' FRMDUNM.FRM
Option Explicit
Dim m0020 As Integer ' 61
Dim m0022 As Integer ' 61
Dim m0024 As Integer ' 61
Dim m0026 As Integer ' 61
Dim m002A As Integer ' 61
Const mc002C = 1 ' &H1%
Const mc002E = 2 ' &H2%
Const mc0030 = 3 ' &H3%
Dim m0032 As Integer ' 61
Const mc0034 = 1 ' &H1%
Const mc0036 = 2 ' &H2%
Const mc0038 = 3 ' &H3%
Const mc003A = 4 ' &H4%
Const mc003C = 5 ' &H5%
Const mc003E = 6 ' &H6%
Const mc0040 = 7 ' &H7%
Const mc0044 = 81 ' &H51%
Const mc0046 = 70 ' &H46%
Const mc0048 = 67 ' &H43%
Const mc004A = 79 ' &H4F%
Const mc004C = 84 ' &H54%
Const mc004E = 80 ' &H50%
Const mc0050 = 76 ' &H4C%
Const mc0052 = 119 ' &H77%
Const mc0072 = 38 ' &H26%
Const mc0074 = 37 ' &H25%
Const mc0076 = 39 ' &H27%
Const mc0078 = 40 ' &H28%
Const mc0086 = 23 ' &H17%
Const mc0090 = 11 ' &HB%
Const mc0096 = 18 ' &H12%
Const mc0098 = 48 ' &H30%
Const m009A = 0 ' &H0%
Const m00A4 = 0 ' &H0%
Const mc00A8 = 4 ' &H4%
Const mc00C4 = 2 ' &H2%
Const mc00C8 = 10 ' &HA%
Const mc00D4 = 13 ' &HD%
Const mc00EE = 100 ' &H64%
Const mc00F2 = 100 ' &H64%
Const mc00FE = 4 ' &H4%
Const mc0124 = 1 ' &H1%
Const mc012C = 113 ' &H71%
Const mc014C = 8 ' &H8%
Const mc0150 = 4 ' &H4%
Const mc0154 = 1 ' &H1%
Const mc0156 = 2 ' &H2%
Const mc0158 = 1 ' &H1%
Const mc0162 = 5 ' &H5%
Const mc0164 = 20 ' &H14%
Const mc016A = 20 ' &H14%
Const mc016E = 20 ' &H14%
Const mc0170 = 15 ' &HF%
Const mc0172 = 16 ' &H10%
Const mc0174 = 3 ' &H3%
Const mc0176 = 67 ' &H43%
Const mc0178 = 40 ' &H28%
Const mc0184 = 49 ' &H31%
Const mc0186 = 1 ' &H1%
Const mc018A = 3 ' &H3%
Const mc018C = 40 ' &H28%
Const mc018E = 1 ' &H1%
Const mc0190 = 2 ' &H2%
Const mc0198 = 8 ' &H8%
Const mc019E = 365 ' &H16D%
Const mc01A8 = 65 ' &H41%
Const mc01AA = 26 ' &H1A%
Const mc01B0 = 56 ' &H38%

Sub cmdAction_Click (Index%)
' Const mc0044 = 81 ' &H51%
' Const mc0046 = 70 ' &H46%
' Const mc0048 = 67 ' &H43%
' Const mc004A = 79 ' &H4F%
' Const mc004C = 84 ' &H54%
' Const mc004E = 80 ' &H50%
' Const mc0050 = 76 ' &H4C%
' Const mc0052 = 119 ' &H77%
    Select Case Index
        Case mc0040
            sub0456 mc0044, 0
        Case m0032
            sub0456 mc0046, 0
        Case mc0034
            sub0456 mc0048, 0
        Case mc0038
            sub0456 mc004A, 0
        Case mc0036
            sub0456 mc004C, 0
        Case mc003A
            sub0456 mc004E, 0
        Case mc003C
            sub0456 mc0050, 0
        Case mc003E
            sub0456 mc0052, 0
        Case Else
    End Select
    If  Index <> mc0034 And gv14C2(gv1A86).M5470 > 0 Then
        If  fn03BD(frmDungeonMain) Then
            picMaze2.SetFocus
        End If
    End If
End Sub

Sub cmdBuffer_Click (Index%)
Dim l006C As Integer ' 81
    If  gv14C2(gv1A86).M5470 > 0 Then
        Select Case Index
            Case 0 To 8
                l006C = 49 + Index
            Case Else
                l006C = 48
        End Select
        sub0456 l006C, 1
    End If
    picMaze2.SetFocus
End Sub

Sub cmdMove_Click (Index%)
' Const mc0072 = 38 ' &H26%
' Const mc0074 = 37 ' &H25%
' Const mc0076 = 39 ' &H27%
' Const mc0078 = 40 ' &H28%
    Select Case Index
        Case mc002E
            sub0456 mc0072, 0
        Case m002A
            sub0456 mc0074, 0
        Case mc002C
            sub0456 mc0076, 0
        Case mc0030
            sub0456 mc0078, 0
        Case Else
    End Select
    picMaze2.SetFocus
End Sub

Sub cmdWait_Click ()
Dim l007A As Single ' 83
Dim l007C As Integer ' 81
Dim l007E As Integer ' 81
Dim l0080 As Integer ' 81
Dim l0082 As Long ' 82
' Const mc0086 = 23 ' &H17%
' Const mc0090 = 11 ' &HB%
' Const mc0096 = 18 ' &H12%
' Const mc0098 = 48 ' &H30%
' Const m009A = 0 ' &H0%
    If  gv14C2(gv1A86).M5483 > False Then
        If  gv14C2(gv1A86).M5470 > False Then
            l0080 = False
            l0082 = fn0A34(gv14C2(gv1A86).M583F, gv14C2(gv1A86).M5845)
            If  fn0380(mc0086, l0082) <> False Then
                l0080 = True
            End If
            cmdWait.Enabled = False
            Screen.MousePointer = mc0090
            Do
                If  l007E < (Log(gv14C2(gv1A86).M5470) * Log(gv14C2(gv1A86).M5470) * 100) + 21 Then
                    l007C = 10000
                Else
                    l007C = 1000
                End If
                If  gv14C2(gv1A86).M5470 = 1 And gv14C2(gv1A86).M59BB <= mc0096 Then
                    l007C = 100
                End If
                l007E = l007E + 1
                l007A = 16 - (gv14C2(gv1A86).M5470)
                If  l007A < .1# Then
                    l007A = .1#
                End If
                If  l0080 = True Then
                    l007A = l007A + 16 - (gv14C2(gv1A86).M5470)
                End If
                If  Rnd * l007C <= l007A Then
                    Beep
                    MsgBox "You have been found after " + CStr(l007E) + " day(s)!", mc0098, "Wait for Rescue"
                    Exit Do
                End If
            Loop
            gv14C2(gv1A86).M5470 = 0
            gv14C2(gv1A86).M59BB = -1
            sub0EAE False, gv1A86, l007E, True
            sub08A9 True, 50
            Screen.MousePointer = m009A
            cmdWait.Enabled = True
        End If
        sub0930 gv1A86
    End If
End Sub

Sub Form_Activate ()
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
' Const m00A4 = 0 ' &H0%
' Const mc00A8 = 4 ' &H4%
    On Error Resume Next
    If  TypeOf Me.ActiveControl Is TextBox Then
    Else
        If  KeyCode = gv1CFE.M6541 And Shift = gv1CFE.M654C Or gv14C2(m00A4).M5470 = 0 Then
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
Dim l00BA ' 80
' Const mc00C4 = 2 ' &H2%
' Const mc00C8 = 10 ' &HA%
' Const mc00D4 = 13 ' &HD%
Dim l00DC As Integer ' 81
' Const mc00EE = 100 ' &H64%
' Const mc00F2 = 100 ' &H64%
' Const mc00FE = 4 ' &H4%
Static m0110 As Integer ' 61
Static m0114 As Integer ' 61
    ReDim gv1E7C(mc00A8)               As Integer
    ReDim gv1AEC(mc00A8)              As Integer
    For l00BA = False To mc00A8 - 1
        gv1E66(l00BA).M56C4 = -1
        gv1E66(l00BA).M5766 = -1
    Next l00BA
    sub063F mc00C4
    Set frmDungeonMain = Me
    sub0792 Me
    gv1B50 = True
    sub050F
    sub0A49
    m0020 = -1
    For l00BA = 0 To mc00C8 - 1
        If  l00BA > 0 Then
            Load cmdBuffer(l00BA)
            cmdBuffer(l00BA).Left = cmdBuffer(l00BA - 1).Left + cmdBuffer(l00BA).Width
        End If
        cmdBuffer(l00BA).Caption = l00BA + 1
        cmdBuffer(l00BA).Visible = True
    Next l00BA
    gv1D6C = gv14C2(m00A4).M5470
    gv1D6A = -1
    gv1E66(gv1A86).M547A = -1
    Me.Tag = "NEW"
    Me.Left = gv14C2(m00A4).M5958(mc00D4).M425F
    Me.Top = gv14C2(m00A4).M5958(mc00D4).M4258
    Me.Width = gv14C2(m00A4).M5958(mc00D4).M4216
    Me.Height = gv14C2(m00A4).M5958(mc00D4).M420C
    shpMazeBox.Width = picMaze2.Width + (Screen.TwipsPerPixelX * 3)
    shpMazeBox.Height = picMaze2.Height + (Screen.TwipsPerPixelY * 3)
    shpMazeBox.Left = picMaze2.Left - (Screen.TwipsPerPixelX)
    shpMazeBox.Top = picMaze2.Top - (Screen.TwipsPerPixelY)
    If  fn0A0B(m00A4) = False Then
        l00DC% = MsgBox("Failure opening " + gv19E8 + gc1C34 + "!", 64, "ERROR")
        Unload frmDungeonMain
        gv14C2(gv1A86).M5470 = 0
        frmCityMain.Show
        Exit Sub
    End If
    picMonsters.Visible = True
    gv1D58 = picMaze2.ScaleWidth / mc00EE
    gv1D5C = picMaze2.ScaleHeight / mc00F2
    gv1D60 = picMaze2.ScaleWidth
    gv1D62 = picMaze2.ScaleHeight
    If  gv14C2(m00A4).M5470 = 0 Then
        gv14C2(m00A4).M59BB = -1
    Else
        gv14C2(m00A4).M59BB = fn0992(fn0AE8(gv14C2(m00A4)))
        sub09CC
    End If
    If  gv14C2(gv1A86).M5943 >= mc00FE Then
        sub0A7C gv14C2(gv1A86).M5943 - mc00FE, 0, 0
    End If
    gv19C2(mc00D4).M4216 = gv19C2(mc00D4).M5E20
    gv19C2(mc00D4).M420C = gv19C2(mc00D4).M5E2D
    gv19C2(mc00D4).M5E47 = Me.hWnd
    Me.Tag = ""
    sub0784 Me
    sub0524 Me
    If  UBound(gv14C2) > m00A4 Then
        frmParty!lblCall = "0"
    End If
    sub168B
    If  fn03BD(frmAutoMap) Then
        frmAutoMap.WindowState = m0110
    End If
    If  gv1D64 <> m0114 Then
        frmAutoMap!lblCall = "UPDATE"
    End If
    sub0835 gv14C2(m00A4).M5470
    sub0A91 gv14C2(m00A4).M59BB
    Screen.MousePointer = m009A
    gv1B50 = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
Dim l0116 As Integer ' 81
Dim l0118 As Single ' 83
Static m0122 As Integer ' 61
' Const mc0124 = 1 ' &H1%
    If  m0022 = True Then Exit Sub
    If  Me.WindowState <> 1 Then
        If  Me.Width < gv19C2(mc00D4).M5E20 / 2 Then
            Me.Width = gv19C2(mc00D4).M5E20 / 2
        End If
        If  Me.Height < gv19C2(mc00D4).M5E2D / 2 Then
            Me.Height = gv19C2(mc00D4).M5E2D / 2
        End If
    End If
    If  Me.Tag = "" Then
        If  Me.WindowState = False Then
            l0118 = Me.Width / gv19C2(mc00D4).M5E20
            If  Me.Height <> gv19C2(mc00D4).M5E2D * l0118 Then
                Me.Tag = "RESIZE"
                Me.Height = gv19C2(mc00D4).M5E2D * l0118
                Me.Tag = ""
            End If
            sub0760 Me, gv19C2(mc00D4)
            sub0B82 gv1A86
            If  gv14C2(gv1A86).M5483 = False Then
                If  gv1E38(0).M4ED4 <> -1 And gv1E38(0).M4ECC <> m0122 Then
                    frmDungeonMain!timCombat.Enabled = False
                    sub0A64 mc0124
                    frmDungeonMain!timCombat.Enabled = True
                End If
                l0116 = fn09A4(False, False)
            End If
        End If
    End If
    Exit Sub
    If  Me.Tag = "" Then
        sub0760 Me, gv19C2(mc00D4)
        If  gv14C2(gv1A86).M5483 = False Then
            If  gv1E38(0).M4ED4 <> -1 And gv1E38(0).M4ECC <> m0122 Then
                frmDungeonMain!timCombat.Enabled = False
                sub0A64 mc0124
                frmDungeonMain!timCombat.Enabled = True
            End If
            l0116 = fn09A4(False, False)
        End If
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc00D4, Me, True
    gv19C2(mc00D4).M5E47 = False
    Set frmDungeonMain = Nothing
    sub0792 Nothing
    Screen.MousePointer = mc0090
    extsub05E7
End Sub

Sub lblMonster_Click (Index%)
' Const mc012C = 113 ' &H71%
    If  gv1E38(Index).M4EDC > 0 Then
        gv1E66(gv1A86).M547A = Index
        sub0BCD
    End If
End Sub

Sub lblRoom_Click ()
    sub0456 mc012C, 0
End Sub

Sub picMaze2_Paint ()
    If  gv1B50 = False Then
        sub0980
    End If
End Sub

Sub picMonsters_Paint ()
    If  gv1EB4 = False And gv1EB6 = False And gv1EB8 = False Then
        sub0BBA 0
        sub0BAA 0
        sub0B9B
    End If
End Sub

Sub timAilment_Timer ()
Dim l013C As Integer ' 81
Dim l013E As Integer ' 81
Dim l0140 ' 80
Dim l0142 As Integer ' 81
Dim l0144 As Integer ' 81
' Const mc014C = 8 ' &H8%
' Const mc0150 = 4 ' &H4%
Static m0152 As Integer ' 61
' Const mc0154 = 1 ' &H1%
' Const mc0156 = 2 ' &H2%
' Const mc0158 = 1 ' &H1%
' Const mc0162 = 5 ' &H5%
' Const mc0164 = 20 ' &H14%
' Const mc016A = 20 ' &H14%
' Const mc016E = 20 ' &H14%
' Const mc0170 = 15 ' &HF%
' Const mc0172 = 16 ' &H10%
' Const mc0174 = 3 ' &H3%
' Const mc0176 = 67 ' &H43%
' Const mc0178 = 40 ' &H28%
' Const mc0184 = 49 ' &H31%
' Const mc0186 = 1 ' &H1%
Static m0188 As Integer ' 61
' Const mc018A = 3 ' &H3%
' Const mc018C = 40 ' &H28%
' Const mc018E = 1 ' &H1%
' Const mc0190 = 2 ' &H2%
Dim l0192 As Single ' 83
Dim l0194 As Single ' 83
Dim l0196 As Single ' 83
' Const mc0198 = 8 ' &H8%
' Const mc019E = 365 ' &H16D%
' Const mc01A8 = 65 ' &H41%
' Const mc01AA = 26 ' &H1A%
' Const mc01B0 = 56 ' &H38%
    If  m0026 = True Or gv1ACC.M602F = True Then
        Exit Sub
    End If
    On Error GoTo L713B8
    If  l0144 > UBound(gv14C2) Then
        l0144 = UBound(gv14C2)
    End If
    If  gv14C2(l0144).M5470 = 0 Then
        m0026 = False
        Exit Sub
    End If
    m0026 = True
    l0144 = m00A4
    If  gv14C2(l0144).M5483 = False Then
        If  fn0EEF() = False Then
            If  (Rnd * 100) < 10 Then
                sub086D mc014C + Int(Rnd * 3)
            End If
        End If
    End If
    Do While l0144 <= UBound(gv14C2)
        If  gv14C2(l0144).M5483 = False Then
            If  fn0DCD(-1) > -1 Then
                For l0140 = 0 To mc0150 - 1
                    If  gv1E38(l0140).M4EDC > 0 Then
                        If  gv1E38(l0140).M4EEE <> m0152 Then
                            Select Case gv1E38(l0140).M4EEE
                                Case mc0154, mc0156
                                    If  fn0380(mc0158, gv14F6(gv1E38(l0140).M4ED4).M55BE) = False Or (fn0380(mc0158, gv14F6(gv1E38(l0140).M4ED4).M55BE) = True And gv14C2(l0144).M56B9(mc0162) <> False) Then
                                        If  fn0380(mc0164, fn0AD3(fn0AE8(gv14C2(m00A4)))) <> False Then
                                            l0142 = fn12AF(l0144) + mc016A
                                        Else
                                            l0142 = (fn12AF(l0144) * 1.25#) + mc016A
                                        End If
                                        If  l0142 < 5 Then l0142 = 5
                                        If  l0142 > 80 Then l0142 = 80
                                        If  Rnd * 100 < l0142 Then
                                            gv1E38(l0140).M4EEE = m0152
                                            sub0BBA gv14C2(m00A4).M59BB
                                            If  l0144 = gv1A86 Then
                                                sub085B "You properly identified the monster(s) in group " + CStr(l0140 + 1) + " as " + fn0E23(l0144, gv1E38(l0140).M4EDC, gv1E38(l0140)) + "."
                                            Else
                                                sub085B Chr(34) + RTrim(gv14C2(l0144).M548B) + Chr(34) + " properly identified the monster(s) in group " + CStr(l0140 + 1) + " as " + fn0E23(l0144, gv1E38(l0140).M4EDC, gv1E38(l0140)) + "."
                                            End If
                                        End If
                                    End If
                            End Select
                        End If
                        If  gv1E38(l0140).M4F01 <> gv1E38(l0140).M4ED4 Then
                            If  fn0380(mc0158, gv14F6(gv1E38(l0140).M4ED4).M55BE) = False Or (fn0380(mc0158, gv14F6(gv1E38(l0140).M4ED4).M55BE) = True And gv14C2(l0144).M56B9(mc0162) <> False) Then
                                l013C = Int(Rnd * 100) + 1
                                If  fn0380(mc0164, fn0AD3(fn0AE8(gv14C2(l0144)))) <> False Then
                                    l0142 = (fn12AF(l0144) * .75#) + mc016E
                                Else
                                    l0142 = fn12AF(l0144) + mc016E
                                End If
                                If  l0142 < 10 Then l0142 = 10
                                If  l0142 > 90 Then l0142 = 90
                                If  l013C < l0142 Then
                                    gv1E38(l0140).M4F01 = gv1E38(l0140).M4ED4
                                    If  l0144 = gv1A86 Then
                                        sub085B "You properly identified the monster(s) in group " + CStr(l0140 + 1) + " as " + fn0E23(l0144, gv1E38(l0140).M4EDC, gv1E38(l0140)) + "."
                                    Else
                                        sub085B Chr(34) + RTrim(gv14C2(l0144).M548B) + Chr(34) + " properly identified the monster(s) in group " + CStr(l0140 + 1) + " as " + fn0E23(l0144, gv1E38(l0140).M4EDC, gv1E38(l0140)) + "."
                                    End If
                                    sub0BBA gv14C2(l0144).M59BB
                                    sub06FE gv1E38(l0140), False, False, True, l0144
                                End If
                            End If
                        End If
                    End If
                Next l0140
            End If
            If  (fn0380(mc0170, fn0AD3(fn0AE8(gv14C2(l0144)))) <> False Or fn0380(mc0172, fn0AD3(fn0AE8(gv14C2(l0144)))) <> False) And gv14C2(l0144).M56B9(mc0174) = False Then
                If  fn0380(mc0170, fn0AD3(fn0AE8(gv14C2(l0144)))) <> False Then
                    If  l0144 = gv1A86 Then sub086D mc0176
                    sub15EC frmDungeonMain!lblSquareInfo, "You are Drowning!"
                End If
                If  fn0380(mc0172, fn0AD3(fn0AE8(gv14C2(l0144)))) <> False Then
                    sub15EC frmDungeonMain!lblSquareInfo, "You are Sinking!"
                    If  Int(Rnd * 100) < ((gv14C2(l0144).M5470 / 25) * 100) Then
                        l013C = Int(Rnd * (mc0178 - 1)) + 1
                        If  gv14C2(l0144).M5857(l013C).M4ED4 > 0 Then
                            If  fn1121(gv14C2(l0144).M5857(l013C).M4ED4) = True Then
                                If  l0144 = gv1A86 Then
                                    sub085B "QUICKSAND: " + gv1426(gv14C2(l0144).M5857(l013C).M4ED4).M548B + " Destroyed!"
                                Else
                                    sub085B Chr$(34) + RTrim(gv14C2(l0144).M548B) + Chr$(34) + ": QUICKSAND: " + gv1426(gv14C2(l0144).M5857(l013C).M4ED4).M548B + " Destroyed!"
                                End If
                                sub09DE mc0184
                                sub0EDA l0144, l013C
                            End If
                        End If
                    End If
                End If
                gv14C2(l0144).M4EAC = gv14C2(l0144).M4EAC - gv14C2(l0144).M5470
                sub08A9 True, 7
                If  gv14C2(l0144).M4EAC < 1 Then
                    sub091E l0144, mc0186
                    sub0930 l0144
                End If
            End If
            If  l0144 > UBound(gv14C2) Then l0144 = UBound(gv14C2)
            If  gv14C2(l0144).M56B9(m0188) > 0 Then
                l013C = Int(Rnd * 200) + ((gv14C2(l0144).M55B5(mc018A) + (gv14C2(l0144).M584B(mc018A)) - 10) * 2) - (gv14C2(l0144).M56B9(m0188) * 2)
                If  gv14C2(l0144).M56B9(m0188) > 0 And l013C > 185 Then
                    sub09DE mc018C
                    gv14C2(l0144).M56B9(m0188) = 0
                    sub08A9 True, 12
                Else
                    gv14C2(l0144).M4EAC = gv14C2(l0144).M4EAC - 2
                End If
            End If
            If  gv14C2(l0144).M56B9(mc018E) Then
                l013C = Int(Rnd * 200) + ((gv14C2(l0144).M55B5(mc018A) + (gv14C2(l0144).M584B(mc018A)) - 10) * 2) - (gv14C2(l0144).M56B9(m0188) * 2)
                If  gv14C2(l0144).M56B9(mc018E) > 0 And l013C > 195 Then
                    sub09DE mc018C
                    gv14C2(l0144).M56B9(mc018E) = 0
                    sub08A9 True, 12
                Else
                    gv14C2(l0144).M4EAC = gv14C2(l0144).M4EAC - 1
                End If
            End If
            If  gv14C2(l0144).M56B9(mc0190) > 0 Then
                    l013E = gv14C2(l0144).M5584(gv14C2(l0144).M58BB).M4E82
                    l0192 = (Log((gv14C2(l0144).M56B9(mc0190) / 2) + (gv14C2(l0144).M56B9(mc0190) / 10)) / Log(1.02#))
                    l0194 = (((Log(l013E) + (l013E / 10)) / Log(1.05#) / 10) + ((gv14C2(l0144).M55B5(mc018A) + gv14C2(l0144).M584B(mc018A)) * 1.5#)) + gv14C2(l0144).M5548(mc0198)
                    l0196 = l0192 - l0194
                    If  l0196 < 5 Then l0196 = 5
                    If  l0196 > 90 Then l0196 = 90
                    If  (Int(Rnd * 100) + 1) > l0196 Or fn0EEF() = False Then
                        sub09DE mc018C
                        sub0D1D l0144, 1, 0
                        sub08A9 True, 12
                    End If
            End If
            sub0C00 l0144
            If  (((gv14C2(l0144).M5577 / mc019E) / gv148E(gv14C2(l0144).M5821).M5577) * 100) >= 98 Then
                If  Int(Rnd * 100) < 5 + Log(((((gv14C2(l0144).M5577 / mc019E) / gv148E(gv14C2(l0144).M5821).M5577) * 100) - 98)) Then
                    sub091E l0144, mc0186
                    If  l0144 = gv1A86 Then
                        sub085B "You have died of natural causes."
                    Else
                        sub085B Chr$(34) + RTrim(gv14C2(l0144).M548B) + Chr$(34) + " has died of natural causes."
                    End If
                End If
            End If
            If  gv14C2(l0144).M4EAC < 1 Then
                sub091E l0144, mc0186
                sub0930 l0144
                sub08A9 True, 7
                l0144 = l0144 - 1
            Else
                sub08A9 True, 7
            End If
        End If
        l0144 = l0144 + 1
    Loop
    If  (fn0380(mc0164, fn0AD3(fn0AE8(gv14C2(m00A4))))) <> False And (Rnd * 100) < 25 Then
        sub086D mc01A8
    End If
    If  (fn0380(mc0170, fn0AD3(fn0AE8(gv14C2(m00A4)))) <> False Or fn0380(mc0172, fn0AD3(fn0AE8(gv14C2(m00A4)))) <> False) Then
        sub086D mc01AA + Int(Rnd * 2)
    End If
    If  UBound(gv14C2) > False Then
        For l0144 = False To UBound(gv14C2)
            If  gv14C2(l0144).M5483 = False Then
                If  gv14C2(l0144).M4EAC < 10 Or gv14C2(l0144).M4EAC <= (gv14C2(l0144).M4EB4 * .1#) Then
                    If  Not gv1A66.M5F71 Then sub09DE mc01B0
                    sub085B RTrim(gv14C2(l0144).M548B) + " - " + Chr$(34) + "Help! My hits are " + LTrim(CStr(gv14C2(l0144).M4EAC)) + "/" + LTrim(CStr(gv14C2(l0144).M4EB4)) + "!"
                End If
            End If
        Next l0144
    End If
    sub0BF1
    m0026 = False

L713AA:
    Exit Sub

L713B8:
    sub04FC "Error '" + Error + "' occurred in FRMDUNM:timAilment_Timer."
    Resume L713AA
End Sub

Sub timCombat_Timer ()
    If  m0024 = True Or gv1ACC.M602F = True Then
        Exit Sub
    Else
        If  gv14C2(m00A4).M5470 = 0 Then
            timCombat.Enabled = False
            m0024 = False
            Exit Sub
        Else
            m0024 = True
            sub155A gv14C2(m00A4).M59BB
            m0024 = False
        End If
    End If
End Sub
