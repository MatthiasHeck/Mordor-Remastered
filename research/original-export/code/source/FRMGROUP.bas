' FRMGROUP.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Dim m001E As Integer ' 61
Dim m0020 As Single ' 63
Dim m0024 As Single ' 63
Dim m0028 As Integer ' 61
Dim m002A As Integer ' 61
Const mc002C = 1 ' &H1%
Const mc002E = 2 ' &H2%
Const mc003C = 1 ' &H1%
Const mc0050 = 17 ' &H11%
Const m0052 = 0 ' &H0%
Const mc0060 = 1 ' &H1%
Const mc0072 = 4 ' &H4%
Const mc00AC = 1 ' &H1%
Const mc0122 = 1 ' &H1%
Const m012C = 0 ' &H0%
Const mc0148 = 1 ' &H1%
Const mc014A = 2 ' &H2%
Const mc014C = 1 ' &H1%
Const mc014E = 4 ' &H4%
Const mc0150 = 1 ' &H1%
Const mc0152 = 2 ' &H2%
Const mc016A = 274 ' &H112%

Sub cmdCommand_Click (Index%)
' Const mc003C = 1 ' &H1%
    Select Case Index
        Case m002A
            If  gv1A82 <> gv1A86 Then sub14E0 gv1A86
        Case mc002C
            If  fn0EEF() = False Then
                frmPartyOptions.Show mc003C
            Else
                sub085B "Cannot set default options while in Combat!"
            End If
        Case mc002E
            sub1547 gv1A86
    End Select
End Sub

Sub Form_Deactivate ()
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
' Const mc0050 = 17 ' &H11%
    On Error Resume Next
    If  KeyCode = gv1CFE.M6541 And Shift = gv1CFE.M654C Or gv14C2(gv1A86).M5470 = 0 Then
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
' Const m0052 = 0 ' &H0%
    m0028 = True
    Me.Tag = "NEW"
    m0020 = -1
    m0024 = -1
    If  gv14C2(m0052).M5958(mc0050).M425F = 0 And gv14C2(m0052).M5958(mc0050).M4258 = 0 Then
        Me.Width = gv19C2(mc0050).M5E20
        Me.Height = gv19C2(mc0050).M5E2D
        sub02FE Me
    Else
        Me.Left = gv14C2(m0052).M5958(mc0050).M425F
        Me.Top = gv14C2(m0052).M5958(mc0050).M4258
        Me.Width = gv14C2(m0052).M5958(mc0050).M4216
        Me.Height = gv14C2(m0052).M5958(mc0050).M420C
    End If
    gv19C2(mc0050).M4216 = gv19C2(mc0050).M5E20
    gv19C2(mc0050).M420C = gv19C2(mc0050).M5E2D
    gv19C2(mc0050).M5E47 = Me.hWnd
    sub0784 Me
    sub0524 Me
    m001C = 1
    sub2F40
    sub178B False
    sub2F5A
    Me.Tag = ""
    Me.WindowState = gv14C2(m0052).M5958(mc0050).M5801
    m0028 = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
Dim l005C As Single ' 83
Static m005E As Integer ' 61
' Const mc0060 = 1 ' &H1%
' Const mc0072 = 4 ' &H4%
    If  Me.WindowState = m005E And m001E = mc0060 Then
        m001E = m005E
    End If
    If  Me.WindowState <> 1 Then
        If  Me.Width < gv19C2(mc0050).M5E20 / 2 Then
            Me.Width = gv19C2(mc0050).M5E20 / 2
        End If
        If  Me.Height < gv19C2(mc0050).M5E2D / 2 Then
            Me.Height = gv19C2(mc0050).M5E2D / 2
        End If
        If  Me.Tag = "" Then
            l005C = Me.Width / gv19C2(mc0050).M5E20
            If  Me.Height <> gv19C2(mc0050).M5E2D * l005C Then
                Me.Tag = "RESIZE"
                Me.Height = gv19C2(mc0050).M5E2D * l005C
                Me.Tag = ""
            End If
            sub07B3 Me, elaElastic(0)
            sub07C5 Me, gv19C2(mc0050)
        End If
    End If
    m001E = Me.WindowState
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc0050, Me, True
    gv19C2(mc0050).M5E47 = False
    gv1A86 = m0052
    gv1A84 = m0052
    gv1A82 = m0052
    m001E = False
    sub14E0 m0052
    sub096E
End Sub

Sub lblCall_Change ()
    If  m001A = False Then
        m001A = True
        Select Case UCase(lblCall.Caption)
            Case "UPDATE"
                sub2F40
            Case "STATS"
                sub2F5A
            Case Else
                If  gv1A86 <> Val(lblCall.Caption) Then
                    If  Val(lblCall.Caption) >= m0052 And Val(lblCall.Caption) <= mc0072 Then sub178B Val(lblCall.Caption)
                End If
        End Select
        lblCall.Caption = ""
        m001A = False
    End If
End Sub

Sub lblHits_Click (Index%)
    lblName_Click Index
End Sub

Sub lblHits_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblHits_DragDrop (Index%, Source As Control, X As Single, Y As Single)
    lblName_DragDrop Index, Source, X, Y
End Sub

Sub lblHits_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName_MouseMove Index, Button, Shift, X, Y
End Sub

Sub lblName_Click (Index%)
    If  Index <> gv1A86 Then
        sub178B Index
    End If
End Sub

Sub lblName_DblClick (Index%)
    sub14E0 Index
End Sub

Sub lblName_DragDrop (Index%, Source As Control, X As Single, Y As Single)
Dim l009C As T5810 ' 8A
Dim l00A0 As T68BA ' 8A
Dim l00A2 As Integer ' 81
' Const mc00AC = 1 ' &H1%
    If  Left(Source.Tag, 4) = "BANK" Then
        l00A2 = Val(Right(Source.Tag, Len(Source.Tag) - 4))
        sub145F gv1A82, Index, -(l00A2 + 1), False
        Exit Sub
    End If
    If  Source.Tag = "ITEM" Or Source.Tag = "GOLD" Then
        If  fn0EEF() > False And gv1E38(0).M4ECC = mc00AC Then
            sub085B "You cannot give items or gold during combat!"
            Exit Sub
        End If
        If  gv1A82 = Index Then
            Exit Sub
        End If
        If  Source.Index > False Then
            If  Source.Tag = "ITEM" Then
                sub145F gv1A82, Index, CInt(Source.Index), False
                If  fn03BD(frmCityStore) Then frmCityStore!lblCall = "UPDATE"
            End If
            If  Source.Tag = "GOLD" Then
                sub145F gv1A82, Index, False, CLng(gv14C2(gv1A82).M4F2D)
            End If
        End If
        Exit Sub
    End If
    If  gv14C2(0).M5470 > False Then
        If  fn0EEF() > False And gv1E38(0).M4ECC = mc00AC Then
            sub085B "You cannot rearrange the party during combat!"
            Exit Sub
        End If
    End If
    lblName_Click Index
    If  Source.Tag = "CHAR" Then
        If  Index <> Source.Index Then
            l009C = gv14C2(Index)
            l00A0 = gv1E66(Index)
            gv14C2(Index) = gv14C2(Source.Index)
            gv1E66(Index) = gv1E66(Source.Index)
            gv14C2(Source.Index) = l009C
            gv1E66(Source.Index) = l00A0
            If  Index = gv1A82 Then
                gv1A82 = Source.Index
            ElseIf Source.Index = gv1A82 Then
                gv1A82 = Index
            End If
            gv1A84 = Index
            sub2F40
            sub08A9 False, 13
            If  gv14C2(m0052).M5470 = False Then
                sub14E0 gv1A84
            Else
                sub178B gv1A84
            End If
            If  Index = m0052 Or Source.Index = m0052 Then
                sub085B Chr$(34) + RTrim(gv14C2(m0052).M548B) + Chr$(34) + " is now party leader!"
            End If
        End If
    End If
    If  gv14C2(m0052).M5470 > False Then
        frmDungeonMain.Caption = "Dungeon (" + RTrim(gv14C2(gv1A86).M548B) + ")"
    End If
End Sub

Sub lblName_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  X = m0020 And Y = m0024 Then Exit Sub
    If  Button <> False Then
        lblName_Click Index
        lblName(Index).Drag
    End If
    m0020 = X
    m0024 = Y
End Sub

Sub lblOption_Click (Index%)
    lblName_Click Index
End Sub

Sub lblOption_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblOption_DragDrop (Index%, Source As Control, X As Single, Y As Single)
    lblName_DragDrop Index, Source, X, Y
End Sub

Sub lblOption_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName_MouseMove Index, Button, Shift, X, Y
End Sub

Sub lblSpells_Click (Index%)
    lblName_Click Index
End Sub

Sub lblSpells_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblSpells_DragDrop (Index%, Source As Control, X As Single, Y As Single)
    lblName_DragDrop Index, Source, X, Y
End Sub

Sub lblSpells_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName_MouseMove Index, Button, Shift, X, Y
End Sub

Sub lblStatus_Click (Index%)
    lblName_Click Index
End Sub

Sub lblStatus_DblClick (Index%)
    lblName_DblClick Index
End Sub

Sub lblStatus_DragDrop (Index%, Source As Control, X As Single, Y As Single)
    lblName_DragDrop Index, Source, X, Y
End Sub

Sub lblStatus_MouseMove (Index%, Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblName_MouseMove Index, Button, Shift, X, Y
End Sub

Sub sub2F40 ()
Dim l0118 As Integer ' 81
Dim l011A As Integer ' 81
Dim l011C As Integer ' 81
Dim l011E As Integer ' 81
Dim l0120 As Integer ' 81
' Const mc0122 = 1 ' &H1%
' Const m012C = 0 ' &H0%
    On Error GoTo L7F8A8
    If  UBound(gv14C2) = m0052 Then
        sub2F5A
        Exit Sub
    End If
    l011C = gv1A86
    l0120 = False
    Do While l0118 <= UBound(gv14C2)
        If  gv14C2(l0118).M548B <> "" Then
            If  gv14C2(l0118).M4EAC <= False And UBound(gv14C2) > m0052 Then
                l0120 = True
                gv14C2(l0118).M4EAC = False
                If  gv14C2(l0118).M5470 = gv14C2(m0052).M5470 Then
                    sub085B Chr$(34) + RTrim(gv14C2(l0118).M548B) + Chr$(34) + " has died!"
                End If
                If  gv14C2(l0118).M5483 = False Then
                    sub091E l0118, mc0122
                End If
                If  l0118 = gv1A82 Then
                    l011A = True
                End If
                If  l0118 < gv1A86 Then
                    gv1A86 = gv1A86 - 1
                End If
                sub0956
                sub04DC l0118
                If  gv1A86 > UBound(gv14C2) Then
                    gv1A86 = UBound(gv14C2)
                End If
                l0118 = l0118 - 1
                l011E = fn09A4(False, False)
            End If
        End If
        l0118 = l0118 + 1
    Loop
    If  gv1A86 > UBound(gv14C2) Then
        gv1A86 = UBound(gv14C2)
    End If
    If  l0120 Then
        sub0980
    End If
    l011E = fn09A4(False, False)
    If  l011A = True Then
        sub14E0 gv1A86
    End If
    sub08A9 False, 13
    If  UBound(gv14C2) > m001C - 1 Then
        For l0118 = m001C To UBound(gv14C2)
            m001C = m001C + 1
            Load lblName(l0118)
            Load lblHits(l0118)
            lblName(l0118).ForeColor = QBColor(m012C)
            lblHits(l0118).ForeColor = QBColor(m012C)
            lblHits(l0118).ZOrder False
            Load lblSpells(l0118)
            Load lblStatus(l0118)
            Load lblOption(l0118)
            lblName(l0118).Top = lblName(l0118 - 1).Top + lblName(l0118 - 1).Height
            lblHits(l0118).Top = lblHits(l0118 - 1).Top + lblHits(l0118 - 1).Height
            lblSpells(l0118).Top = lblSpells(l0118 - 1).Top + lblSpells(l0118 - 1).Height
            lblStatus(l0118).Top = lblStatus(l0118 - 1).Top + lblStatus(l0118 - 1).Height
            lblOption(l0118).Top = lblOption(l0118 - 1).Top + lblOption(l0118 - 1).Height
        Next l0118
    End If
    sub08A9 False, 13
    sub178B gv1A86
    If  gv1A86 > UBound(gv14C2) Then
        sub178B m0052
    Else
        If  l011C <> gv1A86 Then
            sub178B gv1A86
        End If
    End If
    If  gv14C2(m0052).M5470 > False Then
        sub096E
        l011E = fn09A4(False, False)
    End If
    sub2F5A
    Exit Sub

L7F8A8:
    sub04FC "Error '" + Error + "' occurred in FRMGROUP:modUpdateCharacterList."
    Resume L7F91C
L7F91C:
End Sub

Sub sub2F5A ()
Dim l0140 ' 80
Dim l0142 As String ' 87
Dim l0144 As Integer ' 81
Static m0146 As Integer ' 61
' Const mc0148 = 1 ' &H1%
' Const mc014A = 2 ' &H2%
' Const mc014C = 1 ' &H1%
' Const mc014E = 4 ' &H4%
' Const mc0150 = 1 ' &H1%
' Const mc0152 = 2 ' &H2%
    On Error GoTo L7FE2A
    For l0140 = m0052 To m001C - 1
        If  l0140 <= UBound(gv14C2) Then
            If  fn0EEF() = False Then
                gv1E66(l0140).M4E97 = False
                gv1E66(l0140).M56C4 = -1
                gv1E66(l0140).M5766 = -1
            End If
        End If
        If  l0140 > UBound(gv14C2) Then
            lblName(l0140).Visible = False
            lblHits(l0140).Visible = False
            lblSpells(l0140).Visible = False
            lblName(l0140).ForeColor = QBColor(m012C)
            lblHits(l0140).ForeColor = QBColor(m012C)
            lblStatus(l0140).Visible = False
            lblOption(l0140).Visible = False
        Else
            lblName(l0140).Caption = gv14C2(l0140).M548B
            lblHits(l0140).Caption = CStr(gv14C2(l0140).M4EAC) + "/" + CStr(gv14C2(l0140).M4EB4)
            lblSpells(l0140).Caption = CStr(gv14C2(l0140).M5830)
            l0142 = ""
            If  gv14C2(l0140).M56B9(m0146) <> False Then
                l0142 = l0142 + "Po"
            End If
            If  gv14C2(l0140).M56B9(mc0148) <> False Then
                l0142 = l0142 + "Di"
            End If
            If  gv14C2(l0140).M56B9(mc014A) <> False Then
                l0142 = l0142 + "Pa"
            End If
            If  l0142 = "" Then
                l0142 = "OK"
                lblStatus(l0140).ForeColor = QBColor(mc014C)
            Else
                lblStatus(l0140).ForeColor = QBColor(mc014E)
            End If
            lblStatus(l0140).Caption = l0142
            l0142 = "None"
            If  gv1E66(l0140).M4E97 = mc0150 Then
                l0142 = "Fight"
            ElseIf gv1E66(l0140).M4E97 = mc0152 Then
                l0142 = "Defend"
            ElseIf gv1E66(l0140).M56C4 > False Then
                If  gv1E66(l0140).M56C4 >= 1000 Then
                    l0142 = Chr$(34) + gv152A(gv1E66(l0140).M56C4 - 1000).M548B + Chr$(34)
                Else
                    l0142 = Chr$(34) + gv152A(gv1E66(l0140).M56C4).M548B + Chr$(34)
                End If
            ElseIf gv1E7C(l0140) > False Then
                l0142 = "Open"
            End If
            lblOption(l0140).Caption = l0142
            lblName(l0140).Visible = True
            lblHits(l0140).Visible = True
            lblSpells(l0140).Visible = True
            lblStatus(l0140).Visible = True
            lblOption(l0140).Visible = True
        End If
    Next l0140
    If  l0144 = True Then
    End If
    Exit Sub

L7FE2A:
    sub04FC "Error '" + Error + "' occurred in FRMGROUP:modUpdateStats."
    Resume L7FE96
L7FE96:
End Sub

Sub msgBlast_event0000 (p0162 As Integer ' 41, p0164 As Integer ' 41)
' Const mc016A = 274 ' &H112%
' Const mc016C =-4064 ' &HF020%
    If  m0028 = False Then
        Select Case p0162
            Case mc016A
                If  p0164 = mc016C Then
                    sub15BE -1, mc0050, Me, False
                End If
            Case Else
        End Select
    End If
End Sub
