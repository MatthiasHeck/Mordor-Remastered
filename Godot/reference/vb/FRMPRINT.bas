' FRMPRINT.FRM
Option Explicit
Const mc0022 = 11 ' &HB%
Const mc0032 = 70 ' ? &H 0046 0066
Const mc003A = 18 ' &H12%

Sub Form_Load ()
Dim l001E As Integer ' 81
' Const mc0022 = 11 ' &HB%
' Const mc0032 = 70 ' ? &H 0046 0066
Static m0038 As Integer ' 61
' Const mc003A = 18 ' &H12%
Static m0044 As Integer ' 61
    Me.Tag = "NEW"
    Screen.MousePointer = mc0022
    picMaze.Width = frmAutoMap!picMaze.Width
    picMaze.Height = frmAutoMap!picMaze.Height
    Me.Width = picMaze.Width + (Screen.TwipsPerPixelX * 45)
    Me.Height = picMaze.Height + (Screen.TwipsPerPixelY * 90)
    sub02FE Me
    l001E = extfn182D(picMaze.hDC, 0, 0, picMaze.ScaleWidth, picMaze.ScaleHeight, frmAutoMap!picMaze.hDC, 0, 0, mc0032)
    frmAutoMap.WindowState = m0038
    frmAutoMap.Width = gv19C2(mc003A).M5E20 * Screen.TwipsPerPixelX
    frmAutoMap.Height = gv19C2(mc003A).M5E2D * Screen.TwipsPerPixelY
    sub34F3
    Me.Tag = ""
    Screen.MousePointer = m0044
End Sub

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub3502
        frmPrint.Hide
    End If
End Sub

Sub sub3502 ()
Dim l004A As Integer ' 81
Dim l004C As Single ' 83
    On Error GoTo L8B91C
    Printer.ScaleMode = 3
    Screen.MousePointer = 11
    Printer.Print ""
    l004C = Printer.ScaleWidth
    If  Printer.ScaleHeight < l004C Then l004C = Printer.ScaleHeight
    l004A = fn192B(Printer.hDC, 50, 100, Printer.ScaleWidth, Printer.ScaleHeight, frmPrint.hWnd, l004C, l004C)
    If  Not l004A Then
        MsgBox "Unable to print the form"
    Else
        Printer.EndDoc
    End If
    Screen.MousePointer = 0

L8B90E:
    Exit Sub

L8B91C:
    sub085B "Error '" + Error + "' occurred in FRMPRINT:modPrint!"
    Resume L8B90E
End Sub

Sub sub34F3 ()
Dim l0054 As Integer ' 81
    frmPrint.CurrentX = picMaze.Left
    frmPrint.CurrentY = picMaze.Top - (Screen.TwipsPerPixelY * 15)
    l0054 = frmPrint.FontSize
    frmPrint.Print "Mordor " + gc0186 + ", Level" + Str$(frmAutoMap!hsbLevel.Value)
    frmPrint.FontBold = False
    For l0054 = 2 To gv1864.M420C Step 2
        frmPrint.CurrentX = picMaze.Left - (Screen.TwipsPerPixelX * 20)
        frmPrint.CurrentY = (picMaze.Top + picMaze.Height) - ((l0054) * (Screen.TwipsPerPixelY * 14.05#))
        frmPrint.Print Str$(l0054)
    Next l0054
    For l0054 = 2 To gv1864.M4216 Step 2
        frmPrint.CurrentX = picMaze.Left + ((l0054 - 1) * (Screen.TwipsPerPixelX * 13.9#))
        frmPrint.CurrentY = picMaze.Top + picMaze.Height + (Screen.TwipsPerPixelY * 2)
        frmPrint.Print Str$(l0054)
    Next l0054
End Sub
