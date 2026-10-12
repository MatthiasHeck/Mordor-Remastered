' FRMEXCHA.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0020 = 1 ' &H1%
Dim m0022(1) As Integer ' 71
Dim m0038(1) As Integer ' 71
Const m0052 = 0 ' &H0%
Const mc005E = 11 ' &HB%
Const mc0070 = 40 ' &H28%
Const mc007E = 1 ' &H1%
Const mc008E = 2 ' &H2%
Const mc00AC = 48 ' &H30%
Const mc00BE = 9 ' &H9%

Sub cmdCommand_Click (Index%)
Dim l0050 As Integer ' 81
' Const m0052 = 0 ' &H0%
' Const mc005E = 11 ' &HB%
    Select Case Index
        Case m001A
            l0050 = fn04ED(gv14C2(m0052))
            l0050 = fn04ED(gv14C2(mc0020))
            cmdCommand_Click mc001C
        Case mc001C
            Unload Me
        Case Else
    End Select
End Sub

Sub Form_Load ()
Dim l0064 As String ' 87
Dim l0066 ' 80
Dim l0068 As Integer ' 81
' Const mc0070 = 40 ' &H28%
' Const mc007E = 1 ' &H1%
' Const mc008E = 2 ' &H2%
Static m0090 As Integer ' 61
    sub0784 Me
    sub02FE Me
    Screen.MousePointer = mc005E
    l0064 = "To exchange Items, Drag and Drop an item label from one character to another."
    l0064 = l0064 + " To exchange gold, Drag and Drop from the gold label to the other character's gold label and enter the amount."
    l0064 = l0064 + " When exchange is complete, click on Save Exchange to save."
    pnlPanel(mc001E).Caption = l0064
    vsbItems(m0052).Max = mc0070 - 1
    vsbItems(mc0020).Max = mc0070 - 1
    pnlName(m0052).Caption = Chr$(34) + RTrim(gv14C2(m0052).M548B) + Chr$(34)
    pnlName(mc0020).Caption = Chr$(34) + RTrim(gv14C2(mc0020).M548B) + Chr$(34)
    sub0F61 False, mc007E, 0
    For l0066 = 1 To ((mc0070 - 1) * 2) + 1
        If  l0066 <> mc0070 Then
            Load pnlItem(l0066)
            If  l0066 > mc0070 Then
                l0068 = extfn0144(pnlItem(l0066).hWnd, picItem(1).hWnd)
            End If
            pnlItem(l0066).Top = pnlItem(l0066 - 1).Top + pnlItem(l0066).Height
            pnlItem(l0066).Visible = True
        End If
        If  l0066 < mc0070 Then
            sub0F61 False, mc007E, l0066
        Else
            sub0F61 False, mc008E, l0066 - mc0070
        End If
    Next l0066
    picItem(m0052).Height = pnlItem(mc0070 - 1).Top + pnlItem(mc0070 - 1).Height
    picItem(mc0020).Height = picItem(m0052).Height
    sub2D61
    sub07ED Me
    Screen.MousePointer = m0090
End Sub

Sub sub2D61 ()
Static m0092 As Integer ' 61
    If  gv14C2(m0052).M5470 = False Then
        pnlGold(m0052).Caption = "Gold: " + fn036D(CCur(gv14C2(m0052).M4F2D + gv14C2(m0052).M58AF), m0092)
    Else
        pnlGold(m0052).Caption = "Gold: " + fn036D(CCur(gv14C2(m0052).M4F2D), m0092)
    End If
    If  gv14C2(mc0020).M5470 = False Then
        pnlGold(mc0020).Caption = "Gold: " + fn036D(CCur(gv14C2(mc0020).M4F2D + gv14C2(mc0020).M58AF), m0092)
    Else
        pnlGold(mc0020).Caption = "Gold: " + fn036D(CCur(gv14C2(mc0020).M4F2D), m0092)
    End If
End Sub

Sub pnlGold_DragDrop (Index%, Source As Control, X As Single, Y As Single)
Dim l00A6 As Currency ' 85
Dim l00A8 As Integer ' 81
Dim l00AA As String ' 87
' Const mc00AC = 48 ' &H30%
    On Error GoTo L79F48
    If  Source.Index = Index Then
        Exit Sub
    End If
    If  Index = m0052 Then
        l00A8 = mc0020
    Else
        l00A8 = m0052
    End If
    l00AA = InputBox("How Much Gold?", "Transfer Gold", "0")
    If  Len(l00AA) Then
        l00A6 = CLng(l00AA)
    Else
        Exit Sub
    End If
    If  l00A6 = 0 Then
        Exit Sub
    End If
    If  (l00A6 > gv14C2(l00A8).M4F2D And gv14C2(l00A8).M5470 <> False) Or (l00A6 > gv14C2(l00A8).M4F2D + gv14C2(l00A8).M58AF And gv14C2(l00A8).M5470 = False) Then
        MsgBox "Too Much!", mc00AC, "Transfer Gold"
        Exit Sub
    End If
    gv14C2(Index).M4F2D = gv14C2(Index).M4F2D + l00A6
    gv14C2(l00A8).M4F2D = gv14C2(l00A8).M4F2D - l00A6
    If  gv14C2(l00A8).M4F2D < False Then
        gv14C2(l00A8).M58AF = gv14C2(l00A8).M58AF + gv14C2(l00A8).M4F2D
        gv14C2(l00A8).M4F2D = False
    End If
    sub2D61
    Exit Sub

L79F48:
    Resume L79F54
L79F54:
End Sub

Sub pnlGold_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button > False Then
        pnlGold(Index).Drag
    End If
End Sub

Sub pnlItem_Click (Index%)
Dim l00BA As Integer ' 81
Static m00BC As Integer ' 61
' Const mc00BE = 9 ' &H9%
    If  Index < mc0070 Then
        l00BA = 0
        Else
        l00BA = 1
    End If
    m0022(l00BA) = Index
    If  m0038(l00BA) > -1 Then
        pnlItem(m0038(l00BA)).ForeColor = QBColor(m00BC)
    End If
    m0038(l00BA) = Index
    pnlItem(Index).ForeColor = QBColor(mc00BE)
End Sub

Sub pnlItem_DragDrop (Index%, Source As Control, X As Single, Y As Single)
Dim l00CA As Integer ' 81
Dim l00CC As Integer ' 81
Dim l00CE As Integer ' 81
Dim l00D0 As Integer ' 81
Dim l00D6 As T576E ' 8A
Static m00D8 As Integer ' 61
    l00CE = Source.Index
    If  l00CE > mc0070 - 1 Then
        l00CE = l00CE - mc0070
    End If
    l00D0 = Index
    If  l00D0 > mc0070 - 1 Then
        l00D0 = l00D0 - mc0070
    End If
    If  Index < mc0070 Then
        l00CA = m0052
    Else
        l00CA = mc0020
    End If
    If  Source.Index < mc0070 Then
        l00CC = m0052
    Else
        l00CC = mc0020
    End If
    If  Source.Tag = "ITEM" And Index <> Source.Index Then
        If  l00D0 <> 0 And l00CE <> 0 Then
            If  fn1121(gv14C2(l00CA).M5857(l00D0).M4ED4) = False Then
                MsgBox "Destination Item is a Guild-Issued Item!", mc00AC, "Sorry!"
                Exit Sub
            End If
            If  fn1121(gv14C2(l00CC).M5857(l00CE).M4ED4) = False Then
                MsgBox "Source Item is a Guild-Issued Item!", mc00AC, "Sorry!"
                Exit Sub
            End If
            If  gv14C2(l00CA).M5857(l00D0).M577E <> False And l00CC <> l00CA Then
                MsgBox "Destination Item is either Equipped or in the Bank!", mc00AC, "Sorry!"
                Exit Sub
            End If
            If  gv14C2(l00CC).M5857(l00CE).M577E <> False And l00CC <> l00CA Then
                MsgBox "Source Item is either Equipped or in the Bank!", mc00AC, "Sorry!"
                Exit Sub
            End If
            l00D6 = gv14C2(l00CA).M5857(l00D0)
            gv14C2(l00CA).M5857(l00D0) = gv14C2(l00CC).M5857(l00CE)
            gv14C2(l00CC).M5857(l00CE) = l00D6
            If  gv14C2(l00CA).M5857(l00D0).M4EEE <> m00D8 Then
                If  fn129A(l00CA, gv14C2(l00CA).M5857(l00D0).M4ED4) < gv14C2(l00CA).M5857(l00D0).M4EEE Then
                    gv14C2(l00CA).M5857(l00D0).M4EEE = fn129A(l00CA, gv1426(gv14C2(l00CA).M5857(l00D0).M4ED4).M560D)
                End If
            End If
            sub0F61 False, mc007E, l00CE
            sub0F61 False, mc008E, l00D0
            sub0F61 False, mc007E, l00D0
            sub0F61 False, mc008E, l00CE
            pnlItem_Click Index
        End If
    End If
End Sub

Sub pnlItem_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button > False Then
        pnlItem_Click Index
        pnlItem(Index).Drag
    End If
End Sub

Sub vsbItems_Change (Index%)
    If  vsbItems(Index).Value <> Val(vsbItems(Index).Tag) Then
        If  vsbItems(Index).Value > Val(vsbItems(Index).Tag) Then
            picItem(Index).Top = picItem(Index).Top - (pnlItem(0).Height * Abs(vsbItems(Index).Value - Val(vsbItems(Index).Tag)))
        Else
            picItem(Index).Top = picItem(Index).Top + (pnlItem(0).Height * Abs(vsbItems(Index).Value - Val(vsbItems(Index).Tag)))
        End If
    End If
    vsbItems(Index).Tag = Str$(vsbItems(Index).Value)
End Sub
