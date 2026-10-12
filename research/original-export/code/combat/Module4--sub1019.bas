Sub sub1019 (ByVal pv00F4 As Integer ' 81)
' called (ByVal p1%, p2%)
Dim l00F8 As Integer ' 81
Dim l0100 As Integer ' 81
Dim l0102 As Integer ' 81
Dim l0104 ' 80
Dim l0106 ' 80
Dim l0108 As String ' 87
Dim l010A As Integer ' 81
Dim l010C As Single ' 83
Dim l0112 As Long ' 82
Dim l0114 As Integer ' 81
Dim l0116 As Integer ' 81
Dim l0118 As Integer ' 81
Dim l011A As Integer ' 81
Dim l011C ' 80
Dim l011E As Integer ' 81
Dim l0120 As Single ' 83
' Const mc0122 = 2 ' &H2%
' Const m0132 = 0 ' &H0%
' Const mc0134 = 4 ' &H4%
' Const mc0142 = 36 ' &H24%
' Const mc0144 = 46 ' &H2E%
' Const mc0146 = 4 ' &H4%
' Const mc0148 = 5 ' &H5%
' Const mc014A = 2 ' &H2%
' Const mc014C = 4 ' &H4%
' Const mc0150 = 1 ' &H1%
' Const mc0152 = 5 ' &H5%
' Const mc0154 = 1 ' &H1%
' Const mc0156 = 5 ' &H5%
' Const mc0160 = 55 ' &H37%
' Const mc0162 = 70 ' &H46%
' Const mc0164 = 71 ' &H47%
' Const mc0166 = 2 ' &H2%
Static m0168 As Integer ' 61
' Const mc016A = 6 ' &H6%
    If  pv00F4 > UBound(gv14C2) Then
        Exit Sub
    End If
    If  gv14C2(pv00F4).M56B9(mc0122) > 0 Then
        Exit Sub
    End If
    If  frmDungeonMain!timCombat.Enabled = False Then
        Exit Sub
    End If
    If  gv1E66(pv00F4).M547A = -1 Then
        gv1E66(pv00F4).M547A = fn0DCD(-1)
        If  gv1E66(pv00F4).M547A = -1 Then
            Exit Sub
        End If
    End If
    If  gv1E38(gv1E66(pv00F4).M547A).M4EDC < 1 Then
        gv1E66(pv00F4).M547A = fn0DCD(-1)
    End If
    If  gv1E66(pv00F4).M547A = -1 Then
        Exit Sub
    End If
    extsub05E7
    If  gv1E66(pv00F4).M56C4 > -1 Then
        gv1E66(pv00F4).M4E97 = gv1DB0
        If  gv1E66(pv00F4).M56C4 >= 1000 Then
            l00F8 = fn1173(pv00F4, gv1E66(pv00F4).M56C4, gv1426(gv14C2(pv00F4).M5857(gv1E66(pv00F4).M5766).M4ED4).M5734, -1)
        Else
            l00F8 = fn1173(pv00F4, gv1E66(pv00F4).M56C4, 0, -1)
        End If
        Exit Sub
    End If
    l0116 = gv14C2(pv00F4).M4E97
    l011A = gv14C2(pv00F4).M55B5(m0132) + gv14C2(pv00F4).M584B(m0132)
    l0118 = gv1E38(gv1E66(pv00F4).M547A).M4EA1
    l00F8 = CInt(fn11D4(pv00F4, mc0134, False))
    l011E = gv141C.M5B9F
    l0100 = gv14C2(pv00F4).M56AF
    For l0106 = 0 To 1
        If  gv14C2(pv00F4).M5997(l0106) > -1 Then
            l0100 = l0100 + gv1426(gv14C2(pv00F4).M5997(l0106)).M56AF
        End If
    Next l0106
    If  l0100 < 1 Or (gv14C2(pv00F4).M5997(0) = -1 And gv14C2(pv00F4).M5997(1) = -1) Then
        If  pv00F4 = gv1A86 Then
            frmDungeonMain!lblCharacterHit.Caption = "Using no weapon!"
        End If
        sub102F pv00F4, gc1DB4
        Exit Sub
    End If
    l0100 = 0
    For l0106 = 0 To 1
        If  gv14C2(pv00F4).M5997(l0106) > -1 Then
            l0100 = gv14C2(pv00F4).M56AF + gv1426(gv14C2(pv00F4).M5997(l0106)).M56AF
            If  l0100 > 0 Then
                For l0104 = 1 To l0100
                    If  gv14C2(pv00F4).M5997(l0106) = -1 Then Exit For
                    If  (gv1A66.M5F48 = True And pv00F4 = gv1A86) Or gv1A66.M5F48 = False Then
                        Select Case gv1426(gv14C2(pv00F4).M5997(l0106)).M5709
                            Case 0, 1, 2, 4, 5, 7
                                sub09DE mc0142
                            Case Else
                                sub09DE mc0144
                        End Select
                    End If
                    If  fn0380(mc0146, gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M55BE) = True Then
                        If  gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 < Int(gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5693 / 2) Then
                            If  pv00F4 = gv1A86 Then
                                frmDungeonMain!lblCharacterHit.Caption = "Weapon has no effect!"
                                frmDungeonMain!lblCharacterHit.Refresh
                            End If
                            sub102F pv00F4, gc1DB4
                            Exit For
                        End If
                    End If
                    If  fn0380(mc0148, gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M55BE) = True Then
                        If  pv00F4 = gv1A86 Then
                            frmDungeonMain!lblCharacterHit.Caption = "Weapon has no effect!"
                            frmDungeonMain!lblCharacterHit.Refresh
                        End If
                        Exit For
                    End If
                    If  pv00F4 = gv1A86 Then
                        frmDungeonMain!lblCharacterHit.Caption = ""
                        frmDungeonMain!lblCharacterHit.Refresh
                        sub07E2 .25#
                    End If
                    If  frmDungeonMain!timCombat.Enabled = False Then
                        Exit Sub
                    End If
                    If  gv14C2(pv00F4).M5997(l0106) < 0 Then
                        Exit Sub
                    End If
                    l0120 = fn11D4(pv00F4, mc0134, False)
                    l0120 = l0120 * gv1426(gv14C2(pv00F4).M5997(l0106)).M56F7
                    l0112 = 0
                        l00F8 = CInt(fn11D4(pv00F4, mc014A, False))
                        l010C = (((Log((gv141C.M5B9F / 999) + 1) * 100) * Log(gv141C.M5B95 + 1)) / 3)
                        l010C = l010C - ((Log((gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5A7C / 999) + 1)) * 100)
                        l010C = l010C / 2
                        If  fn0380(mc014C, gv1426(gv14C2(pv00F4).M5997(l0106)).M55BE) <> False Then
                            l010C = l010C + (Log(gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 + 1) * Log(10))
                            If  l010C < (Log(gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 + 1) * Log(10)) Then
                                l010C = (Log(gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 + 1) * Log(10))
                            End If
                        End If
                        If  l010C < 1 Then
                            If  gv141C.M5B9F > 0 Or fn0380(mc014C, gv1426(gv14C2(pv00F4).M5997(l0106)).M55BE) <> False Then
                                l010C = 1
                            End If
                        End If
                        If  l010C > 50 Then
                            l010C = 50
                        End If
                        If  Int(Rnd * 100) < l010C Then
                            l0112 = fn0418(mc014A, l0112, True)
                            l0120 = l0120 + 5
                        End If
                        l00F8 = CInt(fn11D4(pv00F4, mc0150, False))
                        l010C = (((Log((gv141C.M5B9F / 999) + 1) * 100) * Log(gv141C.M5B95 + 1)) / 2)
                        l010C = l010C - ((Log((gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5A7C / 999) + 1)) * 100)
                        l010C = l010C / 2
                        If  fn0380(mc0152, gv1426(gv14C2(pv00F4).M5997(l0106)).M55BE) <> False Then
                            l010C = l010C + (Log(gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 + 1) * Log(100))
                            If  l010C < (Log(gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 + 1) * Log(100)) Then
                                l010C = (Log(gv1426(gv14C2(pv00F4).M5997(l0106)).M5693 + 1) * Log(100))
                            End If
                        End If
                        If  l010C < 2 Then
                            If  gv141C.M5B9F > 0 Or fn0380(mc0152, gv1426(gv14C2(pv00F4).M5997(l0106)).M55BE) <> False Then
                                l010C = 2
                            End If
                        End If
                        If  l010C > 75 Then
                            l010C = 75
                        End If
                        If  Int(Rnd * 100) < l010C Then
                            l0112 = fn0418(mc0150, l0112, True)
                            l0120 = l0120 + 2
                        End If
                    If  fn0380(mc0154, gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M55BE) = True Then
                        If  gv14C2(pv00F4).M56B9(mc0156) = False Then
                            l0120 = l0120 - (l0120 / 2)
                        End If
                    End If
                    l0114 = Abs(gv148E(gv14C2(pv00F4).M5821).M5565 - gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5565)
                    If  gv148E(gv14C2(pv00F4).M5821).M5565 < gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5565 Then
                        l0120 = l0120 - (l0114 / 10)
                        ElseIf gv148E(gv14C2(pv00F4).M5821).M5565 > gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5565 Then
                        l0120 = l0120 + (l0114 / 10)
                    End If
                    l0102 = fn0DEE(l0116, l011C, l011E, l011A, l0120)
                    l010A = gv1E38(gv1E66(pv00F4).M547A).M4EAC
                    If  l0102 < 1 Then
                        l0108 = "You missed!"
                        l0104 = l0100
                    Else
                        If  (gv1A66.M5F48 = True And pv00F4 = gv1A86) Or gv1A66.M5F48 = False Then
                            If  fn0380(mc0150, l0112) = True And fn0380(mc014A, l0112) = True Then
                                sub09DE mc0160
                                ElseIf fn0380(mc0150, l0112) = True Then
                                sub09DE mc0162
                                ElseIf fn0380(mc014A, l0112) = True Then
                                sub09DE mc0164
                            End If
                            sub09DE mc0166
                        End If
                        gv1E38(gv1E66(pv00F4).M547A).M4EAC = gv1E38(gv1E66(pv00F4).M547A).M4EAC - l0102
                        If  gv1E38(gv1E66(pv00F4).M547A).M4EAC < False Then
                            gv1E38(gv1E66(pv00F4).M547A).M4EAC = False
                        End If
                        If  gv1E38(gv1E66(pv00F4).M547A).M4EAC > 0 Then
                            If  fn0380(mc0150, l0112) = True And fn0380(mc014A, l0112) = True Then
                                l0108 = "You Severed one for" + Str$(l0102) + " damage!"
                                ElseIf fn0380(mc0150, l0112) = True Then
                                l0108 = "You Backstabbed for" + Str$(l0102) + " damage!"
                                ElseIf fn0380(mc014A, l0112) = True Then
                                l0108 = "You Critically hit for" + Str$(l0102) + " damage!"
                            Else
                                l0108 = "You hit for" + Str$(l0102) + " damage!"
                            End If
                            sub0CDF pv00F4, l010A - gv1E38(gv1E66(pv00F4).M547A).M4EAC, gv1E38(gv1E66(pv00F4).M547A).M4ED4, 1
                            l0104 = l0100
                        Else
                            If  (gv1A66.M5F48 = True And pv00F4 = gv1A86) Or gv1A66.M5F48 = False Then
                                extsub05E7
                                sub0CB7 gv1E38(gv1E66(pv00F4).M547A).M4ED4
                            End If
                            gv14C2(pv00F4).M5906(m0168) = gv14C2(pv00F4).M5906(m0168) + 1
                            If  gv1E38(gv1E66(pv00F4).M547A).M4F01 = gv1E38(gv1E66(pv00F4).M547A).M4ED4 Then
                                If  fn0380(mc0154, gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M55BE) = True Then
                                    If  gv14C2(pv00F4).M56B9(mc0156) <> False Then
                                        sub1043 mc016A, pv00F4, gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5467
                                    End If
                                Else
                                    sub1043 mc016A, pv00F4, gv14F6(gv1E38(gv1E66(pv00F4).M547A).M4ED4).M5467
                                End If
                            End If
                            gv1E38(gv1E66(pv00F4).M547A).M4EDC = gv1E38(gv1E66(pv00F4).M547A).M4EDC - 1
                            If  fn0380(mc0150, l0112) = True And fn0380(mc014A, l0112) = True Then
                                l0108 = "You Severed one!"
                                ElseIf fn0380(mc0150, l0112) = True Then
                                l0108 = "You Backstabbed one!"
                                ElseIf fn0380(mc014A, l0112) = True Then
                                l0108 = "You Critically hit one!"
                                Else
                                l0108 = "You Killed One!"
                            End If
                            sub0CDF pv00F4, l010A, gv1E38(gv1E66(pv00F4).M547A).M4ED4, 1
                            sub0CF3 gv1E38(gv1E66(pv00F4).M547A).M4ED4
                            sub0D08 pv00F4
                        End If
                    End If
                    extsub05E7
                    If  pv00F4 = gv1A86 Then
                        frmDungeonMain!lblCharacterHit.Caption = l0108
                        frmDungeonMain!lblCharacterHit.Refresh
                        sub07E2 .25#
                    End If
                    If  frmDungeonMain!timCombat.Enabled = False Then
                        Exit Sub
                    End If
                    If  gv1E38(gv1E66(pv00F4).M547A).M4EDC < 1 Then
                        gv1E66(pv00F4).M547A = fn0DCD(-1)
                    End If
                    If  gv1E66(pv00F4).M547A < 0 Then
                        sub0C53
                        Exit Sub
                    End If
                    sub0BBA 0
                    sub0BCD
                Next l0104
            End If
        End If
    Next l0106
End Sub
