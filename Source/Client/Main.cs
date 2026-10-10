using Godot;
using Mordor.Core;
using System.Globalization;
using System.Text.Json;
using FileAccess = Godot.FileAccess;

namespace Mordor.Client;

public partial class Main : Control
{
    private Catalog _catalog = null!;
    private Rules _rules = null!;
    private World _world = null!;
    private SaveStore _store = null!;
    private VBoxContainer _root = null!;
    private Control? _modal;
    private string _page = "Town", _notice = "Welcome to Marlith. Your story begins with a name.";
    private bool _paused, _smoke, _highContrast;
    private int _fontSize = 16;
    private string? _rebinding;
    private Label? _noticeLabel;
    private readonly Dictionary<string, Key> _keys = new()
    {
        ["Forward"] = Key.W, ["Backward"] = Key.S, ["Turn left"] = Key.A, ["Turn right"] = Key.D,
        ["Strafe left"] = Key.Q, ["Strafe right"] = Key.E, ["Open door"] = Key.O,
        ["Map"] = Key.M, ["Pause"] = Key.P
    };

    public override void _Ready()
    {
        _smoke = OS.GetCmdlineUserArgs().Contains("--smoke-test");
        try
        {
            _catalog = new Catalog(file => FileAccess.GetFileAsString("res://Data/" + file));
            _rules = new Rules(_catalog);
            var path = ProjectSettings.GlobalizePath(_smoke ? "res://Artifacts/smoke/world.json" : "user://world.json");
            _store = new(path, _catalog);
            _world = _smoke ? new World() : _store.Load();
            if (_store.RecoveredBackup) _notice = "The previous consistent world was recovered. The damaged file was preserved.";
            if (!_world.InTown) _page = "Dungeon";
            LoadSettings();
            Render();
            GetTree().AutoAcceptQuit = false;
            if (_smoke) CallDeferred(MethodName.SmokeTest);
        }
        catch (Exception error)
        {
            GD.PushError(error.ToString());
            Theme = Ui.MakeTheme(18, false);
            var box = new MarginContainer { OffsetLeft = 50, OffsetTop = 50, OffsetRight = 1100, OffsetBottom = 650 };
            AddChild(box);
            var stack = Ui.Card(box, "Unable to open this world");
            stack.AddChild(Ui.Label(error.Message, 24, Ui.Ink, true));
            stack.AddChild(Ui.Label("No new world has replaced your save. Check the reference data and the world.json recovery files, then reopen the application.", 16, Ui.Muted, true));
            stack.AddChild(Ui.Button("Close application", () => GetTree().Quit(1)));
            if (_smoke) GetTree().Quit(1);
        }
    }

    public override void _Notification(int what)
    {
        if (what == NotificationWMCloseRequest) GetTree().Quit(); // Every successful command is already committed.
        if (what == NotificationApplicationFocusOut && _world is not null && !_world.InTown && !_smoke)
        {
            _paused = true;
            if (_root is not null) Render();
        }
    }

    private void Render()
    {
        // The root margin is replaced without affecting an open modal.
        foreach (var child in GetChildren())
            if (child is MarginContainer) { RemoveChild(child); child.QueueFree(); }
        Theme = Ui.MakeTheme(_fontSize, _highContrast);
        var margin = new MarginContainer();
        margin.SetAnchorsAndOffsetsPreset(LayoutPreset.FullRect);
        foreach (var side in new[] { "left", "right", "top", "bottom" }) margin.AddThemeConstantOverride("margin_" + side, 24);
        AddChild(margin);
        if (_modal is not null) MoveChild(_modal, GetChildCount() - 1);
        _root = Ui.Stack(margin, 16);
        Header();
        var body = Ui.Row(_root, 18);
        body.SizeFlagsVertical = SizeFlags.ExpandFill;
        PartyPanel(body);
        var center = Ui.Stack(body, 12);
        center.SizeFlagsHorizontal = SizeFlags.ExpandFill;
        Navigation(center);
        var content = Ui.Stack(center);
        content.SizeFlagsVertical = SizeFlags.ExpandFill;
        switch (_page)
        {
            case "Town": Town(content); break;
            case "Dungeon": Dungeon(content); break;
            case "Roster": Roster(content); break;
            case "Guilds": Guilds(content); break;
            case "Bank": Bank(content); break;
            case "Inventory": Inventory(content); break;
            case "Library": Library(content); break;
            case "Settings": Settings(content); break;
            case "Help": Help(content); break;
            case "Reference": Reference(content); break;
            default: Service(content, _page); break;
        }
        CharacterPanel(body);
        Footer();
    }

    private void Header()
    {
        var row = Ui.Row(_root, 18);
        var mark = new TextureRect { Texture = GD.Load<Texture2D>("res://Assets/icon.svg"), CustomMinimumSize = new(54, 54), ExpandMode = TextureRect.ExpandModeEnum.IgnoreSize, StretchMode = TextureRect.StretchModeEnum.KeepAspectCentered };
        row.AddChild(mark);
        var title = Ui.Stack(row, 0);
        title.AddChild(Ui.Label("M O R D O R", 29, Ui.Ink));
        title.AddChild(Ui.Label("THE DEPTHS OF DEJENOL  /  REMASTERED", 11, Ui.Gold));
        Ui.Space(row);
        var state = Ui.Stack(row, 4);
        state.SizeFlagsHorizontal = SizeFlags.ShrinkEnd;
        state.AddChild(Ui.Label("REFERENCE PROTOTYPE", 11, Ui.Gold));
        state.AddChild(Ui.Label($"Offline  ·  Saved revision {_world.CommandNumber}", 12, Ui.Muted));
        row.AddChild(Ui.Button("Reference tools", () => Go("Reference")));
        row.AddChild(Ui.Button("Settings", () => Go("Settings")));
        row.AddChild(Ui.Button("?", () => Go("Help")));
        _root.AddChild(new HSeparator());
    }

    private void PartyPanel(Node parent)
    {
        var scroller = new ScrollContainer { CustomMinimumSize = new(205, 0), HorizontalScrollMode = ScrollContainer.ScrollMode.Disabled };
        parent.AddChild(scroller);
        var compact = _world.Party.Count >= 3;
        var column = Ui.Stack(scroller, compact ? 8 : 12);
        column.SizeFlagsVertical = SizeFlags.ExpandFill;
        column.AddChild(Ui.Label("YOUR COMPANY", 12, Ui.Gold));
        column.AddChild(Ui.Label($"{_world.Party.Count} / 4 adventurers", 14, Ui.Muted));
        foreach (var member in _world.PartyMembers)
        {
            var card = Ui.Card(column);
            var select = Ui.Button(member.Name, () => Select(member.Id));
            select.Alignment = HorizontalAlignment.Left;
            if (compact)
            {
                ((PanelContainer)card.GetParent()).AddThemeStyleboxOverride("panel", Ui.Box(Ui.Panel, Ui.Line, 8, 8));
                card.AddThemeConstantOverride("separation", 3);
                select.CustomMinimumSize = new(0, 30);
                select.AddThemeStyleboxOverride("normal", Ui.Box(Ui.Panel, Ui.Line, 5, 6));
            }
            if (member.Id == _world.Selected) select.AddThemeStyleboxOverride("normal", Ui.Box(new("29413b"), Ui.Teal));
            if (compact && member.Id == _world.Selected) select.AddThemeStyleboxOverride("normal", Ui.Box(new("29413b"), Ui.Teal, 5, 6));
            card.AddChild(select);
            card.AddChild(Ui.Label($"{_catalog.Races[member.Race].Name} · {_catalog.Guilds[member.ActiveGuild].Name}", 12, Ui.Muted));
            if (compact) card.AddChild(Ui.Label($"HP {member.Hp}/{member.MaxHp} · SP {member.Sp}/{member.MaxSp}", 13, Ui.Teal));
            else
            {
                Meter(card, "HP", member.Hp, member.MaxHp, Ui.Teal);
                Meter(card, "SP", member.Sp, member.MaxSp, new("839ebd"));
            }
            card.AddChild(Ui.Label(member.Condition + "  ·  Stopped", 12, Ui.Muted));
        }
        if (_world.Party.Count == 0)
        {
            var empty = Ui.Card(column);
            empty.AddChild(Ui.Label("An empty company", 18));
            empty.AddChild(Ui.Label("Recruit an adventurer, then assemble a party of up to four.", 14, Ui.Muted, true));
        }
        if (_world.InTown) column.AddChild(Ui.Button("Manage roster", () => Go("Roster")));
        Ui.Space(column);
        if (compact) column.AddChild(Ui.Label(_world.InTown ? "Marlith · In town" : $"Depth {_world.Position.Floor} · {_world.Position.X} E, {_world.Position.Y} N\nFacing {Rules.Directions[_world.Facing]}", 13, Ui.Muted, true));
        else
        {
            var location = Ui.Card(column, "Location");
            location.AddChild(Ui.Label(_world.InTown ? "Marlith" : $"Dejenol · Depth {_world.Position.Floor}", 19));
            location.AddChild(Ui.Label(_world.InTown ? "At the edge of the depths" : $"{_world.Position.X} east · {_world.Position.Y} north\nFacing {Rules.Directions[_world.Facing]}", 13, Ui.Muted, true));
        }
        if (!_world.InTown) column.AddChild(Ui.Button(_paused ? "Resume exploration" : "Pause", TogglePause, _paused));
    }

    private static void Meter(Node parent, string name, int current, int maximum, Color color)
    {
        Ui.Pair(parent, name, $"{current} / {maximum}");
        var bar = new ProgressBar { MaxValue = maximum, Value = current, ShowPercentage = false, CustomMinimumSize = new(0, 4) };
        bar.AddThemeStyleboxOverride("fill", Ui.Box(color, color, 1, 0));
        parent.AddChild(bar);
    }

    private void Navigation(Node parent)
    {
        var row = Ui.Row(parent, 7);
        foreach (var page in _world.InTown ? new[] { "Town", "Roster", "Guilds", "Bank", "Library", "Inventory" } : new[] { "Dungeon", "Inventory", "Library" })
        {
            var destination = page;
            var button = Ui.Button(page, () => Go(destination));
            button.SizeFlagsHorizontal = SizeFlags.ExpandFill;
            if (_page == page) button.AddThemeColorOverride("font_color", Ui.Gold);
            row.AddChild(button);
        }
    }

    private void CharacterPanel(Node parent)
    {
        var scroller = new ScrollContainer { CustomMinimumSize = new(234, 0), HorizontalScrollMode = ScrollContainer.ScrollMode.Disabled };
        parent.AddChild(scroller);
        var column = Ui.Stack(scroller, 12);
        var card = Ui.Card(column, "Selected adventurer");
        card.AddThemeConstantOverride("separation", 6);
        if (_world.SelectedCharacter is not { } character)
        {
            card.AddChild(Ui.Label("A name unwritten", 21));
            card.AddChild(Ui.Label("Nine races. Twelve guilds. Fifteen levels beneath the city.", 15, Ui.Muted, true));
            card.AddChild(Ui.Button("Create character", Creation, true));
        }
        else
        {
            card.AddChild(Ui.Label(character.Name, 23));
            card.AddChild(Ui.Label($"{_catalog.Races[character.Race].Name} · {Alignment(character.Alignment)}", 14, Ui.Muted));
            Ui.Pair(card, _catalog.Guilds[character.ActiveGuild].Name, $"Level {character.GuildLevels[character.ActiveGuild]}", Ui.Gold);
            card.AddChild(new HSeparator());
            var stats = new GridContainer { Columns = 2 };
            stats.AddThemeConstantOverride("h_separation", 22);
            stats.AddThemeConstantOverride("v_separation", 8);
            card.AddChild(stats);
            for (var i = 0; i < 6; i++)
            {
                var label = Ui.Label($"{Catalog.StatLabels[i][..3].ToUpperInvariant()}  {character.NaturalStats[i] + character.Modifiers[i]}", 15);
                label.TooltipText = $"{Catalog.StatLabels[i]}: {character.NaturalStats[i]} natural, {character.Modifiers[i]:+0;-0;0} modifier";
                label.MouseFilter = MouseFilterEnum.Pass;
                label.SizeFlagsHorizontal = SizeFlags.ExpandFill;
                stats.AddChild(label);
            }
            card.AddChild(new HSeparator());
            Ui.Pair(card, "Carried gold", character.Gold.ToString("N0"), Ui.Gold);
            Ui.Pair(card, "Banked gold", character.Bank.ToString("N0"));
            card.AddChild(Ui.Label($"{character.AgeDays / 365} years · {character.Condition}", 13, Ui.Teal));
            card.AddChild(Ui.Button("Character sheet", CharacterModal));
        }
        var mapCard = Ui.Card(column, "Automap");
        if (_world.InTown)
        {
            mapCard.AddChild(Ui.Label("Chart the unknown", 18));
            mapCard.AddChild(Ui.Label("Only visited cells appear on your expedition map. Notes stay with this world.", 13, Ui.Muted, true));
        }
        else
        {
            mapCard.AddChild(new MapView { Catalog = _catalog, World = _world, Zoomed = true, CustomMinimumSize = new(190, 135) });
            mapCard.AddChild(Ui.Button($"Expand map  [{_keys["Map"]}]", MapModal));
        }
    }

    private void Town(Node parent)
    {
        var title = Ui.Row(parent);
        var headings = Ui.Stack(title, 2);
        headings.AddChild(Ui.Label("THE CITY ABOVE THE DEPTHS", 11, Ui.Gold));
        headings.AddChild(Ui.Label("Welcome to Marlith", 30));
        var vista = new Vista { Catalog = _catalog, World = _world, CustomMinimumSize = new(0, 240), SizeFlagsVertical = SizeFlags.ExpandFill };
        parent.AddChild(vista);
        var row = Ui.Row(parent);
        var text = Ui.Stack(row, 5);
        text.AddChild(Ui.Label("The old gate still stands.", 20));
        text.AddChild(Ui.Label("Prepare your company. Below the city, the mines of Dejenol await.", 14, Ui.Muted, true));
        row.AddChild(Ui.Button(_world.Party.Count == 0 ? "Create an adventurer" : "Enter Dejenol  ↓", () =>
        {
            if (_world.Party.Count == 0) Creation();
            else Apply(() => _rules.EnterDungeon(_world), "Dungeon");
        }, true));
        var services = new GridContainer { Columns = 4, SizeFlagsHorizontal = SizeFlags.ExpandFill };
        services.AddThemeConstantOverride("h_separation", 8);
        services.AddThemeConstantOverride("v_separation", 8);
        parent.AddChild(services);
        foreach (var name in new[] { "Store", "Bank", "Guilds", "Library", "Morgue", "Seer", "Holding", "Roster" })
        {
            var destination = name;
            var button = Ui.Button(name, () => Go(destination));
            button.SizeFlagsHorizontal = SizeFlags.ExpandFill;
            services.AddChild(button);
        }
        parent.AddChild(Ui.Label("Exploration build · combat, encounters and risky services await rule validation.", 12, Ui.Muted, true));
    }

    private void Dungeon(Node parent)
    {
        parent.AddChild(Ui.Label($"The depths of Dejenol", 28));
        parent.AddChild(Ui.Label(_paused ? "PAUSED · Resume to issue expedition commands" : $"DEPTH {_world.Position.Floor:D2}  /  {Rules.Directions[_world.Facing].ToUpperInvariant()}  /  EXPLORATION", 12, Ui.Gold));
        parent.AddChild(new Vista { Catalog = _catalog, World = _world, CustomMinimumSize = new(0, 280), SizeFlagsVertical = SizeFlags.ExpandFill });
        var row = Ui.Row(parent, 6);
        foreach (var (label, action) in new (string, Func<CommandResult>)[]
        {
            ("↶ Turn", () => _rules.Turn(_world, -1)), ("↑ Forward", () => _rules.Move(_world, 0)),
            ("↷ Turn", () => _rules.Turn(_world, 1)), ($"Open [{_keys["Open door"]}]", () => _rules.OpenDoor(_world)),
            ("Stairs up", () => _rules.Stairs(_world, false)), ("Stairs down", () => _rules.Stairs(_world, true))
        })
        {
            var callback = action;
            var button = Ui.Button(label, () => Expedition(callback));
            button.SizeFlagsHorizontal = SizeFlags.ExpandFill;
            button.Disabled = _paused;
            row.AddChild(button);
        }
        parent.AddChild(Ui.Label($"{_keys["Forward"]}/{_keys["Backward"]} move · {_keys["Turn left"]}/{_keys["Turn right"]} turn · {_keys["Strafe left"]}/{_keys["Strafe right"]} sidestep · {_keys["Open door"]} open · {_keys["Map"]} map · {_keys["Pause"]} pause", 13, Ui.Muted, true));
        parent.AddChild(Ui.Label("Encounters are inactive. Terrain with unresolved effects blocks entry in this prototype.", 12, Ui.Muted, true));
    }

    private void Roster(Node parent)
    {
        var row = Ui.Row(parent);
        row.AddChild(Ui.Label("The adventurers of Marlith", 27));
        Ui.Space(row);
        row.AddChild(Ui.Button("+ Create character", Creation, true));
        parent.AddChild(Ui.Label("Select a character to inspect them. Add up to four adventurers to your company.", 14, Ui.Muted, true));
        var list = Scroll(parent);
        if (_world.Roster.Count == 0) list.AddChild(Ui.Label("The roster is empty. Create your first adventurer to begin.", 18, Ui.Muted, true));
        foreach (var character in _world.Roster)
        {
            var member = character;
            var card = Ui.Card(list);
            var line = Ui.Row(card);
            var description = Ui.Stack(line, 4);
            description.AddChild(Ui.Label(member.Name, 22));
            description.AddChild(Ui.Label($"{_catalog.Races[member.Race].Name} · {Alignment(member.Alignment)} · {_catalog.Guilds[member.ActiveGuild].Name} {member.GuildLevels[member.ActiveGuild]}", 14, Ui.Muted));
            line.AddChild(Ui.Button("Select", () => Select(member.Id)));
            line.AddChild(Ui.Button(_world.Party.Contains(member.Id) ? "Remove from party" : "Add to party", () => Apply(() => _rules.ToggleParty(_world, member.Id))));
        }
    }

    private void Bank(Node parent)
    {
        parent.AddChild(Ui.Label("The city bank", 28));
        parent.AddChild(Ui.Label("Your account. Your decision.", 15, Ui.Gold));
        if (!SelectedOrPrompt(parent, out var character)) return;
        var card = Ui.Card(parent, character.Name + " · personal account");
        Ui.Pair(card, "Carried gold", character.Gold.ToString("N0"), Ui.Gold);
        Ui.Pair(card, "Bank balance", character.Bank.ToString("N0"), Ui.Teal);
        card.AddChild(Ui.Label("Gold remains carried until you deposit it. The bank is accessible only in town.", 15, Ui.Muted, true));
        var amount = new LineEdit { PlaceholderText = "Amount in whole gold pieces", Text = "100", MaxLength = 18 };
        card.AddChild(amount);
        var row = Ui.Row(card);
        void Transfer(bool deposit)
        {
            if (!long.TryParse(amount.Text, NumberStyles.None, CultureInfo.InvariantCulture, out var value)) { Notice("Enter a positive whole amount."); return; }
            Apply(() => _rules.TransferGold(_world, value, deposit));
        }
        row.AddChild(Ui.Button("Deposit → bank", () => Transfer(true), true));
        row.AddChild(Ui.Button("Withdraw → carried", () => Transfer(false)));
        card.AddChild(Ui.Label("Transfers affect only the selected character. No fees are added.", 13, Ui.Muted, true));
        Ui.Space(parent);
    }

    private void Guilds(Node parent)
    {
        parent.AddChild(Ui.Label("The guild halls", 28));
        parent.AddChild(Ui.Label("Requirements from the original catalogue. Membership fees and training await validation.", 14, Ui.Muted, true));
        if (!SelectedOrPrompt(parent, out var character)) return;
        var list = Scroll(parent);
        for (var i = 0; i < _catalog.Guilds.Count; i++)
        {
            var guild = _catalog.Guilds[i];
            var reasons = _rules.GuildRequirements(character, i);
            var card = Ui.Card(list);
            var row = Ui.Row(card);
            var name = Ui.Label(guild.Name, 21);
            name.SizeFlagsHorizontal = SizeFlags.ExpandFill;
            row.AddChild(name);
            row.AddChild(Ui.Label(character.GuildLevels.TryGetValue(i, out var level) ? $"Member · Level {level}" : reasons.Count == 0 ? "Requirements met" : "Requirements not met", 13, reasons.Count == 0 ? Ui.Teal : Ui.Gold));
            card.AddChild(Ui.Label(reasons.Count == 0 ? "Natural and modified statistics meet the catalogue requirements." : string.Join(" · ", reasons), 14, Ui.Muted, true));
        }
    }

    private void Inventory(Node parent)
    {
        parent.AddChild(Ui.Label("Inventory & equipment", 28));
        if (!SelectedOrPrompt(parent, out var character)) return;
        var card = Ui.Card(parent, character.Name);
        Ui.Pair(card, "Carried items", $"{character.Inventory.Count} / 40");
        if (character.Inventory.Count == 0)
        {
            card.AddChild(Ui.Label("Your pack is empty.", 22));
            card.AddChild(Ui.Label("Starting equipment is not established in the design evidence. This build does not award invented starter gear.", 15, Ui.Muted, true));
        }
        foreach (var item in character.Inventory) card.AddChild(Ui.Label(Knowledge.ItemName(_catalog, item), 18));
        card.AddChild(Ui.Label("Equip, Use and service transactions will be enabled as their original rules are verified.", 13, Ui.Muted, true));
        Ui.Space(parent);
    }

    private void Library(Node parent)
    {
        parent.AddChild(Ui.Label("The library of Marlith", 28));
        parent.AddChild(Ui.Label("Knowledge is earned in the depths.", 15, Ui.Gold));
        var card = Ui.Card(parent, "Discoveries");
        card.AddChild(Ui.Label("No creature or item discoveries yet.", 22));
        card.AddChild(Ui.Label("Unknown identities and hidden statistics stay out of the adventurer's library. The separate Reference tools provide the complete research catalogue.", 15, Ui.Muted, true));
        if (_world.SelectedCharacter is { } character)
        {
            var spells = Ui.Card(parent, character.Name + " · candidate spell access");
            var available = _catalog["guild-spell-access"].Where(row => character.GuildLevels.Any(g =>
                _catalog.Guilds[g.Key].Name == row.Text("guild") && g.Value >= row.Int("guild_level_candidate")))
                .Select(row => _catalog["spells"][row.Int("spell_record_index") - 1])
                .Distinct().Where(spell => Catalog.Stats.Select((s, i) => character.NaturalStats[i] + character.Modifiers[i] >= spell.Int("required_" + s)).All(ok => ok)).ToArray();
            foreach (var spell in available) spells.AddChild(Ui.Label(spell.Name, 18));
            if (available.Length == 0) spells.AddChild(Ui.Label("No eligible spells at your current guild levels and statistics.", 15, Ui.Muted, true));
            spells.AddChild(Ui.Label("Access is a static-source candidate. Casting is pending cost and effect validation.", 13, Ui.Muted, true));
        }
        Ui.Space(parent);
    }

    private void Service(Node parent, string service)
    {
        var (title, description, gate) = service switch
        {
            "Store" => ("The city store", "Equipment, identification, combining, realignment and uncursing.", "Purchase quotes contain an unresolved source index. Stock, charge bundles and equipment eligibility need original-build tests before transactions can be enabled."),
            "Morgue" => ("The morgue", "Recovery has a cost. Death has consequences.", "Search, pending raises, complications and permanent loss remain separate rules. No free revival or automatic body retrieval is substituted."),
            "Seer" => ("The seer's chamber", "Answers from beyond the lamplight.", "Paid inquiry accuracy, target selection and pricing await validation. The seer does not reveal exact coordinates from the save."),
            _ => ("Holding & confinement", "Companions are allies with wills of their own.", "Purchase, binding, realignment and revival need verified prices and outcomes. Companions are not implemented in this build.")
        };
        parent.AddChild(Ui.Label(title, 30));
        parent.AddChild(Ui.Label(description, 16, Ui.Gold, true));
        var card = Ui.Card(parent, "Service awaiting validation");
        card.AddChild(Ui.Label(gate, 17, Ui.Muted, true));
        card.AddChild(Ui.Label("No gold, items, time or random draws have been consumed.", 14, Ui.Teal, true));
        if (service == "Morgue") card.AddChild(Ui.Label("No casualties are recorded in this exploration world.", 15, Ui.Ink, true));
        card.AddChild(Ui.Button("Return to town", () => Go("Town")));
        Ui.Space(parent);
    }

    private void Reference(Node parent)
    {
        parent.AddChild(Ui.Label("Reference tools", 28));
        parent.AddChild(Ui.Label("DEVELOPMENT VIEW · Complete raw data · Does not add discoveries", 12, Ui.Gold, true));
        var row = Ui.Row(parent);
        var table = new OptionButton { CustomMinimumSize = new(210, 42) };
        foreach (var name in Catalog.TableNames) table.AddItem(name);
        row.AddChild(table);
        var search = new LineEdit { PlaceholderText = "Search every raw field…", SizeFlagsHorizontal = SizeFlags.ExpandFill };
        row.AddChild(search);
        row.AddChild(Ui.Button("Floor atlas", AtlasModal));
        var count = Ui.Label("", 13, Ui.Muted);
        parent.AddChild(count);
        var list = Scroll(parent);
        void Populate()
        {
            Ui.Clear(list);
            var name = Catalog.TableNames[table.Selected];
            var found = _catalog[name].Where(record => record.Fields.Values.Any(value => value.Contains(search.Text, StringComparison.OrdinalIgnoreCase))).ToArray();
            count.Text = $"{found.Length:N0} matches · first 100 shown · source: {name}-local.csv";
            foreach (var record in found.Take(100))
            {
                var entry = record;
                var identity = record.Fields.GetValueOrDefault("name", record.Fields.GetValueOrDefault("spell", record.Fields.GetValueOrDefault("cell_index", record.Fields.GetValueOrDefault("slot", "record"))));
                var index = record.Fields.GetValueOrDefault("record_index", "");
                var button = Ui.Button((index.Length > 0 ? $"{index.PadLeft(3)}  ·  " : "") + identity, () => RecordModal(entry, name));
                button.Alignment = HorizontalAlignment.Left;
                list.AddChild(button);
            }
        }
        table.ItemSelected += _ => Populate();
        search.TextChanged += _ => Populate();
        Populate();
    }

    private void Settings(Node parent)
    {
        parent.AddChild(Ui.Label("Settings", 28));
        var list = Scroll(parent);
        var card = Ui.Card(list, "Presentation");
        var row = Ui.Row(card);
        row.AddChild(Ui.Label("Text size", 17));
        foreach (var size in new[] { 14, 16, 18 })
        {
            var selectedSize = size;
            row.AddChild(Ui.Button(size.ToString(), () => { _fontSize = selectedSize; SaveSettings(); Render(); }));
        }
        card.AddChild(Ui.Button(_highContrast ? "High contrast: on" : "High contrast: off", () => { _highContrast = !_highContrast; SaveSettings(); Render(); }));
        card.AddChild(Ui.Button("Toggle fullscreen [F11]", Fullscreen));
        card.AddChild(Ui.Label("Movement is instant. There are no camera shakes or flashing effects. All feedback is available as text.", 14, Ui.Muted, true));
        var controls = Ui.Card(list, "Keyboard bindings");
        controls.AddChild(Ui.Label("Choose an action, then press an unused letter key. Arrow keys also move and turn. Esc cancels rebinding.", 14, Ui.Muted, true));
        foreach (var pair in _keys)
        {
            var action = pair.Key;
            controls.AddChild(Ui.Button($"{action.PadRight(16)}   {pair.Value}", () => { _rebinding = action; Notice($"Press a letter key for {action}. Esc cancels."); }));
        }
    }

    private void Help(Node parent)
    {
        parent.AddChild(Ui.Label("A guide to the depths", 28));
        var list = Scroll(parent);
        foreach (var (title, text) in new[]
        {
            ("Begin in Marlith", "Create an adventurer, allocate the racial point pool and assemble a party in the roster. The bank holds each character's gold separately. Inspect guild eligibility before entering Dejenol."),
            ("Explore deliberately", "Move with W/S, turn with A/D and sidestep with Q/E. Arrow keys also move and turn. Face a visible door and press O. Use stairs at the current cell. Return to the entrance at 9 east, 11 north on depth 1 and take the stairs up."),
            ("Keep your own map", "M expands the discovery map. Only visited cells are recorded. Add a note to the current cell. Secret doors are rendered as ordinary walls. Reference tools are a separate development view and never alter discoveries."),
            ("Know this build", "This is a reference-data and exploration prototype for design document 1.3. Combat, encounters, loot, progression, active spells, companions and risky services are not implemented. Hazard cells and unverified stair transitions reject movement. No completed milestone or runtime parity is claimed."),
            ("Persistent worlds", "Every successful command commits the entire world. The previous snapshot is kept as a corruption recovery copy. There is no offline simulation or catch-up. This prototype uses its own save ruleset and cannot import or overwrite original Mordor saves."),
            ("Original terminology", "Natural statistics are permanent values; modifiers are separate. Your active guild differs from your complete guild history. Carried gold differs from bank holdings. Dead, Stoned and Rock are distinct conditions in the design."),
            ("Credits & provenance", "Original Mordor: The Depths of Dejenol by David Allen. This development client uses the supplied research exports and new procedural vector artwork. No original executable, artwork, music or help archive is bundled. Godot Engine is distributed under its own MIT license. See docs/IMPLEMENTATION.md for evidence and limits.")
        })
        {
            var card = Ui.Card(list, title);
            card.AddChild(Ui.Label(text, 16, Ui.Muted, true));
        }
    }

    private void Footer()
    {
        _noticeLabel = Ui.Label(_notice, 14, Ui.Gold, true);
        _root.AddChild(_noticeLabel);
        var panel = new PanelContainer();
        panel.AddThemeStyleboxOverride("panel", Ui.Box(Ui.Background, Ui.Line, 6, 12));
        _root.AddChild(panel);
        var row = Ui.Row(panel, 18);
        row.AddChild(Ui.Label("JOURNAL", 11, Ui.Muted));
        var log = Ui.Label(string.Join("\n", _world.Journal.TakeLast(2)), 13, Ui.Muted, true);
        row.AddChild(log);
    }

    private static VBoxContainer Scroll(Node parent)
    {
        var scroll = new ScrollContainer { SizeFlagsVertical = SizeFlags.ExpandFill, SizeFlagsHorizontal = SizeFlags.ExpandFill, HorizontalScrollMode = ScrollContainer.ScrollMode.Disabled };
        parent.AddChild(scroll);
        return Ui.Stack(scroll);
    }

    private bool SelectedOrPrompt(Node parent, out Character character)
    {
        character = _world.SelectedCharacter!;
        if (character is not null) return true;
        parent.AddChild(Ui.Label("Create and select an adventurer first.", 18, Ui.Muted));
        parent.AddChild(Ui.Button("Create character", Creation, true));
        return false;
    }

    private void Go(string page)
    {
        _page = page;
        _rebinding = null;
        Render();
    }

    private void Select(Guid id) => Apply(() =>
    {
        _world.Selected = id;
        return CommandResult.Ok($"Selected {_world.SelectedCharacter!.Name}.");
    });

    private void Apply(Func<CommandResult> command, string? destination = null)
    {
        var before = _world.Clone();
        try
        {
            var result = command();
            if (!result.Success) { _world = before; Notice(result.Message); return; }
            _store.Save(_world);
            _notice = result.Message;
            if (destination is not null) _page = destination;
            if (_world.InTown && _page == "Dungeon") _page = "Town";
            Render();
        }
        catch (Exception error)
        {
            _world = before;
            Notice("The action was not committed: " + error.Message);
            GD.PushError(error.ToString());
        }
    }

    private void Notice(string text)
    {
        _notice = text;
        if (_noticeLabel is not null) _noticeLabel.Text = text;
    }

    private void Expedition(Func<CommandResult> action)
    {
        if (_paused) { Notice("Resume exploration before issuing a command."); return; }
        Apply(action);
    }

    private void TogglePause() { _paused = !_paused; Render(); }
    private static string Alignment(int alignment) => alignment switch { 1 => "Good", 2 => "Neutral", 4 => "Evil", _ => "Unknown" };
    private static void Fullscreen() => DisplayServer.WindowSetMode(DisplayServer.WindowGetMode() == DisplayServer.WindowMode.Fullscreen ? DisplayServer.WindowMode.Windowed : DisplayServer.WindowMode.Fullscreen);

    private VBoxContainer Modal(string title, int width = 760, int height = 630)
    {
        CloseModal();
        var overlay = new ColorRect { Color = new(0, 0, 0, .8f), MouseFilter = MouseFilterEnum.Stop };
        overlay.SetAnchorsAndOffsetsPreset(LayoutPreset.FullRect);
        AddChild(overlay);
        _modal = overlay;
        var center = new CenterContainer();
        center.SetAnchorsAndOffsetsPreset(LayoutPreset.FullRect);
        overlay.AddChild(center);
        var panel = new PanelContainer { CustomMinimumSize = new(width, height) };
        center.AddChild(panel);
        var stack = Ui.Stack(panel);
        var header = Ui.Row(stack);
        header.AddChild(Ui.Label(title, 27));
        Ui.Space(header);
        header.AddChild(Ui.Button("Close  [Esc]", CloseModal));
        return stack;
    }

    private void CloseModal()
    {
        if (_modal is null) return;
        RemoveChild(_modal);
        _modal.QueueFree();
        _modal = null;
    }

    private void Creation()
    {
        if (!_world.InTown) { Notice("Recruit in town."); return; }
        var stack = Modal("Create an adventurer", 860, 690);
        var identity = Ui.Row(stack);
        var name = new LineEdit { PlaceholderText = "Character name", MaxLength = 24, CustomMinimumSize = new(250, 42), SizeFlagsHorizontal = SizeFlags.ExpandFill };
        identity.AddChild(name);
        var race = new OptionButton { CustomMinimumSize = new(130, 42) };
        foreach (var entry in _catalog.Races) race.AddItem(entry.Name);
        identity.AddChild(race);
        var sex = new OptionButton { CustomMinimumSize = new(110, 42) };
        sex.AddItem("Female"); sex.AddItem("Male");
        identity.AddChild(sex);
        var alignment = new OptionButton { CustomMinimumSize = new(110, 42) };
        identity.AddChild(alignment);
        var stats = _rules.InitialStats(0);
        var points = Ui.Label("", 17, Ui.Gold);
        stack.AddChild(points);
        var body = Ui.Row(stack, 30);
        body.SizeFlagsVertical = SizeFlags.ExpandFill;
        var statList = Ui.Stack(body);
        var eligible = Ui.Stack(body);
        eligible.CustomMinimumSize = new(270, 0);
        var values = new Label[6];
        var limits = new Label[6];
        var minus = new Button[6];
        var plus = new Button[6];
        var guildPreview = Ui.Label("", 14, Ui.Muted, true);
        eligible.AddChild(Ui.Label("GUILD REQUIREMENTS", 12, Ui.Gold));
        Scroll(eligible).AddChild(guildPreview);
        eligible.AddChild(Ui.Label("All characters begin as a level 1 Nomad. Guild entry is a separate town action.", 14, Ui.Muted, true));
        void Update()
        {
            var pool = _rules.RemainingPoints(race.Selected, stats);
            points.Text = $"{pool} points remaining · Racial minimum + 5, plus the original allocation pool";
            for (var i = 0; i < 6; i++)
            {
                var minimum = _catalog.Races[race.Selected].Int("min_" + Catalog.Stats[i]);
                var maximum = _catalog.Races[race.Selected].Int("max_" + Catalog.Stats[i]);
                values[i].Text = stats[i].ToString();
                limits[i].Text = $"{minimum}–{maximum}";
                minus[i].Disabled = stats[i] <= minimum;
                plus[i].Disabled = pool <= 0 || stats[i] >= maximum;
            }
            var candidate = new Character { Race = race.Selected, Alignment = alignment.GetSelectedId(), NaturalStats = stats };
            guildPreview.Text = string.Join("\n", Enumerable.Range(0, 12).Select(i =>
            {
                var reasons = _rules.GuildRequirements(candidate, i);
                return (reasons.Count == 0 ? "✓  " : "·  ") + _catalog.Guilds[i].Name + (reasons.Count == 0 ? "" : "  —  " + string.Join(", ", reasons));
            }));
        }
        for (var i = 0; i < 6; i++)
        {
            var statIndex = i;
            var row = Ui.Row(statList, 8);
            var label = Ui.Label(Catalog.StatLabels[i], 17);
            label.CustomMinimumSize = new(125, 0);
            row.AddChild(label);
            minus[i] = Ui.Button("−", () => { stats[statIndex]--; Update(); });
            row.AddChild(minus[i]);
            values[i] = Ui.Label("", 23, Ui.Ink);
            values[i].CustomMinimumSize = new(36, 0);
            values[i].HorizontalAlignment = HorizontalAlignment.Center;
            row.AddChild(values[i]);
            plus[i] = Ui.Button("+", () => { stats[statIndex]++; Update(); });
            row.AddChild(plus[i]);
            limits[i] = Ui.Label("", 12, Ui.Muted);
            row.AddChild(limits[i]);
        }
        void ResetRace()
        {
            stats = _rules.InitialStats(race.Selected);
            alignment.Clear();
            foreach (var mask in new[] { 1, 2, 4 })
                if ((_catalog.Races[race.Selected].Int("alignment_mask_raw") & mask) != 0) alignment.AddItem(Alignment(mask), mask);
            Update();
        }
        race.ItemSelected += _ => ResetRace();
        alignment.ItemSelected += _ => Update();
        ResetRace();
        var unused = new CheckBox { Text = "I accept leaving any remaining allocation points unused." };
        stack.AddChild(unused);
        stack.AddChild(Ui.Label("Starting record: age 16 · 15 HP · 1,500 carried gold · no banked gold · Nomad 1", 14, Ui.Teal));
        var errorLabel = Ui.Label("", 14, Ui.Gold, true);
        stack.AddChild(errorLabel);
        stack.AddChild(Ui.Button("Begin in Marlith", () =>
        {
            var previousCount = _world.Roster.Count;
            Apply(() => _rules.Create(_world, name.Text, race.Selected, sex.GetItemText(sex.Selected), alignment.GetSelectedId(), stats, unused.ButtonPressed), "Town");
            if (_world.Roster.Count > previousCount) CloseModal(); else errorLabel.Text = _notice;
        }, true));
        name.GrabFocus();
    }

    private void MapModal()
    {
        if (_world.InTown) { Notice("Enter the dungeon to chart your route."); return; }
        var stack = Modal($"Automap · Depth {_world.Position.Floor}", 730, 710);
        stack.AddChild(new MapView { Catalog = _catalog, World = _world, CustomMinimumSize = new(540, 490), SizeFlagsVertical = SizeFlags.ExpandFill });
        stack.AddChild(Ui.Label("Gold dot: stairs · Triangle: your facing · Small dot: your note", 13, Ui.Muted));
        var row = Ui.Row(stack);
        var note = new LineEdit { Text = _world.Notes.GetValueOrDefault(_world.Position.Key, ""), PlaceholderText = "Note for the current cell…", MaxLength = 160, SizeFlagsHorizontal = SizeFlags.ExpandFill };
        row.AddChild(note);
        row.AddChild(Ui.Button("Save note", () => { Apply(() => _rules.Note(_world, note.Text)); MapModal(); }));
    }

    private void AtlasModal()
    {
        var stack = Modal("Dungeon atlas · Development view", 740, 730);
        stack.AddChild(Ui.Label("All 13,500 source cells. This view does not reveal or modify the expedition map.", 13, Ui.Gold, true));
        var floor = new OptionButton { CustomMinimumSize = new(0, 42) };
        for (var i = 1; i <= 15; i++) floor.AddItem($"Depth {i:D2} · 30 × 30 cells");
        stack.AddChild(floor);
        var map = new MapView { Catalog = _catalog, World = _world, Atlas = true, CustomMinimumSize = new(580, 520), SizeFlagsVertical = SizeFlags.ExpandFill };
        stack.AddChild(map);
        floor.ItemSelected += index => { map.Floor = (int)index + 1; map.QueueRedraw(); };
        stack.AddChild(Ui.Label("Candidate orientation: x increases east, y increases north. Runtime overlay still required.", 12, Ui.Muted, true));
    }

    private void RecordModal(DataRecord record, string table)
    {
        var stack = Modal("Source record", 800, 720);
        stack.AddChild(Ui.Label($"{table}-local.csv · Extracted candidate · Runtime parity unverified", 13, Ui.Gold, true));
        var list = Scroll(stack);
        foreach (var field in record.Fields) Ui.Pair(list, field.Key, field.Value);
    }

    private void CharacterModal()
    {
        if (_world.SelectedCharacter is not { } character) return;
        var stack = Modal(character.Name + " · Character sheet", 710, 640);
        var list = Scroll(stack);
        Ui.Pair(list, "Race / sex / alignment", $"{_catalog.Races[character.Race].Name} / {character.Sex} / {Alignment(character.Alignment)}");
        Ui.Pair(list, "Age in days", character.AgeDays.ToString("N0"));
        Ui.Pair(list, "Condition", character.Condition);
        Ui.Pair(list, "HP / SP", $"{character.Hp}/{character.MaxHp}  /  {character.Sp}/{character.MaxSp}");
        for (var i = 0; i < 6; i++) Ui.Pair(list, Catalog.StatLabels[i], $"{character.NaturalStats[i]} natural  {character.Modifiers[i]:+0;-0;0} modifier  = {character.NaturalStats[i] + character.Modifiers[i]}");
        list.AddChild(Ui.Label("GUILD HISTORY", 13, Ui.Gold));
        foreach (var guild in character.GuildLevels) Ui.Pair(list, _catalog.Guilds[guild.Key].Name + (guild.Key == character.ActiveGuild ? " · active" : ""), $"Level {guild.Value} · {character.GuildExperience.GetValueOrDefault(guild.Key)} XP");
        list.AddChild(Ui.Label("Attack and defense totals remain hidden until all guild and equipment contributions are validated.", 14, Ui.Muted, true));
    }

    public override void _Input(InputEvent input)
    {
        if (input is not InputEventKey { Pressed: true, Echo: false } key || _world is null) return;
        var code = key.Keycode;
        if (_rebinding is not null)
        {
            GetViewport().SetInputAsHandled();
            if (code == Key.Escape) { _rebinding = null; Notice("Rebinding canceled."); return; }
            if (code < Key.A || code > Key.Z || _keys.Any(pair => pair.Key != _rebinding && pair.Value == code)) { Notice("Choose an unused letter key."); return; }
            _keys[_rebinding] = code;
            _rebinding = null;
            SaveSettings(); Render(); return;
        }
        if (code == Key.F11) { Fullscreen(); GetViewport().SetInputAsHandled(); return; }
        if (code == Key.Escape && _modal is not null) { CloseModal(); GetViewport().SetInputAsHandled(); return; }
        if (_modal is not null || GetViewport().GuiGetFocusOwner() is LineEdit or TextEdit) return;
        if (code == Key.F1) { Go("Help"); GetViewport().SetInputAsHandled(); return; }
        if (_world.InTown) return;
        if (code == _keys["Pause"]) { TogglePause(); GetViewport().SetInputAsHandled(); return; }
        if (code == _keys["Map"]) { MapModal(); GetViewport().SetInputAsHandled(); return; }
        if (_page != "Dungeon") return;
        Func<CommandResult>? action = code switch
        {
            Key.Up => () => _rules.Move(_world, 0), Key.Down => () => _rules.Move(_world, 2),
            Key.Left => () => _rules.Turn(_world, -1), Key.Right => () => _rules.Turn(_world, 1), _ => null
        };
        if (code == _keys["Forward"]) action = () => _rules.Move(_world, 0);
        if (code == _keys["Backward"]) action = () => _rules.Move(_world, 2);
        if (code == _keys["Turn left"]) action = () => _rules.Turn(_world, -1);
        if (code == _keys["Turn right"]) action = () => _rules.Turn(_world, 1);
        if (code == _keys["Strafe left"]) action = () => _rules.Move(_world, 3);
        if (code == _keys["Strafe right"]) action = () => _rules.Move(_world, 1);
        if (code == _keys["Open door"]) action = () => _rules.OpenDoor(_world);
        if (action is not null) { Expedition(action); GetViewport().SetInputAsHandled(); }
    }

    private void LoadSettings()
    {
        if (_smoke) return;
        var config = new ConfigFile();
        if (config.Load("user://settings.cfg") != Error.Ok) return;
        _fontSize = Math.Clamp(config.GetValue("ui", "font_size", 16).AsInt32(), 14, 18);
        _highContrast = config.GetValue("ui", "high_contrast", false).AsBool();
        var loaded = new Dictionary<string, Key>();
        foreach (var action in _keys.Keys)
        {
            var key = (Key)config.GetValue("keys", action, (long)_keys[action]).AsInt64();
            if (key < Key.A || key > Key.Z || loaded.ContainsValue(key)) return;
            loaded[action] = key;
        }
        foreach (var pair in loaded) _keys[pair.Key] = pair.Value;
    }

    private void SaveSettings()
    {
        if (_smoke) return;
        var config = new ConfigFile();
        config.SetValue("ui", "font_size", _fontSize);
        config.SetValue("ui", "high_contrast", _highContrast);
        foreach (var pair in _keys) config.SetValue("keys", pair.Key, (long)pair.Value);
        var result = config.Save("user://settings.cfg");
        if (result != Error.Ok) Notice("Settings could not be saved: " + result);
    }

    private async void SmokeTest()
    {
        try
        {
            Directory.CreateDirectory(ProjectSettings.GlobalizePath("res://Artifacts"));
            Creation();
            Descendants<LineEdit>(_modal!).Single(edit => edit.PlaceholderText == "Character name").Text = "Aelith";
            var raceChoice = Descendants<OptionButton>(_modal!).First();
            raceChoice.Select(1);
            raceChoice.EmitSignal(OptionButton.SignalName.ItemSelected, 1L);
            var alignmentChoice = Descendants<OptionButton>(_modal!).Last();
            alignmentChoice.Select(1);
            alignmentChoice.EmitSignal(OptionButton.SignalName.ItemSelected, 1L);
            Descendants<CheckBox>(_modal!).Single().ButtonPressed = true;
            Press("Begin in Marlith");
            if (_world.SelectedCharacter is not { Name: "Aelith", Race: 1, Alignment: 2 } || _modal is not null) throw new InvalidOperationException("Creation UI failed.");
            Go("Bank");
            Press("Deposit → bank");
            if (_world.SelectedCharacter.Bank != 100) throw new InvalidOperationException("Bank UI failed.");
            Press("Withdraw → carried");
            Go("Town");
            await Capture("town");
            Creation(); await Capture("creation"); CloseModal();
            foreach (var page in new[] { "Roster", "Guilds", "Bank", "Inventory", "Library", "Reference", "Settings", "Help", "Store", "Morgue", "Seer", "Holding" })
            {
                Go(page);
                await ToSignal(GetTree(), SceneTree.SignalName.ProcessFrame);
            }
            Go("Town");
            Press("Enter Dejenol  ↓");
            if (_world.InTown || _page != "Dungeon") throw new InvalidOperationException("Entry UI failed.");
            await Capture("dungeon");
            MapModal(); await Capture("map"); CloseModal();
            AtlasModal(); await Capture("atlas"); CloseModal();
            _store.Save(_world);
            if (_store.Load().Position != _world.Position) throw new InvalidOperationException("Save position mismatch.");
            // Exercise keyboard dispatch and paused-input rejection.
            _Input(new InputEventKey { Keycode = Key.P, Pressed = true });
            var before = _world.Position;
            _Input(new InputEventKey { Keycode = Key.W, Pressed = true });
            if (!_paused || _world.Position != before) throw new InvalidOperationException("Paused movement was accepted.");
            _Input(new InputEventKey { Keycode = Key.P, Pressed = true });
            _Input(new InputEventKey { Keycode = Key.A, Pressed = true });
            if (_world.Facing != 3) throw new InvalidOperationException("Keyboard turn failed.");
            Press("Stairs up");
            for (var i = 0; i < 3; i++)
            {
                _rules.Create(_world, new[] { "Bram", "Corin", "Dara" }[i], 0, "Male", 2, _rules.InitialStats(0), true);
                _rules.ToggleParty(_world, _world.Selected);
            }
            _rules.EnterDungeon(_world);
            _fontSize = 18;
            Go("Dungeon");
            await Capture("party-large-text");
            _rules.Stairs(_world, false);
            Go("Town");
            Creation();
            await Capture("creation-large-text");
            var submit = Descendants<Button>(_modal!).Single(button => button.Text == "Begin in Marlith");
            if (submit.GetGlobalRect().End.Y > GetViewportRect().Size.Y) throw new InvalidOperationException("Creation submit is outside the viewport.");
            CloseModal();
            GD.Print("SMOKE PASS: all screens; UI creation, banking and entry; keyboard and pause; four-member layout; map, atlas, and save/load.");
            GetTree().Quit();
        }
        catch (Exception error) { GD.PushError(error.ToString()); GetTree().Quit(1); }
    }

    private async System.Threading.Tasks.Task Capture(string name)
    {
        await ToSignal(GetTree(), SceneTree.SignalName.ProcessFrame);
        await ToSignal(GetTree(), SceneTree.SignalName.ProcessFrame);
        if (DisplayServer.GetName() == "headless") return;
        await ToSignal(RenderingServer.Singleton, RenderingServer.SignalName.FramePostDraw);
        var suffix = OS.GetCmdlineUserArgs().Contains("--compact-test") ? "-compact" : "";
        var result = GetViewport().GetTexture().GetImage().SavePng($"res://Artifacts/{name}{suffix}.png");
        if (result != Error.Ok) throw new IOException("Screenshot failed: " + result);
    }

    private static IEnumerable<T> Descendants<T>(Node node) where T : Node
    {
        foreach (var child in node.GetChildren())
        {
            if (child is T match) yield return match;
            foreach (var descendant in Descendants<T>(child)) yield return descendant;
        }
    }

    private void Press(string text)
    {
        var button = Descendants<Button>(this).FirstOrDefault(button => button.Text == text && !button.Disabled)
            ?? throw new InvalidOperationException("Missing UI action: " + text);
        button.EmitSignal(Button.SignalName.Pressed);
    }
}
