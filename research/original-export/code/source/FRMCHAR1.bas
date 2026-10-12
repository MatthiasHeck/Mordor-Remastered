' FRMCHAR1.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Dim m001E As Integer ' 61
Dim m0020 As Integer ' 61
Dim m0022 As Integer ' 61
Dim m0026 As Integer ' 61
Dim m0028 As Integer ' 61
Const mc002A = 1 ' &H1%
Const mc002C = 2 ' &H2%
Dim m002E As Integer ' 61
Const mc0064 = 10 ' &HA%
Const mc0082 = 1 ' &H1%
Const mc0096 = 7 ' &H7%
Const mc00C2 = 40 ' &H28%
Const mc00D2 = 274 ' &H112%
Const mc00D4 =-4064 ' &HF020%
Const mc00E4 = 6 ' &H6%
Const mc00E6 = 1 ' &H1%
Const mc00E8 = 3 ' &H3%
Const mc00EA = 2 ' &H2%
Const mc00EC = 6 ' &H6%
Const mc00EE = 3 ' &H3%
Const mc00F0 = 7 ' &H7%
Const mc00F2 = 4 ' &H4%
Const mc00F4 = 4 ' &H4%

Sub Form_Activate ()
    If  gv19C2(m002E).M5E4F <> gv1A86 Then
        sub14E0 gv1A86
    End If
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
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
Dim l004C As Integer ' 81
Static m0054 As Integer ' 61
' Const mc0064 = 10 ' &HA%
    Me.Tag = "NEW"
    picTabPicture.Tag = "6|0|0|0|0|0"
    m0020 = True
    gv19C2(m002E).M4216 = gv19C2(m002E).M5E20
    gv19C2(m002E).M420C = gv19C2(m002E).M5E2D
    gv19C2(m002E).M5E47 = Me.hWnd
    Me.Left = gv14C2(m0054).M5958(m002E).M425F
    Me.Top = gv14C2(m0054).M5958(m002E).M4258
    Me.Width = gv14C2(m0054).M5958(m002E).M4216
    Me.Height = gv14C2(m0054).M5958(m002E).M420C
    l004C = extfn0144(elaTabFrame(0).[$C025?], tabStatTab.P?C028)
    l004C = extfn0144(elaTabFrame(1).[$C025?], tabStatTab.P?C028)
    l004C = extfn0144(picTabPicture.hWnd, tabStatTab.P?C028)
    For l004C = 1 To mc0064 - 1
        Load lblBuffer(l004C)
        Load lblBufferStat(l004C)
    Next l004C
    For l004C = 0 To mc0064 - 1
        lblBuffer(l004C).Caption = ""
        lblBufferStat(l004C).Caption = ""
        If  l004C > 0 Then
            lblBuffer(l004C).Top = lblBuffer(l004C - 1).Top + lblBuffer(l004C - 1).Height
            lblBuffer(l004C).Visible = True
            lblBufferStat(l004C).Top = lblBuffer(l004C).Top
            lblBufferStat(l004C).ZOrder False
            lblBufferStat(l004C).Visible = True
        End If
        sub0F4C l004C
    Next l004C
    sub0784 Me
    sub0524 Me
    sub08A9 False, 1
    sub08A9 False, 50
    Me.WindowState = gv14C2(m0054).M5958(m002E).M5801
    m0020 = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
Dim l0072 As Integer ' 81
Dim l0074 As Integer ' 81
Dim l0076 As Single ' 83
Dim l0078 As Single ' 83
Static m0080 As Integer ' 61
' Const mc0082 = 1 ' &H1%
' Const mc0096 = 7 ' &H7%
    l0074 = (lblStat(l0072).Height / 2)
    If  Me.WindowState = m0080 And m001C = mc0082 Then
        m001C = m0080
    End If
    If  Me.Tag = "RESIZE" Then
        Exit Sub
    End If
    If  Me.WindowState <> mc0082 Then
        If  Me.Width < gv19C2(m002E).M5E20 / 2 Then
            Me.Width = gv19C2(m002E).M5E20 / 2
        End If
        If  Me.Height < gv19C2(m002E).M5E2D / 2 Then
            Me.Height = gv19C2(m002E).M5E2D / 2
        End If
    End If
    l0076 = Me.Width / gv19C2(m002E).M5E20
    l0078 = Me.Height / gv19C2(m002E).M5E2D
    If  Me.Tag = "NEW" Then
        Me.Tag = ""
        For l0072 = 1 To 12
            If  l0072 <> 6 Then
                Load lblStat(l0072)
            End If
            Load lblStatInfo(l0072)
            Select Case l0072
                Case 1
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height + l0074
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStatInfo(l0072).Caption = "Spells"
                Case 2
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStatInfo(l0072).Caption = "Spell Level"
                Case 3
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height + l0074
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStatInfo(l0072).Caption = "Hits"
                Case 4
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStatInfo(l0072).Caption = "Att/Def"
                Case 5
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStatInfo(l0072).Caption = "Experience"
                Case 6
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height
                    lblStat(l0072).Left = lblStat(l0072 - 1).Left
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStatInfo(l0072).Caption = "Gold"
                Case 7
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height + (l0074 * 2)
                    elaBorder.P?C005 = lblStat(l0072).Top - (lblStat(l0072).Height / 1.2#)
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStat(l0072).Width = 400
                    lblStat(l0072).Left = lblStatInfo(l0072).Left + lblStatInfo(l0072).Width + 1
                    lblStatInfo(l0072).Caption = gv05EE$(0)
                Case Is > 7
                    lblStat(l0072).Width = 400
                    lblStat(l0072).Top = lblStat(l0072 - 1).Top + lblStat(l0072 - 1).Height
                    lblStatInfo(l0072).Top = lblStat(l0072).Top
                    lblStat(l0072).Left = lblStat(l0072 - 1).Left
                    lblStatInfo(l0072).Caption = gv05EE$(l0072 - 7)
            End Select
            lblStatInfo(l0072).Visible = True
            lblStat(l0072).Visible = True
        Next l0072
        For l0072 = 0 To mc0096
            If  l0072 > 0 Then
                Load lblSpecial(l0072)
                lblSpecial(l0072).Top = (lblSpecial(l0072 - 1).Top + lblSpecial(l0072 - 1).Height)
                lblSpecial(l0072).Visible = False
            Else
                lblSpecial(l0072).Top = lblStat(7).Top
            End If
            lblSpecial(l0072).Caption = gv07E2$(l0072)
        Next l0072
    Else
        If  Me.WindowState = m0080 Then
            If  Me.Height <> gv19C2(m002E).M5E2D * l0076 Then
                Me.Tag = "RESIZE"
                Me.Height = gv19C2(m002E).M5E2D * l0076
                Me.Tag = ""
            End If
            sub07D4 Me, tabStatTab
            sub07C5 Me, gv19C2(m002E)
        End If
    End If
    sub08A9 False, 12
    m001C = Me.WindowState
    Me.Refresh
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, m002E, Me, True
    m001E = False
    m001C = False
End Sub

Sub lblBuffer_Click (Index%)
Dim l00A8 As Integer ' 81
    If  gv14C2(gv1A86).M5470 > 0 Then
        Select Case Index
            Case 0 To 8
                l00A8 = 49 + Index
            Case Else
                l00A8 = 48
        End Select
        sub0456 l00A8, 1
    End If
End Sub

Sub lblBuffer_DragDrop (Index%, Source As Control, X As Single, Y As Single)
Dim l00B6 ' 80
' Const mc00C2 = 40 ' &H28%
    Select Case Source.Tag
        Case "ITEM"
            gv14C2(gv1A86).M59B0(Index) = Source.Index
        Case "SPELL"
            For l00B6 = 0 To gv1BF8 - 1
                If  gv152A(l00B6).M548B = Source.Caption Then
                    gv14C2(gv1A86).M59B0(Index) = mc00C2 + l00B6
                End If
            Next l00B6
    End Select
    sub0F4C Index
End Sub

Sub lblCall_Change ()
    If  m001A = False Then
        m001A = True
        Select Case UCase(lblCall.Caption)
            Case "UPDATE"
                picTabPicture.Refresh
            Case Else
        End Select
        lblCall = ""
        m001A = False
    End If
End Sub

Sub msgBlast_event0000 (p00CA As Integer ' 41, p00CC As Integer ' 41)
' Const mc00D2 = 274 ' &H112%
' Const mc00D4 =-4064 ' &HF020%
    If  m0020 = False Then
        Select Case p00CA
            Case mc00D2
                If  p00CC = mc00D4 Then
                    sub15BE -1, m002E, Me, False
                End If
            Case Else
        End Select
    End If
End Sub

Sub picTabPicture_Paint ()
Dim l00D6() As Integer ' 91
Dim l00DC As Integer ' 81
Dim l00DE As Integer ' 81
Dim l00E0 As Integer ' 81
Dim l00E2 As String ' 87
' Const mc00E4 = 6 ' &H6%
' Const mc00E6 = 1 ' &H1%
' Const mc00E8 = 3 ' &H3%
' Const mc00EA = 2 ' &H2%
' Const mc00EC = 6 ' &H6%
' Const mc00EE = 3 ' &H3%
' Const mc00F0 = 7 ' &H7%
' Const mc00F2 = 4 ' &H4%
' Const mc00F4 = 4 ' &H4%
    ReDim l00D6(0)  As Integer
    On Error GoTo L5E504
    If  m0026 = True Then Exit Sub
    If  tabStatTab.P?C01E = mc00E4 Then
        l00E2 = lblCall.Tag
    Else
        l00E2 = picTabPicture.Tag
    End If
    If  m0022 = False Then
        If  Me.WindowState = False And InStr(l00E2, "|") <> False Then
            m0022 = True
            If  tabStatTab.P?C01E = mc00E4 Then
                l00E2 = lblCall.Tag
            Else
                l00E2 = picTabPicture.Tag
            End If
            l00E0 = 1
            Do
                l00DC = l00DC + 1
                If  Mid$(l00E2, l00DC, 1) = "|" Or l00DC = Len(l00E2) Then
                    l00DE = l00DE + 1
                    If  l00DC = Len(l00E2) Then
                        l00DC = l00DC + 1
                    End If
                    ReDim Preserve l00D6(l00DE - 1)     As Integer
                    l00D6(l00DE - 1) = Val(Mid$(l00E2, l00E0, l00DC - l00E0))
                    l00E0 = l00DC + 1
                End If
                If  l00DC >= Len(l00E2) Then
                    Exit Do
                End If
            Loop
            sub151C l00D6(0), l00D6(1), l00D6(2), l00D6(3), l00D6(4), l00D6(5)
        End If
    End If
    m0022 = False
    Exit Sub

L5E504:
    sub04FC "Error '" + Error + "' has occurred in FRMCHAR1:picTabPicture_Paint (" + l00E2 + ")."
    m0022 = False
    Resume L5E59A
L5E59A:
End Sub

Sub tabStatTab_event0000 ()
    If  m0026 = False Then
        If  gv19C2(m002E).M5E4F <> gv1A86 Then
            sub14E0 gv1A86
        End If
        Select Case tabStatTab.P?C01E
            Case mc00E6
                sub150A mc00E8, 0, 0, 0, 0, 0
            Case mc00EA
                sub150A mc00EC, 0, 0, 0, 0, 0
            Case mc00EE
                sub150A mc00F0, 0, 0, 0, 0, 0
            Case mc00F2
                sub150A mc00F4, 0, 0, 0, 0, 0
            Case mc00E4
                lblCall = "UPDATE"
            Case Else
        End Select
    End If
End Sub

Sub tabStatTab_event000D (p00F6 As Integer ' 41, p00F8 As Integer ' 41)
Dim l00FC As Integer ' 81
Static m00FE As Integer ' 61
' Const mc0100 = 5 ' &H5%
    On Error GoTo L5E97E
    If  m0026 Then Exit Sub
    m0026 = True
    If  gv19C2(m002E).M5E4F <> gv1A86 Then
        sub14E0 gv1A86
    End If
    Select Case p00F8
        Case m00FE
            l00FC = m0028
        Case mc0100
            l00FC = mc002A
        Case mc00E6
            l00FC = mc002C
        Case mc00EA
            l00FC = mc002C
        Case mc00EE
            l00FC = mc002C
        Case mc00F2
            l00FC = mc002C
        Case mc00E4
            l00FC = mc002C
    End Select
    If  p00F8 <> p00F6 Then
        If  l00FC = mc002C And m001E <> mc002C Then
            elaTabFrame(m001E).Left = False
        Else
            picTabPicture.Visible = False
            If  l00FC = m0028 Then
                elaTabFrame(mc002A).Left = False
            Else
                elaTabFrame(m0028).Left = False
            End If
        End If
    End If
    picTabPicture.Cls
    If  l00FC = mc002C Then
        picTabPicture.Visible = True
    Else
        elaTabFrame(l00FC).Left = True
    End If
    picTabPicture.Refresh
    m001E = l00FC
    m0026 = False
    Exit Sub

L5E97E:
    sub04FC "Error '" + Error + "' occurred in FRMCHAR1:tabStatTab_TabChange"
    Resume L5E9EE
L5E9EE:
End Sub
