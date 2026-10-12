' FRMCITYC.FRM
Option Explicit
Dim m0026 As Integer ' 61
Dim m0028 As Integer ' 61
Dim m002A As Integer ' 61
Dim m002C As Integer ' 61
Dim m002E As Integer ' 61
Dim m0030 As Integer ' 61
Dim m0032() As Integer ' 71
Dim m0064 As Integer ' 61
Dim m0066 As Integer ' 61
Dim m0068 As Integer ' 61
Const mc006A = 9 ' &H9%
Const mc006C = 12 ' &HC%
Const mc006E = 4 ' &H4%
Const mc008A = 48 ' &H30%
Const m008C = 0 ' &H0%
Const mc0090 = 4 ' &H4%
Const mc0092 = 6 ' &H6%
Const mc009A = 6 ' &H6%
Const mc009C = 8 ' &H8%
Const mc00BA = 4 ' &H4%
Const mc00D2 = 4 ' &H4%
Const mc00EC = 9 ' &H9%
Const mc016E = 11 ' &HB%
Const mc0174 = 5 ' &H5%
Const mc01DE = 5 ' &H5%
Const mc01E0 = 3 ' &H3%
Const mc01E4 = 4 ' &H4%
Const mc01E6 = 5 ' &H5%
Const mc01E8 = 6 ' &H6%
Const mc01EA = 8 ' &H8%
Const mc01EC = 10 ' &HA%
Const mc01EE = 11 ' &HB%
Const mc01F2 = 1 ' &H1%
Const mc01F4 = 2 ' &H2%
Const mc01F6 = 3 ' &H3%
Const mc01F8 = 4 ' &H4%
Const mc01FA = 5 ' &H5%
Const mc01FC = 6 ' &H6%
Const mc01FE = 11 ' &HB%
Const mc024E = 3 ' &H3%
Const m0252 = 0 ' &H0%
Const mc0254 = 9 ' &H9%

Sub cmdAlign_Click (Index%)
    m002C = Index
End Sub

Sub cmdBind_Click ()
Dim l0072 As Integer ' 81
Dim l0074 As Integer ' 81
Dim l0076 As Integer ' 81
Dim l0078 As Integer ' 81
' Const mc008A = 48 ' &H30%
' Const m008C = 0 ' &H0%
' Const mc0090 = 4 ' &H4%
' Const mc0092 = 6 ' &H6%
' Const mc009A = 6 ' &H6%
' Const mc009C = 8 ' &H8%
    l0072 = fn33DB(CStr(txtBind.Text))
    If  l0072 > -1 Then
        l0074 = gv14C2(gv1A86).M58CB(l0072).M57E1
        If  l0074 >= mc006C Then
            MsgBox "Companion is already bound to or beyond our abilities!", mc008A, "Bind Companion"
            Exit Sub
        End If
        If  l0074 + mc006E > mc006C Then
            l0076 = mc006C
        Else
            l0076 = l0074 + mc006E
        End If
        l0078 = gv14C2(gv1A86).M58CB(l0072).M4ED4
        If  MsgBox("Cost to bind companion to a binding level of " + CStr(l0076) + " is " + fn036D(CCur(fn33B9(l0072)), m008C) + "." + Chr(13) + "Do you wish to pay?", mc0090 Or mc008A, "Bind Companion") = mc0092 Then
            If  fn114E(fn33B9(l0072)) = False Then
                MsgBox "Not enough gold!", mc008A, "Bind Companion"
                Exit Sub
            End If
            gv14C2(gv1A86).M58CB(l0072).M57E1 = l0076
            If  frmCharStat1!tabStatTab.P?C01E = mc009A Then
                If  Left(frmCharStat1!lblCall.Tag, 1) = CStr(mc009C) Then
                    If  gv1EBC.M57D4 = l0072 Then
                        gv1EBC.M57E1 = l0076
                    End If
                End If
            End If
            sub0B82 gv1A86
            sub08A9 False, 10
            txtBind.Text = ""
            lblBindCost.Caption = ""
            cmdBind.Enabled = False
        End If
    End If
End Sub

Sub cmdBuy_Click ()
Dim l00AE As Integer ' 81
Dim l00B0 ' 80
Dim l00B2 As Integer ' 81
Dim l00B4 As Integer ' 81
Dim l00B6 As Integer ' 81
Dim l00B8 As String ' 87
' Const mc00BA = 4 ' &H4%
' Const mc00D2 = 4 ' &H4%
' Const mc00EC = 9 ' &H9%
    l00B2 = -1
    For l00B0 = 0 To mc00BA - 1
        If  gv14C2(gv1A86).M58CB(l00B0).M4ED4 = -1 Then
            l00B2 = l00B0
            Exit For
        End If
    Next l00B0
    If  l00B2 = -1 Then
        l00AE% = MsgBox("No more room for companions!", mc008A, "Buy Companion")
        Exit Sub
    End If
    If  fn114E(fn33CC(m002C, Val(lblSelectedComp.Tag))) = False Then
        l00AE% = MsgBox("Not enough gold!", mc008A, "Buy Companion")
        Exit Sub
    End If
    m002A% = True
    l00B4 = Val(lblSelectedComp.Tag)
    gv14C2(gv1A86).M58CB(l00B2).M548B = ""
    gv14C2(gv1A86).M58CB(l00B2).M4ED4 = l00B4
    gv14C2(gv1A86).M58CB(l00B2).M57D4 = gv14F6(l00B4).M5467
    gv14C2(gv1A86).M58CB(l00B2).M4E97 = gv14F6(l00B4).M4E97
    gv14C2(gv1A86).M58CB(l00B2).M4EA1 = gv14F6(l00B4).M4EA1
    gv14C2(gv1A86).M58CB(l00B2).M4EAC = gv14F6(l00B4).M4EAC
    gv14C2(gv1A86).M58CB(l00B2).M4EB4 = gv14F6(l00B4).M4EAC
    gv14C2(gv1A86).M58CB(l00B2).M4EBF = m002C%
    gv14C2(gv1A86).M58CB(l00B2).M4EEE = 0
    gv14C2(gv1A86).M58CB(l00B2).M57E1 = 5 + (gv14F6(l00B4).M5693)
    If  gv14C2(gv1A86).M58CB(l00B2).M57E1 > 10 Then
        gv14C2(gv1A86).M58CB(l00B2).M57E1 = 10
    End If
    If  gv14F6(l00B4).M5693 > False Then
        gv162E(l00B4).M5557(m002C%) = gv162E(l00B4).M5557(m002C%) - 1
    End If
    l00AE% = False
    For l00B0 = 0 To mc00D2 - 1
        If  gv162E(l00B4).M5557(l00B0) > 0 Then
            l00AE% = True
            Exit For
        End If
    Next l00B0
    If  l00AE% = False Then
        gv162E(l00B4).M5766 = 0
        gv162E(l00B4).M5467 = False
    End If
    sub3347 1
    If  gv162E(l00B4).M5557(m002C%) < 1 Then
        lblSelectedComp.Caption = ""
        lblSelectedComp.Tag = ""
        lblCost.Caption = "Cost"
        lblSelectedCompCost.Caption = ""
        cmdBuy.Enabled = False
        cmdInfo.Enabled = False
    Else
        l00B6% = gv162E(m0028%).M5557(m002C%)
        If  l00B6% > mc00EC Then
            l00B6% = mc00EC
        End If
        l00B8$ = LTrim$(Str$(l00B6%)) + gv077E$(m002C% + 1)
        lblCost.Caption = l00B8$ + " Cost"
        lblSelectedCompCost.Caption = " " + fn036D(CCur(fn33CC(m002C%, l00B4)), m008C)
    End If
    sub0B82 gv1A86
    sub085B "Companion #" + LTrim$(Str$(l00B2 + 1)) + " is now your " + gv14F6(gv14C2(gv1A86).M58CB(l00B2).M4ED4).M548B + "."
End Sub

Sub cmdExit_Click ()
    Unload frmCityCStore
    sub0792 frmCityMain
    frmCityMain.SetFocus
End Sub

Sub cmdID_Click ()
Dim l00FC As String ' 87
Dim l00FE As Integer ' 81
Dim l0100 As Integer ' 81
Dim l010A As T4E8B ' 8A
    l00FC = txtID.Text
    l00FE = fn33DB(l00FC)
    If  l00FE > -1 Then
        If  fn114E(fn33E9(l00FE)) = False Then
            l0100% = MsgBox("Not enough gold!", mc008A, "Identify Companion")
            Exit Sub
        End If
        gv14C2(gv1A86).M58CB(l00FE).M4EEE = gv14C2(gv1A86).M58CB(l00FE).M4EEE - 1
        l010A.M4ED4 = gv14C2(gv1A82).M58CB(l00FE).M4ED4
        l010A.M4F01 = l010A.M4ED4
        gv1EBC = gv14C2(gv1A82).M58CB(l00FE)
        l010A.M4EEE = gv14C2(gv1A82).M58CB(l00FE).M4EEE
        sub06FE l010A, False, True, False, gv1A82
        gv1EBC = gv14C2(gv1A82).M58CB(l00FE)
        gv1EBC.M57D4 = l00FE
        sub150A mc009C, 0, 0, 0, 0, 0
        frmCharStat1!picTabPicture.SetFocus
        sub0B82 gv1A86
        txtID_KeyPress 13
    End If
End Sub

Sub cmdIDInfo_Click ()
Dim l0114 As Integer ' 81
Dim l0116 As String ' 87
    l0116 = txtID.Text
    l0114 = fn33DB(l0116)
    If  l0114 > -1 Then
        If  l0114 > -1 Then
            gv1EBC = gv14C2(gv1A86).M58CB(l0114)
            gv1EBC.M57D4 = l0114
            sub150A mc009C, 0, 0, 0, 0, 0
            frmCharStat1!picTabPicture.SetFocus
        End If
    End If
End Sub

Sub cmdInfo_Click ()
Dim l0118 As Integer ' 81
    l0118 = Val(lblSelectedComp.Tag)
    If  l0118 > -1 Then
        gv1EBC.M548B = ""
        gv1EBC.M4ED4 = l0118
        gv1EBC.M57D4 = -1
        gv1EBC.M4EAC = gv14F6(l0118).M4EAC
        gv1EBC.M4EB4 = gv14F6(l0118).M4EAC
        gv1EBC.M4EBF = m002C
        gv1EBC.M4E97 = gv14F6(l0118).M4E97
        gv1EBC.M4EA1 = gv14F6(l0118).M4EA1
        gv1EBC.M57E1 = 0
        gv1EBC.M4EEE = 0
        sub150A mc009C, 0, 0, 0, 0, 0
        frmCharStat1!picTabPicture.SetFocus
    End If
End Sub

Sub cmdRealign_Click (Index%)
Dim l011C As Integer ' 81
Dim l011E As String ' 87
Dim l0120 As Integer ' 81
Dim l0122 As Long ' 82
Dim l0124 As Integer ' 81
    l011E = txtID.Text
    l011C = fn33DB(l011E)
    If  l011C > -1 Then
        l0124 = 1
        If  Abs(gv14C2(gv1A86).M58CB(l011C).M4EBF - (Index)) > 1 Then
            l0124 = 2
        End If
        l0122 = (.72# * fn33A6(gv14C2(gv1A86).M58CB(l011C).M4ED4)) * l0124
        If  MsgBox("Cost to realign is " + fn036D(CCur(l0122), m008C) + "." + Chr$(13) + "Do you wish to pay?", 36, "REALIGN ITEM") = 6 Then
            If  fn114E(l0122) = False Then
                l0120 = MsgBox("Not enough gold!", 64, "SORRY!")
                Exit Sub
            End If
            gv14C2(gv1A86).M58CB(l011C).M4EBF = (Index)
            If  gv1EBC.M57D4 = l011C Then
                gv1EBC.M4EBF = gv14C2(gv1A86).M58CB(l011C).M4EBF
                If  Len(frmCharStat1!lblCall.Tag) Then
                    If  CInt(Left(frmCharStat1!lblCall.Tag, 1)) = mc009C Then
                        frmCharStat1!picTabPicture.Refresh
                    End If
                End If
            End If
            sub0B82 gv1A86
            txtID_KeyPress 13
        End If
    End If
End Sub

Sub cmdSell_Click ()
Dim l0126 As Integer ' 81
Dim l0128 As String ' 87
Dim l012A As Integer ' 81
    l0128 = txtID.Text
    l0126 = fn33DB(l0128)
    l012A = True
    If  l0126 > -1 Then
        gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + fn33FA(l0126)
        If  gv14F6(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5693 = 0 Then
            l012A = False
        End If
        If  l012A = True And gv162E(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5557(gv14C2(gv1A86).M58CB(l0126).M4EBF) < mc00EC Then
            gv162E(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5557(gv14C2(gv1A86).M58CB(l0126).M4EBF) = gv162E(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5557(gv14C2(gv1A86).M58CB(l0126).M4EBF) + 1
            gv162E(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5766 = gv14C2(gv1A86).M58CB(l0126).M4ED4
            gv162E(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5467 = gv14F6(gv14C2(gv1A86).M58CB(l0126).M4ED4).M5467
        End If
        gv14C2(gv1A86).M58CB(l0126).M4ED4 = -1
        sub0B82 gv1A86
        sub08A9 False, 10
        sub268D
    End If
    m002A = True
    sub3347 1
End Sub

Sub elaComp_event0000 (p0132 As Integer ' 41)
Dim l0140 ' 80
Dim l0144 As Integer ' 81
Dim l0146 As Integer ' 81
Dim l0148 As Integer ' 81
Dim l014A As String ' 87
    On Error GoTo L8867A
    If  p0132 < 0 Or p0132 > m0026 Then
        p0132 = 0
    End If
    If  elaAlignments.P?C008 = True Or elaComp(p0132).Left = False Or elaComp(p0132).[$C023?] = "" Then
        Beep
        Exit Sub
    End If
    sub336F p0132
    m0028 = Val(elaComp(p0132).Tag)
    m002E = p0132
    l0146% = Val(elaComp(p0132).Tag)
    For l0140 = 0 To (mc00D2 - 1) - 1
        cmdAlign(l0140).Visible = True
        If  gv162E(l0146%).M5557(l0140) > 0 Then
            cmdAlign(l0140).Enabled = True
            l0144% = l0144% + 1
            m002C = l0140
        Else
            cmdAlign(l0140).Enabled = False
        End If
    Next l0140
    If  l0144% > 1 Then
        m002C% = -1
        elaAlignments.P?C008 = True
        cmdExit.Enabled = False
        cmdBuy.Enabled = False
        cmdInfo.Enabled = False
        vsbComps.Enabled = False
        elaAlignments.SetFocus
        Do
            sub05D8
            If  fn03BD(frmCityCStore) = False Then Exit Do
        Loop While m002C = -1
        If  fn03BD(frmCityCStore) = False Then Exit Sub
        vsbComps.Enabled = True
        cmdExit.Enabled = True
        cmdBuy.Enabled = True
        cmdInfo.Enabled = True
        elaAlignments.P?C008 = False
    Else
        cmdBuy.Enabled = True
        cmdInfo.Enabled = True
        elaAlignments.P?C008 = False
    End If
    l014A$ = elaComp(p0132).[$C023?]
    lblSelectedComp.Caption = l014A$
    lblSelectedComp.Tag = elaComp(p0132).Tag
    l0148% = gv162E(m0028).M5557(m002C)
    If  l0148% = 0 Then Exit Sub
    If  l0148% > mc00EC Then
        l0148% = mc00EC
    End If
    l014A$ = LTrim$(Str$(l0148%)) + gv077E$(m002C + 1)
    lblCost.Caption = l014A$ + " Cost"
    lblSelectedCompCost.Caption = " " + fn036D(CCur(fn33CC(m002C, Val(elaComp(p0132).Tag))), m008C)
    Exit Sub

L8867A:
    MsgBox "Error '" + Error$ + "' occurred at '" + CStr(Erl) + "' in FRMCITYC:elaComp_Click!", mc008A, "Error!"
    Resume L886FA
L886FA:
End Sub

Sub elaCompInfo_event0000 (p0162 ' 40)
    elaComp_event0000 p0162
End Sub

Sub Form_Activate ()
    sub0792 Me
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l0168 As Integer ' 81
' Const mc016E = 11 ' &HB%
' Const mc0174 = 5 ' &H5%
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
        l0168 = fn14CB(KeyCode, Shift)
    End If
End Sub

Sub Form_Load ()
Static m0176 As Integer ' 61
Static m0180 As Integer ' 61
    Screen.MousePointer = mc016E
    m0028 = 0
    m002E = 0
    m002C = 0
    m002A = False
    sub3347 0
    Me.Tag = "NEW"
    If  gv14C2(m0176).M5958(mc0174).M425F = 0 And gv14C2(m0176).M5958(mc0174).M4258 = 0 Then
        sub02FE Me
    Else
        Me.Left = gv14C2(m0176).M5958(mc0174).M425F
        Me.Top = gv14C2(m0176).M5958(mc0174).M4258
    End If
    Me.Width = gv14C2(m0176).M5958(mc0174).M4216
    Me.Height = gv14C2(m0176).M5958(mc0174).M420C
    gv19C2(mc0174).M4216 = gv19C2(mc0174).M5E20
    gv19C2(mc0174).M420C = gv19C2(mc0174).M5E2D
    gv19C2(mc0174).M5E47 = Me.hWnd
    Me.Tag = ""
    sub0524 Me
    sub0784 Me
    sub168B
    Screen.MousePointer = m0180
End Sub

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub07B3 Me, elaElastic(0)
        sub07C5 Me, gv19C2(mc0174)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
Dim l018A ' 80
    m0028 = 0
    For l018A = 1 To 7
        Unload elaComp(l018A)
        Unload elaCompInfo(l018A)
    Next l018A
    If  m002A Then
        If  fn0425(gc1C44) = False Then
            l018A = MsgBox("Error saving companion store file!", 64, "ERROR!")
        End If
    End If
    sub15BE -1, mc0174, Me, True
    gv19C2(mc0174).M5E47 = False
    l018A = fn04ED(gv14C2(gv1A86))
    Set frmCityCStore = Nothing
End Sub

Sub lblCall_Change ()
    If  m0064 = False Then
        m0064 = True
        txtID.Text = ""
        lblValue.Caption = ""
        lblValueNum.Caption = "Value"
        lblIDCost.Caption = ""
        lblIDLevel.Caption = ""
        cmdIDInfo.Enabled = False
        cmdSell.Enabled = False
        cmdID.Enabled = False
        cmdBind.Enabled = False
        txtBind.Text = ""
        lblBindCost.Caption = ""
        vsbComps_Change
        If  vsbComps.Enabled = False Then
            elaAlignments.P?C008 = True
        End If
        lblCall = ""
        m0064 = False
    End If
End Sub

Sub sub3347 (p01C8 As Integer ' 41)
Dim l01CA ' 80
    m0026 = 0
    If  p01C8 = 0 Then
        ReDim m0032(0)      As Integer
        m0032(0) = -1
    End If
    For l01CA = 0 To gv1BF6 - 1
        If  l01CA > UBound(gv162E) Then
            Exit For
        End If
        If  gv162E(l01CA).M5766 > 0 Then
            m0026 = m0026 + 1
            If  m0026 - 1 > UBound(m0032) Then
                ReDim Preserve m0032(m0026 - 1)
            End If
            m0032(m0026 - 1) = l01CA
        End If
    Next l01CA
    If  p01C8 = 0 Then
        m0030 = 1
        For l01CA = 1 To (mc006A - 1)
            Load elaComp(l01CA)
            Load elaCompInfo(l01CA)
            elaCompInfo(l01CA).X2 = elaCompInfo(l01CA - 1).X2 + elaCompInfo(l01CA - 1).Y2
            elaComp(l01CA).X2 = elaComp(l01CA - 1).X2 + elaComp(l01CA - 1).Y2
            elaCompInfo(l01CA).Left = True
            elaComp(l01CA).Left = True
        Next l01CA
    End If
    If  UBound(m0032) = 0 And m0032(0) = 0 Then
        elaComp(0).[$C023?] = "NO COMPANIONS!"
        elaCompInfo(0).[$C023?] = ""
    End If
    vsbComps.LargeChange = mc006A
    If  UBound(m0032) <= (mc006A - 1) Then
        vsbComps.Enabled = False
    Else
        vsbComps.Enabled = True
    End If
    If  p01C8 = 0 Then
        vsbComps.Tag = "2"
        vsbComps.Min = 1
        vsbComps.Max = (m0026) - (mc006A - 1)
    Else
        vsbComps.Tag = LTrim$(Str$(vsbComps.Value))
        vsbComps.Min = 1
        vsbComps.Max = (m0026) - (mc006A - 1)
        vsbComps_Change
    End If
End Sub

Function fn33A6 (p01D6 As Integer ' 41) As Currency ' 5
Dim l01D8 As Currency ' 85
Dim l01DA ' 80
Static m01DC As Integer ' 61
' Const mc01DE = 5 ' &H5%
' Const mc01E0 = 3 ' &H3%
' Const mc01E4 = 4 ' &H4%
' Const mc01E6 = 5 ' &H5%
' Const mc01E8 = 6 ' &H6%
' Const mc01EA = 8 ' &H8%
' Const mc01EC = 10 ' &HA%
' Const mc01EE = 11 ' &HB%
Static m01F0 As Integer ' 61
' Const mc01F2 = 1 ' &H1%
' Const mc01F4 = 2 ' &H2%
' Const mc01F6 = 3 ' &H3%
' Const mc01F8 = 4 ' &H4%
' Const mc01FA = 5 ' &H5%
' Const mc01FC = 6 ' &H6%
' Const mc01FE = 11 ' &HB%
    l01D8 = (500@ * gv14F6(p01D6).M4E97)
    l01D8 = l01D8 + 500@ * gv14F6(p01D6).M4EA1
    l01D8 = l01D8 + 250@ * gv14F6(p01D6).M4EAC
    l01D8 = l01D8 * Log(gv14F6(p01D6).M55B5(m01DC) + gv14F6(p01D6).M55B5(mc01DE))
    l01D8 = l01D8 * Log(gv14F6(p01D6).M5A7C + 1)
    If  fn0380(mc01E0, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (3250@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  fn0380(mc01E4, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (3250@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  fn0380(mc01E6, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (2050@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  fn0380(mc01E8, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (2050@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  fn0380(mc01EA, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (1500@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  fn0380(mc01EC, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (1500@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  fn0380(mc01EE, gv14F6(p01D6).M5A35) Then
        l01D8 = l01D8 + (500@ * gv14F6(p01D6).M5A7C + 1)
    End If
    If  gv14F6(p01D6).M5A40 > 0 Then
        If  fn0380(m01F0, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (5250@ * gv14F6(p01D6).M5A7C + 1)
        End If
        If  fn0380(mc01F2, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (3250@ * gv14F6(p01D6).M5A7C + 1)
        End If
        If  fn0380(mc01F4, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (4250@ * gv14F6(p01D6).M5A7C + 1)
        End If
        If  fn0380(mc01F6, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (3250@ * gv14F6(p01D6).M5A7C + 1)
        End If
        If  fn0380(mc01F8, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (5250@ * gv14F6(p01D6).M5A7C + 1)
        End If
        If  fn0380(mc01FA, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (5250@ * gv14F6(p01D6).M5A7C + 1)
        End If
        If  fn0380(mc01FC, gv14F6(p01D6).M5A40) Then
            l01D8 = l01D8 + (4250@ * gv14F6(p01D6).M5A7C + 1)
        End If
    End If
    For l01DA = 0 To mc01FE - 1
        If  gv14F6(p01D6).M5548(l01DA) > 0 Then
            l01D8 = l01D8 + (500@ * gv14F6(p01D6).M5548(l01DA))
        End If
    Next l01DA
    If  gv14F6(p01D6).M4EAC = 1 Then l01D8 = 1
    fn33A6 = l01D8
End Function

Function fn33B9 (p0202 As Integer ' 41) As Currency ' 5
Dim l0204 As Integer ' 81
Dim l0206 As Integer ' 81
Dim l0208 As Currency ' 85
    l0204 = Abs(gv14C2(gv1A86).M58CB(p0202).M57E1)
    If  l0204 + mc006E > mc006C Then
        l0206 = mc006C - l0204
    Else
        l0206 = l0204 + mc006E
    End If
    l0208 = ((gv14F6(gv14C2(gv1A86).M58CB(p0202).M4ED4).M5A7C) * 1237@ * l0206 * gv14C2(gv1A86).M58CB(p0202).M57E1) / 4
    fn33B9 = l0208
End Function

Function fn33CC (p020C As Integer ' 41, p020E ' 40) As Long ' 2
Dim l0214 As Currency ' 85
Dim l0216 As Integer ' 81
Dim l0218 As Integer ' 81
    On Error GoTo L897BC
    l0214 = fn33A6(p020E)
    l0216 = gv162E(p020E).M5557(p020C) - 1
    If  l0216 > mc00EC Then
        l0216 = mc00EC
    End If
    l0218 = 0
    If  l0214 < 10 Then
        l0214 = 10
    End If
    fn33CC = (((1.5# * l0214) / (Log(l0216 + 1) + 1.15#)) / ((l0218 + 1)))
    Exit Function

L897BC:
    sub04FC "Error '" + Error + "' occurred in FRMCTYS:modItemCost."
    Resume L89824
L89824:
End Function

Sub sub268D ()
    txtID.Text = ""
    cmdID.Enabled = False
    cmdIDInfo.Enabled = False
    cmdSell.Enabled = False
    lblValue.Caption = ""
    lblIDCost.Caption = ""
    lblIDLevel.Caption = ""
    lblValueNum.Caption = "Value"
End Sub

Function fn33DB (p0222 As String ' 47) As Integer ' 1
Dim l0224 As Integer ' 81
    On Error GoTo L89966
    l0224 = (Val(p0222) - 1)
    If  l0224 < 0 Or l0224 > mc00BA - 1 Then
        l0224 = -1
    Else
        If  gv14C2(gv1A86).M58CB(l0224).M4ED4 = -1 Then
            l0224 = -1
        End If
    End If
    fn33DB = l0224
    Exit Function

L89966:
    fn33DB = -1
    Resume L8997C
L8997C:
End Function

Function fn33E9 (p0228 As Integer ' 41) As Long ' 2
Dim l022A As Integer ' 81
Dim l022C As Integer ' 81
Dim l022E As Currency ' 85
Dim l0230 As Integer ' 81
Dim l0232 As Integer ' 81
Dim l0236 As Long ' 82
    l022A = gv14C2(gv1A86).M58CB(p0228).M4ED4
    l022C = gv14C2(gv1A86).M58CB(p0228).M4EBF
    l022E = fn33A6(gv14C2(gv1A86).M58CB(p0228).M4ED4)
    l0230 = gv162E(l022A).M5557(l022C)
    If  l0230 > mc00EC Then
        l0230 = mc00EC
    End If
    l0232 = gv14C2(gv1A86).M58CB(p0228).M4EEE
    l0236 = ((.13# * l022E) / (((l0230 / 2) + 1) * .9#) / l0232 + 1)
    If  l0236 < 0 Then l0236 = 0
    fn33E9 = l0236
End Function

Function fn33FA (p023A As Integer ' 41) As Currency ' 5
Dim l023C ' 80
Dim l023E As Integer ' 81
Dim l0240 As Currency ' 85
Dim l0242 As Integer ' 81
Dim l0244 As Integer ' 81
Dim l024A As Long ' 82
Dim l024C As Integer ' 81
' Const mc024E = 3 ' &H3%
    l023E = gv14C2(gv1A86).M58CB(p023A).M4EBF
    l0240 = fn33A6(gv14C2(gv1A86).M58CB(p023A).M4ED4)
    l0242 = gv162E(gv14C2(gv1A86).M58CB(p023A).M4ED4).M5557(l023E)
    If  l0242 = 0 Then
        For l023C = 0 To mc024E
            If  gv162E(gv14C2(gv1A86).M58CB(p023A).M4ED4).M5557(l023C) > 0 Then
                l024C = True
            End If
        Next l023C
        If  l024C = True Then
            l0242 = 1
        End If
    End If
    If  l0242 > mc00EC Then
        l0242 = mc00EC
    End If
    l0244 = gv14C2(gv1A86).M58CB(p023A).M4EEE
    l024A = (((.9# * l0240) / (l0242 + 1.15#)) / ((l0244 + 1)))
    If  l024A < 0 Then l024A = 0
    fn33FA = l024A
End Function

Sub sub336F (p0250 As Integer ' 41)
' Const m0252 = 0 ' &H0%
' Const mc0254 = 9 ' &H9%
    If  m0066 > -1 And m0066 < mc006A Then
        elaComp(m0066).FontSize = QBColor(m0252)
        elaCompInfo(m0066).FontSize = QBColor(m0252)
    End If
    m0066 = p0250
    elaComp(p0250).FontSize = QBColor(mc0254)
    elaCompInfo(p0250).FontSize = QBColor(mc0254)
End Sub

Sub txtBind_Change ()
    If  cmdBind.Enabled = True Then
        cmdBind.Enabled = False
        lblBindCost.Caption = ""
    End If
End Sub

Sub txtBind_DragDrop (Source As Control, X As Single, Y As Single)
    frmCityCStore.SetFocus
    If  Source.Tag = "COMP" Then
        txtBind.Text = Source.Index + 1
        txtBind_KeyPress 13
    Else
        sub085B "You may only drag and drop companions to the companion store."
    End If
End Sub

Sub txtBind_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtBind_KeyPress (KeyAscii As Integer)
Dim l0264 As Integer ' 81
Dim l0266 As Integer ' 81
Dim l026C As String ' 87
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l026C$ = txtBind.Text
        l0264 = fn33DB(l026C$)
        If  l0264 > -1 Then
            If  gv14C2(gv1A86).M58CB(l0264).M57E1 < 0 Then
                MsgBox "You cannot bind a companion that has joined you free of will.", mc008A, "Bind Companion"
                Exit Sub
            End If
            l0266 = gv14C2(gv1A86).M58CB(l0264).M57E1
            If  l0266 >= mc006C Then
                MsgBox "Companion is already bound to or beyond our abilities!", mc008A, "Bind Companion"
                Exit Sub
            End If
            lblBindCost.Caption = fn036D(CCur(fn33B9(l0264)), m008C)
            txtBind.Text = frmCharStat3!lblCompName(l0264)
            cmdBind.Enabled = True
        Else
            lblBindCost.Caption = ""
            cmdBind.Enabled = False
        End If
    End If
End Sub

Sub txtID_DragDrop (Source As Control, X As Single, Y As Single)
    frmCityCStore.SetFocus
    If  Source.Tag = "COMP" Then
        txtID.Text = Source.Index + 1
        txtID_KeyPress 13
    Else
        sub085B "You may only drag and drop companions to the companion store."
    End If
End Sub

Sub txtID_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtID_KeyPress (KeyAscii As Integer)
Dim l0280 ' 80
Dim l0282 As String ' 87
Dim l0284 As Integer ' 81
Static m028E As Integer ' 61
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l0282 = txtID.Text
        l0284 = fn33DB(l0282)
        For l0280 = 0 To mc024E - 1
            cmdRealign(l0280).Enabled = False
        Next l0280
        If  l0284 > -1 Then
            If  gv14C2(gv1A86).M58CB(l0284).M4EAC = 0 Then
                MsgBox "We don't have any interest in dead companions!", mc008A, "Sorry!"
                sub268D
                Exit Sub
            End If
            lblValue.Caption = fn036D(CCur(fn33FA(l0284)), m008C)
            lblIDLevel.Caption = fn12D6(gv14C2(gv1A86).M58CB(l0284).M4EEE)
            txtID.Text = frmCharStat3!lblCompName(l0284)
            cmdIDInfo.Enabled = True
            cmdSell.Enabled = True
            If  gv14C2(gv1A86).M58CB(l0284).M4EEE > m028E Then
                cmdID.Enabled = True
                lblIDCost.Caption = fn036D(CCur(fn33E9(l0284)), m008C)
                lblValueNum.Caption = "? Value"
            Else
                For l0280 = 0 To mc024E - 1
                    If  gv14C2(gv1A86).M58CB(l0284).M4EBF <> l0280 Then
                        cmdRealign(l0280).Enabled = True
                    End If
                Next l0280
                lblValueNum.Caption = gv077E$(gv14C2(gv1A86).M58CB(l0284).M4EBF + 1) + LTrim$(Str$(gv162E(gv14C2(gv1A86).M58CB(l0284).M4ED4).M5557(gv14C2(gv1A86).M58CB(l0284).M4EBF))) + " Value"
                cmdID.Enabled = False
                lblIDCost.Caption = ""
            End If
            lblIDLevel.Caption = fn12D6(gv14C2(gv1A86).M58CB(l0284).M4EEE)
        Else
            sub268D
        End If
    End If
End Sub

Sub txtSearch_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtSearch_KeyPress (KeyAscii As Integer)
Dim l0296 ' 80
Dim l0298 As Integer ' 81
Dim l029A As Variant ' 86
Dim l029E As String ' 87
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l029E = txtSearch.Text
        For l0296 = 0 To m0026 - 1
            If  Len(gv14F6(gv162E(m0032(l0296)).M5766).M548B) >= Len(l029E) Then
                If  Left$(UCase$(gv14F6(gv162E(m0032(l0296)).M5766).M548B), Len(l029E)) = UCase$(l029E) Then
                    If  UCase$(gv14F6(gv162E(m0032(l0296)).M5766).M548B) = UCase$(l029E) Then
                        l029A = l0296
                        l0298 = 1
                        Exit For
                    End If
                    l0298 = l0298 + 1
                    l029A = l0296
                End If
            End If
        Next l0296
        If  l0298 = 0 Then
            txtSearch.Text = "Companion Not Found!"
            sub07E2 .5#
            txtSearch.Text = l029E
            Exit Sub
        End If
        If  l0298 > 1 Then
            txtSearch.Text = "Name is ambiguous!"
            sub07E2 .5#
            txtSearch.Text = l029E
            Exit Sub
        End If
        If  l029A + 1 > vsbComps.Max Then
            vsbComps.Value = vsbComps.Max
        Else
            vsbComps.Value = l029A + 1
        End If
        txtSearch.Text = ""
    End If
End Sub

Sub vsbComps_Change ()
Dim l02A6 As String ' 87
Dim l02A8 ' 80
Dim l02AA ' 80
Dim l02AC As Integer ' 81
    On Error GoTo L8AA56
    If  elaAlignments.P?C008 = True Then Exit Sub
    If  vsbComps.Value > Val(vsbComps.Tag) Then
        l02AC = (vsbComps.Value - Val(vsbComps.Tag))
        ElseIf vsbComps.Value < Val(vsbComps.Tag) Then
        l02AC = -(Val(vsbComps.Tag) - vsbComps.Value)
    End If
    m0030 = m0030 + l02AC
    For l02A8 = 0 To mc006A - 1
        elaComp(l02A8).FontSize = QBColor(m0252)
        elaCompInfo(l02A8).FontSize = QBColor(m0252)
        If  l02A8 <= UBound(m0032) Then
            If  gv14F6(gv162E(m0032(m0030 + l02A8)).M5766).M5693 = 0 Then
                elaCompInfo(l02A8).[$C023?] = "PRICE"
            Else
                l02A6$ = ""
                For l02AA = 0 To (mc00D2 - 1) - 1
                    m0068 = gv162E(m0032(m0030 + l02A8)).M5557(l02AA)
                    If  m0068 > mc00EC Then
                        m0068 = mc00EC
                    End If
                    l02A6$ = l02A6$ + " " + LTrim$(Str$(m0068))
                Next l02AA
                l02A6$ = LTrim$(l02A6$)
                elaCompInfo(l02A8).[$C023?] = l02A6$
            End If
            l02A6$ = " " + gv14F6(gv162E(m0032(m0030 + l02A8)).M5766).M548B
            elaComp(l02A8).[$C023?] = l02A6$
            elaComp(l02A8).Tag = LTrim$(Str$(gv162E(m0032(m0030 + l02A8)).M5766))
            If  gv162E(m0032(m0030 + l02A8)).M5766 = m0028 Then
                m0066 = l02A8 - 1
                sub336F l02A8
                m0066 = l02A8 + 1
                sub336F l02A8
            End If
        End If
    Next l02A8
    vsbComps.Tag = LTrim$(Str$(vsbComps.Value))
    Exit Sub

L8AA56:
    sub04FC "Error '" + Error + "' occurred in FRMCITYC:vsbComps!"
    Resume L8AABC
L8AABC:
End Sub
