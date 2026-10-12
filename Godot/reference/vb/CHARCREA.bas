' CHARCREA.FRM
Option Explicit
Dim m0026 As Integer ' 61
Const mc0028 = 1 ' &H1%
Const mc004A = 3 ' &H3%
Const mc005C = 6 ' &H6%
Const mc0090 = 1 ' &H1%
Const mc0092 = 14 ' &HE%
Const mc0096 = 15 ' &HF%
Const mc00A4 = 48 ' &H30%
Const mc00AE = 6 ' &H6%
Const mc00BC = 3 ' &H3%
Const m00C2 = 0 ' &H0%
Const mc00C4 = 1 ' &H1%
Const mc00C6 = 10 ' &HA%
Const mc00C8 = 10 ' &HA%
Const mc00CA = 1 ' &H1%
Const mc00CC = 5 ' &H5%
Const mc00D0 = 6 ' &H6%
Const mc00D4 = 1 ' &H1%
Const mc00D6 = 1 ' &H1%
Const mc00DA = 10 ' &HA%
Const mc00DC = 4 ' &H4%
Const mc00F2 = 32 ' &H20%
Const mc00F4 = 4 ' &H4%
Const mc00F6 = 6 ' &H6%
Const mc010A = 1 ' &H1%
Const mc010C = 10 ' &HA%
Const mc010E = 12 ' &HC%
Const mc0110 = 11 ' &HB%
Const mc0112 = 5 ' &H5%
Const mc0114 = 16 ' &H10%
Const mc0116 = 15 ' &HF%
Const mc0118 = 19 ' &H13%
Const mc011A = 2 ' &H2%
Const mc011C = 3 ' &H3%
Const mc011E = 17 ' &H11%
Const mc0120 = 13 ' &HD%
Const mc0122 = 18 ' &H12%
Const mc0138 = 2 ' &H2%

Sub cmbAlignment_Click ()
    gv14C2(gv1A84).M4EBF = cmbAlignment.ItemData(cmbAlignment.ListIndex)
    sub1EBA
End Sub

Sub cmbRace_Click ()
Dim l003A ' 80
' Const mc004A = 3 ' &H3%
' Const mc005C = 6 ' &H6%
    If  cmbRace.ListIndex = -1 Then
        Exit Sub
    End If
    gv14C2(gv1A84).M5821 = cmbRace.ListIndex
    cmbSex.Enabled = True
    cmbAlignment.Enabled = True
    cmbAlignment.Clear
    For l003A = 0 To mc004A - 1
        If  fn0380(l003A, gv148E(cmbRace.ListIndex).M5557) = True Then
            cmbAlignment.AddItem gv074C$(l003A)
            cmbAlignment.ItemData(cmbAlignment.ListCount - 1) = l003A
        End If
    Next l003A
    For l003A = 0 To mc005C - 1
        pnlPanel(l003A).Caption = LTrim$(Str$((gv148E(cmbRace.ListIndex).M5530(l003A) + 5)))
        gv14C2(gv1A84).M55B5(l003A) = Val(pnlPanel(l003A).Caption)
        cmdAdd(l003A).Enabled = True
        cmdSubtract(l003A).Enabled = True
        cmdSubtract(l003A).Tag = LTrim$(Str$(gv148E(cmbRace.ListIndex).M5530(l003A)))
        cmdAdd(l003A).Tag = LTrim$(Str$(gv148E(cmbRace.ListIndex).M553C(l003A)))
        lblStatInfo(l003A).Caption = "(" + LTrim$(Str$(gv148E(cmbRace.ListIndex).M5530(l003A))) + "-" + LTrim$(Str$(gv148E(cmbRace.ListIndex).M553C(l003A))) + ")"
    Next l003A
    lblPoints.Enabled = True
    lblPoints.Caption = LTrim$(Str$(gv148E(cmbRace.ListIndex).M556D))
    If  cmbSex.ListIndex = -1 Then
        cmbSex.ListIndex = 0
    End If
    If  cmbAlignment.ListIndex = -1 Then
        cmbAlignment.ListIndex = 0
    End If
    cmbAlignment_Click
    sub1EBA
End Sub

Sub cmdAdd_Click (Index%)
    If  Val(lblPoints.Caption) > 0 Then
        If  gv14C2(gv1A84).M55B5(Index) < Val(cmdAdd(Index).Tag) Then
            lblPoints.Caption = Str$(lblPoints.Caption - 1)
            gv14C2(gv1A84).M55B5(Index) = gv14C2(gv1A84).M55B5(Index) + 1
            pnlPanel(Index).Caption = LTrim$(Str$(gv14C2(gv1A84).M55B5(Index)))
        End If
    End If
    sub1EBA
End Sub

Sub cmdExit_Click ()
    gv14C2(gv1A84).M548B = " "
    Unload frmCreateChar
End Sub

Sub cmdHelp_Click (Index%)
Dim l0084 As String ' 87
Dim l0086 As Integer ' 81
' Const mc0090 = 1 ' &H1%
' Const mc0092 = 14 ' &HE%
' Const mc0096 = 15 ' &HF%
    l0084 = Space$(Len(App.HelpFile))
    l0084 = App.HelpFile + ">stats"
    Select Case Index
        Case m0026
            l0086 = extfn012C(frmMain.hWnd, l0084, mc0090, CLng(mc0092))
        Case mc0028
            l0086 = extfn012C(frmMain.hWnd, l0084, mc0090, CLng(mc0096))
        Case Else
    End Select
End Sub

Sub cmdSave_Click ()
Dim l0098 As Variant ' 86
Dim l009C ' 80
' Const mc00A4 = 48 ' &H30%
Dim l00A8 As String ' 87
Dim l00AA As String ' 87
' Const mc00AE = 6 ' &H6%
    If  txtName.Text = "" Then
        l0098 = MsgBox("No Name Defined!", 64, "NO NAME!")
        Exit Sub
    ElseIf InStr(txtName.Text, "|") <> False Then
        MsgBox "The character '|' is not allowed in a Character name.", mc00A4, "Sorry!"
        Exit Sub
    End If
    If  cmbRace.ListIndex = -1 Then
        l0098 = MsgBox("No Race Defined!", 64, "NO RACE!")
        Exit Sub
    End If
    If  cmbSex.ListIndex = -1 Then
        l0098 = MsgBox("No Sex Defined!", 64, "NO SEX!")
        Exit Sub
    End If
    If  cmbAlignment.ListIndex = -1 Then
        l0098 = MsgBox("No Alignment Defined!", 64, "NO ALIGNMENT!")
        Exit Sub
    End If
    If  fn04B9(CStr(txtName.Text)) = True Then
        l0098 = MsgBox("Name " + Chr$(34) + txtName.Text + Chr$(34) + " already exists!" + Chr$(13) + "Try another.", 64, "NAME ALREADY EXISTS!")
        Exit Sub
    End If
    If  Val(lblPoints.Caption) > 0 Then
        If  MsgBox("You still have points left.  Save Anyway?", 68, "POINTS") <> 6 Then
            Exit Sub
        End If
    End If
    Do
        l00A8 = fn16A0("ENTER PASSWORD", "Please enter Password", "", "PASSWORD")
        If  l00A8 = "-1" Then
            Exit Sub
        End If
        l00AA = fn16A0("ENTER PASSWORD", "Please re-enter Password", "", "PASSWORD")
        If  l00AA = "-1" Then
            Exit Sub
        End If
        If  l00A8 <> l00AA Then
            l0098 = MsgBox("Passwords don't match!", 64, "ERROR")
        End If
    Loop While l00A8 <> l00AA
    If  l00A8 = "" Then
        If  MsgBox("You have chosen no password." + Chr$(13) + "Is this okay?", 36, "NO PASSWORD") <> mc00AE Then
            Exit Sub
        End If
        l00A8 = " "
    End If
    gv14C2(gv1A84).M594C = l00A8
    sub1F1F
    If  fn04ED(gv14C2(gv1A84)) = False Then
        l0098 = MsgBox("Error saving character to " + gv19E8 + gc1C10 + "!", 64, "ERROR!")
    Else
        sub096E
        For l009C = False To mc005C - 1
            sub1043 l009C, gv1A84, CCur(gv14C2(gv1A84).M55B5(l009C))
        Next l009C
    End If
    Unload frmCreateChar
End Sub

Sub cmdSubtract_Click (Index%)
    If  gv14C2(gv1A84).M55B5(Index) > Val(cmdSubtract(Index).Tag) Then
        lblPoints.Caption = Str$(lblPoints.Caption + 1)
        gv14C2(gv1A84).M55B5(Index) = gv14C2(gv1A84).M55B5(Index) - 1
        pnlPanel(Index).Caption = LTrim$(Str$(gv14C2(gv1A84).M55B5(Index)))
    End If
    sub1EBA
End Sub

Sub cmdTutorial_Click ()
Dim l00B8 As Integer ' 81
Dim l00BA As String ' 87
' Const mc00BC = 3 ' &H3%
    l00BA = Space$(Len(App.HelpFile))
    l00BA = App.HelpFile + ">tutorial"
    l00B8 = extfn012C(frmMain.hWnd, l00BA, mc0090, CLng(mc00BC))
    txtName.SetFocus
End Sub

Sub sub1F1F ()
Dim l00BE ' 80
' Const m00C2 = 0 ' &H0%
' Const mc00C4 = 1 ' &H1%
' Const mc00C6 = 10 ' &HA%
' Const mc00C8 = 10 ' &HA%
' Const mc00CA = 1 ' &H1%
' Const mc00CC = 5 ' &H5%
' Const mc00D0 = 6 ' &H6%
Static m00D2 As Integer ' 61
' Const mc00D4 = 1 ' &H1%
' Const mc00D6 = 1 ' &H1%
' Const mc00DA = 10 ' &HA%
' Const mc00DC = 4 ' &H4%
    gv14C2(m00C2).M548B = txtName.Text
    gv14C2(m00C2).M5821 = cmbRace.ListIndex
    gv14C2(m00C2).M4EBF = cmbAlignment.ItemData(cmbAlignment.ListIndex)
    gv14C2(m00C2).M5829 = cmbSex.ListIndex
    gv14C2(m00C2).M5577 = (16 * 365)
    gv14C2(m00C2).M5899 = mc00C4
    gv14C2(m00C2).M58AF = False
    gv14C2(m00C2).M4F2D = 1500
    gv14C2(m00C2).M4EB4 = 15
    gv14C2(m00C2).M4EAC = gv14C2(m00C2).M4EB4
    gv14C2(m00C2).M56AF = 0
    gv14C2(m00C2).M58BB = 0
    gv14C2(m00C2).M4E97 = mc00C6
    gv14C2(m00C2).M4EA1 = mc00C8
    gv14C2(m00C2).M5584(0).M4E82 = 1
    gv14C2(m00C2).M5962 = 0
    gv14C2(m00C2).M583F = 9
    gv14C2(m00C2).M5845 = 11
    gv14C2(m00C2).M5943 = -1
    gv14C2(m00C2).M5470 = False
    gv14C2(m00C2).M59BB = -1
    gv14C2(m00C2).M5914(mc00CC) = mc00CA
    gv14C2(m00C2).M5830 = fn1338(m00C2)
    gv14C2(m00C2).M5997(0) = -1
    gv14C2(m00C2).M5997(1) = -1
    gv14C2(m00C2).M5943 = -1
    gv14C2(m00C2).M5906(mc00D0) = CLng(Date)
    gv14C2(m00C2).M5914(m00D2) = True
    gv14C2(m00C2).M5914(mc00D4) = True
    sub047C m00C2, mc00D6
    gv14C2(m00C2).M5970 = fn1397(gv14C2(m00C2))
    For l00BE = 0 To mc00DA - 1
        gv14C2(m00C2).M59B0(l00BE) = -1
    Next l00BE
    For l00BE = 0 To mc00DC - 1
        gv14C2(m00C2).M58CB(l00BE).M548B = " "
        gv14C2(m00C2).M58CB(l00BE).M4ED4 = -1
        gv14C2(m00C2).M58CB(l00BE).M57D4 = -1
    Next l00BE
    sub1F5B
    sub0578 gv14C2(m00C2).M58BB, Chr$(34) + RTrim(gv14C2(m00C2).M548B) + Chr$(34) + " joined our guild."
End Sub

Sub Form_Load ()
Dim l00DE ' 80
    sub07ED Me
    sub02FE frmCreateChar
    gv1A84 = m00C2
    For l00DE = 1 To gv1BEA - 1
        Load lblGuild(l00DE)
        lblGuild(l00DE).Top = lblGuild(l00DE - 1).Top + lblGuild(l00DE - 1).Height
    Next l00DE
    sub1F7D
    ReDim gv14C2(UBound(gv14C2)) As T5810
End Sub

Sub Form_Paint ()
End Sub

Sub sub1F5B ()
Dim l00EC As Single ' 83
Dim l00EE As Single ' 83
Dim l00F0 As Single ' 83
' Const mc00F2 = 32 ' &H20%
' Const mc00F4 = 4 ' &H4%
' Const mc00F6 = 6 ' &H6%
Static m0100 As Integer ' 61
' Const mc010A = 1 ' &H1%
' Const mc010C = 10 ' &HA%
' Const mc010E = 12 ' &HC%
' Const mc0110 = 11 ' &HB%
' Const mc0112 = 5 ' &H5%
' Const mc0114 = 16 ' &H10%
' Const mc0116 = 15 ' &HF%
' Const mc0118 = 19 ' &H13%
' Const mc011A = 2 ' &H2%
' Const mc011C = 3 ' &H3%
' Const mc011E = 17 ' &H11%
' Const mc0120 = 13 ' &HD%
' Const mc0122 = 18 ' &H12%
    If  MsgBox("Are you using Large Fonts?", mc00F2 & mc00F4, "Adjust Windows to Display") = mc00F6 Then
        l00F0 = 1.25#
    Else
        l00F0 = 1
    End If
    l00EC = ((gv1ACC.M6049 / Screen.TwipsPerPixelX) / 800) / l00F0
    l00EE = ((gv1ACC.M6039 / Screen.TwipsPerPixelY) / 600) / l00F0
    If  l00EC < 1 Then
        l00EC = 1
    End If
    If  l00EE < 1 Then
        l00EE = 1
    End If
    gv14C2(m00C2).M5958(m0100).M4216 = gv19C2(m0100).M5E20 * l00EC
    gv14C2(m00C2).M5958(m0100).M420C = gv19C2(m0100).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc010A).M4216 = gv19C2(mc010A).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc010A).M420C = gv19C2(mc010A).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc010C).M4216 = gv19C2(mc010C).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc010C).M420C = gv19C2(mc010C).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc010E).M4216 = gv19C2(mc010E).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc010E).M420C = gv19C2(mc010E).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0110).M4216 = gv19C2(mc0110).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc0110).M420C = gv19C2(mc0110).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0112).M4216 = gv19C2(mc0112).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc0112).M420C = gv19C2(mc0112).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0114).M4216 = gv19C2(mc0114).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc0114).M420C = gv19C2(mc0114).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0116).M4216 = gv19C2(mc0116).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc0116).M420C = gv19C2(mc0116).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0118).M4216 = gv19C2(mc0118).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc0118).M420C = gv19C2(mc0118).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc011A).M4216 = gv19C2(mc011A).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc011A).M420C = gv19C2(mc011A).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc011C).M4216 = gv19C2(mc011C).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc011C).M420C = gv19C2(mc011C).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc011E).M4216 = gv19C2(mc011E).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc011E).M420C = gv19C2(mc011E).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0120).M4216 = gv19C2(mc0120).M5E20 * l00EC
    gv14C2(m00C2).M5958(mc0120).M420C = gv19C2(mc0120).M5E2D * l00EE
    gv14C2(m00C2).M5958(mc0122).M4216 = (gv19C2(mc0122).M5E20 / 2.25#) * Screen.TwipsPerPixelX
    gv14C2(m00C2).M5958(mc0122).M420C = (gv19C2(mc0122).M5E2D / 2.25#) * Screen.TwipsPerPixelY
    sub14B4
End Sub

Sub sub1EBA ()
Dim l0124 ' 80
Dim l0126 ' 80
Dim l0128 As Integer ' 81
Dim l012A As Integer ' 81
    For l0124 = 0 To gv1BEA - 1
        l012A = False
        If  fn0380(gv14C2(m00C2).M5821, gv145A(l0124).M5604) = True Then
            If  fn115C(l0124, gv14C2(m00C2)) = True Then
                lblGuild(l0128).FontBold = False
                lblGuild(l0128).FontItalic = False
            Else
                lblGuild(l0128).FontBold = False
                lblGuild(l0128).FontItalic = True
                l012A = True
            End If
            For l0126 = 0 To mc005C - 1
                If  gv14C2(m00C2).M55B5(l0126) < gv145A(l0124).M55B5(l0126) Then
                    l012A = True
                    Exit For
                End If
            Next l0126
            If  l012A = False Then
                lblGuild(l0128).FontBold = True
            Else
                lblGuild(l0128).FontBold = False
            End If
            lblGuild(l0128).Caption = gv145A(l0124).M548B
            lblGuild(l0128).Visible = True
            l0128 = l0128 + 1
        End If
    Next l0124
    If  l0128 < gv1BEA - 1 Then
        For l0124 = l0128 To gv1BEA - 1
            lblGuild(l0124).Visible = False
        Next l0124
    End If
End Sub

Sub sub1F7D ()
Dim l0136 ' 80
' Const mc0138 = 2 ' &H2%
    txtName.Text = ""
    cmbSex.Clear
    For l0136 = 0 To mc0138 - 1
        cmbSex.AddItem gv06B6$(l0136)
    Next l0136
    cmbRace.Clear
    For l0136 = 0 To gv1BE8 - 1
        cmbRace.AddItem gv148E(l0136).M548B
    Next l0136
    cmbAlignment.Clear
    For l0136 = 0 To mc004A - 1
        cmbAlignment.AddItem gv074C$(l0136)
    Next l0136
    For l0136 = 0 To mc005C - 1
        lblStatInfo(l0136).Caption = ""
        pnlPanel(l0136).Caption = ""
    Next l0136
    lblPoints.Caption = ""
    lblPoints.Enabled = False
    cmbSex.Enabled = False
    cmbAlignment.Enabled = False
End Sub

Sub txtName_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 34 Then
        KeyCode = False
    End If
    If  KeyCode = 13 Then
        cmbRace.SetFocus
    End If
End Sub

Sub txtName_KeyPress (KeyAscii As Integer)
    If  KeyAscii = 34 Then
        KeyAscii = False
    End If
    If  KeyAscii = 13 Then
        KeyAscii = False
    End If
End Sub
