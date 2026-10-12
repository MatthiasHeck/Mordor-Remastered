' FRMCHAR3.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Dim m001E As Integer ' 61
Dim m0020 As Integer ' 61
Dim m0022 As Single ' 63
Dim m0026 As Single ' 63
Dim m002C As Integer ' 61
Dim m002E As Integer ' 61
Dim m0030 As Integer ' 61
Dim m0032 As Integer ' 61
Dim m0034 As Integer ' 61
Dim m0038() As T5B69 ' 7A
Const mc006A = 5 ' &H5%
Dim m006C As Integer ' 61
Dim m006E As Integer ' 61
Dim m0070 As Integer ' 61
Const mc0072 = 1 ' &H1%
Const mc0074 = 2 ' &H2%
Const m00A4 = 0 ' &H0%
Const mc00F2 = 1 ' &H1%
Const mc00FA = 2 ' &H2%
Const mc0116 = 2 ' &H2%
Const mc0118 = 3 ' &H3%
Const mc011A = 1 ' &H1%
Const m0120 = 0 ' &H0%
Const mc0122 = 40 ' &H28%
Const mc0124 = 1 ' &H1%
Const mc0126 = 1 ' &H1%
Const mc0128 = 2 ' &H2%
Const mc012E = 32 ' &H20%
Const mc0130 = 4 ' &H4%
Const mc0132 = 6 ' &H6%
Const mc0134 = 1 ' &H1%
Const m014A = 0 ' &H0%
Const mc0156 = 9 ' &H9%
Const mc0158 = 2 ' &H2%
Const mc0166 = 27 ' &H1B%
Const mc0198 = 4 ' &H4%
Const mc01A4 = 1 ' &H1%
Const mc01DE = 9 ' &H9%
Const mc0206 = 10 ' &HA%
Const mc028A = 274 ' &H112%
Const mc028C =-4064 ' &HF020%
Const mc02A2 = 8 ' &H8%
Const mc02E6 = 60 ' &H3C%
Const mc02E8 = 32 ' ? &H 0020 00CC
Const mc0302 = 13 ' &HD%

Sub cmbClass_Click ()
Dim l0076 ' 80
Dim l0078 As Integer ' 81
Dim l007C As Single ' 83
Dim l007E As Integer ' 81
Dim l0080 As Integer ' 81
Dim l0082 ' 80
Dim l0086 As Integer ' 81
Dim l0088 As Integer ' 81
Dim l008A As Integer ' 81
' Const m00A4 = 0 ' &H0%
    On Error GoTo L5EFDC
    If  cmbClass.ListIndex = -1 Then
        Exit Sub
    End If
    l0078 = cmbClass.ItemData(cmbClass.ListIndex)
    ReDim m0038(0)       As T5B69
    m0038(0).M56C4 = -1
    txtSpell.Enabled = True
    cmdCast.Enabled = True
    vsbSpells.Enabled = True
    m002E = -1
    For l0076 = 0 To mc006A - 1
        lblName(l0076).ForeColor = QBColor(m00A4)
        lblGuild(l0076).ForeColor = QBColor(m00A4)
        lblPoints(l0076).ForeColor = QBColor(m00A4)
        lblLevel(l0076).ForeColor = QBColor(m00A4)
    Next l0076
    For l0076 = 0 To gv1BF8 - 1
        If  gv152A(l0076).M5709 = l0078 Then
            l0080 = 0
            l007C = 0
            l0088 = 0
            l0086 = False
            For l0082 = 0 To gv1BEA - 1
                If  gv14C2(gv1A86).M5584(l0082).M4E82 > False Then
                    If  gv152A(l0076).M4E82 <= gv145A(l0082).M55F6(l0078, 1) Then
                        If  l007C = 0 Then
                            l007C = gv145A(l0082).M55F6(gv152A(l0076).M5709, 0)
                        End If
                        If  gv145A(l0082).M55F6(gv152A(l0076).M5709, 0) <= l007C Then
                            l007C = gv145A(l0082).M55F6(gv152A(l0076).M5709, 0)
                            If  (gv152A(l0076).M4E82 * l007C) <= ((gv14C2(gv1A86).M5584(l0082).M4E82 / 2) + .5#) Then
                                If  ((gv14C2(gv1A86).M5584(l0082).M4E82 / 2) + .5#) > l0088 Then
                                    l008A = l0082
                                    l0088 = ((gv14C2(gv1A86).M5584(l0082).M4E82 / 2) + .5#)
                                End If
                                If  l0086 = False Then
                                    l0086 = True
                                    If  m0038(0).M56C4 > -1 Then
                                        ReDim Preserve m0038(UBound(m0038) + 1)             As T5B69
                                    End If
                                End If
                                m0038(UBound(m0038)).M56C4 = l0076
                                m0038(UBound(m0038)).M5493 = l008A
                                m0038(UBound(m0038)).M4E82 = Int(gv152A(l0076).M4E82 * l007C)
                                m0038(UBound(m0038)).M556D = 0
                                If  fn10E5(gv1A86, l0076, False, True) Then m0038(UBound(m0038)).M5B7A = True
                                If  l007C = 0 Then
                                    l007C = 1
                                End If
                                If  fn142F(gv1A86, l0076) <= l0080 Or l0080 = 0 Then
                                    l0080 = fn142F(gv1A86, l0076)
                                    m0038(UBound(m0038)).M556D = l0080
                                End If
                            End If
                        End If
                        If  l0086 = False Then l007C = 0
                    End If
                End If
            Next l0082
        End If
    Next l0076
    vsbSpells.Min = 0
    l007E = UBound(m0038) - (mc006A - 1)
    If  l007E < 0 Then
        l007E = 0
    End If
    vsbSpells.Max = l007E
    If  vsbSpells.Max > False Then
        vsbSpells.Visible = True
    Else
        vsbSpells.Visible = False
    End If
    m002E = -1
    m0030 = -1
    vsbSpells.Value = 0
    vsbSpells_Change
    Exit Sub

L5EFDC:
    sub04FC "Error '" + Error + "' occurred in FRMCHAR3:cmbClass_Click."
    Resume L5F048
L5F048:
End Sub

Sub cmdCast_Click ()
Dim l00E0 As Integer ' 81
Dim l00E2 As String ' 87
Dim l00E4 As Integer ' 81
' Const mc00F2 = 1 ' &H1%
Static m00F4 As Integer ' 61
Static m00F8 As Integer ' 61
' Const mc00FA = 2 ' &H2%
Dim l010E As Variant ' 86
    If  gv14C2(gv1A86).M5470 = 0 Then
        sub085B "Cannot cast spells while in the city!"
        Exit Sub
    End If
    If  txtSpell.Text = "" Or gv14C2(gv1A86).M5483 <> False Then
        Exit Sub
    End If
    l00E2 = txtSpell.Text
    l00E0 = fn16B8(l00E2)
    If  l00E0 = -1 Then
        sub0775
        Exit Sub
    End If
    txtSpell.Text = gv152A(l00E0).M548B
    If  fn0EEF() > False And (gv1E38(0).M4ECC = mc00F2 Or (gv1E38(0).M4ECC = m00F4 And (fn1448(l00E0) = m00F8 Or fn1448(l00E0) = mc00FA))) Then
        If  gv1E7C(gv1A86) > 0 Then
            frmDungeonMain!lblCharacterHit.Caption = ""
            gv1E7C(gv1A86) = 0
            sub0FE1
        End If
        gv1E66(gv1A86).M56C4 = l00E0
        l010E = fn10E5(gv1A86, gv1E66(gv1A86).M56C4, False, False)
        sub0BCD
        sub0775
        Exit Sub
    End If
    l00E4 = fn1173(gv1A86, l00E0, 0, -1)
    sub0775
End Sub

Sub cmdCommand_Click (Index%)
' Const mc0116 = 2 ' &H2%
' Const mc0118 = 3 ' &H3%
' Const mc011A = 1 ' &H1%
' Const m0120 = 0 ' &H0%
' Const mc0122 = 40 ' &H28%
' Const mc0124 = 1 ' &H1%
' Const mc0126 = 1 ' &H1%
' Const mc0128 = 2 ' &H2%
' Const mc012E = 32 ' &H20%
' Const mc0130 = 4 ' &H4%
' Const mc0132 = 6 ' &H6%
' Const mc0134 = 1 ' &H1%
    If  gv14C2(gv1A86).M56B9(mc0116) = False Then
        Select Case Index
            Case mc0118
                If  m001A > -1 Then
                    If  gv14C2(gv1A86).M5857(m001A).M4ED4 > False Then
                        sub150A mc011A, gv14C2(gv1A86).M5857(m001A).M4ED4, gv14C2(gv1A86).M5857(m001A).M4EBF, gv14C2(gv1A86).M5857(m001A).M4EEE, 0, 0
                        frmCharStat1!picTabPicture.SetFocus
                    End If
                End If
            Case m0120
                sub0F74 gv1A86, m001A
                If  m001A < mc0122 - 1 Then
                   lblItem_Click m001A + 1
                End If
                If  frmCharStat1!tabStatTab.P?C01E = mc0124 Then
                    frmCharStat1!picTabPicture.Refresh
                End If
                sub08B9 False
            Case mc0126
                If  gv14C2(gv1A86).M5470 > 0 Then
                    sub1577 gv1A86, m001A
                Else
                    sub085B "Must be in Dungeon to Use items."
                End If
            Case mc0128
                If  m001A > 0 And m001A < mc0122 Then
                    If  gv14C2(gv1A86).M5857(m001A).M4ED4 > 0 Then
                        If  fn1121(gv14C2(gv1A86).M5857(m001A).M4ED4) = False Then
                            sub085B "Cannot drop Guild-Issued Items!"
                            Exit Sub
                        End If
                        If  MsgBox("Drop the " + fn12EF(gv14C2(gv1A86).M5857(m001A).M4ED4, gv14C2(gv1A86).M5857(m001A).M4EEE, gv14C2(gv1A86).M5857(m001A).M4EBF, gv14C2(gv1A86).M5857(m001A).M56DB) + "?", mc012E + mc0130, "DROP ITEM") = mc0132 Then
                            If  gv14C2(gv1A86).M5857(m001A).M572A <> False And gv14C2(gv1A86).M5857(m001A).M577E = mc0134 Then
                                Beep
                                sub085B "You can't drop item " + lblItem(m001A).Caption + "!  It's cursed!"
                                Exit Sub
                            End If
                            sub0EDA gv1A86, (m001A)
                            If  m001A < mc0122 - 1 Then
                                lblItem_Click m001A + 1
                            End If
                        End If
                    End If
                End If
            Case Else
        End Select
    End If
End Sub

Sub cmdCommand_DragDrop (Index%, Source As Control, X As Single, Y As Single)
    cmdCommand_Click Index
End Sub

Sub cmdCompanion_Click (Index%)
Dim l0148 As String ' 87
' Const m014A = 0 ' &H0%
        If  gv14C2(gv1A86).M58CB(Index).M4EAC = 0 Then
            sub085B "You must drop a dead companion you're carrying - not kick them out!"
            Exit Sub
        End If
        If  gv14C2(m014A).M5470 = 0 Then
            sub085B "You cannot kick out companions in the city!"
            Exit Sub
        End If
        l0148 = "Kick out " + fn1235(gv1A86, Index) + "?"
        If  gv14C2(gv1A86).M58CB(Index).M57E1 > 0 Then
            l0148 = l0148 + Chr(13) + Chr(13) + "WARNING: Since the companion is bound, you will risk them turning on you!"
        End If
        If  MsgBox(l0148, mc012E & mc0130, "Kick Out Companion") = mc0132 Then
            If  fn0B6C(gv1A86, Index, False) = False Then
                gv14C2(gv1A86).M58CB(Index).M4ED4 = -1
                If  gv14C2(gv1A86).M5943 = Index Then
                    gv14C2(gv1A86).M5943 = -1
                End If
                sub0B82 gv1A86
            End If
        End If
    sub0775
End Sub

Sub cmdInfo_Click ()
Dim l0150 As Integer ' 81
Dim l0152 As String ' 87
' Const mc0156 = 9 ' &H9%
' Const mc0158 = 2 ' &H2%
    If  txtSpell.Text = "" Then
        Exit Sub
    End If
    l0152 = txtSpell.Text
    l0150 = fn16B8(l0152)
    If  l0150 = -1 Then
        sub0775
        Exit Sub
    End If
    txtSpell.Text = gv152A(l0150).M548B
    sub150A mc0156, l0150, False, False, 0, 0
    If  frmCharStat1!picTabPicture.Visible Then
        frmCharStat1!picTabPicture.SetFocus
    End If
End Sub

Sub Form_Activate ()
    If  gv19C2(mc0158).M5E4F <> gv1A86 Then
        sub14E0 gv1A86
    End If
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
' Const mc0166 = 27 ' &H1B%
    On Error Resume Next
    If  TypeOf Me.ActiveControl Is ComboBox Then
        If  KeyCode = mc0166 Then gv1BFC.SetFocus
    ElseIf TypeOf Me.ActiveControl Is TextBox Then
        If  KeyCode = mc0166 Then gv1BFC.SetFocus
    ElseIf TypeOf Me.ActiveControl Is VScrollBar Then
        If  KeyCode = mc0166 Then gv1BFC.SetFocus
    ElseIf KeyCode = gv1CFE.M6541 And Shift = gv1CFE.M654C Or gv14C2(gv1A86).M5470 = 0 Then
        gv1CFE.M6541 = False
        gv1CFE.M654C = False
        If  fn14CB(KeyCode, Shift) Then
            KeyCode = False
            Shift = False
        End If
    Else
        sub0456 KeyCode, Shift
        KeyCode = False
        Shift = False
    End If
End Sub

Sub Form_Load ()
Dim l0176 ' 80
' Const mc0198 = 4 ' &H4%
    m006E = True
    m0022 = -1
    m0026 = -1
    m001C = False
    m001A = -1
    m001E = -1
    m0020 = -1
    m002C = False
    m002E = False
    m0030 = False
    m0032 = False
    m0034 = 1
    For l0176 = 1 To mc0122 - 1
        Load lblItemStatus(l0176)
        Load lblItem(l0176)
    Next l0176
    elaTabFrame(0).[$C018?] = 0
    elaItemFrame.P?C004 = 0
    elaItemFrame.P?C005 = 0
    elaItemFrame.P?C006 = elaTabFrame(0).Y1
    elaItemFrame.P?C007 = elaTabFrame(0).Y2
    elaTabFrame(0).[$C018?] = 7
    For l0176 = 1 To mc006A - 1
        Load lblName(l0176)
        Load lblLevel(l0176)
        Load lblPoints(l0176)
        Load lblGuild(l0176)
        lblGuild(l0176).ZOrder 0
        lblName(l0176).Top = lblName(l0176 - 1).Top + lblName(l0176 - 1).Height
        lblLevel(l0176).Top = lblLevel(l0176 - 1).Top + lblLevel(l0176 - 1).Height
        lblPoints(l0176).Top = lblPoints(l0176 - 1).Top + lblPoints(l0176 - 1).Height
        lblGuild(l0176).Top = lblGuild(l0176 - 1).Top + lblGuild(l0176 - 1).Height
    Next l0176
    l0176 = extfn0144(elaTabFrame(0).[$C025?], tabItemTab.P?C028)
    l0176 = extfn0144(elaTabFrame(1).[$C025?], tabItemTab.P?C028)
    l0176 = extfn0144(elaTabFrame(2).[$C025?], tabItemTab.P?C028)
    Me.Tag = "NEW"
    Me!vsbItems.Tag = "1"
    Me.Left = gv14C2(m014A).M5958(mc0158).M425F
    Me.Top = gv14C2(m014A).M5958(mc0158).M4258
    Me.Width = gv14C2(m014A).M5958(mc0158).M4216
    Me.Height = gv14C2(m014A).M5958(mc0158).M420C
    Me.Tag = ""
    sub2263
    picItems.Height = (lblItem(mc0122 - 1).Top + lblItem(mc0122 - 1).Height)
    vsbSpells.Tag = "1"
    sub1602
    m002E = -1
    m0030 = -1
    For l0176 = 1 To mc0198 - 1
        Load cmdCompanion(l0176)
    Next l0176
    For l0176 = mc0198 - 2 To 0 Step -1
        cmdCompanion(l0176).Left = cmdCompanion(l0176 + 1).Left - cmdCompanion(l0176).Width
        cmdCompanion(l0176).Visible = True
    Next l0176
    cmdCompanion(mc0198 - 1).Visible = True
    For l0176 = 0 To mc0198 - 1
        cmdCompanion(l0176).Caption = LTrim$(Str$(l0176 + 1))
    Next l0176
    gv19C2(mc0158).M4216 = gv19C2(mc0158).M5E20
    gv19C2(mc0158).M420C = gv19C2(mc0158).M5E2D
    gv19C2(mc0158).M5E47 = Me.hWnd
    sub0784 Me
    sub0524 Me
    Me.WindowState = gv14C2(m014A).M5958(mc0158).M5801
    m006E = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
Dim l01A0 As Single ' 83
Static m01A2 As Integer ' 61
' Const mc01A4 = 1 ' &H1%
    If  Me.WindowState = m01A2 And m0032 = mc01A4 Then
        m0032 = m01A2
    End If
    If  Me.WindowState <> mc01A4 Then
        If  Me.Width < gv19C2(mc0158).M5E20 / 2 Then
            Me.Width = gv19C2(mc0158).M5E20 / 2
        End If
        If  Me.Height < gv19C2(mc0158).M5E2D / 2 Then
            Me.Height = gv19C2(mc0158).M5E2D / 2
        End If
    End If
    If  Me.Tag = "" Then
        If  Me.WindowState = m01A2 Then
            l01A0 = Me.Width / gv19C2(mc0158).M5E20
            If  Me.Height <> gv19C2(mc0158).M5E2D * l01A0 Then
                Me.Tag = "RESIZE"
                Me.Height = gv19C2(mc0158).M5E2D * l01A0
                Me.Tag = ""
            End If
            sub07D4 Me, tabItemTab
            sub07C5 Me, gv19C2(mc0158)
        End If
    End If
    Select Case tabItemTab.P?C01E
        Case mc0074
            sub0B82 gv1A86
        Case Else
    End Select
    m0032 = Me.WindowState
    DoEvents
    vsbItems.Max = (mc0122 - Int(elaItemFrame.P?C007 / lblItem(0).Height))
    Me.Refresh
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc0158, Me, True
    Set frmCharStat3 = Nothing
End Sub

Sub lblCall_Change ()
    If  m006C = False Then
        m006C = True
        If  lblCall.Caption = "SPELL" Then
            If  tabItemTab.P?C01E <> mc0072 Then
                tabItemTab.P?C01E = mc0072
            End If
            txtSpell.SelStart = 0
            txtSpell.SelLength = Len(txtSpell.Text)
            txtSpell.SetFocus
        Else
            Select Case Val(lblCall.Caption)
                Case m0120 + 1
                    cmdCommand_Click (m0120)
                Case mc0126 + 1
                    cmdCommand_Click (mc0126)
                Case mc0128 + 1
                    cmdCommand_Click (mc0128)
                Case mc0118 + 1
                    cmdCommand_Click (mc0118)
            End Select
        End If
        lblCall.Caption = ""
        m006C = False
    End If
End Sub

Sub lblCompName_Click (Index%)
Dim l01BE As String ' 87
    If  fn0EEF() = False And gv14C2(gv1A82).M58CB(Index).M4ED4 > -1 Then
        l01BE = fn16A0("Name " + fn1235(gv1A86, Index), "New Name?", "", "COMPNAME")
        If  l01BE <> "-1" Then
            gv14C2(gv1A86).M58CB(Index).M548B = l01BE
            sub0B82 gv1A86
        End If
    End If
End Sub

Sub lblGuild_Click (Index%)
    lblName_MouseDown Index, False, False, False, False
End Sub

Sub lblGuild_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblGuild_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button <> False Then
        lblName(Index).Drag
    End If
End Sub

Sub lblGuild_MouseUp (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName(Index).Drag 2
End Sub

Sub lblItem_Click (Index%)
' Const mc01DE = 9 ' &H9%
    m001A = Index
    If  m0020 > -1 Then
        lblItem(m0020).ForeColor = QBColor(m00A4)
    End If
    m0020 = Index
    lblItem(Index).ForeColor = QBColor(mc01DE)
End Sub

Sub lblItem_DblClick (Index%)
    lblItem_Click Index
    cmdCommand_Click mc0126
End Sub

Sub lblItem_DragDrop (Index%, Source As Control, X As Single, Y As Single)
Dim l01EC As Integer ' 81
Dim l01F0 As T576E ' 8A
Dim l01F2 ' 80
Dim l01F8 As T576E ' 8A
Static m01FA As Integer ' 61
Dim l01FE As Variant ' 86
' Const mc0206 = 10 ' &HA%
    If  Left(Source.Tag, 4) = "BANK" Then
        If  Index Then
            l01EC = Val(Right(Source.Tag, Len(Source.Tag) - 4))
            If  gv14C2(gv1A86).M5857(Index).M4ED4 > False Then
                If  gv14C2(gv1A86).M5857(Index).M577E Then
                    sub085B "Cannot put equipped items in the bank!"
                    Exit Sub
                End If
                l01F0 = gv14C2(gv1A86).M5857(Index)
                gv14C2(gv1A86).M5857(Index) = gv14C2(gv1A86).M5860(l01EC)
                gv14C2(gv1A86).M5860(l01EC) = l01F0
            Else
                gv14C2(gv1A86).M5857(Index) = gv14C2(gv1A86).M5860(l01EC)
                gv14C2(gv1A86).M5860(l01EC) = l01F0
            End If
            If  gv14C2(gv1A86).M5857(Index).M4EEE <> m01FA Then
                If  fn129A(gv1A86, gv14C2(gv1A86).M5857(Index).M4ED4) < gv14C2(gv1A86).M5857(Index).M4EEE Then
                    gv14C2(gv1A86).M5857(Index).M4EEE = fn129A(gv1A86, gv14C2(gv1A86).M5857(Index).M4ED4)
                    l01FE = fn12EF(gv14C2(gv1A86).M5857(Index).M4ED4, gv14C2(gv1A86).M5857(Index).M4EEE, gv14C2(gv1A86).M5857(Index).M4EBF, gv14C2(gv1A86).M5857(Index).M56DB)
                    sub085B "You have re-identified the retrieved item as: " + l01FE
                    sub0730 gv1A86, gv14C2(gv1A86).M5857(Index).M4ED4, gv14C2(gv1A86).M5857(Index).M4EEE, -1, False
                End If
            End If
            sub0F61 gv1A86, m014A, Index
            frmCityBank!lblCall = "UPDATE"
            For l01F2 = 0 To mc0206 - 1
                If  gv14C2(gv1A86).M59B0(l01F2) = Index Then
                    gv14C2(gv1A86).M59B0(l01F2) = -1
                End If
                sub0F4C l01F2
            Next l01F2
        End If
    ElseIf Source.Tag = "ITEM" And Index <> Source.Index Then
        If  Source.Index <> 0 And Index <> 0 Then
            l01F8 = gv14C2(gv1A86).M5857(Source.Index)
            gv14C2(gv1A86).M5857(Source.Index) = gv14C2(gv1A86).M5857(Index)
            gv14C2(gv1A86).M5857(Index) = l01F8
            sub0F61 gv1A84, m014A, Source.Index
            sub0F61 gv1A84, m014A, Index
            m001A = Index
            lblItem_Click Index
            For l01F2 = False To mc0206 - 1
                If  gv14C2(gv1A86).M59B0(l01F2) = Source.Index Then
                    gv14C2(gv1A86).M59B0(l01F2) = Index
                ElseIf gv14C2(gv1A86).M59B0(l01F2) = Index Then
                    gv14C2(gv1A86).M59B0(l01F2) = Source.Index
                End If
            Next l01F2
            For l01F2 = 0 To mc0206 - 1
                sub0F4C l01F2
            Next l01F2
        End If
    End If
    If  fn03BD(frmCityStore) Then frmCityStore!lblCall = "UPDATE"
End Sub

Sub lblItem_DragOver (Index%, Source As Control, X As Single, Y As Single, State As Integer)
End Sub

Sub lblItem_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  X = m0022 And Y = m0026 Then Exit Sub
    If  Button > False Then
        lblItem_Click Index
        lblItem(Index).Drag
    End If
    m0022 = X
    m0026 = Y
End Sub

Sub lblLevel_Click (Index%)
    lblName_MouseDown Index, False, False, False, False
End Sub

Sub lblLevel_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblLevel_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button <> False Then
        lblName(Index).Drag
    End If
End Sub

Sub lblLevel_MouseUp (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName(Index).Drag 2
End Sub

Sub lblName_DblClick (Index%)
    txtSpell.Text = lblName(Index).Caption
    cmdCast_Click
End Sub

Sub lblName_MouseDown (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    m002E = Index
    If  m0030 > -1 And m0030 <= (mc006A - 1) Then
        lblName(m0030).ForeColor = QBColor(m00A4)
        lblLevel(m0030).ForeColor = QBColor(m00A4)
        lblPoints(m0030).ForeColor = QBColor(m00A4)
        lblGuild(m0030).ForeColor = QBColor(m00A4)
    End If
    m0030 = Index
    lblName(Index).ForeColor = QBColor(mc01DE)
    lblLevel(Index).ForeColor = QBColor(mc01DE)
    lblPoints(Index).ForeColor = QBColor(mc01DE)
    lblGuild(Index).ForeColor = QBColor(mc01DE)
    txtSpell.Text = lblName(Index).Caption
End Sub

Sub lblName_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button <> False Then
        lblName(Index).Drag 1
    End If
End Sub

Sub lblName_MouseUp (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName(Index).Drag 2
End Sub

Sub lblPoints_Click (Index%)
    lblName_MouseDown Index, False, False, False, False
End Sub

Sub lblPoints_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblPoints_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button <> False Then
        lblName(Index).Drag
    End If
End Sub

Sub lblPoints_MouseUp (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName(Index).Drag 2
End Sub

Sub sub2263 ()
Dim l0276 ' 80
    For l0276 = 0 To mc0122 - 1
        lblItemStatus(l0276).Caption = ""
        If  l0276 > 0 Then
            lblItemStatus(l0276).Top = (lblItemStatus(l0276 - 1).Top + lblItemStatus(l0276 - 1).Height)
            lblItemStatus(l0276).Visible = True
            lblItem(l0276).Top = lblItemStatus(l0276).Top
            lblItem(l0276).Visible = True
        End If
        sub0F61 gv1A84, m014A, (l0276)
    Next l0276
End Sub

Sub sub2424 ()
Dim l0278 ' 80
Dim l027A As Integer ' 81
    For l0278 = 0 To mc006A - 1
        l027A = l0278 + vsbSpells.Value
        If  m0038(0).M56C4 = -1 And l0278 = 0 Then
            lblName(l0278) = "No Spells Yet"
            lblGuild(l0278).Visible = False
            lblPoints(l0278).Visible = False
            lblLevel(l0278).Visible = False
        Else
            If  l027A <= UBound(m0038) Then
                lblName(l0278).Caption = gv152A(m0038(l027A).M56C4).M548B
                lblGuild(l0278).Caption = Left(gv145A(m0038(l027A).M5493).M548B, 3)
                If  m0038(l027A).M556D > 999 Then
                    lblPoints(l0278).Caption = "***"
                Else
                    lblPoints(l0278).Caption = CStr(m0038(l027A).M556D)
                End If
                If  fn10E5(gv1A86, m0038(l027A).M56C4, False, True) = True Then
                    lblName(l0278).FontBold = True
                    lblGuild(l0278).FontBold = True
                    lblPoints(l0278).FontBold = True
                    lblLevel(l0278).FontBold = True
                Else
                    lblName(l0278).FontBold = False
                    lblGuild(l0278).FontBold = False
                    lblPoints(l0278).FontBold = False
                    lblLevel(l0278).FontBold = False
                End If
                lblLevel(l0278).Caption = CStr(m0038(l027A).M4E82)
                lblName(l0278).Visible = True
                lblGuild(l0278).Visible = True
                lblPoints(l0278).Visible = True
                lblLevel(l0278).Visible = True
            Else
                lblName(l0278).Visible = False
                lblGuild(l0278).Visible = False
                lblPoints(l0278).Visible = False
                lblLevel(l0278).Visible = False
            End If
        End If
    Next l0278
    If  m0038(0).M56C4 = -1 Then
        elaSpells.P?C00F = False
    Else
        elaSpells.P?C00F = True
    End If
End Sub

Sub msgBlast_event0000 (p0282 As Integer ' 41, p0284 As Integer ' 41)
' Const mc028A = 274 ' &H112%
' Const mc028C =-4064 ' &HF020%
    If  m006E = False Then
        Select Case p0282
            Case mc028A
                If  p0284 = mc028C Then
                    sub15BE -1, mc0158, Me, False
                End If
            Case Else
        End Select
    End If
End Sub

Sub picCompanion_DblClick (Index%)
Dim l0292 As T4E8B ' 8A
' Const mc02A2 = 8 ' &H8%
    If  gv14C2(gv1A82).M58CB(Index).M4ED4 > -1 Then
        l0292.M4ED4 = gv14C2(gv1A82).M58CB(Index).M4ED4
        l0292.M4F01 = l0292.M4ED4
        gv1EBC = gv14C2(gv1A82).M58CB(Index)
        gv1EBC.M57D4 = Index
        If  fn121C(gv1A82, gv14F6(gv1EBC.M4ED4).M5A7C, gv14F6(gv1EBC.M4ED4).M5693, True) < gv1EBC.M4EEE Then
            gv1EBC.M4EEE = fn121C(gv1A82, gv14F6(gv1EBC.M4ED4).M5A7C, gv14F6(gv1EBC.M4ED4).M5693, True)
            gv14C2(gv1A82).M58CB(Index).M4EEE = gv1EBC.M4EEE
        End If
        l0292.M4EEE = gv1EBC.M4EEE
        sub06FE l0292, False, True, False, gv1A86
        sub150A mc02A2, 0, 0, 0, 0, 0
        frmCharStat1!picTabPicture.SetFocus
    End If
End Sub

Sub picCompanion_DragDrop (Index%, Source As Control, X As Single, Y As Single)
Dim l02B0 As T57BF ' 8A
    If  Source.Tag = "COMP" Then
        If  Index <> Source.Index Then
            If  gv14C2(gv1A86).M58CB(Index).M4EAC = 0 Then
                sub085B "No use re-arranging a dead companion!"
                Exit Sub
            End If
            If  gv14C2(gv1A86).M58CB(Source.Index).M4EAC = 0 Then
                sub085B "No use re-arranging a dead companion!"
                Exit Sub
            End If
            l02B0 = gv14C2(gv1A86).M58CB(Index)
            gv14C2(gv1A86).M58CB(Index) = gv14C2(gv1A86).M58CB(Source.Index)
            gv14C2(gv1A86).M58CB(Source.Index) = l02B0
            sub0B82 gv1A86
        End If
    End If
End Sub

Sub picCompanion_MouseDown (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim l02BC As Integer ' 81
Static m02BE As Integer ' 61
    If  Button = 2 And gv14C2(m014A).M5470 > 0 And gv14C2(gv1A86).M58CB(Index).M4EAC > 0 Then
        If  gv14C2(gv1A86).M4EBF = m02BE And gv14C2(gv1A86).M58CB(Index).M4EBF = m02BE Then
            sub085B "It is against your ways to attack a Good companion."
        Else
            l02BC = fn0B6C(gv1A86, Index, True)
        End If
    End If
End Sub

Sub picCompanion_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button Then
        picCompanion(Index).Drag 1
    End If
End Sub

Sub picCompanion_Paint (Index%)
Dim l02D2 As Integer ' 81
Dim l02D4 As Integer ' 81
Dim l02D6 As Integer ' 81
Dim l02D8 As Integer ' 81
Dim l02DA As Integer ' 81
' Const mc02E6 = 60 ' &H3C%
' Const mc02E8 = 32 ' ? &H 0020 00CC
    l02D4 = picCompanion(Index).Width / Screen.TwipsPerPixelX
    l02D6 = picCompanion(Index).Height / Screen.TwipsPerPixelY
    If  gv14C2(gv1A82).M58CB(Index).M4ED4 > -1 Then
        l02D8 = ((gv14F6(gv14C2(gv1A82).M58CB(Index).M4ED4).M5A1B - 1) Mod 10)
        l02DA = Int((gv14F6(gv14C2(gv1A82).M58CB(Index).M4ED4).M5A1B - 1) / 10)
        If  gv14C2(gv1A82).M58CB(Index).M4ED4 > -1 Then
            If  gv1A66.M5F04 = False Then
                l02D2 = extfn01C4(picCompanion(Index).hDC, 0, 0, l02D4, l02D6, gv2BB8, (l02D8 * mc02E6), l02DA * mc02E6, mc02E6, mc02E6, mc02E8)
            Else
                l02D2 = extfn182D(picCompanion(Index).hDC, (l02D4 / 2) - (mc02E6 / 2), (l02D6 / 2) - (mc02E6 / 2), mc02E6, mc02E6, gv2BB8, (l02D8 * mc02E6), l02DA * mc02E6, mc02E8)
            End If
        End If
    End If
End Sub

Sub tabItemTab_event0000 ()
    If  gv19C2(mc0158).M5E4F <> gv1A86 Then
        sub14E0 gv1A86
    End If
End Sub

Sub tabItemTab_event000D (p02F0 As Integer ' 41, p02F2 As Integer ' 41)
    If  gv19C2(mc0158).M5E4F <> gv1A86 Then
        sub14E0 gv1A86
    End If
    elaTabFrame(p02F0).Left = False
    elaTabFrame(p02F2).Left = True
    DoEvents
    Select Case p02F2
        Case mc0074
            sub0B82 gv1A86
        Case m0070
        Case Else
    End Select
End Sub

Sub txtSpell_DragDrop (Source As Control, X As Single, Y As Single)
    If  Source.Tag = "SPELL" Then
        txtSpell.Text = Source
    End If
End Sub

Sub txtSpell_KeyDown (KeyCode As Integer, Shift As Integer)
' Const mc0302 = 13 ' &HD%
    If  KeyCode = mc0302 Then
        KeyCode = 0
        cmdCast_Click
    End If
    If  KeyCode = mc0166 Then
        KeyCode = 0
        sub0775
    End If
End Sub

Sub txtSpell_KeyPress (KeyAscii As Integer)
    If  KeyAscii = mc0302 Then
        KeyAscii = 0
    End If
    If  KeyAscii = mc0166 Then
        KeyAscii = 0
    End If
End Sub

Sub vsbItems_Change ()
    If  vsbItems.Value > Val(vsbItems.Tag) Then
        picItems.Top = picItems.Top - ((lblItem(0).Height - (Screen.TwipsPerPixelY * .25#)) * Abs(vsbItems.Value - Val(vsbItems.Tag)))
    Else
        picItems.Top = picItems.Top + ((lblItem(0).Height - (Screen.TwipsPerPixelY * .25#)) * Abs(Val(vsbItems.Tag) - vsbItems.Value))
    End If
    vsbItems.Tag = LTrim$(Str$(vsbItems.Value))
End Sub

Sub vsbSpells_Change ()
    If  vsbSpells.Value > Val(vsbSpells.Tag) Then
        If  m0030 >= 0 And m0030 <= (mc006A - 1) Then
            lblName(m0030).ForeColor = QBColor(m00A4)
            lblLevel(m0030).ForeColor = QBColor(m00A4)
            lblPoints(m0030).ForeColor = QBColor(m00A4)
            lblGuild(m0030).ForeColor = QBColor(m00A4)
        End If
        If  (m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)) >= 0 And (m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)) <= (mc006A - 1) Then
            lblName(m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
            lblLevel(m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
            lblPoints(m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
            lblGuild(m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
        End If
        m0030 = m0030 - Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)
    Else
        If  m0030 >= 0 And m0030 <= (mc006A - 1) Then
            lblName(m0030).ForeColor = QBColor(m00A4)
            lblLevel(m0030).ForeColor = QBColor(m00A4)
            lblPoints(m0030).ForeColor = QBColor(m00A4)
            lblGuild(m0030).ForeColor = QBColor(m00A4)
        End If
        If  (m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)) >= 0 And (m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)) <= (mc006A - 1) Then
            lblName(m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
            lblLevel(m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
            lblPoints(m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
            lblGuild(m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)).ForeColor = QBColor(mc01DE)
        End If
        m0030 = m0030 + Abs(CInt(vsbSpells.Tag) - vsbSpells.Value)
    End If
    vsbSpells.Tag = LTrim$(Str$(vsbSpells.Value))
    sub2424
End Sub
