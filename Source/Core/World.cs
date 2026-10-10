using System.Text.Json;
using System.Text.Json.Serialization;

namespace Mordor.Core;

public sealed class Character
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string Name { get; set; } = "";
    public int Race { get; set; }
    public string Sex { get; set; } = "Female";
    public int Alignment { get; set; } = 2;
    public int[] NaturalStats { get; set; } = new int[6];
    public int[] Modifiers { get; set; } = new int[6];
    public int AgeDays { get; set; } = 5840;
    public int Hp { get; set; } = 15;
    public int MaxHp { get; set; } = 15;
    public int Sp { get; set; }
    [JsonIgnore] public int MaxSp => 5 * (NaturalStats[1] + NaturalStats[2]);
    public long Gold { get; set; } = 1500;
    public long Bank { get; set; }
    public string Condition { get; set; } = "Healthy";
    public int ActiveGuild { get; set; }
    public Dictionary<int, int> GuildLevels { get; set; } = new() { [0] = 1 };
    public Dictionary<int, long> GuildExperience { get; set; } = new() { [0] = 0 };
    public CellPosition Location { get; set; } = new(0, 9, 11);
    public int Facing { get; set; }
    public List<ItemInstance> Inventory { get; set; } = [];
    public List<ItemInstance> BankItems { get; set; } = [];
}

public sealed class ItemInstance
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public int RecordIndex { get; set; }
    public int Identification { get; set; } = 2;
    public string KnownAppearance { get; set; } = "Unidentified item";
    public int Alignment { get; set; }
    public int Charges { get; set; }
    public bool Equipped { get; set; }
    public bool Cursed { get; set; }
}

public sealed class World
{
    public const string RulesetId = "reference-prototype-v1";
    public int Schema { get; set; } = 1;
    public string Ruleset { get; set; } = RulesetId;
    public Guid Id { get; set; } = Guid.NewGuid();
    public List<Character> Roster { get; set; } = [];
    public List<Guid> Party { get; set; } = [];
    public Guid Selected { get; set; }
    public CellPosition Position { get; set; } = new(0, 9, 11);
    public int Facing { get; set; }
    public long CommandNumber { get; set; }
    public HashSet<string> Discovered { get; set; } = [];
    public HashSet<string> OpenDoors { get; set; } = [];
    public Dictionary<string, string> Notes { get; set; } = [];
    public List<string> Journal { get; set; } = ["A new company begins in Marlith."];
    [JsonIgnore] public bool InTown => Position.Floor == 0;
    [JsonIgnore] public Character? SelectedCharacter => Roster.FirstOrDefault(c => c.Id == Selected);
    [JsonIgnore] public IEnumerable<Character> PartyMembers => Party.Select(id => Roster.Single(c => c.Id == id));

    public World Clone() => JsonSerializer.Deserialize<World>(JsonSerializer.Serialize(this))!;
    public void Log(string message)
    {
        Journal.Add(message);
        if (Journal.Count > 100) Journal.RemoveAt(0);
    }

    public void Validate(Catalog catalog)
    {
        if (Schema != 1 || Ruleset != RulesetId) throw new InvalidDataException("Unsupported save schema or ruleset.");
        if (Roster is null || Party is null || Journal is null || Discovered is null || OpenDoors is null || Notes is null)
            throw new InvalidDataException("Incomplete world snapshot.");
        if (Party.Count > 4 || Party.Distinct().Count() != Party.Count || Party.Any(id => Roster.All(c => c.Id != id)))
            throw new InvalidDataException("Invalid party membership.");
        if (Roster.Select(c => c.Id).Distinct().Count() != Roster.Count || Roster.Select(c => c.Name.ToUpperInvariant()).Distinct().Count() != Roster.Count)
            throw new InvalidDataException("Duplicate character identity.");
        if (Roster.Count > 0 && Roster.All(c => c.Id != Selected)) throw new InvalidDataException("Missing selected character.");
        if (Facing is < 0 or > 3 || Position.Floor is < 0 or > 15 || Position.X is < 1 or > 30 || Position.Y is < 1 or > 30)
            throw new InvalidDataException("Invalid position or facing.");
        if (!InTown && (Party.Count == 0 || catalog.Cell(Position) is not { Rock: false })) throw new InvalidDataException("Invalid expedition position.");
        if (!InTown && !Party.Contains(Selected)) throw new InvalidDataException("Selected adventurer is not in the expedition.");
        if (PartyMembers.Any(c => c.Alignment == 1) && PartyMembers.Any(c => c.Alignment == 4)) throw new InvalidDataException("Good and Evil party members conflict.");
        var items = new HashSet<Guid>();
        foreach (var character in Roster)
        {
            if (string.IsNullOrWhiteSpace(character.Name) || character.Name.Contains('|') || character.Race is < 0 or > 8 ||
                character.Alignment is not (1 or 2 or 4) || character.NaturalStats is not { Length: 6 } || character.Modifiers is not { Length: 6 } ||
                character.Gold < 0 || character.Bank < 0 || character.AgeDays < 0 || character.MaxHp is < 1 or > 999 ||
                character.Hp < 0 || character.Hp > character.MaxHp || character.Sp < 0 || character.Sp > character.MaxSp ||
                character.GuildLevels is null || character.GuildExperience is null || !character.GuildLevels.ContainsKey(character.ActiveGuild) ||
                character.GuildLevels.Any(g => g.Key is < 0 or > 11 || g.Value < 1) || character.GuildExperience.Any(g => g.Key is < 0 or > 11 || g.Value < 0))
                throw new InvalidDataException("Invalid character record.");
            var race = catalog.Races[character.Race];
            if ((race.Int("alignment_mask_raw") & character.Alignment) == 0) throw new InvalidDataException("Ineligible racial alignment.");
            for (var stat = 0; stat < 6; stat++)
                if (character.NaturalStats[stat] < race.Int("min_" + Catalog.Stats[stat]) || character.NaturalStats[stat] > race.Int("max_" + Catalog.Stats[stat]))
                    throw new InvalidDataException("Natural stat outside racial bounds.");
            if (character.Inventory.Count > 40 || character.BankItems.Count > 40) throw new InvalidDataException("Item storage overflow.");
            foreach (var item in character.Inventory.Concat(character.BankItems))
                if (!items.Add(item.Id) || item.RecordIndex is < 1 or > 366 || item.Charges < 0 || item.Identification is < 0 or > 2)
                    throw new InvalidDataException("Invalid or duplicated item instance.");
        }
        foreach (var member in PartyMembers)
            if (member.Location != Position || member.Facing != Facing) throw new InvalidDataException("Party location mismatch.");
    }
}

public static class Knowledge
{
    public static string ItemName(Catalog catalog, ItemInstance item) => item.Identification == 0
        ? catalog["items"][item.RecordIndex - 1].Name : item.KnownAppearance;
    public static bool Knows(World world, CellPosition at) => world.Discovered.Contains(at.Key);
}
