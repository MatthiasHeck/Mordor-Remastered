' FRMLIBRA.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Const mc001E = 1 ' &H1%
Const mc0024 = 11 ' &HB%
Const m0044 = 0 ' &H0%
Const mc0054 = 1 ' &H1%
Const mc008A = 32 ' ? &H 0020 00CC
Const mc0090 = 60 ' &H3C%
Const mc00AC = 64 ' &H40%

Sub cmdCommand_Click (Index%)
' Const mc0024 = 11 ' &HB%
    Select Case Index
        Case m001C
            Unload Me
        Case Else
    End Select
End Sub

Sub Form_Load ()
Static m002A As Integer ' 61
    Screen.MousePointer = mc0024
    m001A = True
    sub327E
    sub0802 Me
    m001A = False
    Screen.MousePointer = m002A
End Sub

Sub Form_Resize ()
    If  m001A = False Then
        sub07B3 Me, elaElastic(0)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    Set frmLibrary = Nothing
End Sub

Sub lstList_Click ()
' Const m0044 = 0 ' &H0%
' Const mc0054 = 1 ' &H1%
    If  optOption(mc001E).Value Then
        txtInfo.Text = fn1BBE(CStr(lstList.List(lstList.ListIndex)), m0044)
        picMonster.Refresh
    Else
        txtInfo.Text = fn1BBE(CStr(lstList.List(lstList.ListIndex)), mc0054)
    End If
End Sub

Sub sub327E ()
Dim l0056 ' 80
Dim l005A As T5BF1 ' 8A
    lstList.Clear
    txtInfo.Text = ""
    If  optOption(mc001E).Value Then
        picMonster.Visible = True
        For l0056 = False To gv1BF6 - 1
            sub0F9A l0056, m0044, l005A
            If  l005A.M4EEE Then
                lstList.AddItem gv14F6(l0056).M548B
            End If
        Next l0056
        lblEntries = "There are " + CStr(fn1BD5(m0044)) + " Monster Entries."
    Else
        picMonster.Visible = False
        For l0056 = False To gv1BEC - 1
            sub0F9A l0056, mc0054, l005A
            If  l005A.M4EEE Then
                lstList.AddItem gv1426(l0056).M548B
            End If
        Next l0056
        lblEntries = "There are " + CStr(fn1BD5(mc0054)) + " Item Entries."
    End If
    If  lstList.ListCount = False Then
        lstList.AddItem "<NO ENTRIES>"
        lstList.Enabled = False
    Else
        lstList.Enabled = True
        lstList.ListIndex = False
    End If
End Sub

Sub optOption_Click (Index%)
    sub327E
    If  lstList.ListCount Then
        lstList.SetFocus
    End If
End Sub

Sub picMonster_Paint ()
Dim l007A As Integer ' 81
Dim l007C As Integer ' 81
Dim l007E As Integer ' 81
' Const mc008A = 32 ' ? &H 0020 00CC
' Const mc0090 = 60 ' &H3C%
    l007C = ((gv14F6(gv2A66).M5A1B - 1) Mod 10)
    l007E = Int((gv14F6(gv2A66).M5A1B - 1) / 10)
    If  optOption(mc001E).Value Then
        If  gv1A66.M5F04 Then
            If  fn0C3B(1, gv2A66) Then
                l007A = extfn182D(picMonster.hDC, (picMonster.ScaleWidth / 2) - (100 / 2), (picMonster.ScaleHeight / 2) - (100 / 2), 100, 100, gv2BB4, 0, 0, mc008A)
            Else
                l007A = extfn182D(picMonster.hDC, (picMonster.ScaleWidth / 2) - (mc0090 / 2), (picMonster.ScaleHeight / 2) - (mc0090 / 2), mc0090, mc0090, gv2BB8, (l007C * mc0090), (l007E * mc0090), mc008A)
            End If
        Else
            If  fn0C3B(1, gv2A66) Then
                l007A = extfn01C4(picMonster.hDC, 0, 0, picMonster.ScaleWidth, picMonster.ScaleHeight, gv2BB4, 0, 0, 100, 100, mc008A)
            Else
                l007A = extfn01C4(picMonster.hDC, 0, 0, picMonster.ScaleWidth, picMonster.ScaleHeight, gv2BB8, (l007C * mc0090), (l007E * mc0090), mc0090, mc0090, mc008A)
            End If
        End If
    End If
End Sub

Sub txtInfo_KeyDown (KeyCode As Integer, Shift As Integer)
    KeyCode = False
End Sub

Sub txtInfo_KeyPress (KeyAscii As Integer)
    KeyAscii = False
End Sub

Sub txtSearch_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l00A0 ' 80
Dim l00A2 As Integer ' 81
Dim l00A4 As Integer ' 81
' Const mc00AC = 64 ' &H40%
    If  KeyCode = 13 Then
        For l00A0 = False To lstList.ListCount - 1
            If  UCase(Left(lstList.List(l00A0), Len(txtSearch.Text))) = UCase(txtSearch.Text) Then
                l00A4 = l00A0
                l00A2 = l00A2 + 1
            End If
        Next l00A0
        If  l00A2 = False Then
            MsgBox "No match was found.", mc00AC, "Search"
            txtSearch.SelStart = 0
            txtSearch.SelLength = Len(txtSearch.Text)
        ElseIf l00A2 = 1 Then
            lstList.ListIndex = l00A4
            txtSearch.Text = ""
        Else
            MsgBox "ambiguous!", mc00AC, "Search"
            txtSearch.SelStart = 0
            txtSearch.SelLength = Len(txtSearch.Text)
        End If
        KeyCode = False
    End If
End Sub

Sub txtSearch_KeyPress (KeyAscii As Integer)
    If  KeyAscii = 13 Then
        KeyAscii = False
    End If
End Sub
