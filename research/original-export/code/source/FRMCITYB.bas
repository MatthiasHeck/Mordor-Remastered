' FRMCITYB.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0020 = 3 ' &H3%
Const mc0022 = 4 ' &H4%
Dim m0024 As Integer ' 61
Dim m0026 As Integer ' 61
Dim m0028 As Integer ' 61
Const mc003E = 13 ' &HD%
Const mc0058 = 1 ' &H1%
Const mc0068 = 15 ' &HF%
Const m006A = 0 ' &H0%
Const mc00A2 = 40 ' &H28%
Const mc00A4 = 64 ' &H40%
Const mc00A6 = 10 ' &HA%
Const mc00D4 = 8 ' &H8%

Sub cmdCommand_Click (Index%)
Dim l002C ' 80
' Const mc003E = 13 ' &HD%
    Select Case Index
        Case m001A
            txtAmount(Index).Text = LTrim$(Str$(gv14C2(gv1A86).M4F2D))
        Case mc001C
            txtAmount(Index).Text = LTrim$(Str$(gv14C2(gv1A86).M58AF))
    End Select
    Select Case Index
        Case m001A, mc001C
            txtAmount_KeyPress Index, mc003E
        Case Else
            Select Case Index
                Case mc001E
                    For l002C = False To UBound(gv14C2)
                        gv14C2(gv1A86).M58AF = gv14C2(gv1A86).M58AF + gv14C2(l002C).M4F2D
                        gv14C2(l002C).M4F2D = False
                    Next l002C
                Case mc0020
                    For l002C = False To UBound(gv14C2)
                        gv14C2(l002C).M58AF = gv14C2(l002C).M58AF + gv14C2(l002C).M4F2D
                        gv14C2(l002C).M4F2D = False
                    Next l002C
                Case mc0022
                    For l002C = False To UBound(gv14C2)
                        If  l002C = gv1A84 Then
                            gv14C2(l002C).M58AF = gv14C2(l002C).M58AF + gv14C2(l002C).M4F2D
                            gv14C2(l002C).M4F2D = False
                        Else
                            gv14C2(gv1A86).M58AF = gv14C2(gv1A86).M58AF + gv14C2(l002C).M58AF
                            gv14C2(gv1A86).M58AF = gv14C2(gv1A86).M58AF + gv14C2(l002C).M4F2D
                            gv14C2(l002C).M58AF = False
                            gv14C2(l002C).M4F2D = False
                        End If
                    Next l002C
                Case Else
            End Select
            sub2884
            sub08A9 True, 10
            If  fn03BD(frmCityGuild) Then frmCityGuild!lblCall.Caption = "UPDATE"
        End Select
End Sub

Sub cmdExit_Click ()
    Unload frmCityBank
    sub0792 frmCityMain
    frmCityMain.SetFocus
End Sub

Sub cmdInfo_Click ()
Dim l0050 As Integer ' 81
' Const mc0058 = 1 ' &H1%
    l0050 = lstItems.ListIndex
    If  l0050 > -1 Then
        If  gv14C2(gv1A86).M5860(lstItems.ItemData(l0050)).M4ED4 > False Then
            sub150A mc0058, gv14C2(gv1A86).M5860(lstItems.ItemData(l0050)).M4ED4, gv14C2(gv1A86).M5860(lstItems.ItemData(l0050)).M4EBF, gv14C2(gv1A86).M5860(lstItems.ItemData(l0050)).M4EEE, 0, 0
            frmCharStat1!picTabPicture.SetFocus
        End If
    End If
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l0062 As Integer ' 81
' Const mc0068 = 15 ' &HF%
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
        l0062 = fn14CB(KeyCode, Shift)
    End If
End Sub

Sub Form_Load ()
' Const m006A = 0 ' &H0%
    sub2897
    Me.Tag = "NEW"
    If  gv14C2(m006A).M5958(mc0068).M425F = 0 And gv14C2(m006A).M5958(mc0068).M4258 = 0 Then
        sub02FE Me
    Else
        Me.Left = gv14C2(m006A).M5958(mc0068).M425F
        Me.Top = gv14C2(m006A).M5958(mc0068).M4258
    End If
    Me.Width = gv14C2(m006A).M5958(mc0068).M4216
    Me.Height = gv14C2(m006A).M5958(mc0068).M420C
    Me.Tag = ""
    gv19C2(mc0068).M4216 = gv19C2(mc0068).M5E20
    gv19C2(mc0068).M420C = gv19C2(mc0068).M5E2D
    gv19C2(mc0068).M5E47 = Me.hWnd
    If  UBound(gv14C2) = m006A Then
        cmdCommand(mc001E).Enabled = False
        cmdCommand(mc0020).Enabled = False
        cmdCommand(mc0022).Enabled = False
    Else
        cmdCommand(mc001E).Enabled = True
        cmdCommand(mc0020).Enabled = True
        cmdCommand(mc0022).Enabled = True
    End If
    cmdInfo.Enabled = False
    m0028 = -1
    sub28A7
    sub0784 Me
    sub0524 Me
End Sub

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub07B3 Me, elaElastic(0)
        sub07C5 Me, gv19C2(mc0068)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc0068, Me, True
    gv19C2(mc0068).M5E47 = False
    Set frmCityBank = Nothing
End Sub

Sub lblCall_Change ()
    If  m0026 = False Then
        m0026 = True
        Select Case UCase(lblCall.Caption)
            Case "GOLD"
                sub2884
            Case Else
                sub2897
                sub2884
                sub28A7
        End Select
        lblCall = ""
        m0026 = False
    End If
End Sub

Sub lstItems_Click ()
    If  lstItems.ListIndex > -1 Then
        cmdInfo.Enabled = True
    End If
End Sub

Sub lstItems_DragDrop (Source As Control, X As Single, Y As Single)
Dim l009C As T576E ' 8A
Dim l009E As Integer ' 81
Dim l00A0 ' 80
' Const mc00A2 = 40 ' &H28%
' Const mc00A4 = 64 ' &H40%
' Const mc00A6 = 10 ' &HA%
    If  Source.Tag = "ITEM" Then
        If  fn03BD(frmCityStore) Then frmCityStore!lblCall = "UPDATE"
        If  Source.Index Then
            If  gv14C2(gv1A86).M5857(Source.Index).M577E Then
                sub085B "Cannot put equipped items in the bank!"
                Exit Sub
            End If
            l009E = -1
            For l00A0 = False To mc00A2 - 1
                If  gv14C2(gv1A86).M5860(l00A0).M4ED4 <= False Then
                    l009E = l00A0
                    Exit For
                End If
            Next l00A0
            If  l009E = -1 Then
                MsgBox "There is no more room left for another item!", mc00A4, "Out of room!"
                Exit Sub
            End If
            gv14C2(gv1A86).M5860(l009E) = gv14C2(gv1A86).M5857(Source.Index)
            gv14C2(gv1A86).M5857(Source.Index) = l009C
            sub0F61 gv1A84, m006A, Source.Index
            sub28A7
            For l00A0 = 0 To mc00A6 - 1
                sub0F4C l00A0
            Next l00A0
        End If
    End If
End Sub

Sub lstItems_MouseMove (Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button And lstItems.ListCount > False Then
        If  lstItems.ListIndex = -1 Then
            lstItems.ListIndex = False
        End If
        m0028 = lstItems.ListIndex
        m0024 = True
        lstItems.Tag = "BANK" + CStr(lstItems.ItemData(lstItems.ListIndex))
        lstItems.Drag 1
    End If
End Sub

Sub lstItems_MouseUp (Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  m0024 Then
        lstItems.Drag 2
    End If
End Sub

Sub sub28A7 ()
Dim l00B8 ' 80
Dim l00BA As String ' 87
    lstItems.Clear
    For l00B8 = False To mc00A2 - 1
        If  gv14C2(gv1A86).M5860(l00B8).M4ED4 > False Then
            l00BA = fn12EF(gv14C2(gv1A86).M5860(l00B8).M4ED4, gv14C2(gv1A86).M5860(l00B8).M4EEE, gv14C2(gv1A86).M5860(l00B8).M4EBF, gv14C2(gv1A86).M5860(l00B8).M56DB)
            lstItems.AddItem l00BA
            lstItems.ItemData(lstItems.ListCount - 1) = l00B8
        End If
    Next l00B8
    If  lstItems.ListCount = False Then
        cmdInfo.Enabled = False
    End If
    If  lstItems.ListIndex = -1 And lstItems.ListCount > False Then
    End If
    If  m0028 > lstItems.ListCount - 1 Then
        m0028 = lstItems.ListCount - 1
    End If
    If  m0028 > -1 Then
        If  lstItems.ListCount > False Then
            If  m0028 > lstItems.ListCount - 1 Then
                m0028 = m0028 - 1
            End If
            lstItems.ListIndex = m0028
        End If
    End If
    sub2884
End Sub

Sub sub2897 ()
Dim l00BE ' 80
Dim l00C8 As Variant ' 86
    For l00BE = False To mc00A2 - 1
        If  gv14C2(gv1A86).M5860(l00BE).M4ED4 > 0 Then
            If  gv14C2(gv1A86).M5860(l00BE).M5467 <> gv1426(gv14C2(gv1A86).M5860(l00BE).M4ED4).M5467 Then
                sub085B "BANK ITEM SORTER: Remapping Item #" + LTrim$(Str$(l00BE))
                If  gv14C2(gv1A86).M5860(l00BE).M5467 = -1 Then
                    gv14C2(gv1A86).M5860(l00BE).M5467 = gv14C2(gv1A86).M5860(l00BE).M4ED4
                Else
                    For l00C8 = 0 To gv1BEC - 1
                        If  gv1426(l00C8).M5467 = gv14C2(gv1A86).M5860(l00BE).M5467 Then
                            gv14C2(gv1A86).M5860(l00BE).M4ED4 = l00C8
                            Exit For
                        End If
                    Next l00C8
                End If
            End If
        End If
    Next l00BE
End Sub

Sub sub2884 ()
Dim l00CE As String ' 87
Static m00D0 As Integer ' 61
' Const mc00D4 = 8 ' &H8%
    l00CE = "You have " + fn036D(CCur(gv14C2(gv1A86).M58AF), m00D0) + " gold and "
    l00CE = l00CE + CStr(mc00A2 - lstItems.ListCount) + " free Bank slots available."
    sub1043 mc00D4, gv1A84, gv14C2(gv1A86).M58AF
    If  UBound(gv14C2) = m006A Then
        cmdCommand(mc001E).Enabled = False
        cmdCommand(mc0020).Enabled = False
        cmdCommand(mc0022).Enabled = False
    Else
        cmdCommand(mc001E).Enabled = True
        cmdCommand(mc0020).Enabled = True
        cmdCommand(mc0022).Enabled = True
    End If
    lblStatus = l00CE
End Sub

Sub txtAmount_KeyDown (Index%, KeyCode As Integer, Shift As Integer)
    If  KeyCode = 13 Then
        KeyCode = 0
    End If
End Sub

Sub txtAmount_KeyPress (Index%, KeyAscii As Integer)
Dim l00E6 As Currency ' 85
    On Error Resume Next
    If  KeyAscii = 13 Then
        KeyAscii = 0
        l00E6 = CCur(txtAmount(Index).Text)
        If  l00E6 Then
            Select Case Index
                Case m001A
                    If  l00E6 > gv14C2(gv1A86).M4F2D Or l00E6 <= 0 Then
                        Beep
                    Else
                        gv14C2(gv1A86).M58AF = gv14C2(gv1A86).M58AF + l00E6
                        gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D - l00E6
                        sub08A9 False, 10
                    End If
                Case mc001C
                    If  l00E6 > gv14C2(gv1A86).M58AF Or gv14C2(gv1A86).M58AF < False Then
                        Beep
                    Else
                        gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + l00E6
                        gv14C2(gv1A86).M58AF = gv14C2(gv1A86).M58AF - l00E6
                        sub08A9 False, 10
                    End If
            End Select
            txtAmount(Index).Text = ""
        End If
        sub2884
    End If
End Sub
