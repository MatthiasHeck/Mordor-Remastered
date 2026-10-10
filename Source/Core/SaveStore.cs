using System.Security.Cryptography;
using System.Text;
using System.Text.Json;

namespace Mordor.Core;

/// <summary>Whole-world, checksummed snapshots. Replace is atomic; the preceding file is the recovery copy.</summary>
public sealed class SaveStore(string path, Catalog catalog)
{
    public string Path { get; } = path;
    public bool RecoveredBackup { get; private set; }
    private sealed record Envelope(int Version, string Sha256, string Payload);
    private static string Digest(string payload) => Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(payload)));

    public void Save(World world)
    {
        world.Validate(catalog);
        Directory.CreateDirectory(System.IO.Path.GetDirectoryName(Path)!);
        var payload = JsonSerializer.Serialize(world);
        var bytes = JsonSerializer.SerializeToUtf8Bytes(new Envelope(1, Digest(payload), payload));
        var temporary = Path + ".tmp";
        using (var stream = new FileStream(temporary, FileMode.Create, FileAccess.Write, FileShare.None))
        {
            stream.Write(bytes);
            stream.Flush(true);
        }
        if (File.Exists(Path)) File.Replace(temporary, Path, Path + ".bak");
        else File.Move(temporary, Path);
    }

    public World Load()
    {
        RecoveredBackup = false;
        if (!File.Exists(Path))
        {
            if (!File.Exists(Path + ".bak")) return new World();
            var recovered = Read(Path + ".bak");
            RecoveredBackup = true;
            return recovered;
        }
        try { return Read(Path); }
        catch (Exception error) when (error is JsonException or InvalidDataException)
        {
            if (!File.Exists(Path + ".bak")) throw new InvalidDataException("The world is damaged and has no valid recovery copy.", error);
            var recovered = Read(Path + ".bak");
            // Preserve the damaged primary separately before the next save replaces it.
            File.Copy(Path, Path + ".corrupt-" + DateTime.UtcNow.ToString("yyyyMMddHHmmssfff"), false);
            File.Copy(Path + ".bak", Path, true);
            RecoveredBackup = true;
            return recovered;
        }
    }

    private World Read(string file)
    {
        var envelope = JsonSerializer.Deserialize<Envelope>(File.ReadAllText(file)) ?? throw new InvalidDataException("Empty snapshot.");
        if (envelope.Version != 1) throw new NotSupportedException("Save container version is not supported; no file was replaced.");
        if (envelope.Payload is null || envelope.Sha256 != Digest(envelope.Payload)) throw new InvalidDataException("Snapshot checksum mismatch.");
        var world = JsonSerializer.Deserialize<World>(envelope.Payload) ?? throw new InvalidDataException("Empty world.");
        if (world.Schema != 1 || world.Ruleset != World.RulesetId) throw new NotSupportedException("Save ruleset is incompatible; no file was replaced.");
        world.Validate(catalog);
        return world;
    }
}
