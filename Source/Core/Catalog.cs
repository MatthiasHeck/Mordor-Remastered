using System.Collections.ObjectModel;
using System.Globalization;
using System.Text;

namespace Mordor.Core;

/// <summary>Raw fields are retained verbatim; physical records are never keyed by embedded ID.</summary>
public sealed class DataRecord
{
    public IReadOnlyDictionary<string, string> Fields { get; }
    public DataRecord(IDictionary<string, string> fields) => Fields = new ReadOnlyDictionary<string, string>(fields);
    public string Text(string field) => Fields.TryGetValue(field, out var value) ? value : throw new InvalidDataException($"Missing field {field}.");
    public int Int(string field) => int.Parse(Text(field), CultureInfo.InvariantCulture);
    public long Long(string field) => long.Parse(Text(field), CultureInfo.InvariantCulture);
    public string Name => Text("name");
}

public sealed class Catalog
{
    public static readonly string[] Stats = ["strength", "intelligence", "wisdom", "constitution", "charisma", "dexterity"];
    public static readonly string[] StatLabels = ["Strength", "Intelligence", "Wisdom", "Constitution", "Charisma", "Dexterity"];
    public static readonly string[] TableNames = ["races", "guilds", "spells", "guild-spell-access", "items", "monsters",
        "item-subtypes", "item-classes", "monster-types", "monster-subtypes", "item-spell-links", "dungeon-cells",
        "dungeon-floors", "dungeon-areas", "dungeon-teleporters", "dungeon-chutes"];
    private readonly Dictionary<string, IReadOnlyList<DataRecord>> _tables = [];
    private readonly Dictionary<CellPosition, DungeonCell> _cells = [];
    public IReadOnlyList<DataRecord> this[string table] => _tables[table];
    public IReadOnlyList<DataRecord> Races => this["races"];
    public IReadOnlyList<DataRecord> Guilds => this["guilds"];

    public Catalog(Func<string, string> read)
    {
        foreach (var name in TableNames) _tables[name] = ReadCsv(read(name + "-local.csv"));
        foreach (var row in this["dungeon-cells"])
        {
            var position = new CellPosition(row.Int("floor"), row.Int("x_candidate"), row.Int("y_candidate"));
            _cells.Add(position, new(position, row.Int("area_id"), row.Long("flags_integer")));
        }
        if (Races.Count != 9 || Guilds.Count != 12 || this["spells"].Count != 105 || this["items"].Count != 366 ||
            this["monsters"].Count != 401 || _cells.Count != 13500) throw new InvalidDataException("Reference catalogue census failed.");
        for (var floor = 1; floor <= 15; floor++)
        for (var y = 1; y <= 30; y++)
        for (var x = 1; x <= 30; x++)
            if (!_cells.ContainsKey(new(floor, x, y))) throw new InvalidDataException("Incomplete floor.");
    }

    public DungeonCell? Cell(CellPosition position) => _cells.GetValueOrDefault(position);

    public static IReadOnlyList<DataRecord> ReadCsv(string csv)
    {
        var rows = new List<List<string>>();
        var row = new List<string>();
        var field = new StringBuilder();
        var quoted = false;
        foreach (var lineChar in csv.TrimStart('\uFEFF'))
        {
            if (lineChar == '"') { quoted = !quoted; field.Append(lineChar); }
            else if (!quoted && lineChar == ',') { row.Add(Decode(field)); field.Clear(); }
            else if (!quoted && lineChar == '\n')
            {
                row.Add(Decode(field)); field.Clear();
                if (row.Any(s => s.Length > 0)) rows.Add(row);
                row = [];
            }
            else field.Append(lineChar);
        }
        if (quoted) throw new InvalidDataException("Unclosed CSV quote.");
        if (field.Length > 0 || row.Count > 0) { row.Add(Decode(field)); rows.Add(row); }
        if (rows.Count == 0) throw new InvalidDataException("Empty CSV.");
        var headers = rows[0];
        return rows.Skip(1).Select(values =>
        {
            if (values.Count != headers.Count) throw new InvalidDataException("CSV column count mismatch.");
            return new DataRecord(headers.Zip(values).ToDictionary(pair => pair.First, pair => pair.Second));
        }).ToList().AsReadOnly();
    }

    private static string Decode(StringBuilder field)
    {
        var value = field.ToString().TrimEnd('\r');
        return value.StartsWith('"') && value.EndsWith('"') ? value[1..^1].Replace("\"\"", "\"") : value;
    }
}

public readonly record struct CellPosition(int Floor, int X, int Y)
{
    public string Key => $"{Floor}:{X}:{Y}";
    public CellPosition Step(int facing) => facing switch
    {
        0 => this with { Y = Y + 1 }, 1 => this with { X = X + 1 },
        2 => this with { Y = Y - 1 }, 3 => this with { X = X - 1 },
        _ => throw new ArgumentOutOfRangeException(nameof(facing))
    };
}

public sealed record DungeonCell(CellPosition Position, int Area, long Flags)
{
    public bool Has(int bit) => (Flags & (1L << bit)) != 0;
    public bool Rock => Has(19);
    public bool StairsUp => Has(12);
    public bool StairsDown => Has(13);
    // No invented outcomes: these cells require unresolved original effects before expedition entry.
    public bool NeedsHazardRule => Enumerable.Range(6, 6).Concat([14, 15, 16, 17, 18, 20, 21, 22, 23]).Any(Has);
}

public enum EdgeKind { Passage, Wall, Door }
public readonly record struct DungeonEdge(EdgeKind Kind, string Key);

public static class Geometry
{
    public static DungeonEdge Edge(Catalog catalog, CellPosition at, int facing)
    {
        var next = at.Step(facing);
        if (catalog.Cell(at) is not { Rock: false } || catalog.Cell(next) is not { Rock: false }) return new(EdgeKind.Wall, "boundary");
        var owner = facing is 0 or 1 ? at : next;
        var vertical = facing is 0 or 2;
        var cell = catalog.Cell(owner)!;
        var key = owner.Key + (vertical ? ":N" : ":E");
        // Secret doors remain visually indistinguishable from walls in ordinary exploration.
        if (cell.Has(vertical ? 5 : 4)) return new(EdgeKind.Wall, key);
        if (cell.Has(vertical ? 3 : 2)) return new(EdgeKind.Door, key);
        return new(cell.Has(vertical ? 1 : 0) ? EdgeKind.Wall : EdgeKind.Passage, key);
    }
}
