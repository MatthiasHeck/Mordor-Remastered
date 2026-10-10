namespace Mordor.Core;

public readonly record struct CommandResult(bool Success, string Message)
{
    public static CommandResult Ok(string message) => new(true, message);
    public static CommandResult Reject(string message) => new(false, message);
}

public sealed class Rules(Catalog catalog)
{
    public int[] InitialStats(int race) => Catalog.Stats.Select(s => catalog.Races[race].Int("min_" + s) + 5).ToArray();
    public int RemainingPoints(int race, int[] stats) => 30 + catalog.Races[race].Int("bonus_points") -
        Catalog.Stats.Select((s, i) => stats[i] - catalog.Races[race].Int("min_" + s)).Sum();

    public CommandResult Create(World world, string name, int race, string sex, int alignment, int[] stats, bool acceptUnused = false)
    {
        if (!world.InTown) return CommandResult.Reject("Return to Marlith before recruiting.");
        name = name.Trim();
        if (name.Length is < 1 or > 24 || name.Contains('|') || name.Any(char.IsControl)) return CommandResult.Reject("Use a name of 1–24 characters without | or control characters.");
        if (world.Roster.Any(c => c.Name.Equals(name, StringComparison.OrdinalIgnoreCase))) return CommandResult.Reject("That name is already in the roster.");
        if (race is < 0 or > 8 || alignment is not (1 or 2 or 4) || stats.Length != 6 || sex is not ("Female" or "Male")) return CommandResult.Reject("Invalid identity.");
        var definition = catalog.Races[race];
        if ((definition.Int("alignment_mask_raw") & alignment) == 0) return CommandResult.Reject("This race does not allow that alignment.");
        for (var i = 0; i < 6; i++)
            if (stats[i] < definition.Int("min_" + Catalog.Stats[i]) || stats[i] > definition.Int("max_" + Catalog.Stats[i]))
                return CommandResult.Reject("Keep statistics within racial limits.");
        var points = RemainingPoints(race, stats);
        if (points < 0) return CommandResult.Reject("Not enough allocation points.");
        if (points > 0 && !acceptUnused) return CommandResult.Reject($"Confirm leaving {points} allocation points unused.");
        var character = new Character { Name = name, Race = race, Sex = sex, Alignment = alignment, NaturalStats = (int[])stats.Clone() };
        character.Sp = character.MaxSp;
        world.Roster.Add(character);
        world.Selected = character.Id;
        if (world.Party.Count == 0) world.Party.Add(character.Id);
        return Finish(world, $"{name} arrives in Marlith. Nomad, level 1.");
    }

    public List<string> GuildRequirements(Character character, int guild)
    {
        var definition = catalog.Guilds[guild];
        var reasons = new List<string>();
        if ((definition.Int("race_mask_raw") & (1 << character.Race)) == 0) reasons.Add("Race restriction");
        if ((definition.Int("alignment_mask_raw") & character.Alignment) == 0) reasons.Add("Alignment restriction");
        for (var i = 0; i < 6; i++)
            if (character.NaturalStats[i] + character.Modifiers[i] < definition.Int("required_" + Catalog.Stats[i]))
                reasons.Add($"{Catalog.StatLabels[i]} {definition.Int("required_" + Catalog.Stats[i])}");
        return reasons;
    }

    public CommandResult ToggleParty(World world, Guid id)
    {
        if (!world.InTown) return CommandResult.Reject("Assemble the party in town.");
        var character = world.Roster.SingleOrDefault(c => c.Id == id);
        if (character is null || character.Hp <= 0 || character.Location.Floor != 0) return CommandResult.Reject("Only living characters in town can join.");
        if (world.Party.Contains(id)) world.Party.Remove(id);
        else
        {
            if (world.Party.Count >= 4) return CommandResult.Reject("A party holds up to four characters.");
            if (world.PartyMembers.Any(c => (c.Alignment | character.Alignment) == 5)) return CommandResult.Reject("Good and Evil characters cannot share a party.");
            world.Party.Add(id);
            character.Location = world.Position;
            character.Facing = world.Facing;
        }
        return Finish(world, $"Party updated: {world.Party.Count}/4 members.");
    }

    public CommandResult TransferGold(World world, long amount, bool deposit)
    {
        if (!world.InTown || world.SelectedCharacter is not { } character) return CommandResult.Reject("Select a character in town.");
        if (amount <= 0) return CommandResult.Reject("Enter a positive whole amount.");
        if ((deposit ? character.Gold : character.Bank) < amount) return CommandResult.Reject("Insufficient funds in the source account.");
        var destination = deposit ? character.Bank : character.Gold;
        if (destination > long.MaxValue - amount) return CommandResult.Reject("Account limit exceeded.");
        if (deposit) { character.Gold -= amount; character.Bank += amount; }
        else { character.Bank -= amount; character.Gold += amount; }
        return Finish(world, $"{character.Name} {(deposit ? "deposits" : "withdraws")} {amount:N0} gold.");
    }

    public static bool Pay(Character character, long price)
    {
        if (price < 0) return false;
        var fromHand = Math.Min(price, character.Gold);
        var fromBank = price - fromHand;
        if (fromBank > character.Bank) return false;
        character.Gold -= fromHand;
        character.Bank -= fromBank;
        return true;
    }

    public CommandResult EnterDungeon(World world)
    {
        if (!world.InTown || world.Party.Count == 0) return CommandResult.Reject("Assemble a party before descending.");
        if (!world.Party.Contains(world.Selected)) world.Selected = world.Party[0];
        world.Position = new(1, 9, 11);
        world.Facing = 0;
        RevealAndSync(world);
        return Finish(world, "The company descends into Dejenol. Exploration prototype: encounters are not active.");
    }

    public CommandResult Turn(World world, int direction)
    {
        if (world.InTown) return CommandResult.Reject("Enter the dungeon first.");
        world.Facing = (world.Facing + (direction < 0 ? 3 : 1)) % 4;
        RevealAndSync(world);
        return Finish(world, $"Facing {Directions[world.Facing]}.");
    }

    public CommandResult Move(World world, int offset)
    {
        if (world.InTown) return CommandResult.Reject("Enter the dungeon first.");
        var direction = (world.Facing + offset + 4) % 4;
        var edge = Geometry.Edge(catalog, world.Position, direction);
        if (edge.Kind == EdgeKind.Wall) return CommandResult.Reject("Stone blocks the way.");
        if (edge.Kind == EdgeKind.Door && !world.OpenDoors.Contains(edge.Key)) return CommandResult.Reject("A closed door blocks the way. Face it and press O to open.");
        var destination = world.Position.Step(direction);
        if (catalog.Cell(destination)!.NeedsHazardRule) return CommandResult.Reject("This passage needs a terrain rule still awaiting validation. Movement was not applied.");
        world.Position = destination;
        RevealAndSync(world);
        var cell = catalog.Cell(destination)!;
        return Finish(world, cell.StairsUp ? "A stairway leads upward." : cell.StairsDown ? "A stairway leads downward." : "The company advances.");
    }

    public CommandResult OpenDoor(World world)
    {
        if (world.InTown) return CommandResult.Reject("Enter the dungeon first.");
        var edge = Geometry.Edge(catalog, world.Position, world.Facing);
        if (edge.Kind != EdgeKind.Door) return CommandResult.Reject("There is no visible door ahead.");
        if (!world.OpenDoors.Add(edge.Key)) return CommandResult.Reject("The door is already open.");
        return Finish(world, "The door opens.");
    }

    public CommandResult Stairs(World world, bool down)
    {
        if (world.InTown) return down ? EnterDungeon(world) : CommandResult.Reject("You are already in Marlith.");
        var cell = catalog.Cell(world.Position)!;
        if (down ? !cell.StairsDown : !cell.StairsUp) return CommandResult.Reject("No matching stairway at this location.");
        var floor = world.Position.Floor + (down ? 1 : -1);
        if (floor == 0)
        {
            world.Position = new(0, 9, 11);
            foreach (var member in world.PartyMembers)
            {
                member.AgeDays += (int)Math.Round((100.0 - member.Hp * 100.0 / member.MaxHp) / 3.25, MidpointRounding.ToEven);
                member.Hp = member.MaxHp;
                member.Sp = member.MaxSp;
            }
            RevealAndSync(world);
            return Finish(world, "The company returns to Marlith.");
        }
        var destination = world.Position with { Floor = floor };
        if (catalog.Cell(destination) is not { Rock: false, NeedsHazardRule: false } target || (down ? !target.StairsUp : !target.StairsDown))
            return CommandResult.Reject("This stair transition requires original-build validation.");
        world.Position = destination;
        RevealAndSync(world);
        return Finish(world, $"The company reaches depth {floor}.");
    }

    public CommandResult Note(World world, string note)
    {
        if (world.InTown || !Knowledge.Knows(world, world.Position)) return CommandResult.Reject("Notes belong to discovered dungeon cells.");
        if (note.Length > 160) return CommandResult.Reject("Keep map notes to 160 characters.");
        if (string.IsNullOrWhiteSpace(note)) world.Notes.Remove(world.Position.Key);
        else world.Notes[world.Position.Key] = note.Trim();
        return Finish(world, "Map note saved.");
    }

    public static readonly string[] Directions = ["North", "East", "South", "West"];
    private static void RevealAndSync(World world)
    {
        if (!world.InTown) world.Discovered.Add(world.Position.Key);
        foreach (var character in world.PartyMembers) { character.Location = world.Position; character.Facing = world.Facing; }
    }
    private static CommandResult Finish(World world, string message)
    {
        world.CommandNumber++;
        world.Log(message);
        return CommandResult.Ok(message);
    }
}
