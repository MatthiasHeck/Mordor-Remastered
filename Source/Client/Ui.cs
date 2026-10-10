using Godot;

namespace Mordor.Client;

internal static class Ui
{
    private static float _textScale = 1;
    public static readonly Color Background = new("10171b"), Panel = new("182126"), Raised = new("202d32"),
        Ink = new("e8e4d8"), Muted = new("9faeaf"), Gold = new("d3b47a"), Teal = new("83b9ac"), Line = new("354247");

    public static Theme MakeTheme(int fontSize, bool contrast)
    {
        _textScale = fontSize / 16f;
        var theme = new Theme { DefaultFontSize = fontSize };
        theme.SetColor("font_color", "Label", Ink);
        theme.SetColor("font_color", "Button", Ink);
        theme.SetColor("font_hover_color", "Button", Gold);
        theme.SetColor("font_disabled_color", "Button", Muted.Darkened(0.25f));
        theme.SetStylebox("normal", "Button", Box(Panel, contrast ? Muted : Line, 6, 12));
        theme.SetStylebox("hover", "Button", Box(Raised, Gold, 6, 12));
        theme.SetStylebox("pressed", "Button", Box(new("30473f"), Teal, 6, 12));
        theme.SetStylebox("focus", "Button", Box(new(0, 0, 0, 0), Gold, 6, 2, 2));
        theme.SetStylebox("disabled", "Button", Box(Background, Line, 6, 12));
        theme.SetStylebox("panel", "PanelContainer", Box(Panel, Line, 10, 18));
        theme.SetStylebox("normal", "LineEdit", Box(Background, Line, 5, 10));
        theme.SetStylebox("focus", "LineEdit", Box(Background, Gold, 5, 10));
        theme.SetColor("font_color", "LineEdit", Ink);
        theme.SetColor("font_placeholder_color", "LineEdit", Muted);
        theme.SetColor("caret_color", "LineEdit", Gold);
        theme.SetStylebox("background", "ProgressBar", Box(Background, Background, 2, 0));
        theme.SetStylebox("fill", "ProgressBar", Box(Teal, Teal, 2, 0));
        theme.SetConstant("separation", "VBoxContainer", 10);
        theme.SetConstant("separation", "HBoxContainer", 10);
        return theme;
    }

    public static StyleBoxFlat Box(Color color, Color border, int radius = 6, int margin = 12, int thickness = 1) => new()
    {
        BgColor = color, BorderColor = border,
        BorderWidthBottom = thickness, BorderWidthTop = thickness, BorderWidthLeft = thickness, BorderWidthRight = thickness,
        CornerRadiusTopLeft = radius, CornerRadiusTopRight = radius, CornerRadiusBottomLeft = radius, CornerRadiusBottomRight = radius,
        ContentMarginLeft = margin, ContentMarginRight = margin, ContentMarginTop = margin, ContentMarginBottom = margin
    };

    public static Label Label(string text, int size = 0, Color? color = null, bool wrap = false)
    {
        var label = new Label { Text = text, MouseFilter = Control.MouseFilterEnum.Ignore };
        if (size > 0) label.AddThemeFontSizeOverride("font_size", (int)MathF.Round(size * _textScale));
        if (color.HasValue) label.AddThemeColorOverride("font_color", color.Value);
        if (wrap) { label.AutowrapMode = TextServer.AutowrapMode.WordSmart; label.SizeFlagsHorizontal = Control.SizeFlags.ExpandFill; }
        return label;
    }

    public static Button Button(string text, Action action, bool accent = false)
    {
        var button = new Button { Text = text, CustomMinimumSize = new(0, 42), MouseDefaultCursorShape = Control.CursorShape.PointingHand };
        if (accent) { button.AddThemeStyleboxOverride("normal", Box(new("b89b63"), Gold)); button.AddThemeColorOverride("font_color", Background); }
        button.Pressed += action;
        return button;
    }

    public static VBoxContainer Stack(Node parent, int separation = 10)
    {
        var stack = new VBoxContainer { SizeFlagsHorizontal = Control.SizeFlags.ExpandFill };
        stack.AddThemeConstantOverride("separation", separation);
        parent.AddChild(stack);
        return stack;
    }

    public static HBoxContainer Row(Node parent, int separation = 10)
    {
        var row = new HBoxContainer { SizeFlagsHorizontal = Control.SizeFlags.ExpandFill };
        row.AddThemeConstantOverride("separation", separation);
        parent.AddChild(row);
        return row;
    }

    public static VBoxContainer Card(Node parent, string? eyebrow = null)
    {
        var panel = new PanelContainer { SizeFlagsHorizontal = Control.SizeFlags.ExpandFill };
        parent.AddChild(panel);
        var stack = Stack(panel);
        if (eyebrow is not null) stack.AddChild(Label(eyebrow.ToUpperInvariant(), 12, Gold));
        return stack;
    }

    public static void Clear(Node parent)
    {
        foreach (var child in parent.GetChildren()) { parent.RemoveChild(child); child.QueueFree(); }
    }

    public static void Space(Node parent) => parent.AddChild(new Control { SizeFlagsVertical = Control.SizeFlags.ExpandFill, SizeFlagsHorizontal = Control.SizeFlags.ExpandFill });

    public static void Pair(Node parent, string name, string value, Color? color = null)
    {
        var row = Row(parent);
        var label = Label(name, 14, Muted);
        label.SizeFlagsHorizontal = Control.SizeFlags.ExpandFill;
        row.AddChild(label);
        row.AddChild(Label(value, 15, color ?? Ink));
    }
}
