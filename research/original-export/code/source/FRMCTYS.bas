' FRMCTYS.FRM
Option Explicit
Dim m0022 As Integer ' 61
Dim m0024 As Integer ' 61
Dim m0026 As Integer ' 61
Dim m0028 As Integer ' 61
Dim m002A As Integer ' 61
Dim m002C As Integer ' 61
Dim m002E() As Integer ' 71
Dim m0060 As Integer ' 61
Dim m0062 As Integer ' 61
Dim m0064 As Integer ' 61
Const mc0066 = 9 ' &H9%
Dim m0068 As Integer ' 61
Const mc0078 = 40 ' &H28%
Const mc009C = 4 ' &H4%
Const mc00B6 = 9 ' &H9%
Const m00BE = 0 ' &H0%
Const m00C4 = 0 ' &H0%
Const mc00E2 = 13 ' &HD%
Const mc00F2 = 48 ' &H30%
Const mc0104 = 1 ' &H1%
Const mc0118 = 1 ' &H1%
Const m0148 = 0 ' &H0%
Const mc0192 = 11 ' &HB%
Const mc0198 = 11 ' &HB%
Const mc023E = 1 ' &H1%
Const mc0240 = 3 ' &H3%
Const m0244 = 0 ' &H0%
Const mc0246 = 9 ' &H9%
Const mc025A = 13 ' &HD%

Sub cmdAlign_Click (Index%)
    m0028% = Index
End Sub

Sub cmdBuy_Click ()
Dim l006C As Integer ' 81
Dim l006E ' 80
Dim l0070 As Integer ' 81
Dim l0072 As Integer ' 81
Dim l0074 As Integer ' 81
Dim l0076 As String ' 87
' Const mc0078 = 40 ' &H28%
' Const mc009C = 4 ' &H4%
' Const mc00B6 = 9 ' &H9%
' Const m00BE = 0 ' &H0%
' Const m00C4 = 0 ' &H0%
    l0070 = 0
    For l006E = 1 To mc0078 - 1
        If  gv14C2(gv1A86).M5857(l006E).M4ED4 = 0 Then
            l0070 = l006E
            Exit For
        End If
    Next l006E
    If  l0070 = 0 Then
        l006C% = MsgBox("No free slots!", 64, "BUY ITEM")
        Exit Sub
    End If
    If  fn114E(fn272C(m0028%, Val(elaSelectedItem.P?C00C))) = False Then
        l006C% = MsgBox("Not enough gold!", 64, "BUY ITEM")
        Exit Sub
    End If
    m0026% = True
    l0072 = Val(elaSelectedItem.P?C00C)
    gv14C2(gv1A86).M5857(l0070).M4ED4 = l0072
    gv14C2(gv1A86).M5857(l0070).M4E97 = gv1426(l0072).M4E97
    gv14C2(gv1A86).M5857(l0070).M4EA1 = gv1426(l0072).M4EA1
    gv14C2(gv1A86).M5857(l0070).M4EBF = m0028%
    gv14C2(gv1A86).M5857(l0070).M56DB = gv1426(l0072).M56DB
    gv14C2(gv1A86).M5857(l0070).M4EEE = 0
    gv14C2(gv1A86).M5857(l0070).M5467 = gv1426(l0072).M5467
    If  gv1426(l0072).M5693 > False Or m0028% > 0 Then
        gv15FA(l0072).M5557(m0028%) = gv15FA(l0072).M5557(m0028%) - 1
    End If
    l006C% = False
    For l006E = 0 To mc009C - 1
        If  gv15FA(l0072).M5557(l006E) > 0 Then
            l006C% = True
            Exit For
        End If
    Next l006E
    If  l006C% = False Then
        gv15FA(l0072).M5766 = 0
        gv15FA(l0072).M5467 = False
    End If
    sub260A 1
    If  gv15FA(l0072).M5557(m0028%) < 1 Then
        elaSelectedItem.P?C024 = ""
        elaSelectedItem.P?C00C = ""
        lblCost.Caption = "Cost"
        elaSelectedItemCost.P?C024 = ""
        cmdBuy.Enabled = False
        cmdInfo.Enabled = False
    Else
        l0074% = gv15FA(m0024%).M5557(m0028%)
        If  l0074% > mc00B6 Then
            l0074% = mc00B6
        End If
        l0076$ = LTrim$(Str$(l0074%)) + gv077E$(m0028%)
        lblCost.Caption = l0076$ + " Cost"
        elaSelectedItemCost.P?C024 = " " + fn036D(CCur(fn272C(m0028%, l0072)), m00BE)
    End If
    sub0F61 gv1A84, m00C4, (l0070)
    sub085B "Slot #" + LTrim$(Str$(l0070 + 1)) + " now contains your " + gv1426(gv14C2(gv1A86).M5857(l0070).M4ED4).M548B + "."
End Sub

Sub cmdCommand_Click (Index%)
    Select Case Index
        Case m0068
            sub2621
            lblCombine.Caption = ""
            cmdCommand(m0068).Enabled = False
        Case Else
    End Select
End Sub

Sub cmdExit_Click ()
    Unload frmCityStore
    sub0792 frmCityMain
    frmCityMain.SetFocus
End Sub

Sub cmdID_Click ()
Dim l00DC As String ' 87
Dim l00DE As Integer ' 81
Dim l00E0 As Integer ' 81
' Const mc00E2 = 13 ' &HD%
' Const mc00F2 = 48 ' &H30%
    txtID_KeyPress mc00E2
    If  cmdID.Enabled = False Then Exit Sub
    l00DC = txtID.Text
    l00DE = fn12C4(l00DC)
    If  l00DE > -1 Then
        If  l00DE Then
            If  fn114E(fn271B(l00DE)) = False Then
                l00E0% = MsgBox("Not enough gold!", mc00F2, "Identify Item")
                Exit Sub
            End If
            gv14C2(gv1A86).M5857(l00DE).M4EEE = gv14C2(gv1A86).M5857(l00DE).M4EEE - 1
            sub0730 gv1A86, gv14C2(gv1A86).M5857(l00DE).M4ED4, gv14C2(gv1A86).M5857(l00DE).M4EEE, -1, False
            sub0F61 gv1A86, m00C4, l00DE
            txtID_KeyPress 13
        End If
    End If
End Sub

Sub cmdIDInfo_Click ()
Dim l00FA As Integer ' 81
Dim l00FC As Integer ' 81
Dim l00FE As Integer ' 81
Dim l0100 As Integer ' 81
Dim l0102 As String ' 87
' Const mc0104 = 1 ' &H1%
    l0102$ = txtID.Text
    l00FA = fn12C4(l0102$)
    If  l00FA > -1 Then
        l00FC = gv14C2(gv1A86).M5857(l00FA).M4ED4
        l00FE = gv14C2(gv1A86).M5857(l00FA).M4EBF
        l0100 = gv14C2(gv1A86).M5857(l00FA).M4EEE
        sub150A mc0104, l00FC, l00FE, l0100, 0, 0
        frmCharStat1!picTabPicture.SetFocus
    End If
End Sub

Sub cmdInfo_Click ()
Dim l010A As Integer ' 81
Dim l010C As Integer ' 81
Dim l010E ' 80
    l010A% = Val(elaSelectedItem.P?C00C)
    For l010E = 0 To mc009C - 1
        If  InStr(lblCost.Caption, gv077E$(l010E)) Then
            l010C% = l010E + 1
            Exit For
        End If
    Next l010E
    If  l010C% = 0 Then
        Exit Sub
    End If
    If  Val(elaSelectedItem.P?C00C) Then
        sub150A mc0104, l010A%, l010C% - 1, 0, 0, 0
        frmCharStat1!picTabPicture.SetFocus
    End If
End Sub

Sub cmdRealign_Click (Index%)
Dim l0112 As Integer ' 81
Dim l0114 As String ' 87
Dim l0116 As Integer ' 81
' Const mc0118 = 1 ' &H1%
Dim l011A As Long ' 82
Dim l011C As Integer ' 81
    l0114 = txtID.Text
    l0112 = fn12C4(l0114)
    If  l0112 > -1 Then
        If  gv14C2(gv1A86).M5857(l0112).M577E = mc0118 Then
            l0116 = MsgBox("Cannot realign Equipped item!", 64, "SORRY!")
            Exit Sub
        End If
        l011C = 1
        If  Abs(gv14C2(gv1A86).M5857(l0112).M4EBF - (Index + 1)) > 1 Then
            l011C = 2
        End If
        l011A = (((.72# * gv1426(gv14C2(gv1A86).M5857(l0112).M4ED4).M5686))) * l011C
        If  MsgBox("Cost to realign is " + fn036D(CCur(l011A), m00BE) + "." + Chr$(13) + "Do you wish to pay?", 36, "REALIGN ITEM") = 6 Then
            If  fn114E(l011A) = False Then
                l0116 = MsgBox("Not enough gold!", 64, "SORRY!")
                Exit Sub
            End If
            gv14C2(gv1A86).M5857(l0112).M4EBF = (Index + 1)
            sub0F61 gv1A84, m00C4, l0112
            txtID_KeyPress 13
        End If
    End If
End Sub

Sub cmdSell_Click ()
Dim l011E As Integer ' 81
Dim l0120 As String ' 87
Dim l0122 As Integer ' 81
Dim l0124 As Integer ' 81
Dim l0126 As Integer ' 81
Dim l0128 As Integer ' 81
    txtID_KeyPress mc00E2
    If  cmdSell.Enabled = False Then Exit Sub
    l0120 = txtID.Text
    l011E = fn12C4(l0120)
    If  l011E > -1 Then
        If  gv14C2(gv1A86).M5857(l011E).M577E = mc0118 And gv14C2(gv1A86).M5857(l011E).M572A <> False Then
            l0128% = MsgBox("Item is Equipped and Cursed!", 64, "SELL ITEM")
            Exit Sub
        End If
        If  gv14C2(gv1A86).M5857(l011E).M577E = mc0118 Then
            sub0F74 gv1A84, l011E
        End If
        gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + fn273B(l011E)
        If  gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB > 0 Then
            Select Case gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M5709
                Case 23, 24, 25, 26, 27, 28, 30, 31
                    If  gv14C2(gv1A86).M5857(l011E).M56DB >= gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB Then
                        l0122 = True
                        If  gv14C2(gv1A86).M5857(l011E).M56DB > gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB Then
                            gv14C2(gv1A86).M5857(l011E).M56DB = gv14C2(gv1A86).M5857(l011E).M56DB - gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB
                            l0124 = True
                        Else
                            l0126 = True
                        End If
                    Else
                        l0126 = True
                        l0122 = False
                    End If
                Case Else
                    l0122 = True
                    l0126 = True
            End Select
        Else
            l0122 = True
            l0126 = True
        End If
        If  gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M5693 = False And gv14C2(gv1A86).M5857(l011E).M4EBF = 0 Then
            l0122 = False
        End If
        If  l0122 = True And gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M572A = False And gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5557(gv14C2(gv1A86).M5857(l011E).M4EBF) < mc00B6 Then
            gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5557(gv14C2(gv1A86).M5857(l011E).M4EBF) = gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5557(gv14C2(gv1A86).M5857(l011E).M4EBF) + 1
            gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5766 = gv14C2(gv1A86).M5857(l011E).M4ED4
            gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5467 = gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M5467
        End If
        If  l0126 = True Then
            sub0EDA gv1A86, l011E
        End If
        sub0F61 gv1A86, m00C4, l011E
        sub08A9 False, 10
        If  l0124 = False Then
            sub268D
        Else
            txtID.Text = LTrim$(Str$(l011E + 1))
        End If
        txtID_KeyPress 13
    End If
    m0026% = True
    sub260A 1
End Sub

Sub cmdUncurse_Click ()
Dim l0130 As String ' 87
Dim l0132 As Integer ' 81
Dim l013E As Integer ' 81
Static m0146 As Integer ' 61
' Const m0148 = 0 ' &H0%
    l0130 = txtUncurse.Text
    l0132 = fn12C4(l0130)
    If  l0132 > -1 Then
        If  gv14C2(gv1A86).M5857(l0132).M572A = False Then
            sub085B "Item is not cursed!"
            Exit Sub
        End If
        If  gv14C2(gv1A86).M5857(l0132).M577E = m0146 Then
            Beep
            sub085B "Item isn't equipped!"
            Exit Sub
        End If
        If  fn114E(fn274F(gv14C2(gv1A86).M5857(l0132).M4ED4)) = False Then
            l013E% = MsgBox("Not enough gold!", 64, "UNCURSE ITEM")
            Exit Sub
        End If
        sub0F74 gv1A84, -l0132
        gv14C2(gv1A86).M5857(l0132).M4EEE = m0148
        sub0730 gv1A86, gv14C2(gv1A86).M5857(l0132).M4ED4, gv14C2(gv1A86).M5857(l0132).M4EEE, -1, False
        sub0F61 gv1A86, m00C4, l0132
        If  gv1426(gv14C2(gv1A86).M5857(l0132).M4ED4).M572A = False Then
            gv14C2(gv1A86).M5857(l0132).M572A = False
        End If
        sub08A9 False, 50
        sub0F61 gv1A86, m00C4, l0132
        sub085B "Item has been separated from you."
        txtUncurse.Text = ""
        lblUncurse.Caption = ""
        cmdUncurse.Enabled = False
    End If
End Sub

Sub elaItem_event0000 (p0156 As Integer ' 41)
Dim l0164 ' 80
Dim l0168 As Integer ' 81
Dim l016A As Integer ' 81
Dim l016C As Integer ' 81
Dim l016E As String ' 87
    On Error GoTo L65136
    If  p0156 < 0 Then Exit Sub
    If  elaAlignments.P?C008 = True Or elaItem(p0156).Left = False Then
        Beep
        Exit Sub
    End If
    sub26C8 p0156
    m0024% = Val(elaItem(p0156).Tag)
    m002A% = p0156
    l016A% = Val(elaItem(p0156).Tag)
    For l0164 = 0 To mc009C - 1
        cmdAlign(l0164).Visible = True
        If  gv15FA(l016A%).M5557(l0164) > 0 Then
            cmdAlign(l0164).Enabled = True
            l0168% = l0168% + 1
            m0028% = l0164
        Else
            cmdAlign(l0164).Enabled = False
        End If
    Next l0164
    If  l0168% > 1 Then
        m0028% = -1
        elaAlignments.P?C008 = True
        cmdExit.Enabled = False
        cmdBuy.Enabled = False
        cmdInfo.Enabled = False
        vsbItems.Enabled = False
        elaAlignments.SetFocus
        Do
            sub05D8
            If  fn03BD(frmCityStore) = False Then Exit Do
        Loop While m0028% = -1
        If  fn03BD(frmCityStore) = False Then Exit Sub
        vsbItems.Enabled = True
        cmdExit.Enabled = True
        cmdBuy.Enabled = True
        cmdInfo.Enabled = True
        elaAlignments.P?C008 = False
    Else
        elaAlignments.P?C008 = False
        cmdBuy.Enabled = True
        cmdInfo.Enabled = True
    End If
    l016E$ = elaItem(p0156).[$C023?]
    elaSelectedItem.P?C024 = l016E$
    elaSelectedItem.P?C00C = elaItem(p0156).Tag
    l016C% = gv15FA(m0024%).M5557(m0028%)
    If  l016C% = 0 Then Exit Sub
    If  l016C% > mc00B6 Then
        l016C% = mc00B6
    End If
    l016E$ = LTrim$(Str$(l016C%)) + gv077E$(m0028%)
    lblCost.Caption = l016E$ + " Cost"
    elaSelectedItemCost.P?C024 = " " + fn036D(CCur(fn272C(m0028%, Val(elaItem(p0156).Tag))), m00BE)
    Exit Sub

L65136:
    MsgBox "Error '" + Error$ + "' occurred at '" + CStr(Erl) + "' in FRMCTYS:lblItem_Click!", mc00F2, "Error!"
    Resume L651B4
L651B4:
End Sub

Sub elaItemInfo_event0000 (p0186 ' 40)
    elaItem_event0000 p0186
End Sub

Sub sub26EC ()
    cmdBuy.Enabled = True
    cmdInfo.Enabled = True
End Sub

Sub Form_Activate ()
    sub0792 Me
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l018C As Integer ' 81
' Const mc0192 = 11 ' &HB%
' Const mc0198 = 11 ' &HB%
    On Error Resume Next
    If  TypeOf Me.ActiveControl Is ComboBox Then
        If  fn1589(KeyCode, Shift) Then
            KeyCode = 0
            Shift = 0
        End If
    ElseIf TypeOf Me.ActiveControl Is TextBox Then
        If  fn1589(KeyCode, Shift) Then
            KeyCode = 0
            Shift = 0
        End If
    Else
        l018C = fn14CB(KeyCode, Shift)
    End If
End Sub

Sub Form_Load ()
Static m01A4 As Integer ' 61
    Screen.MousePointer = mc0192
    m0024% = 0
    m002A% = 0
    m0026% = False
    m0028% = 0
    sub260A 0
    Me.Tag = "NEW"
    If  gv14C2(m00C4).M5958(mc0198).M425F = 0 And gv14C2(m00C4).M5958(mc0198).M4258 = 0 Then
        sub02FE Me
    Else
        Me.Left = gv14C2(m00C4).M5958(mc0198).M425F
        Me.Top = gv14C2(m00C4).M5958(mc0198).M4258
    End If
    Me.Width = gv14C2(m00C4).M5958(mc0198).M4216
    Me.Height = gv14C2(m00C4).M5958(mc0198).M420C
    gv19C2(mc0198).M4216 = gv19C2(mc0198).M5E20
    gv19C2(mc0198).M420C = gv19C2(mc0198).M5E2D
    gv19C2(mc0198).M5E47 = Me.hWnd
    Me.Tag = ""
    sub0524 Me
    sub0784 Me
    sub168B
    Screen.MousePointer = m01A4
End Sub

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub07B3 Me, elaElastic(0)
        sub07C5 Me, gv19C2(mc0198)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
Dim l01AE ' 80
    For l01AE = 1 To 7
        Unload elaItem(l01AE)
        Unload elaItemInfo(l01AE)
    Next l01AE
    m0024 = 0
    If  m0026% Then
        If  fn0425(gc1C18) = False Then
            l01AE = MsgBox("Error saving store file!", 64, "ERROR!")
        End If
    End If
    sub15BE -1, mc0198, Me, True
    gv19C2(mc0198).M5E47 = False
    l01AE = fn04ED(gv14C2(gv1A86))
    Set frmCityStore = Nothing
End Sub

Sub lblCall_Change ()
    If  m0060 = False Then
        m0060 = True
        txtID.Text = ""
        lblValue.Caption = ""
        lblValueNum.Caption = "Value"
        lblIDCost.Caption = ""
        lblIDLevel.Caption = ""
        cmdIDInfo.Enabled = False
        cmdSell.Enabled = False
        cmdID.Enabled = False
        cmdCommand(m0068).Enabled = False
        lblCombine.Caption = ""
        txtUncurse.Text = ""
        lblUncurse.Caption = ""
        cmdUncurse.Enabled = False
        vsbItems_Change
        If  vsbItems.Enabled = False Then
            elaAlignments.P?C008 = True
        End If
        lblCall = ""
        m0060 = False
    End If
End Sub

Sub lblCombine_Change ()
    If  lblCombine.Caption = "" Then
        cmdCommand(m0068).Enabled = False
    Else
        cmdCommand(m0068).Enabled = True
    End If
End Sub

Sub sub260A (p01E0 As Integer ' 41)
Dim l01E2 ' 80
    If  p01E0 = 0 Then
        ReDim m002E(0)      As Integer
        m002C = 1
        If  gv1BEC = 0 Then
            elaItem(0).[$C023?] = "<NO ITEMS>"
            elaItemInfo(0).[$C023?] = ""
            Exit Sub
        End If
        For l01E2 = 1 To (mc0066 - 1)
            Load elaItem(l01E2)
            Load elaItemInfo(l01E2)
            elaItemInfo(l01E2).X2 = elaItemInfo(l01E2 - 1).X2 + elaItemInfo(l01E2 - 1).Y2
            elaItem(l01E2).X2 = elaItem(l01E2 - 1).X2 + elaItem(l01E2 - 1).Y2
            elaItemInfo(l01E2).Left = True
            elaItem(l01E2).Left = True
        Next l01E2
    End If
    m0022 = 0
    For l01E2 = 0 To gv1BEC - 1
        If  l01E2 > UBound(gv15FA) Then
            Exit For
        End If
        If  gv15FA(l01E2).M5766 > 0 Then
            m0022 = m0022 + 1
            If  m0022 - 1 > UBound(m002E) Then
                ReDim Preserve m002E(m0022 - 1)
            End If
            m002E(m0022 - 1) = l01E2
        End If
    Next l01E2
    vsbItems.LargeChange = mc0066
    If  p01E0 = 0 Then
        vsbItems.Tag = "2"
        vsbItems.Min = 1
        vsbItems.Max = (m0022) - (mc0066 - 1)
    Else
        vsbItems.Tag = LTrim$(Str$(vsbItems.Value))
        vsbItems.Min = 1
        vsbItems.Max = (m0022) - (mc0066 - 1)
        vsbItems_Change
    End If
End Sub

Sub sub268D ()
    txtID.Text = ""
    lblValue.Caption = ""
    lblValueNum.Caption = "Value"
    lblIDCost.Caption = ""
    lblIDLevel.Caption = ""
    cmdIDInfo.Enabled = False
    cmdSell.Enabled = False
    cmdID.Enabled = False
End Sub

Function fn271B (p01EE As Integer ' 41) As Long ' 2
Dim l01F0 As Integer ' 81
Dim l01F2 As Integer ' 81
Dim l01F4 As Currency ' 85
Dim l01F6 As Integer ' 81
Dim l01F8 As Integer ' 81
Dim l01FA As Integer ' 81
    l01F0 = gv14C2(gv1A86).M5857(p01EE).M4ED4
    l01F2 = gv14C2(gv1A86).M5857(p01EE).M4EBF
    l01F4 = gv1426(l01F0).M5686
    l01F6 = gv15FA(l01F0).M5557(l01F2)
    If  l01F6 > mc00B6 Then
        l01F6 = mc00B6
    End If
    l01F8 = gv14C2(gv1A86).M5857(p01EE).M4EEE
    l01FA = gv14C2(gv1A86).M5857(p01EE).M56DB
    fn271B = ((.23# * l01F4) / (((l01F6 / 2) + 1) * .9#) / l01F8 + 1)
End Function

Function fn272C (p01FE As Integer ' 41, p0200 As Integer ' 41) As Long ' 2
Dim l0202 As Integer ' 81
Dim l0206 As Currency ' 85
Dim l0208 As Integer ' 81
Dim l020A As Integer ' 81
Dim l020C As Integer ' 81
Dim l020E As Single ' 83
    If  gv1426(p0200).M5693 = 0 Then
        fn272C = gv1426(p0200).M5686
        Exit Function
    End If
    On Error GoTo L65DAC
    l0206 = gv1426(p0200).M5686
    l0208 = gv15FA(p0200).M5557(p01FE) - 1
    If  l0208 > mc00B6 Then
        l0208 = mc00B6
    End If
    l020A = 0
    l020C = gv1426(p0200).M56DB
    l020E = Log(Abs(l020C - gv1426(l0202).M56DB) + 1)
    fn272C = (((1.5# * l0206) / (Log(l0208 + 1) + 1.15#)) / ((l020A + 1))) - l020E * (.05# * l0206)
    Exit Function

L65DAC:
    sub04FC "Error '" + Error + "' occurred in FRMCTYS:modItemCost."
    Resume L65E14
L65E14:
End Function

Sub sub2621 ()
Dim l0210 As String ' 87
Dim l0212 As Integer ' 81
Dim l0214() As Integer ' 91
Dim l021A As Integer ' 81
Dim l021C As Integer ' 81
Dim l0220 As Integer ' 81
Dim l0222 As Integer ' 81
Dim l0224 As Integer ' 81
    l0210 = lblCombine.Caption
    If  l0210 = "" Then
        Exit Sub
    End If
    l0212 = 0
    l021C = 1
    l021A = 0
    Do
        l0212 = l0212 + 1
        If  Mid$(l0210, l0212, 1) = "," Or l0212 = Len(l0210) Then
            l021A = l021A + 1
            If  l0212 = Len(l0210) Then
                l0212 = l0212 + 1
            End If
            ReDim Preserve l0214(l021A - 1)     As Integer
            l0214(l021A - 1) = Val(Mid$(l0210, l021C, l0212 - l021C)) - 1
            l021C = l0212 + 1
        End If
        If  l0212 >= Len(l0210) Then
            Exit Do
        End If
    Loop
    For l0212 = False To UBound(l0214)
        If  gv14C2(gv1A86).M5857(l0214(l0212)).M4EEE <> m0148 Then
            l0212 = MsgBox("Item #" + CStr(l0214(l0212) + 1) + " Not Completely Identified!", 48, "SORRY!")
            lblCombine.Caption = ""
            Exit Sub
        End If
    Next l0212
    If  UBound(l0214) = 0 Then
        lblCombine.Caption = ""
        Exit Sub
    End If
    l021A = 0
    l0224 = gv14C2(gv1A86).M5857(l0214(0)).M4ED4
    l0220 = gv1426(gv14C2(gv1A86).M5857(l0214(0)).M4ED4).M5709
    l0222 = gv14C2(gv1A86).M5857(l0214(0)).M4EBF
    Select Case l0220
        Case 23, 24, 25, 26, 27, 28, 30, 31
        Case Else
            l0212 = MsgBox("Item Class cannot be Combined!", 48, "SORRY!")
            lblCombine.Caption = ""
            Exit Sub
    End Select
    For l0212 = 1 To UBound(l0214)
        If  l0214(l0212) <> l0214(0) Then
            If  gv14C2(gv1A86).M5857(l0214(l0212)).M4EEE = m0148 Then
                If  gv1426(gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4).M5709 = l0220 Then
                    If  gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4 = l0224 Then
                        If  gv14C2(gv1A86).M5857(l0214(l0212)).M4EBF = l0222 Then
                            If  gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4 = l0224 Then
                                sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " combined to Item #" + LTrim$(Str$(l0214(0) + 1)) + "."
                                gv14C2(gv1A86).M5857(l0214(0)).M56DB = gv14C2(gv1A86).M5857(l0214(0)).M56DB + gv14C2(gv1A86).M5857(l0214(l0212)).M56DB
                                gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4 = 0
                                sub0F61 gv1A84, m00C4, l0214(l0212)
                            End If
                            Else
                            sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not compatible Alignment."
                        End If
                        Else
                        sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not of the same type."
                    End If
                    Else
                    sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not compatible class."
                End If
                Else
                sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not completely identified."
            End If
        End If
    Next l0212
    sub0F61 gv1A84, m00C4, l0214(0)
    lblCombine.Caption = ""
End Sub

Function fn273B (p0228 As Integer ' 41) As Long ' 2
Dim l022A ' 80
Dim l022C As Integer ' 81
Dim l022E As Integer ' 81
Dim l0230 As Currency ' 85
Dim l0232 As Integer ' 81
Dim l0234 As Integer ' 81
Dim l0236 As Integer ' 81
Dim l0238 As Single ' 83
Dim l023A As Long ' 82
Dim l023C As Integer ' 81
' Const mc023E = 1 ' &H1%
' Const mc0240 = 3 ' &H3%
    l022C = gv14C2(gv1A86).M5857(p0228).M4ED4
    l022E = gv14C2(gv1A86).M5857(p0228).M4EBF
    l0230 = gv1426(l022C).M5686
    l0232 = gv15FA(l022C).M5557(l022E)
    If  gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M572A >= mc023E Then
        If  gv14C2(gv1A86).M5857(p0228).M577E = mc0118 Then
            l0230 = 0
        End If
    End If
    If  l0232 = 0 Then
        For l022A = 0 To mc0240
            If  gv15FA(l022C).M5557(l022A) > 0 Then
                l023C = True
            End If
        Next l022A
        If  l023C = True Then
            l0232 = 1
        End If
    End If
    If  l0232 > mc00B6 Then
        l0232 = mc00B6
    End If
    l0234 = gv14C2(gv1A86).M5857(p0228).M4EEE
    l0236 = gv14C2(gv1A86).M5857(p0228).M56DB
    l0238 = 1
    If  gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M56DB > 0 Then
        Select Case gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M5709
            Case 23, 24, 25, 26, 27, 28, 30, 31
                l0238 = 5
                If  gv14C2(gv1A86).M5857(p0228).M56DB > gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M56DB Then
                    l0236 = gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M56DB
                End If
        End Select
    End If
    l0238 = l0238 * Log(Abs(l0236 - gv1426(l022C).M56DB) + 1)
    If  l0234 = m0148 And gv1426(l022C).M572A <> False Then
        fn273B = 0
    Else
        l023A = (((.9# * l0230) / (l0232 + 1.15#)) / ((l0234 + 1)))
        fn273B = l023A - (l0238 * (.05# * l023A))
    End If
End Function

Sub sub26C8 (p0242 As Integer ' 41)
' Const m0244 = 0 ' &H0%
' Const mc0246 = 9 ' &H9%
    If  m0062 > -1 And m0062 < mc0066 Then
        elaItem(m0062).FontSize = QBColor(m0244)
        elaItemInfo(m0062).FontSize = QBColor(m0244)
    End If
    m0062 = p0242
    elaItem(p0242).FontSize = QBColor(mc0246)
    elaItemInfo(p0242).FontSize = QBColor(mc0246)
End Sub

Function fn274F (p024A As Integer ' 41) As Long ' 2
    fn274F = (.8# * gv1426(p024A).M5686) / .5#
End Function

Sub txtCombine_DragDrop (Source As Control, X As Single, Y As Single)
' Const mc025A = 13 ' &HD%
    frmCityStore.SetFocus
    If  Source.Tag = "ITEM" Then
        txtCombine.Text = Source
        txtCombine_KeyPress mc025A
    Else
        sub085B "You may only drag and drop items on your character to the store."
    End If
End Sub

Sub txtCombine_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtCombine_KeyPress (KeyAscii As Integer)
Dim l0262 As String ' 87
Dim l0264 As String ' 87
Dim l0266 As Integer ' 81
    If  KeyAscii = mc025A Then
        KeyAscii = 0
        l0262 = txtCombine.Text
        If  fn12C4(l0262) > 0 Then
            cmdCommand(m0068).Enabled = True
            l0264 = txtCombine.Text
            l0266 = fn12C4(l0264)
            If  l0266 Then
                If  lblCombine.Caption = "" Then
                    lblCombine.Caption = LTrim$(Str$(l0266 + 1))
                Else
                    lblCombine.Caption = lblCombine.Caption + "," + LTrim$(Str$(l0266 + 1))
                End If
                txtCombine.Text = ""
            End If
        End If
    End If
End Sub

Sub txtID_DragDrop (Source As Control, X As Single, Y As Single)
    frmCityStore.SetFocus
    If  Source.Tag = "ITEM" Then
        txtID.Text = Source
        txtID_KeyPress 13
    Else
        sub085B "You may only drag and drop items on your character to the store."
    End If
End Sub

Sub txtID_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtID_KeyPress (KeyAscii As Integer)
Dim l0276 ' 80
Dim l0278 As String ' 87
Dim l027A As Integer ' 81
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l0278$ = txtID.Text
        l027A% = fn12C4(l0278$)
        For l0276 = 0 To mc0240 - 1
            cmdRealign(l0276).Enabled = False
        Next l0276
        If  l027A% > 0 Then
            If  fn1121(gv14C2(gv1A86).M5857(l027A%).M4ED4) = False Then
                sub085B "Cannot sell Guild-Issued Items!"
                sub268D
                Exit Sub
            End If
            lblValue.Caption = fn036D(CCur(fn273B(l027A%)), m00BE)
            If  gv1426(gv14C2(gv1A86).M5857(l027A%).M4ED4).M56DB > 0 Then
                Select Case gv1426(gv14C2(gv1A86).M5857(l027A%).M4ED4).M5709
                    Case 23, 24, 25, 26, 27, 28, 30, 31
                        If  gv14C2(gv1A86).M5857(l027A%).M56DB > gv1426(gv14C2(gv1A86).M5857(l027A%).M4ED4).M56DB Then
                            If  gv14C2(gv1A86).M5857(l027A%).M4EEE = m0148 Then
                                lblValue.Caption = lblValue.Caption + " (" + LTrim$(Str$(gv14C2(gv1A86).M5857(l027A%).M56DB)) + "->" + LTrim$(Str$(gv14C2(gv1A86).M5857(l027A%).M56DB - gv1426(gv14C2(gv1A86).M5857(l027A%).M4ED4).M56DB)) + ")"
                            End If
                        End If
                End Select
            End If
            txtID.Text = frmCharStat3!lblItem(l027A%).Caption
            cmdIDInfo.Enabled = True
            cmdSell.Enabled = True
            If  gv14C2(gv1A86).M5857(l027A%).M4EEE > 0 Then
                cmdID.Enabled = True
                lblIDCost.Caption = fn036D(CCur(fn271B(l027A%)), m00BE)
                lblValueNum.Caption = "? Value"
            Else
                For l0276 = 0 To mc0240 - 1
                    If  gv1426(gv14C2(gv1A86).M5857(l027A%).M4ED4).M5557 > 1 Then
                        If  gv14C2(gv1A86).M5857(l027A%).M4EBF <> (l0276 + 1) Then
                            cmdRealign(l0276).Enabled = True
                        End If
                        Else
                        cmdRealign(l0276).Enabled = False
                    End If
                Next l0276
                lblValueNum.Caption = gv077E$(gv14C2(gv1A86).M5857(l027A%).M4EBF) + LTrim$(Str$(gv15FA(gv14C2(gv1A86).M5857(l027A%).M4ED4).M5557(gv14C2(gv1A86).M5857(l027A%).M4EBF))) + " Value"
                cmdID.Enabled = False
                lblIDCost.Caption = ""
            End If
            lblIDLevel.Caption = fn12D6(gv14C2(gv1A86).M5857(l027A%).M4EEE)
        Else
            lblUncurse.Caption = ""
            cmdID.Enabled = False
            cmdInfo.Enabled = False
            cmdSell.Enabled = False
            lblValue.Caption = ""
            lblIDCost.Caption = ""
            lblIDLevel.Caption = ""
        End If
    End If
End Sub

Sub txtSearch_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtSearch_KeyPress (KeyAscii As Integer)
Dim l0290 ' 80
Dim l0292 As Integer ' 81
Dim l0294 As Variant ' 86
Dim l0298 As String ' 87
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l0298 = txtSearch.Text
        For l0290 = 0 To m0022 - 1
            If  Len(gv1426(gv15FA(m002E(l0290)).M5766).M548B) >= Len(l0298) Then
                If  Left$(UCase$(gv1426(gv15FA(m002E(l0290)).M5766).M548B), Len(l0298)) = UCase$(l0298) Then
                    If  UCase$(gv1426(gv15FA(m002E(l0290)).M5766).M548B) = UCase$(l0298) Then
                        l0294 = l0290
                        l0292 = 1
                        Exit For
                    End If
                    l0292 = l0292 + 1
                    l0294 = l0290
                End If
            End If
        Next l0290
        If  l0292 = 0 Then
            txtSearch.Text = "Item Not Found!"
            sub07E2 .5#
            txtSearch.Text = l0298
            Exit Sub
        End If
        If  l0292 > 1 Then
            txtSearch.Text = "Item is ambiguous!"
            sub07E2 .5#
            txtSearch.Text = l0298
            Exit Sub
        End If
        If  l0294 + 1 > vsbItems.Max Then
            vsbItems.Value = vsbItems.Max
        Else
            vsbItems.Value = l0294 + 1
        End If
        txtSearch.Text = ""
    End If
End Sub

Sub txtUncurse_Change ()
    If  cmdUncurse.Enabled = True Then
        cmdUncurse.Enabled = False
        lblUncurse.Caption = ""
    End If
End Sub

Sub txtUncurse_DragDrop (Source As Control, X As Single, Y As Single)
    frmCityStore.SetFocus
    If  Source.Tag = "ITEM" Then
        txtUncurse.Text = Source
        txtUncurse_KeyPress 13
    Else
        sub085B "You may only drag and drop items on your character to the store."
    End If
End Sub

Sub txtUncurse_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtUncurse_KeyPress (KeyAscii As Integer)
Dim l02AE As String ' 87
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l02AE$ = txtUncurse.Text
        If  fn12C4(l02AE$) > 0 Then
            lblUncurse.Caption = fn036D(CCur(fn274F(gv14C2(gv1A86).M5857(fn12C4(l02AE$)).M4ED4)), m00BE)
            txtUncurse.Text = frmCharStat3!lblItem(fn12C4(l02AE$)).Caption
            cmdUncurse.Enabled = True
        Else
            lblUncurse.Caption = ""
            cmdUncurse.Enabled = False
        End If
    End If
End Sub

Sub vsbItems_Change ()
Dim l02B0 As String ' 87
Dim l02B2 ' 80
Dim l02B4 ' 80
Dim l02B6 As Integer ' 81
    If  elaAlignments.P?C008 = True Then Exit Sub
    If  vsbItems.Value > Val(vsbItems.Tag) Then
        l02B6 = (vsbItems.Value - Val(vsbItems.Tag))
        ElseIf vsbItems.Value < Val(vsbItems.Tag) Then
        l02B6 = -(Val(vsbItems.Tag) - vsbItems.Value)
    End If
    m002C = m002C + l02B6
    For l02B2 = 0 To mc0066 - 1
        elaItem(l02B2).FontSize = QBColor(m0244)
        elaItemInfo(l02B2).FontSize = QBColor(m0244)
        If  gv1426(gv15FA(m002E(m002C + l02B2)).M5766).M5693 = 0 And gv15FA(m002E(m002C + l02B2)).M5557(0) > 0 Then
            elaItemInfo(l02B2).[$C023?] = fn036D(CCur(gv1426(gv15FA(m002E(m002C + l02B2)).M5766).M5686), m00BE)
        Else
            l02B0$ = ""
            For l02B4 = 0 To mc009C - 1
                m0064 = gv15FA(m002E(m002C + l02B2)).M5557(l02B4)
                If  m0064 > mc00B6 Then
                    m0064 = mc00B6
                End If
                l02B0$ = l02B0$ + " " + LTrim$(Str$(m0064))
            Next l02B4
            l02B0$ = LTrim$(l02B0$)
            elaItemInfo(l02B2).[$C023?] = l02B0$
        End If
        l02B0$ = gv1426(gv15FA(m002E(m002C + l02B2)).M5766).M548B
        If  gv1426(gv15FA(m002E(m002C + l02B2)).M5766).M56DB > 0 Then
            l02B0$ = l02B0$ + " [" + LTrim$(Str$(gv1426(gv15FA(m002E(m002C + l02B2)).M5766).M56DB)) + "]"
        End If
        elaItem(l02B2).[$C023?] = " " + l02B0$
        elaItem(l02B2).Tag = LTrim$(Str$(gv15FA(m002E(m002C + l02B2)).M5766))
        If  gv15FA(m002E(m002C + l02B2)).M5766 = m0024% Then
            m0062 = l02B2 - 1
            sub26C8 l02B2
            m0062 = l02B2 + 1
            sub26C8 l02B2
        End If
        If  fn110D(gv1A86, gv15FA(m002E(m002C + l02B2)).M5766, 0, 1) = False Then
            elaItem(l02B2).CurrentY = False
            elaItemInfo(l02B2).CurrentY = False
        Else
            elaItem(l02B2).CurrentY = True
            elaItemInfo(l02B2).CurrentY = True
        End If
    Next l02B2
    vsbItems.Tag = LTrim$(Str$(vsbItems.Value))
End Sub
