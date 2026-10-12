' FRMAUTOM.FRM
Option Explicit
Const mc001C = 15 ' &HF%
Dim m0022 As Integer ' 61
Dim m002A As Integer ' 61
Dim m002C As Integer ' 61
Dim m002E As Integer ' 61
Dim m0030 As Integer ' 61
Dim m0032 As Integer ' 61
Dim m0034 As Integer ' 61
Dim m0036 As Integer ' 61
Dim m0038 ' 60
Dim m003A As Integer ' 61
Dim m003C As Integer ' 61
Dim m0042 As Integer ' 61
Dim m0044 As Integer ' 61
Dim m0046 As Integer ' 61
Dim m0048 As Integer ' 61
Const m0076 = 0 ' &H0%
Const m0078 = 0 ' &H0%
Const mc007C = 48 ' &H30%
Const mc009E = 18 ' &H12%
Const mc00AE = 10 ' &HA%
Const mc00B0 = 1 ' &H1%
Const mc00BA = 2 ' &H2%
Const mc00C0 = 1 ' &H1%
Const mc00D4 = 32 ' ? &H 0020 00CC
Const mc00DA = 1 ' &H1%
Const mc00DC = 20 ' &H14%
Const m00E0 = 0 ' &H0%
Const mc00E4 = 1 ' &H1%
Const mc00E6 = 23 ' &H17%
Const mc00F8 = 22 ' &H16%
Const mc010A = 134 ' ? &H 0086 00EE
Const mc010E = 70 ' ? &H 0046 0066
Const mc011A = 11 ' &HB%
Const mc012A = 2 ' &H2%
Const mc013C = 30 ' &H1E%
Const mc013E = 30 ' &H1E%
Const mc0150 = 274 ' &H112%
Const mc0152 =-4064 ' &HF020%

Sub Form_Activate ()
    sub1EBA
End Sub

Sub Form_DblClick ()
    picMaze_DblClick
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
    On Error Resume Next
    If  TypeOf Me.ActiveControl Is HScrollBar Then
    Else
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
    End If
End Sub

Sub Form_Load ()
' Const m0076 = 0 ' &H0%
' Const m0078 = 0 ' &H0%
' Const mc007C = 48 ' &H30%
' Const mc009E = 18 ' &H12%
' Const mc00AE = 10 ' &HA%
' Const mc00B0 = 1 ' &H1%
' Const mc00BA = 2 ' &H2%
    On Error GoTo L7AD46
    m0048 = True
    If  m002C = False Then
        m002A = extfn17E6(picMaze.hDC)
        m002C = extfn18D5(picMaze.hDC, mc001C, mc001C)
        m002E = extfn18FF(m002A, m002C)
    End If
    m0032 = -1
    m0034 = -1
    Get #gv1B58, 2, m0038
    If  m0038 = 0 Then m0038 = 1
    hsbLevel.Max = m0038
    If  gv14C2(m0078).M59F4(m0076) = False And gv14C2(m0078).M5470 <> 0 Then
        m0036 = gv14C2(m0078).M5470
    Else
        m0036 = 1
    End If
    m003C = True
    hsbLevel.Value = m0036
    m003C = False
    Close #m003A
    hsbLevel.Left = 20
    If  fn0A0B(m0078) = False Then
        MsgBox "Error opening Maze File!", mc007C, "Error!"
        Unload Me
        Exit Sub
    End If
    lblLevel.Top = hsbLevel.Top
    lblLevel.Left = hsbLevel.Left + hsbLevel.Width + 5
    picMaze.Left = ((m0022 * 2) * Screen.TwipsPerPixelX)
    picMaze.Top = ((m0022 * 2) * Screen.TwipsPerPixelY)
    picMaze.Width = ((gv1864.M4216 * (mc001C - 1)) * Screen.TwipsPerPixelX) + (mc001C * 1)
    picMaze.Height = ((gv1864.M420C * (mc001C - 1)) * Screen.TwipsPerPixelY) + (mc001C * 1)
    picPicture.Width = picMaze.ScaleWidth + (((m0022)) * 2) + 2
    picPicture.Height = picMaze.ScaleHeight + (((m0022)) * 2) + 2
    picPicture.Left = 20
    picPicture.Top = lblLevel.Top + lblLevel.Height + 3
    lblInfo.Left = (picPicture.Left + picPicture.Width - lblInfo.Width)
    lblInfo.Top = hsbLevel.Top
    shpLocation.Width = (mc001C - 1) / 2
    shpLocation.Height = (mc001C - 1) / 2
    Me.Tag = "NEW"
    Me.Left = gv14C2(m0078).M5958(mc009E).M425F
    Me.Top = gv14C2(m0078).M5958(mc009E).M4258
    Me.Width = gv14C2(m0078).M5958(mc009E).M4216
    Me.Height = gv14C2(m0078).M5958(mc009E).M420C
    gv19C2(mc009E).M4216 = gv19C2(mc009E).M5E20
    gv19C2(mc009E).M420C = gv19C2(mc009E).M5E2D
    gv19C2(mc009E).M5E47 = Me.hWnd
    sub0784 Me
    sub0524 Me
    m003A = FreeFile
    Open gv19E8 + gc1C74 + gc1C20 For Random As #m003A Len = mc00AE
    Me.Tag = ""
    Me.Show
    sub2E18
    sub2E29
    sub1EBA
    sub050F
    picMaze.SetFocus
    m0048 = False
    Exit Sub

L7AD46:
    Resume Next
L7AD50:
    Unload Me
End Sub

Sub Form_Resize ()
    If  m0042 = False Then
        m0042 = True
        If  Me.WindowState = False Then
            gv1D64 = mc00B0
            lblCall.Caption = "UPDATE"
            If  (Me.Width / Screen.TwipsPerPixelX) < gv19C2(mc009E).M5E20 / 4 Then
                Me.Width = (gv19C2(mc009E).M5E20 * Screen.TwipsPerPixelX) / 4
            End If
            If  (Me.Height / Screen.TwipsPerPixelY) < gv19C2(mc009E).M5E2D / 4 Then
                Me.Height = (gv19C2(mc009E).M5E2D * Screen.TwipsPerPixelY) / 4
            End If
            sub2E18
            sub2E38
        Else
            gv1D64 = mc00BA
        End If
        m0042 = False
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
Dim l00BE As Integer ' 81
' Const mc00C0 = 1 ' &H1%
Static m00C6 As Integer ' 61
    If  Me.WindowState <> mc00C0 Then
        gv14C2(m0078).M5958(mc009E).M425F = Me.Left
        gv14C2(m0078).M5958(mc009E).M4258 = Me.Top
        gv14C2(m0078).M5958(mc009E).M4216 = Me.Width
        gv14C2(m0078).M5958(mc009E).M420C = Me.Height
    End If
    If  m002C Then
        l00BE = extfn18FF(m002A, m002E)
        l00BE = extfn18EF(m002C)
        l00BE = extfn1821(m002A)
    End If
    gv14C2(m0078).M5958(mc009E).M5801 = Me.WindowState
    gv19C2(mc009E).M5E47 = False
    gv1D64 = m00C6
    Close #m003A
    Set frmAutoMap = Nothing
End Sub

Sub hsbLevel_Change ()
    If  m003C = False And m0044 = False Then
        m0044 = True
        m0036 = hsbLevel.Value
        sub2E29
        m0044 = False
    End If
End Sub

Sub hsbLevel_Scroll ()
    lblLevel.Caption = "Level" + Str$(hsbLevel.Value) + " of" + Str(m0038)
End Sub

Sub lblCall_Change ()
Dim l00CC As Long ' 82
Dim l00CE As Integer ' 81
Dim l00D0 As Integer ' 81
Dim l00D2 As Integer ' 81
' Const mc00D4 = 32 ' ? &H 0020 00CC
' Const mc00DA = 1 ' &H1%
' Const mc00DC = 20 ' &H14%
' Const m00E0 = 0 ' &H0%
' Const mc00E4 = 1 ' &H1%
' Const mc00E6 = 23 ' &H17%
    On Error GoTo L7B7DE
    If  m003C = False Then
        m003C = True
        Select Case UCase(lblCall.Caption)
            Case "UPDATE"
                sub1EBA
                sub2E6E
            Case "CLEARSQ"
                l00D2 = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, m002A, 0, 0, mc00D4)
                picMaze.Refresh
                m0032 = -1: m0034 = -1
            Case "DRAW", "DRAWSQ"
                If  m0036 = gv14C2(m0078).M5470 And gv14C2(m0078).M59F4(mc00DA) = False Then
                    m0046 = True
                    picMaze.Line ((gv14C2(m0078).M583F - 1) * (mc001C - 1) + 4, (gv1864.M420C - (gv14C2(m0078).M5845)) * (mc001C - 1) + 4)-(((gv14C2(m0078).M583F - 1) * (mc001C - 1)) + mc001C - 5, ((gv1864.M420C - (gv14C2(m0078).M5845)) * (mc001C - 1)) + mc001C - 5), QBColor(0), BF
                    l00CC = fn2EB5(gv14C2(m0078).M583F, gv14C2(m0078).M5845)
                    If  gv14C2(m0078).M583F = gv1864.M4216 And fn0380(mc00DC, l00CC) = False Then
                        l00CC = fn0418(m00E0, l00CC, True)
                    End If
                    If  gv14C2(m0078).M5845 = gv1864.M420C And fn0380(mc00DC, l00CC) = False Then
                        l00CC = fn0418(mc00E4, l00CC, True)
                    End If
                    If  l00CC <> False Then
                        sub2E7F gv14C2(m0078).M583F, gv14C2(m0078).M5845, -1, l00CC
                    End If
                    If  gv14C2(m0078).M5845 > 1 Then
                        l00CC = fn2EB5(gv14C2(m0078).M583F, gv14C2(m0078).M5845 - 1)
                        If  l00CC <> False Then
                            sub2E7F gv14C2(m0078).M583F, gv14C2(m0078).M5845 - 1, -1, l00CC
                        End If
                    Else
                        sub2E7F gv14C2(m0078).M583F, gv14C2(m0078).M5845 - 1, -1, fn0418(mc00E4, False, True)
                    End If
                    If  gv14C2(m0078).M583F > 1 Then
                        l00CC = fn2EB5(gv14C2(m0078).M583F - 1, gv14C2(m0078).M5845)
                        If  l00CC <> False Then
                            sub2E7F gv14C2(m0078).M583F - 1, gv14C2(m0078).M5845, -1, l00CC
                        End If
                    Else
                        sub2E7F gv14C2(m0078).M583F - 1, gv14C2(m0078).M5845, -1, fn0418(m00E0, False, True)
                    End If
                    If  UCase(lblCall.Caption) = "DRAWSQ" Then
                        m0032 = -1: m0034 = -1
                    End If
                    sub2E6E
                    m0046 = False
                End If
            Case Else
                If  InStr(CStr(lblCall.Caption), ",") Then
                    l00CE = CInt(Left(CStr(lblCall.Caption), InStr(CStr(lblCall.Caption), ",")))
                    l00D0 = CInt(Right(CStr(lblCall.Caption), Len(CStr(lblCall.Caption)) - InStr(CStr(lblCall.Caption), ",")))
                    l00CC = fn2EB5(l00CE, l00D0)
                    If  l00CC <> False Then
                        If  fn0380(mc00E6, l00CC) Then
                            picMaze.Line ((l00CE - 1) * (mc001C - 1) + 4, (gv1864.M420C - (l00D0)) * (mc001C - 1) + 4)-(((l00CE - 1) * (mc001C - 1)) + mc001C - 5, ((gv1864.M420C - (l00D0)) * (mc001C - 1)) + mc001C - 5), QBColor(0), BF
                        End If
                        sub2E7F l00CE, l00D0, -1, l00CC
                    End If
                    sub2E6E
                End If
        End Select
        lblCall.Caption = ""
        m003C = False
    End If
    Exit Sub

L7B7DE:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:lblCall_Change"
    Resume L7B848
L7B848:
End Sub

Sub lblInfo_Change ()
    lblInfo.Refresh
End Sub

Sub lblLevel_Change ()
    lblLevel.Refresh
End Sub

Sub sub2E6E ()
Dim l00E8 As Integer ' 81
Static m00EA As Integer ' 61
' Const mc00F8 = 22 ' &H16%
    On Error GoTo L7BD1A
    If  m0032 <> -1 And m0034 <> -1 Then
        l00E8 = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, m002A, 0, 0, mc00D4)
    End If
    If  gv14C2(m0078).M5470 > False Then
        If  gv14C2(m0078).M59F4(mc00DA) = False And gv14C2(m0078).M59F4(m0076) = False Then
            shpLocation.Visible = False
            If  gv14C2(m0078).M5470 <> hsbLevel.Value Then
                If  gv14C2(m0078).M5914(m00EA) And m0044 = False Then
                    If  hsbLevel.Max < gv14C2(m0078).M5470 Then hsbLevel.Max = gv14C2(m0078).M5470
                    hsbLevel.Value = gv14C2(m0078).M5470
                    m0036 = hsbLevel.Value
                    sub2E29
                    If  m0032 <> -1 And m0034 <> -1 Then
                        l00E8 = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, m002A, 0, 0, mc00D4)
                    End If
                End If
            End If
            If  gv14C2(m0078).M5470 = m0036 Then
                If  Not gv1A66.M5F8E Then timBlinker.Enabled = True
                sub2E38
                m0032 = gv14C2(m0078).M583F
                m0034 = gv1864.M420C - (gv14C2(m0078).M5845 - 1)
                l00E8 = extfn182D(m002A, 0, 0, mc001C - 4, mc001C - 4, picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc00D4)
                l00E8 = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, gv2BC6, ((gv14C2(m0078).M5899 + mc00F8) * mc001C) + 2, 2, mc00D4)
                picMaze.Refresh
            Else
                timBlinker.Enabled = False
                m0032 = -1
                m0034 = -1
            End If
        Else
            timBlinker.Enabled = False
            m0032 = -1
            m0034 = -1
            picMaze.Refresh
            shpLocation.Visible = False
        End If
    Else
        m0032 = -1
        m0034 = -1
    End If
    Exit Sub

L7BD1A:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:medDrawCursor"
    Resume L7BD84
L7BD84:
End Sub

Sub sub2E7F (ByVal pv00FA As Integer ' 81, ByVal pv00FC As Integer ' 81, ByVal pv00FE As Integer ' 81, p0100 As Long ' 42)
Dim l0102 As Integer ' 81
Dim l0104 ' 80
Dim l0106 As Integer ' 81
Dim l0108 As Integer ' 81
' Const mc010A = 134 ' ? &H 0086 00EE
' Const mc010E = 70 ' ? &H 0046 0066
    On Error GoTo L7C19E
    l0102 = pv00FA + (gv1864.M420C * (pv00FC - 1))
    l0108 = pv00FC
    pv00FC = gv1864.M420C - (pv00FC - 1)
    For l0104 = 0 To 22
        If  fn0380(l0104, p0100) = True Then
            Select Case l0104
                Case 0, 2, 4
                    l0106 = extfn182D(frmAutoMap!picMaze.hDC, (((pv00FA - 1) * (mc001C - 1)) + 7), ((pv00FC - 1) * (mc001C - 1)), mc001C, mc001C, gv2BC6, l0104 * mc001C, 0, mc010A)
                Case 1, 3, 5
                    l0106 = extfn182D(frmAutoMap!picMaze.hDC, ((pv00FA - 1) * (mc001C - 1)), ((pv00FC - 1) * (mc001C - 1)) - 7, mc001C, mc001C, gv2BC6, l0104 * mc001C, 0, mc010A)
                Case Else
                    l0106 = extfn182D(frmAutoMap!picMaze.hDC, ((pv00FA - 1) * (mc001C - 1)), ((pv00FC - 1) * (mc001C - 1)), mc001C, mc001C, gv2BC6, l0104 * mc001C, 0, mc010A)
            End Select
        Else
            If  l0104 = pv00FE Then
                Select Case l0104
                    Case 0, 2, 4
                        l0106 = extfn182D(frmAutoMap!picMaze.hDC, (((pv00FA - 1) * (mc001C - 1)) + 7), ((pv00FC - 1) * (mc001C - 1)), mc001C, mc001C, gv2BC6, l0104 * mc001C, 0, mc010E)
                    Case 1, 3, 5
                        l0106 = extfn182D(frmAutoMap!picMaze.hDC, ((pv00FA - 1) * (mc001C - 1)), ((pv00FC - 1) * (mc001C - 1)) - 7, mc001C, mc001C, gv2BC6, l0104 * mc001C, 0, mc010E)
                    Case Else
                        l0106 = extfn182D(frmAutoMap!picMaze.hDC, ((pv00FA - 1) * (mc001C - 1)), ((pv00FC - 1) * (mc001C - 1)), mc001C, mc001C, gv2BC6, l0104 * mc001C, 0, mc010E)
                End Select
            End If
        End If
    Next l0104
    Exit Sub

L7C19E:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:medDrawSquare"
    Resume L7C208
L7C208:
End Sub

Sub sub2E29 ()
Dim l0112 ' 80
Dim l0114 ' 80
Dim l0116 As Long ' 82
' Const mc011A = 11 ' &HB%
Static m011E As Integer ' 61
    shpLocation.Visible = False
    picMaze.Cls
    On Error GoTo L7C5F6
    m0032 = -1
    m0034 = -1
    Me.Caption = "Automap (Level" + Str$(m0036) + ")"
    lblInfo.Caption = "Plotting Maze..."
    lblInfo.Refresh
    shpLocation.Visible = False
    shpLocation.Refresh
    Screen.MousePointer = mc011A
    If  fn09F6() = False Then
        MsgBox "AutoMap:Error opening AutoMap file!", mc007C, "Error!"
        Unload Me
        Exit Sub
    End If
    picMaze.Visible = False
    For l0112 = 1 To gv1864.M4216
        For l0114 = 1 To gv1864.M420C
            l0116 = fn2EB5(l0112, l0114)
            If  fn0380(mc00E6, l0116) <> False Then
                picMaze.Line ((l0112 - 1) * (mc001C - 1) - 1, (gv1864.M420C - (l0114)) * (mc001C - 1) - 1)-(((l0112 - 1) * (mc001C - 1)) + mc001C, ((gv1864.M420C - (l0114)) * (mc001C - 1)) + mc001C), QBColor(0), BF
            End If
        Next l0114
    Next l0112
    For l0112 = 1 To gv1864.M4216
        For l0114 = 1 To gv1864.M420C
            l0116 = fn2EB5(l0112, l0114)
            If  l0116 <> False Then
                sub2E7F l0112, l0114, -1, l0116
                If  l0112 = 1 Then
                    If  fn0380(mc00E6, l0116) Then
                        sub2E7F l0112 - 1, l0114, -1, fn0418(m00E0, False, True)
                    End If
                End If
                If  l0114 = 1 Then
                    If  fn0380(mc00E6, l0116) Then
                        sub2E7F l0112, l0114 - 1, -1, fn0418(mc00E4, False, True)
                    End If
                End If
            End If
        Next l0114
    Next l0112
    sub1EBA
    picMaze.Visible = True
    sub2E6E
    Screen.MousePointer = m011E
    Exit Sub

L7C5F6:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:medPlotMaze"
    Resume L7C65E
L7C65E:
End Sub

Sub sub2E38 ()
Dim l0120 As Integer ' 81
Dim l0122 As Integer ' 81
Dim l0128 As Integer ' 81
' Const mc012A = 2 ' &H2%
    On Error GoTo L7CB38
    If  (Me.Width / Screen.TwipsPerPixelX) < gv19C2(mc009E).M5E20 Then
        picPicture.Left = False
        picPicture.Width = Me.Width - 150
        If  gv14C2(m0078).M59F4(m0076) = False And gv14C2(m0078).M59F4(mc00DA) = False And gv14C2(m0078).M59F4(mc012A) = False Then
            l0120 = -((((gv14C2(m0078).M583F - 1) * (mc001C - 1)) + (mc001C / 4)) * Screen.TwipsPerPixelX)
        Else
            l0120 = -(((((gv1864.M4216 / 2) - 1) * (mc001C - 1)) + (mc001C / 4)) * Screen.TwipsPerPixelX)
        End If
        l0120 = l0120 + (picPicture.Width / 2)
        l0120 = l0120 + picPicture.Left
        picMaze.Left = l0120
        l0128 = True
    Else
        If  picPicture.Width <> picMaze.ScaleWidth + (((m0022)) * 2) + 2 Then picPicture.Width = picMaze.ScaleWidth + (((m0022)) * 2) + 2
        If  picPicture.Left <> 20 Then picPicture.Left = 20
        If  picMaze.Left <> False Then picMaze.Left = False
    End If
    If  (Me.Height / Screen.TwipsPerPixelY) < gv19C2(mc009E).M5E2D Then
        picPicture.Top = False
        picPicture.Height = Me.Height - 150
        If  gv14C2(m0078).M59F4(m0076) = False And gv14C2(m0078).M59F4(mc00DA) = False And gv14C2(m0078).M59F4(mc012A) = False Then
            l0122 = ((((gv1864.M420C - (gv14C2(m0078).M5845 - 1)) - 1) * (mc001C - 1)) + (mc001C / 4)) * Screen.TwipsPerPixelY
        Else
            l0122 = ((((gv1864.M420C - ((gv1864.M420C / 2) - 1)) - 1) * (mc001C - 1)) + (mc001C / 4)) * Screen.TwipsPerPixelY
        End If
        l0122 = (-l0122) + (picPicture.Height / 2)
        l0122 = l0122 + picPicture.Top
        picMaze.Top = l0122
        l0128 = True
    Else
        If  picPicture.Height <> picMaze.ScaleHeight + (((m0022)) * 2) + 2 Then picPicture.Height = picMaze.ScaleHeight + (((m0022)) * 2) + 2
        If  picPicture.Top <> lblLevel.Top + lblLevel.Height + 3 Then picPicture.Top = lblLevel.Top + lblLevel.Height + 3
        If  picMaze.Top <> False Then picMaze.Top = False
    End If
    Exit Sub

L7CB38:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:modAdjustMap"
    Resume L7CBA0
L7CBA0:
End Sub

Sub sub2E18 ()
Dim l012C ' 80
Dim l012E As Integer ' 81
Dim l0130 As Integer ' 81
    frmAutoMap.Cls
    If  (Me.Width / Screen.TwipsPerPixelX) >= gv19C2(mc009E).M5E20 Then
        For l012C = 2 To gv1864.M4216 Step 2
            Me.CurrentX = (22 + ((l012C - 1) * 14) + (m0022 * 2) - (Len(CStr(l012C)))) + l012E
            Me.CurrentY = 22 + (picMaze.ScaleHeight + (((m0022)) * 2) + 2) + 2
            Me.Print Str$(l012C)
        Next l012C
    End If
    If  (Me.Height / Screen.TwipsPerPixelY) >= gv19C2(mc009E).M5E2D Then
        For l012C = 2 To gv1864.M420C Step 2
            Me.CurrentX = -2
            Me.CurrentY = ((22 + (picMaze.ScaleHeight + (((m0022)) * 2) + 2)) - (l012C * 14) - (m0022 * 2)) + l0130
            Me.Print Str$(l012C)
        Next l012C
    End If
End Sub

Function fn2EB5 (p0134 ' 40, p0136 ' 40) As Long ' 2
Dim l0138 As Integer ' 81
Dim l013A As Long ' 82
' Const mc013C = 30 ' &H1E%
' Const mc013E = 30 ' &H1E%
    On Error GoTo L7CDD0
    l0138 = ((m0036 - 1) * (mc013C * mc013E)) + fn0B01(p0134, p0136)
    Get #gv1B58, l0138 + 2, l013A
    fn2EB5 = l013A
    Exit Function

L7CDD0:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:modReadAutoMap"
    Resume L7CE3A
L7CE3A:
End Function

Sub sub1EBA ()
    On Error GoTo L7D0A0
    Get #gv1B58, 2, m0038
    hsbLevel.Max = m0038
    lblLevel.Caption = "Level" + Str(hsbLevel.Value) + " of" + Str(m0038)
    If  gv14C2(m0078).M5470 = False Then
        lblInfo.Caption = "You are in the city."
    Else
        If  gv14C2(m0078).M59F4(mc00DA) = False And gv14C2(m0078).M59F4(m0076) = False Then
            lblInfo.Caption = "You are at" + Str$(gv14C2(m0078).M583F) + "," + LTrim$(Str$(gv14C2(m0078).M5845)) + "," + CStr(gv14C2(m0078).M5470) + " facing " + gv06E8$(gv14C2(m0078).M5899 - 1) + "."
        Else
            shpLocation.Visible = False
            If  gv14C2(m0078).M59F4(m0076) = False Then
                lblInfo.Caption = "You are lost on Level" + Str$(gv14C2(m0078).M5470) + "."
            Else
                lblInfo.Caption = "You are completely lost."
            End If
        End If
    End If
    Exit Sub

L7D0A0:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:modUpdateInfo"
    Resume L7D10A
L7D10A:
End Sub

Sub msgBlast_event0000 (p0148 As Integer ' 41, p014A As Integer ' 41)
' Const mc0150 = 274 ' &H112%
' Const mc0152 =-4064 ' &HF020%
    If  m0048 = False Then
        Select Case p0148
            Case mc0150
                If  p014A = mc0152 Then
                    gv14C2(m0078).M5958(mc009E).M425F = Me.Left
                    gv14C2(m0078).M5958(mc009E).M4258 = Me.Top
                    gv14C2(m0078).M5958(mc009E).M4216 = Me.Width
                    gv14C2(m0078).M5958(mc009E).M420C = Me.Height
                End If
            Case Else
        End Select
    End If
End Sub

Sub picMaze_DblClick ()
    If  (Me.Width / Screen.TwipsPerPixelX) = gv19C2(mc009E).M5E20 And (Me.Height / Screen.TwipsPerPixelY) = gv19C2(mc009E).M5E2D Then
        m0042 = True
        Me.Width = (gv19C2(mc009E).M5E20 * Screen.TwipsPerPixelX) / 2.25#
        m0042 = False
        Me.Height = (gv19C2(mc009E).M5E2D * Screen.TwipsPerPixelY) / 2.25#
    Else
        m0042 = True
        Me.Width = gv19C2(mc009E).M5E20 * Screen.TwipsPerPixelX
        m0042 = False
        Me.Height = gv19C2(mc009E).M5E2D * Screen.TwipsPerPixelY
    End If
    Me.Refresh
End Sub

Sub picMaze_MouseDown (Button As Integer, Shift As Integer, X As Single, Y As Single)
    If  Button = 2 Then sub2E29
End Sub

Sub picPicture_Click ()
    picMaze_DblClick
End Sub

Sub timBlinker_Timer ()
Dim l015C As Integer ' 81
    On Error GoTo L7D574
    If  m0032 = -1 Or m0034 = -1 Then Exit Sub
    If  gv1A66.M5F8E Then
        l015C = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, m002A, 0, 0, mc00D4)
        timBlinker.Enabled = False
        sub2E6E
        Exit Sub
    End If
    If  m0030 Then
        l015C = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, gv2BC6, ((gv14C2(m0078).M5899 + mc00F8) * mc001C) + 2, 2, mc00D4)
        m0030 = False
    Else
        l015C = extfn182D(picMaze.hDC, ((m0032 - 1) * (mc001C - 1)) + 2, ((m0034 - 1) * (mc001C - 1)) + 2, mc001C - 4, mc001C - 4, m002A, 0, 0, mc00D4)
        m0030 = True
    End If
    picMaze.Refresh
    Exit Sub

L7D574:
    sub04FC "Error '" + Error + "' occurred in FRMAUTOM:timBlinker_Timer"
    Resume L7D5E0
L7D5E0:
End Sub
