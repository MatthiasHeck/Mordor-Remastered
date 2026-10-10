using Godot;
using Mordor.Core;

namespace Mordor.Client;

/// <summary>Original procedural presentation; it consumes no simulation RNG.</summary>
public partial class Vista : Control
{
    public Catalog Catalog { get; set; } = null!;
    public World World { get; set; } = null!;
    public override void _Ready() { Resized += QueueRedraw; MouseFilter = MouseFilterEnum.Ignore; ClipContents = true; }

    private Vector2 P(float x, float y) => new(x * Size.X, y * Size.Y);
    private void Poly(Color color, params Vector2[] points) => DrawColoredPolygon(points, color);

    public override void _Draw()
    {
        if (World is null || Size.X < 1) return;
        DrawRect(new(Vector2.Zero, Size), new("111d24"));
        if (World.InTown) Town(); else Corridor();
    }

    private void Town()
    {
        for (var band = 0; band < 60; band++)
            DrawRect(new(0, band * Size.Y / 60, Size.X, Size.Y / 60 + 1), new Color("35434b").Lerp(new("bba077"), band / 100f));
        DrawCircle(P(0.71f, 0.24f), Size.Y * 0.085f, new("ccba94"));
        Poly(new("39434a"), P(0, .54f), P(.12f, .24f), P(.24f, .48f), P(.39f, .13f), P(.65f, .48f), P(.82f, .31f), P(1, .55f), P(1, 1), P(0, 1));
        Poly(new("283239"), P(0, .64f), P(.17f, .41f), P(.33f, .61f), P(.52f, .36f), P(.7f, .68f), P(.89f, .47f), P(1, .68f), P(1, 1), P(0, 1));
        for (var i = 0; i < 11; i++)
        {
            var x = i / 10f - .05f;
            var y = .55f + (i % 3) * .045f;
            DrawRect(new(P(x, y), P(.11f, 1 - y)), i % 2 == 0 ? new("303739") : new("383c3a"));
            Poly(new("1f2a30"), P(x - .015f, y), P(x + .055f, y - .11f), P(x + .125f, y));
            for (var window = 0; window < 3; window++) DrawRect(new(P(x + .025f + window * .025f, y + .045f), P(.01f, .032f)), new("bd9960"));
        }
        Poly(new("665a48"), P(.38f, 1), P(.49f, .72f), P(.55f, .72f), P(.73f, 1));
        DrawRect(new(P(.39f, .38f), P(.24f, .38f)), new("55564c"));
        DrawRect(new(P(.36f, .30f), P(.07f, .48f)), new("474d48"));
        DrawRect(new(P(.59f, .30f), P(.07f, .48f)), new("474d48"));
        for (var i = 0; i < 5; i++)
        {
            DrawRect(new(P(.355f + i * .017f, .275f), P(.010f, .04f)), new("474d48"));
            DrawRect(new(P(.585f + i * .017f, .275f), P(.010f, .04f)), new("474d48"));
        }
        DrawCircle(P(.51f, .57f), Size.X * .048f, new("171f20"));
        DrawRect(new(P(.462f, .57f), P(.096f, .2f)), new("171f20"));
        for (var y = 0; y < 7; y++) DrawLine(P(.39f, .4f + y * .05f), P(.63f, .4f + y * .05f), new("3a4543"), 1);
        foreach (var x in new[] { .44f, .58f })
        {
            DrawCircle(P(x, .62f), 10, new Color(.9f, .6f, .2f, .08f));
            DrawCircle(P(x, .62f), 4, new("e7b770"));
        }
        // Foreground silhouettes frame the town without importing original art.
        Poly(new("182326"), P(0, 1), P(0, .5f), P(.08f, .42f), P(.19f, .58f), P(.19f, 1));
        Poly(new("182326"), P(.87f, 1), P(.87f, .57f), P(.95f, .46f), P(1, .54f), P(1, 1));
        DrawRect(new(P(0, .92f), P(1, .08f)), new Color(.04f, .07f, .08f, .4f));
    }

    private void Corridor()
    {
        Poly(new("141c20"), P(0, 0), P(1, 0), P(.57f, .47f), P(.43f, .47f));
        Poly(new("343430"), P(0, 1), P(1, 1), P(.57f, .47f), P(.43f, .47f));
        var cells = new List<CellPosition>();
        var current = World.Position;
        for (var i = 0; i < 5; i++)
        {
            cells.Add(current);
            var edge = Geometry.Edge(Catalog, current, World.Facing);
            if (edge.Kind == EdgeKind.Wall || edge.Kind == EdgeKind.Door && !World.OpenDoors.Contains(edge.Key)) break;
            current = current.Step(World.Facing);
        }
        for (var depth = cells.Count - 1; depth >= 0; depth--)
        {
            var near = Frame(depth);
            var far = Frame(depth + 1);
            var shade = new Color("566064").Darkened(depth * .13f);
            DrawLine(new(near.Position.X, near.End.Y), new(near.End.X, near.End.Y), new("51524a"), 2);
            for (var side = 0; side < 2; side++)
            {
                var edge = Geometry.Edge(Catalog, cells[depth], (World.Facing + (side == 0 ? 3 : 1)) % 4);
                var a = side == 0 ? near.Position.X : near.End.X;
                var b = side == 0 ? far.Position.X : far.End.X;
                Vector2[] quad = [new(a, near.Position.Y), new(b, far.Position.Y), new(b, far.End.Y), new(a, near.End.Y)];
                Poly(edge.Kind == EdgeKind.Passage || World.OpenDoors.Contains(edge.Key) ? new("10191c") : shade, quad);
                if (edge.Kind != EdgeKind.Passage && !World.OpenDoors.Contains(edge.Key))
                {
                    for (var row = 1; row < 8; row++)
                    {
                        var t = row / 8f;
                        DrawLine(quad[0].Lerp(quad[3], t), quad[1].Lerp(quad[2], t), shade.Darkened(.24f), 2);
                    }
                    DrawLine(quad[1], quad[2], shade.Darkened(.4f), 3);
                    if (edge.Kind == EdgeKind.Door)
                    {
                        var x = Mathf.Lerp(a, b, .5f);
                        DrawLine(new(x, Mathf.Lerp(near.Position.Y, far.Position.Y, .65f)), new(x, Mathf.Lerp(near.End.Y, far.End.Y, .6f)), new("aa8a54"), 7);
                    }
                }
            }
            var front = Geometry.Edge(Catalog, cells[depth], World.Facing);
            if (front.Kind == EdgeKind.Wall || front.Kind == EdgeKind.Door && !World.OpenDoors.Contains(front.Key))
            {
                DrawRect(far, shade.Darkened(.08f));
                for (var row = 1; row < 7; row++)
                {
                    var y = far.Position.Y + row * far.Size.Y / 7;
                    DrawLine(new(far.Position.X, y), new(far.End.X, y), shade.Darkened(.3f), 2);
                    for (var brick = 0; brick < 4; brick++)
                    {
                        var x = far.Position.X + (brick + (row % 2) * .5f) * far.Size.X / 4;
                        DrawLine(new(x, y), new(x, y - far.Size.Y / 7), shade.Darkened(.25f), 1);
                    }
                }
                if (front.Kind == EdgeKind.Door)
                {
                    var door = new Rect2(far.Position + far.Size * new Vector2(.22f, .14f), far.Size * new Vector2(.56f, .86f));
                    DrawRect(door, new Color("493f30").Darkened(depth * .1f));
                    for (var plank = 0; plank < 5; plank++) DrawLine(door.Position + new Vector2(plank * door.Size.X / 5, 0), new(door.Position.X + plank * door.Size.X / 5, door.End.Y), new("2c302b"), 2);
                    DrawRect(new(door.Position + door.Size * new Vector2(0, .3f), new(door.Size.X, 5)), new("212b2c"));
                    DrawRect(new(door.Position + door.Size * new Vector2(0, .72f), new(door.Size.X, 5)), new("212b2c"));
                    DrawCircle(door.Position + door.Size * new Vector2(.8f, .52f), Math.Max(2, 5 - depth), Ui.Gold);
                }
            }
        }
        var here = Catalog.Cell(World.Position)!;
        if (here.StairsUp || here.StairsDown)
            for (var step = 0; step < 6; step++)
            {
                var y = .69f + step * .045f;
                DrawLine(P(.31f - step * .028f, y), P(.69f + step * .028f, y), new("97937a"), 3);
            }
        DrawCircle(P(.12f, .42f), 28, new Color(.9f, .65f, .25f, .035f));
        DrawLine(P(.12f, .43f), P(.12f, .53f), new("342b22"), 8);
        DrawCircle(P(.12f, .42f), 6, new("edbf71"));
    }

    private Rect2 Frame(int depth)
    {
        var scale = MathF.Pow(.56f, depth);
        return new(P(.5f - .5f * scale, .47f - .49f * scale), P(scale, .99f * scale));
    }
}
