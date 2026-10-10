using Godot;
using Mordor.Core;

namespace Mordor.Client;

public partial class MapView : Control
{
    public Catalog Catalog { get; set; } = null!;
    public World World { get; set; } = null!;
    public bool Atlas { get; set; }
    public bool Zoomed { get; set; }
    public int Floor { get; set; } = 1;
    public override void _Ready() { Resized += QueueRedraw; MouseFilter = MouseFilterEnum.Ignore; }

    public override void _Draw()
    {
        if (Catalog is null || World is null) return;
        DrawRect(new(Vector2.Zero, Size), Ui.Background);
        var span = Zoomed && !Atlas ? 11 : 30;
        var startX = span == 30 ? 1 : Math.Clamp(World.Position.X - 5, 1, 31 - span);
        var startY = span == 30 ? 1 : Math.Clamp(World.Position.Y - 5, 1, 31 - span);
        var unit = Math.Min(Size.X, Size.Y) / (span + 2);
        var origin = (Size - new Vector2(unit * span, unit * span)) / 2;
        var floor = Atlas ? Floor : Math.Max(1, World.Position.Floor);
        for (var y = startY; y < startY + span; y++)
        for (var x = startX; x < startX + span; x++)
        {
            var at = new CellPosition(floor, x, y);
            if (!Atlas && !Knowledge.Knows(World, at)) continue;
            var cell = Catalog.Cell(at)!;
            var corner = origin + new Vector2((x - startX) * unit, (span - 1 - y + startY) * unit);
            if (cell.Rock) { if (Atlas) DrawRect(new(corner, new(unit, unit)), new("465056")); continue; }
            DrawRect(new(corner + Vector2.One, new(unit - 1, unit - 1)), Atlas ? new("243237") : new("354d49"));
            if (cell.StairsUp || cell.StairsDown) DrawCircle(corner + new Vector2(unit / 2, unit / 2), unit * .22f, Ui.Gold);
            if (World.Notes.ContainsKey(at.Key) && !Atlas) DrawCircle(corner + new Vector2(unit * .75f, unit * .25f), 2, Ui.Ink);
            for (var facing = 0; facing < 4; facing++)
            {
                var edge = Geometry.Edge(Catalog, at, facing);
                if (edge.Kind == EdgeKind.Passage) continue;
                var a = corner + (facing switch { 1 => new Vector2(unit, 0), 2 => new Vector2(0, unit), _ => Vector2.Zero });
                var b = corner + (facing switch { 0 => new Vector2(unit, 0), 1 or 2 => new Vector2(unit, unit), _ => new Vector2(0, unit) });
                DrawLine(a, b, edge.Kind == EdgeKind.Door ? Ui.Gold : new("7b8c8b"), edge.Kind == EdgeKind.Door ? 2 : 1);
            }
        }
        if (!Atlas && !World.InTown)
        {
            var center = origin + new Vector2((World.Position.X - startX + .5f) * unit, (span - .5f - World.Position.Y + startY) * unit);
            var forward = Vector2.Up.Rotated(World.Facing * Mathf.Pi / 2);
            var side = forward.Orthogonal();
            DrawColoredPolygon([center + forward * unit * .5f, center - forward * unit * .35f + side * unit * .35f, center - forward * unit * .35f - side * unit * .35f], Ui.Teal.Lightened(.3f));
        }
    }
}
