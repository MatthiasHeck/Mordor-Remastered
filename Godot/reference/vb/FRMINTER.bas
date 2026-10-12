' FRMINTER.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Dim m001E As Integer ' 61
Const mc0026 = 13 ' &HD%
Const mc0028 = 27 ' &H1B%
Const mc0056 = 1 ' &H1%
Const mc0064 = 8 ' &H8%
Const m0068 = 0 ' &H0%
Const mc0072 = 4 ' &H4%

Sub cmbCharacter_KeyDown (KeyCode As Integer, Shift As Integer)
' Const mc0026 = 13 ' &HD%
' Const mc0028 = 27 ' &H1B%
    If  KeyCode = mc0026 Or KeyCode = mc0028 Then
        KeyCode = 0
    End If
End Sub

Sub cmbCharacter_KeyPress (KeyAscii As Integer)
    If  KeyAscii = mc0026 Then
        KeyAscii = 0
        cmdOK_Click
    End If
    If  KeyAscii = mc0028 Then
        KeyAscii = 0
        cmdCancel_Click
    End If
End Sub

Sub cmdCancel_Click ()
    Select Case Me.Tag
        Case "INQUERY"
            frmInteract.Tag = ""
        Case "PICKUP"
            frmInteract.Tag = "-1"
        Case Else
            frmInteract.Tag = "-1"
    End Select
    frmInteract.Hide
    m001E = True
End Sub

Sub cmdCompanion_Click (Index%)
    frmInteract.Tag = LTrim$(Str$(-10 - Index))
    frmInteract.Hide
    m001E = True
End Sub

Sub cmdOK_Click ()
Dim l0032 As Integer ' 81
Dim l0034 ' 80
Dim l0036 As String ' 87
Dim l0038 As Integer ' 81
Dim l003A As Integer ' 81
Dim l003C ' 80
' Const mc0056 = 1 ' &H1%
Dim l0058 As Variant ' 86
' Const mc0064 = 8 ' &H8%
' Const m0068 = 0 ' &H0%
    If  cmbCharacter.Visible = True Then
        l0032 = False
        l0036 = cmbCharacter.Text
        If  Len(l0036) = 0 Then Exit Sub
        For l0034 = False To cmbCharacter.ListCount
            If  UCase(cmbCharacter.Text) = UCase(cmbCharacter.List(l0034)) Then
                l0032 = 1
                l0038 = l0034
                l0036 = cmbCharacter.List(l0034)
                Exit For
            Else
                If  UCase(cmbCharacter.Text) = Left(UCase(cmbCharacter.List(l0034)), Len(cmbCharacter.Text)) Then
                    l0032 = l0032 + 1
                    l0038 = l0034
                    l0036 = cmbCharacter.List(l0034)
                End If
            End If
        Next l0034
        cmbCharacter.Text = l0036
        If  l0032 = False Then
            cmbCharacter.Text = "Not Found!"
            sub07E2 .5#
            cmbCharacter.Text = l0036
            Exit Sub
        End If
        If  l0032 = 1 Then
            frmInteract.Tag = LTrim$(Str$(cmbCharacter.ItemData(l0038)))
        Else
            If  l0032 > 1 Then
                cmbCharacter.Text = "ambiguous!"
                sub07E2 .5#
                cmbCharacter.Text = l0036
                Exit Sub
            End If
        End If
    End If
    If  cmbCharacter.ListCount > 0 Then
        For l003C = 0 To cmbCharacter.ListCount
            If  cmbCharacter.Text = cmbCharacter.List(l003C) Then
                cmbCharacter.ListIndex = l003C
                Exit For
            End If
        Next l003C
    End If
    If  cmbCharacter.Visible = True Then
        m001C = cmbCharacter.ListIndex
        frmInteract.Hide
        m001E = True
        Exit Sub
    End If
    If  txtQuestion.Text <> "" Then
        l0036 = txtQuestion.Text
        Select Case Me.Tag
            Case "PASSWORD", "COMPNAME", "INQUERY"
                frmInteract.Tag = l0036
            Case "GIVEGOLD"
                If  Val(l0036) < 1 Then
                    frmInteract.Tag = "0"
                Else
                    If  Val(l0036) > gv14C2(gv1A86).M4F2D Then
                        l003A = MsgBox("Not enough gold!", 48, "SORRY!")
                        txtQuestion.Text = ""
                        Exit Sub
                    Else
                        frmInteract.Tag = l0036
                    End If
                End If
            Case "GIVEITEM"
                If  l0036 = "" Or l0036 = "0" Then
                    frmInteract.Tag = "0"
                Else
                    l0032 = fn12C4(l0036)
                    If  l0032 < 1 Then
                        l003A = MsgBox("No Item to give!", 48, "SORRY!")
                        txtQuestion.Text = ""
                        Exit Sub
                    Else
                        If  gv14C2(gv1A86).M5857(l0032).M577E = mc0056 Then
                            l003A = MsgBox("Item is Equipped!", 48, "SORRY!")
                            txtQuestion.Text = ""
                            Exit Sub
                        Else
                            frmInteract.Tag = l0036
                        End If
                    End If
                End If
            Case "TELEPORT", "DISPLACEMENT", "SWAP"
                frmInteract.Tag = l0036
            Case "PICKUP", "SPELL", "SPELLHEAL", "SPELLRAISE", "LOCATE", "GIVE", "FETCH", "JOIN"
                For l0058 = 0 To UBound(gv1732)
                    If  UCase$(Left$(gv1732(l0058).M548B, Len(l0036))) = UCase$(l0036) Then
                        If  UCase$(gv1732(l0058).M548B) = UCase$(l0036) Then
                            l0034 = l0058
                            l0032 = 1
                            Exit For
                        End If
                        l0032 = l0032 + 1
                        l0034 = l0058
                    End If
                Next l0058
                If  l0032 = 0 Then
                    txtQuestion.Text = "Not Found!"
                    sub07E2 .5#
                    txtQuestion.Text = l0036
                    Exit Sub
                End If
                If  l0032 > 1 Then
                    txtQuestion.Text = "ambiguous!"
                    sub07E2 .5#
                    txtQuestion.Text = l0036
                    Exit Sub
                End If
                If  Me.Tag = "FETCH" Then
                    If  gv1732(l0034).M5470 <> gv14C2(gv1A86).M5470 Then
                        txtQuestion.Text = "Character is not on this level!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                    If  gv1732(l0034).M5483 <> mc0064 Then
                        txtQuestion.Text = "Character is not in ROCK!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                End If
                If  Me.Tag = "PICKUP" Or Me.Tag = "LOCATE" Or Me.Tag = "GIVE" Or Me.Tag = "JOIN" Then
                    If  gv1732(l0034).M548B = RTrim(gv14C2(gv1A86).M548B) Then
                        txtQuestion.Text = "Yourself?  HA!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                End If
                If  Me.Tag <> "LOCATE" Then
                    If  gv1732(l0034).M5470 <> gv14C2(gv1A86).M5470 Or gv1732(l0034).M547A <> gv14C2(gv1A86).M59BB Then
                        txtQuestion.Text = "Character is not here!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                End If
                If  Me.Tag = "JOIN" Then
                    If  gv1732(l0034).M5483 <> False Then
                        txtQuestion.Text = "Character is Dead!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                    For l003C = 0 To UBound(gv14C2) - 1
                        If  RTrim(gv14C2(l003C).M548B) = gv1732(l0034).M548B Then
                            txtQuestion.Text = "Character is already in Party!"
                            sub07E2 .5#
                            txtQuestion.Text = l0036
                            Exit Sub
                        End If
                    Next l003C
                End If
                If  Me.Tag = "PICKUP" Or Me.Tag = "SPELLRAISE" Then
                    If  gv1732(l0034).M5483 = False Then
                        txtQuestion.Text = "Character is not Dead!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                End If
                If  Me.Tag = "SPELLRAISE" Then
                    If  fn13C0(l0034) = -1 Then
                        txtQuestion.Text = "Character already tended to!"
                        sub07E2 .5#
                        txtQuestion.Text = l0036
                        Exit Sub
                    End If
                End If
                If  Me.Tag = "JOIN" And UBound(gv14C2) > m0068 Then
                    For l0058 = 0 To UBound(gv14C2)
                        If  gv1732(l0034).M548B = RTrim(gv14C2(l0058).M548B) Then
                            txtQuestion.Text = Chr$(34) + gv1732(l0034).M548B + Chr$(34) + " is already in the party!"
                            sub07E2 .5#
                            txtQuestion.Text = l0036
                            Exit Sub
                        End If
                    Next l0058
                End If
                l0036 = gv1732(l0034).M548B
                txtQuestion.Text = l0036
                frmInteract.Tag = LTrim$(Str$(l0034))
            Case "LOADCHAR"
                l0032 = False
                For l0058 = 0 To UBound(gv1732)
                    If  UCase$(Left$(gv1732(l0058).M548B, Len(l0036))) = UCase$(l0036) Then
                        If  UCase$(gv1732(l0058).M548B) = UCase$(l0036) Then
                            l0034 = l0058
                            l0032 = 1
                            Exit For
                        End If
                        l0032 = l0032 + 1
                        l0034 = l0058
                    End If
                Next l0058
                If  l0032 = 0 Then
                    txtQuestion.Text = "Not Found!"
                    sub07E2 .5#
                    txtQuestion.Text = l0036
                    Exit Sub
                End If
                If  l0032 > 1 Then
                    txtQuestion.Text = "ambiguous!"
                    sub07E2 .5#
                    txtQuestion.Text = l0036
                    Exit Sub
                End If
                l0036 = gv1732(l0034).M548B
                txtQuestion.Text = l0036
                frmInteract.Tag = LTrim$(Str$(l0034))
        End Select
    Else
        Select Case Me.Tag
            Case "GIVEGOLD", "GIVEITEM"
                frmInteract.Tag = "0"
            Case "PASSWORD", "INQUERY"
                frmInteract.Tag = ""
            Case Else
                frmInteract.Tag = "-1"
        End Select
    End If
    frmInteract.Hide
    m001E = True
End Sub

Sub cmdSelf_Click ()
    If  cmbCharacter.Visible = True Then
        cmbCharacter.ListIndex = gv1A86
    Else
        txtQuestion.Text = RTrim(gv14C2(gv1A86).M548B)
    End If
    cmdOK_Click
End Sub

Sub Form_Load ()
Dim l006C ' 80
Dim l006E As Variant ' 86
' Const mc0072 = 4 ' &H4%
    m001E = False
    l006E = False
    For l006C = 1 To mc0072 - 1
        Load cmdCompanion(l006C)
    Next l006C
    For l006C = mc0072 - 2 To 0 Step -1
        cmdCompanion(l006C).Left = cmdCompanion(l006C + 1).Left - cmdCompanion(l006C).Width
    Next l006C
    l006E = False
    sub02FE Me
    sub0784 Me
End Sub

Sub Form_Resize ()
Dim l007A ' 80
Dim l007C ' 80
Dim l007E As Integer ' 81
Dim l0082 As Integer ' 81
Dim l0086 As Variant ' 86
Dim l008A As Variant ' 86
    cmbCharacter.Clear
    Select Case Me.Tag
        Case "SPELL", "SPELLHEAL", "GIVE"
            For l007A = 0 To UBound(gv14C2)
                If  Me.Tag = "GIVE" And l007A = gv1A84 Then
                Else
                    cmbCharacter.AddItem RTrim(gv14C2(l007A).M548B)
                    cmbCharacter.ItemData(cmbCharacter.ListCount - 1) = l007A
                End If
            Next l007A
        Case "PICKUP", "SPELLRAISE", "LOCATE", "FETCH", "JOIN", "LOADCHAR"
            For l007A = 0 To UBound(gv1732)
                l007E = True
                Select Case Me.Tag
                    Case "FETCH"
                        l007E = False
                        If  gv1732(l007A).M5483 = mc0064 Then
                            If  gv1732(l007A).M5470 = gv14C2(m0068).M5470 Or (gv1732(l007A).M5470 >= l0086 And gv14C2(m0068).M5470 = l0086) Then
                                If  gv1732(l007A).M547A = False Then
                                    l007E = True
                                End If
                            End If
                        End If
                    Case "JOIN"
                        For l007C = 0 To UBound(gv14C2)
                            If  RTrim(gv14C2(l007C).M548B) = gv1732(l007A).M548B Then
                                l007E = False
                                Exit For
                            End If
                        Next l007C
                    Case "PICKUP", "SPELLRAISE"
                        If  gv1732(l007A).M5483 = False Then
                            l007E = False
                        Else
                            For l007C = False To UBound(gv14C2)
                                If  gv14C2(l007C).M5943 >= mc0072 Then
                                    If  l007A = gv14C2(l007C).M5943 - mc0072 Then
                                        l007E = False
                                    End If
                                End If
                            Next l007C
                        End If
                        If  Me.Tag = "SPELLRAISE" Then
                            If  fn13C0(l007A) = -1 Then
                                l007E = False
                            End If
                        End If
                End Select
                If  Me.Tag <> "LOCATE" And Me.Tag <> "LOADCHAR" And Me.Tag <> "FETCH" Then
                    If  gv1732(l007A).M5470 <> gv14C2(gv1A86).M5470 Or gv1732(l007A).M547A <> gv14C2(gv1A86).M59BB Then
                        l007E = False
                    End If
                End If
                If  gv1732(l007A).M548B = RTrim(gv14C2(gv1A86).M548B) Then
                    l007E = False
                End If
                If  l007E = True Then
                    cmbCharacter.AddItem gv1732(l007A).M548B
                    cmbCharacter.ItemData(cmbCharacter.ListCount - 1) = l007A
                End If
            Next l007A
        Case Else
    End Select
    If  cmbCharacter.ListCount > False Then
        cmbCharacter.ListIndex = False
        cmbCharacter.Visible = True
        txtQuestion.Visible = False
    End If
    If  Me.Tag = "SPELLRAISE" Or Me.Tag = "SPELLHEAL" Then
        For l008A = 0 To mc0072 - 1
            cmdCompanion(l008A).Caption = "&" + LTrim$(Str$(l008A + 1))
            If  gv14C2(gv1A86).M58CB(l008A).M4ED4 > -1 Then
                If  Me.Tag = "SPELLRAISE" Then
                    If  gv14C2(gv1A86).M58CB(l008A).M4EAC = False Then
                        cmdCompanion(l008A).Visible = True
                    End If
                Else
                    cmdCompanion(l008A).Visible = True
                End If
            Else
                cmdCompanion(l008A).Visible = False
            End If
        Next l008A
    End If
    If  Me.Tag = "COMP" Then
        l0082 = False
        For l008A = 0 To mc0072 - 1
            cmdCompanion(l008A).Caption = "&" + LTrim$(Str$(l008A + 1))
            If  gv14C2(gv1A86).M58CB(l008A).M4ED4 > -1 And gv14C2(gv1A86).M58CB(l008A).M4EAC > 0 And gv14C2(gv1A86).M58CB(l008A).M57E1 <> 0 Then
                l0082 = True
                cmdCompanion(l008A).Visible = True
            Else
                cmdCompanion(l008A).Visible = False
            End If
        Next l008A
        If  l0082 = False Then
            txtQuestion.Text = "No bound companions to select!"
            txtQuestion.Visible = True
            txtQuestion.Enabled = False
            cmdOK.Enabled = False
        Else
            txtQuestion.Visible = False
        End If
    End If
    l007E = False
    Select Case Me.Tag
        Case "PICKUP", "SPELLRAISE", "LOCATE", "FETCH", "JOIN", "LOADCHAR", "SPELL", "SPELLHEAL", "GIVE"
            If  cmbCharacter.ListCount = False Then
                l007E = True
                Select Case Me.Tag
                    Case "PICKUP", "JOIN"
                        cmbCharacter.Text = "No other characters in the area!"
                    Case "SPELLHEAL", "GIVE"
                        cmbCharacter.Text = "No characters in the party!"
                    Case "SPELLRAISE"
                        cmbCharacter.Text = "No characters to resurrect!"
                        For l007A = False To mc0072 - 1
                            If  cmdCompanion(l007A).Visible = True Then
                                l007E = False
                            End If
                        Next l007A
                    Case Else
                        cmbCharacter.Text = "No characters available for this selection!"
                End Select
                cmbCharacter.Visible = True
                cmbCharacter.Enabled = False
                cmdOK.Enabled = False
            End If
        Case Else
    End Select
    If  l007E = False Then
        Select Case Me.Tag
            Case "INQUERY"
                txtQuestion.MaxLength = 50
            Case "COMPNAME"
                txtQuestion.MaxLength = 15
            Case "PASSWORD"
                txtQuestion.PasswordChar = gc01CA
                txtQuestion.MaxLength = 10
            Case "GIVEGOLD"
                txtQuestion.MaxLength = 10
            Case "GIVEITEM"
                txtQuestion.MaxLength = 3
        End Select
        If  cmbCharacter.Visible = True Then
            If  cmbCharacter.Enabled = True Then
                If  m001C <= (cmbCharacter.ListCount - 1) And m001C >= m0068 Then
                    cmbCharacter.ListIndex = m001C
                Else
                    cmbCharacter.ListIndex = False
                End If
                cmbCharacter.SetFocus
            End If
        Else
            If  txtQuestion.Visible = True And txtQuestion.Enabled = True Then
                txtQuestion.SetFocus
            End If
        End If
    End If
    If  gv1B52 Then
        Do
            sub0695
            DoEvents
        Loop While m001E = False And gv1CC6 > 0 And Me.Visible = True
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
End Sub

Sub lblCall_Change ()
    If  m001A = False Then
        m001A = True
        Select Case UCase(lblCall.Caption)
            Case "UPDATE"
                Form_Resize
            Case Else
        End Select
        m001A = False
    End If
End Sub

Sub txtQuestion_KeyDown (KeyCode As Integer, Shift As Integer)
    If  KeyCode = mc0026 Or KeyCode = mc0028 Then
        KeyCode = 0
    End If
End Sub

Sub txtQuestion_KeyPress (KeyAscii As Integer)
    If  KeyAscii = mc0026 Then
        KeyAscii = 0
        cmdOK_Click
    End If
    If  KeyAscii = mc0028 Then
        KeyAscii = 0
        cmdCancel_Click
    End If
End Sub
