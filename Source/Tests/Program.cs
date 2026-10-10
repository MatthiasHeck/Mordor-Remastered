using Mordor.Core;
using System.Security.Cryptography;
using System.Text.Json;

var source = Path.GetFullPath(args.Length > 0 ? args[0] : Path.Combine(AppContext.BaseDirectory, "../../../../"));
var catalog = new Catalog(file => File.ReadAllText(Path.Combine(source, "Data", file)));
var rules = new Rules(catalog);
var checks = 0;
var suites = 0;
void Check(bool condition, string message)
{
    checks++;
    if (!condition) throw new Exception(message);
}
void Suite(string name, Action run) { run(); suites++; Console.WriteLine("PASS " + name); }
World Fresh(string name = "Test", int race = 0, int alignment = 2)
{
    var world = new World();
    Check(rules.Create(world, name, race, "Female", alignment, rules.InitialStats(race), true).Success, "Create fixture.");
    return world;
}
void Unchanged(World world, Func<CommandResult> command, string name)
{
    var before = JsonSerializer.Serialize(world);
    Check(!command().Success, name + " rejected");
    Check(JsonSerializer.Serialize(world) == before, name + " must not mutate state");
}

Suite("Reference bytes, census and physical record identity", () =>
{
    using var manifest = JsonDocument.Parse(File.ReadAllText(Path.Combine(source, "Data", "manifest.json")).TrimStart('\uFEFF'));
    foreach (var file in manifest.RootElement.GetProperty("files").EnumerateArray())
    {
        var bytes = File.ReadAllBytes(Path.Combine(source, "Data", file.GetProperty("file").GetString()!));
        Check(Convert.ToHexString(SHA256.HashData(bytes)).Equals(file.GetProperty("sha256").GetString(), StringComparison.OrdinalIgnoreCase), "Hash changed.");
    }
    Check(catalog["monsters"].Select(r => r.Int("monster_id")).Distinct().Count() == 400, "Do not lose duplicated monster ID.");
    Check(catalog["spells"].Select(r => r.Int("spell_id")).Distinct().Count() == 103, "Do not lose duplicated spell IDs.");
    Check(catalog["spells"][0].Int("spell_id") == 0, "Zero is a valid spell ID.");
    Check(catalog["monsters"].Single(r => r.Name == "Dark Shape").Int("item_1") == 33, "Use the local monster baseline.");
    Check(catalog["items"].Single(r => r.Name == "Ball and Chain").Int("defense") == -3, "Preserve signed defense.");
    foreach (var item in catalog["items"].Where(r => r.Int("spell_index") > 0))
        Check(catalog["spells"][item.Int("spell_index") - 1].Int("spell_id") == item.Int("spell_id"), "One-based spell reference must agree.");
    var quoted = Catalog.ReadCsv("id,name,notes\r\n1,\"A, B\",\"He said \"\"hello\"\"\"\r\n");
    Check(quoted[0].Name == "A, B" && quoted[0].Text("notes") == "He said \"hello\"", "Quoted CSV fields.");
});

Suite("Creation across every race, alignment, pool and boundary", () =>
{
    for (var race = 0; race < 9; race++)
    foreach (var alignment in new[] { 1, 2, 4 })
    {
        var world = new World();
        var stats = rules.InitialStats(race);
        Check(rules.RemainingPoints(race, stats) == catalog.Races[race].Int("bonus_points"), "Racial pool is additional to min + 5.");
        var legal = (catalog.Races[race].Int("alignment_mask_raw") & alignment) != 0;
        Check(rules.Create(world, "Candidate", race, "Male", alignment, stats, true).Success == legal, "Race alignment mask.");
        if (!legal) { Check(world.Roster.Count == 0, "Rejected creation adds nothing."); continue; }
        var c = world.SelectedCharacter!;
        Check(c.MaxHp == 15 && c.Hp == 15 && c.Gold == 1500 && c.Bank == 0 && c.AgeDays == 5840, "Starting resources.");
        Check(c.Sp == 5 * (stats[1] + stats[2]) && c.GuildLevels[0] == 1 && c.ActiveGuild == 0, "SP and Nomad.");
        Check(c.Location == new CellPosition(0, 9, 11), "Town coordinates.");
        world.Validate(catalog);
        Unchanged(world, () => rules.Create(world, "candidate", race, "Male", alignment, stats, true), "Duplicate name");
        Unchanged(world, () => rules.Create(world, "bad|name", race, "Male", alignment, stats, true), "Separator in name");
        Unchanged(world, () => rules.Create(world, "Unused", race, "Male", alignment, stats), "Unconfirmed unused points");
        var invalid = (int[])stats.Clone(); invalid[0] = catalog.Races[race].Int("max_strength") + 1;
        Unchanged(world, () => rules.Create(world, "Over cap", race, "Male", alignment, invalid, true), "Stat above cap");
        invalid = (int[])stats.Clone(); invalid[0] = catalog.Races[race].Int("min_strength") - 1;
        Unchanged(world, () => rules.Create(world, "Under min", race, "Male", alignment, invalid, true), "Stat below minimum");
        stats[0]--;
        Check(rules.RemainingPoints(race, stats) == catalog.Races[race].Int("bonus_points") + 1, "Subtracting refunds a point.");
    }
    var troll = Fresh("Local Troll", 8, 1);
    Check(troll.SelectedCharacter!.Alignment == 1, "Preserve local Troll Good permission.");
});

Suite("Party identity, capacity and alignment", () =>
{
    var world = Fresh("Leader", alignment: 1);
    rules.Create(world, "Evil", 0, "Male", 4, rules.InitialStats(0), true);
    var evil = world.Selected;
    Unchanged(world, () => rules.ToggleParty(world, evil), "Good/Evil mixture");
    for (var i = 0; i < 4; i++)
    {
        rules.Create(world, "Ally " + i, 0, "Female", 2, rules.InitialStats(0), true);
        if (i < 3) Check(rules.ToggleParty(world, world.Selected).Success, "Add neutral member.");
        else Unchanged(world, () => rules.ToggleParty(world, world.Selected), "Fifth member");
    }
    Check(world.Party.Count == 4, "Four members.");
    rules.EnterDungeon(world);
    world.Validate(catalog);
    Unchanged(world, () => rules.ToggleParty(world, world.Party[0]), "Dungeon membership change");
});

Suite("Bank ownership, conservation and payment fallback", () =>
{
    var world = Fresh();
    var c = world.SelectedCharacter!;
    Check(rules.TransferGold(world, 1400, true).Success, "Deposit.");
    Check(c.Gold == 100 && c.Bank == 1400, "Separate balances.");
    Check(Rules.Pay(c, 250) && c.Gold == 0 && c.Bank == 1250, "Payment uses carried first, remainder bank.");
    Check(!Rules.Pay(c, 1251) && c.Bank == 1250, "Insufficient payment leaves balance intact.");
    Check(!Rules.Pay(c, -10), "Negative charge rejected.");
    Check(rules.TransferGold(world, 250, false).Success && c.Gold == 250 && c.Bank == 1000, "Withdraw.");
    Unchanged(world, () => rules.TransferGold(world, 0, true), "Zero transfer");
    Unchanged(world, () => rules.TransferGold(world, -1, true), "Negative transfer");
    Unchanged(world, () => rules.TransferGold(world, 251, true), "Overdraft");
    c.Bank = long.MaxValue;
    Unchanged(world, () => rules.TransferGold(world, 1, true), "Overflow");
    c.Bank = 1000;
    rules.EnterDungeon(world);
    Unchanged(world, () => rules.TransferGold(world, 1, true), "Dungeon bank access");
});

Suite("Every map cell and shared edge symmetry", () =>
{
    for (var floor = 1; floor <= 15; floor++)
    for (var y = 1; y <= 30; y++)
    for (var x = 1; x <= 30; x++)
    {
        var at = new CellPosition(floor, x, y);
        var cell = catalog.Cell(at)!;
        Check(cell is not null, "Complete cells.");
        for (var direction = 0; direction < 4; direction++)
        {
            var edge = Geometry.Edge(catalog, at, direction);
            var reverse = Geometry.Edge(catalog, at.Step(direction), (direction + 2) % 4);
            Check(edge == reverse, "Shared edges must agree from both directions.");
        }
        if (cell!.Has(4) && !cell.Rock) Check(Geometry.Edge(catalog, at, 1).Kind == EdgeKind.Wall, "Secret east door stays opaque.");
        if (cell.Has(5) && !cell.Rock) Check(Geometry.Edge(catalog, at, 0).Kind == EdgeKind.Wall, "Secret north door stays opaque.");
    }
    Check(catalog.Cell(new(1, 9, 11))!.StairsUp, "Entrance is original stairs up.");
});

Suite("Exploration rejection, discovery, door opening and return", () =>
{
    var world = Fresh();
    Check(rules.EnterDungeon(world).Success, "Enter.");
    Check(world.Discovered.SetEquals(["1:9:11"]), "Only entered cell is discovered.");
    Unchanged(world, () => rules.Move(world, 1), "Entry east wall");
    Check(rules.Note(world, "Home stair").Success, "Note.");
    Check(world.Notes["1:9:11"] == "Home stair", "Persist note.");
    Check(rules.Stairs(world, false).Success && world.InTown, "Return via stairs.");
    Check(world.SelectedCharacter!.AgeDays == 5840, "Full HP recovery adds no age.");
    var doorTested = false;
    var hazardTested = false;
    foreach (var raw in catalog["dungeon-cells"])
    {
        var at = new CellPosition(raw.Int("floor"), raw.Int("x_candidate"), raw.Int("y_candidate"));
        if (catalog.Cell(at)!.Rock) continue;
        for (var direction = 0; direction < 4; direction++)
        {
            var edge = Geometry.Edge(catalog, at, direction);
            var target = catalog.Cell(at.Step(direction));
            if (target is null || target.Rock) continue;
            world.Position = at; world.Facing = direction;
            foreach (var member in world.PartyMembers) { member.Location = at; member.Facing = direction; }
            if (!doorTested && edge.Kind == EdgeKind.Door && !target.NeedsHazardRule)
            {
                Unchanged(world, () => rules.Move(world, 0), "Closed door");
                Check(rules.OpenDoor(world).Success && rules.Move(world, 0).Success, "Opening permits traversal.");
                world.Validate(catalog);
                doorTested = true;
            }
            if (!hazardTested && edge.Kind == EdgeKind.Passage && target.NeedsHazardRule)
            {
                Unchanged(world, () => rules.Move(world, 0), "Unresolved terrain");
                hazardTested = true;
            }
        }
        if (doorTested && hazardTested) break;
    }
    Check(doorTested && hazardTested, "Real map exercises doors and hazards.");
});

Suite("Knowledge projection does not disclose unidentified names", () =>
{
    var item = new ItemInstance { RecordIndex = 27, KnownAppearance = "An unfamiliar blade", Identification = 2 };
    Check(Knowledge.ItemName(catalog, item) == "An unfamiliar blade", "Unknown identity masked.");
    item.Identification = 1;
    Check(Knowledge.ItemName(catalog, item) == "An unfamiliar blade", "Partial identity conservatively masked.");
    item.Identification = 0;
    Check(Knowledge.ItemName(catalog, item) == "Bronze Sword", "Known item reveals name.");
    var world = Fresh();
    Check(!Knowledge.Knows(world, new(15, 20, 20)), "Deep geometry unknown.");
});

Suite("Atomic whole-world persistence, checksum and corrupt recovery", () =>
{
    var folder = Path.Combine(source, "Artifacts", "tests", Guid.NewGuid().ToString("N"));
    var path = Path.Combine(folder, "world.json");
    var store = new SaveStore(path, catalog);
    var world = Fresh("Saved explorer");
    rules.TransferGold(world, 300, true);
    rules.EnterDungeon(world);
    rules.Note(world, "The way home");
    store.Save(world);
    var first = JsonSerializer.Serialize(world);
    Check(JsonSerializer.Serialize(store.Load()) == first, "Exact round-trip world snapshot.");
    rules.Turn(world, 1);
    store.Save(world);
    Check(File.Exists(path + ".bak"), "Previous snapshot retained.");
    File.WriteAllText(path, "corrupt");
    var recovered = store.Load();
    Check(store.RecoveredBackup && JsonSerializer.Serialize(recovered) == first, "Recover preceding consistent snapshot.");
    Check(Directory.GetFiles(folder, "*.corrupt-*").Length == 1, "Preserve damaged input.");
    store.Save(recovered);
    Check(JsonSerializer.Serialize(store.Load()) == first, "Recovery followed by save remains readable.");
    var bad = recovered.Clone();
    bad.Party.Add(bad.Party[0]);
    var primaryBytes = File.ReadAllBytes(path);
    try { store.Save(bad); throw new Exception("Invalid snapshot was saved."); }
    catch (InvalidDataException) { Check(File.ReadAllBytes(path).SequenceEqual(primaryBytes), "Rejected save cannot replace primary."); }
    var noBackup = new SaveStore(Path.Combine(folder, "isolated.json"), catalog);
    noBackup.Save(recovered);
    File.WriteAllText(noBackup.Path, "bad");
    try { noBackup.Load(); throw new Exception("Corruption silently started a new world."); }
    catch (InvalidDataException) { Check(File.ReadAllText(noBackup.Path) == "bad", "Do not overwrite unrecoverable save."); }
});

Console.WriteLine($"PASS: {suites} suites, {checks:N0} assertions. Static candidate behavior; no original-game parity claim.");
