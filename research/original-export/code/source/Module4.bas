' Module4
Option Explicit
Dim m0034 As Integer ' 61
Const mc0036 = 1 ' &H1%
Const mc0038 = 2 ' &H2%
Const mc003A = 3 ' &H3%
Const mc003C = 4 ' &H4%
Const mc003E = 5 ' &H5%
Const mc0040 = 6 ' &H6%
Const mc0042 = 7 ' &H7%
Const mc00BC = 999 ' &H3E7%
Const mc00DC = 18 ' &H12%
Const mc0122 = 2 ' &H2%
Const m0132 = 0 ' &H0%
Const mc0134 = 4 ' &H4%
Const mc0142 = 36 ' &H24%
Const mc0144 = 46 ' &H2E%
Const mc0146 = 4 ' &H4%
Const mc0148 = 5 ' &H5%
Const mc014A = 2 ' &H2%
Const mc014C = 4 ' &H4%
Const mc0150 = 1 ' &H1%
Const mc0152 = 5 ' &H5%
Const mc0154 = 1 ' &H1%
Const mc0156 = 5 ' &H5%
Const mc0160 = 55 ' &H37%
Const mc0162 = 70 ' &H46%
Const mc0164 = 71 ' &H47%
Const mc0166 = 2 ' &H2%
Const mc016A = 6 ' &H6%
Const mc0180 = 2 ' &H2%
Const mc0182 = 1 ' &H1%
Const mc0186 = 4 ' &H4%
Const m0188 = 0 ' &H0%
Const mc018A = 1 ' &H1%
Const mc01A0 = 4 ' &H4%
Const mc01A8 = 8 ' &H8%
Const mc01BA = 1200 ' &H4B0%
Const m01BC = 0 ' &H0%
Const mc01C8 = 277 ' &H115%
Const mc01D0 = 9 ' &H9%
Const mc0226 = 3 ' &H3%
Const mc0228 = 4 ' &H4%
Const mc022A = 28 ' &H1C%
Const mc022C = 1 ' &H1%
Const mc0230 = 4 ' &H4%
Const mc0232 = 5 ' &H5%
Const mc0234 = 50 ' &H32%
Const mc0236 = 18 ' &H12%
Const mc023C = 10 ' &HA%
Const mc023E = 11 ' &HB%
Const m0240 = 0 ' &H0%
Const mc0242 = 4 ' &H4%
Const mc0244 = 8 ' &H8%
Const mc0246 = 7 ' &H7%
Const mc0248 = 3 ' &H3%
Const mc024A = 52 ' &H34%
Const mc024C = 5 ' &H5%
Const mc024E = 2 ' &H2%
Const mc0250 = 6 ' &H6%
Const mc0252 = 33 ' &H21%
Const mc032C = 18 ' &H12%
Const mc032E = 68 ' &H44%
Const mc0330 = 3 ' &H3%
Const mc0332 = 3 ' &H3%
Const mc0334 = 1 ' &H1%
Const mc0336 = 2 ' &H2%
Const mc0338 = 11 ' &HB%
Const mc033A = 10 ' &HA%
Const mc0340 = 20 ' &H14%
Const mc0342 = 1 ' &H1%
Const mc0346 = 50 ' &H32%
Const mc0348 = 95 ' &H5F%
Const mc034A = 5 ' &H5%
Const mc034C = 1 ' &H1%
Const mc0350 = 4 ' &H4%
Const m03A6 = 0 ' &H0%
Const mc03EE = 2 ' &H2%
Const mc0400 = 15 ' &HF%
Const mc0402 = 200 ' &HC8%
Const m0416 = 0 ' &H0%
Const mc0418 = 1 ' &H1%
Const mc041A = 10 ' &HA%
Const mc041C = 2 ' &H2%
Const mc0436 = 255 ' &HFF%
Const mc0438 = 7 ' &H7%
Const mc043A = 3 ' &H3%
Const mc043C = 2 ' &H2%
Const mc043E = 75 ' &H4B%
Const mc0440 = 100 ' &H64%
Const mc0448 = 5 ' &H5%
Const mc049C = 9 ' &H9%
Const mc04A2 = 365 ' &H16D%
Const mc04A4 = 7 ' &H7%
Const mc04A6 = 9 ' &H9%
Const mc04AC = 6 ' &H6%
Const m04AE = 0 ' &H0%
Const mc04B0 = 1 ' &H1%
Const mc04B2 = 47 ' &H2F%
Const mc04B6 = 51 ' &H33%
Const mc04BA = 5 ' &H5%
Const m04BC = 0 ' &H0%
Const mc04BE = 38 ' &H26%
Const mc04C0 = 1 ' &H1%
Const mc04C2 = 4 ' &H4%
Const mc04C4 = 1 ' &H1%
Const mc04C6 = 39 ' &H27%
Const mc04C8 = 2 ' &H2%
Const mc04CA = 8 ' &H8%
Const mc04CC = 37 ' &H25%
Const mc04CE = 12 ' &HC%
Const mc04D0 = 40 ' &H28%
Const mc04D2 = 5 ' &H5%
Const mc04D6 = 49 ' &H31%
Const mc04D8 = 13 ' &HD%
Const m04E0 = 0 ' &H0%
Const mc04E4 = 12 ' &HC%
Const mc04E6 = 34 ' &H22%
Const mc04E8 = 56 ' &H38%
Const mc0538 = 5 ' &H5%
Const mc0542 = 1 ' &H1%
Const mc0544 = 2 ' &H2%
Const mc0546 = 43 ' &H2B%
Const mc0548 = 35 ' &H23%
Const mc054A = 3 ' &H3%
Const mc054C = 4 ' &H4%
Const mc054E = 5 ' &H5%
Const mc0550 = 44 ' &H2C%
Const mc0552 = 6 ' &H6%
Const mc0554 = 29 ' &H1D%
Const mc0556 = 4 ' &H4%
Const mc0564 = 14 ' &HE%
Const mc056A = 1 ' &H1%
Const m056C = 0 ' &H0%
Const mc056E = 2 ' &H2%
Const mc0574 = 7 ' &H7%
Const mc0576 = 7 ' &H7%
Const mc0578 = 11 ' &HB%
Const mc057A = 3 ' &H3%
Const mc057C = 8 ' &H8%
Const mc057E = 48 ' &H30%
Const mc0580 = 9 ' &H9%
Const mc0582 = 28 ' &H1C%
Const mc0584 = 2 ' &H2%
Const mc058A = 10 ' &HA%
Const mc0596 = 3 ' &H3%
Const mc059A = 41 ' &H29%
Const mc05A4 = 10 ' &HA%
Const mc05A6 = 61 ' &H3D%
Const mc05A8 = 63 ' &H3F%
Const mc05CC = 28 ' &H1C%
Const mc05EA = 4 ' &H4%
Const mc05EC = 1 ' &H1%
Const mc05EE = 3 ' &H3%
Const mc05F0 = 2 ' &H2%
Const mc05F2 = 2 ' &H2%
Const mc05F4 = 1 ' &H1%
Const mc0614 = 13 ' &HD%
Const mc0622 = 45 ' &H2D%
Const mc0626 = 32 ' ? &H 0020 00CC
Const mc062C = 2 ' &H2%
Const mc0640 = 2 ' &H2%
Const mc0650 = 64 ' &H40%
Const mc0658 = 100 ' &H64%
Const mc065A = 100 ' &H64%
Const mc0674 = 60 ' &H3C%
Const mc0678 = 12 ' &HC%

Sub sub0CDF (ByVal pv00A8 As Integer ' 81, p00AA As Integer ' 41, p00AC As Integer ' 41, p00AE As Single ' 43)
Dim l00B0 As Long ' 82
Dim l00B2 As Single ' 83
' Const mc00BC = 999 ' &H3E7%
    If  p00AA > False Then
        l00B2 = 1 + (gv14C2(pv00A8).M5584(gv14C2(pv00A8).M58BB).M4E82 / mc00BC) * 3
        l00B0 = ((((p00AA) * (.9# - (Log(p00AA + 1) / 10))) * (5 + (gv14F6(p00AC).M5A7C / 10)) * (2 - ((Log(p00AA) / 10)))) * p00AE) / l00B2
        sub0F11 pv00A8, l00B0
    End If
End Sub

Function fn0FF5 (p00C8 As Integer ' 41) As Integer ' 1
Dim l00CA As Integer ' 81
Dim l00CC As Integer ' 81
Dim l00CE As Integer ' 81
Dim l00D0 As Integer ' 81
Dim l00D2 As Integer ' 81
Dim l00D4() As Integer ' 91
Dim l00DA As Integer ' 81
' Const mc00DC = 18 ' &H12%
Dim l00E0 ' 80
    ReDim l00D4(0)    As Integer
    l00CC = -1
    l00CE = -1
    l00CA = 0
    Do
        l00CE = Int(Rnd * mc00DC)
        If  fn0380(l00CE, gv14F6(p00C8).M5A40) = False Then
            l00CE = -1
            l00CA = l00CA + 1
        End If
        If  l00CA > 1000 Then
            Exit Do
        End If
    Loop Until l00CE <> -1
    If  l00CA > 1000 Then
        fn0FF5 = -1
        Exit Function
    End If
    l00CA = 0
    l00D0 = gv14F6(p00C8).M5693 + 1
    l00D2 = gv14F6(p00C8).M5693 - (gv14F6(p00C8).M5693 / 3)
    If  l00D2 < 1 Then l00D2 = 1
    For l00E0 = 0 To gv1BF8 - 1
        If  gv152A(l00E0).M5709 = l00CE Then
            If  gv152A(l00E0).M4E82 >= l00D2 And gv152A(l00E0).M4E82 <= l00D0 Then
                l00DA = l00DA + 1
                If  (l00DA - 1) > UBound(l00D4) Then
                    ReDim Preserve l00D4(UBound(l00D4) + 1)
                End If
                l00D4(l00DA - 1) = l00E0
            End If
        End If
    Next l00E0
    If  l00DA = 0 Then
        fn0FF5 = -1
        Exit Function
    End If
    If  Int(Rnd * 100) < 10 Then
        fn0FF5 = -1
        Exit Function
    End If
    If  InStr(gv1662(gv14F6(p00C8).M4ED4).M548B, "Mage") = False Then
        If  Rnd * 100 < 50 Then
            fn0FF5 = -1
            Exit Function
        End If
    End If
    l00CC = Int(Rnd * l00DA)
    If  gv152A(l00D4(l00CC)).M5B33 > 0 And gv152A(l00D4(l00CC)).M5B41 > 0 Then
        fn0FF5 = l00D4(l00CC)
        sub1005 l00CC
    Else
        fn0FF5 = -1
    End If
End Function

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

Function fn0B6C (ByVal pv016E As Integer ' 81, p0170 As Integer ' 41, p0172 As Integer ' 41) As Integer ' 1
Dim l0176 ' 80
Dim l0178 As Integer ' 81
Dim l017A As Integer ' 81
Dim l017C As Integer ' 81
Dim l017E As Integer ' 81
' Const mc0180 = 2 ' &H2%
' Const mc0182 = 1 ' &H1%
' Const mc0186 = 4 ' &H4%
' Const m0188 = 0 ' &H0%
' Const mc018A = 1 ' &H1%
    On Error GoTo L1A484
    If  gv14C2(pv016E).M58CB(p0170).M57E1 <= 0 And p0172 = False Then
        Exit Function
    End If
    l0178 = gv14C2(pv016E).M58CB(p0170).M4ED4
    If  Abs(gv14F6(l0178).M4EBF - gv14C2(pv016E).M4EBF) > 1 Then l017A = True
    If  gv14F6(l0178).M4EBF = mc0180 And (Rnd * 100) < 75 Then l017A = True
    If  gv14F6(l0178).M4EBF = mc0182 And (Rnd * 100) < 15 Then l017A = True
    If  p0172 Then l017A = True
    If  fn0DCD(-1) > -1 Then
        l017E = True
        If  Abs(gv1E38(0).M4EBF - gv14F6(l0178).M4EBF) > 1 Then
            If  gv1A86 = gv1A82 Then
                sub085B "Your companion refuses to join the current monsters!"
            Else
                sub085B Chr(34) + RTrim(gv14C2(gv1A86).M548B) + Chr(34) + " - Your companion refuses to join the current monsters!"
            End If
            Exit Function
        End If
    End If
    If  l017A Then
        For l0176 = 0 To mc0186 - 1
            If  gv1E38(l0176).M4EDC = 0 Then
                l017C = True
                gv1E38(l0176).M4ED4 = l0178
                gv1E38(l0176).M4F01 = l0178
                gv1E38(l0176).M4EEE = m0188
                gv1E38(l0176).M4EDC = 1
                gv1E38(l0176).M4EF9 = False
                gv1E38(l0176).M4E97 = gv14C2(pv016E).M58CB(p0170).M4E97
                gv1E38(l0176).M4EA1 = gv14C2(pv016E).M58CB(p0170).M4EA1
                gv1E38(l0176).M4EAC = gv14C2(pv016E).M58CB(p0170).M4EAC
                gv1E38(l0176).M4EB4 = gv14C2(pv016E).M58CB(p0170).M4EB4
                gv1E38(0).M4ECC = mc018A
                gv1E38(l0176).M4EBF = gv14C2(pv016E).M58CB(p0170).M4EBF
                gv1E38(l0176).M4EE6 = Timer
                Exit For
            End If
        Next l0176
    End If
    If  l017C = True Then
        gv14C2(pv016E).M58CB(p0170).M4ED4 = -1
        If  pv016E = gv1A82 Then
            If  p0172 Then
                sub085B "You've attacked " + fn1235(pv016E, p0170) + "!"
            Else
                sub085B fn1235(pv016E, p0170) + " has turned on you!"
            End If
        Else
            sub085B Chr$(34) + RTrim(gv14C2(pv016E).M548B) + Chr$(34) + ": " + fn1235(pv016E, p0170) + " has turned on the party!"
        End If
        sub0B82 pv016E
        frmDungeonMain!picMonGroups.Visible = True
        sub0B9B
        sub0BAA gv1D68
        sub0BBA gv1D68
        sub0BCD
        If  l017E = False Then
            frmDungeonMain!timCombat.Enabled = False
            sub0A64 gc1DBA
            frmDungeonMain!timCombat.Enabled = True
        End If
        sub0BDE -1
        sub0BF1
        fn0B6C = True
    End If
    Exit Function

L1A484:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monCheckCompAttack."
    Resume L1A4F2
L1A4F2:
End Function

Sub sub0C00 (ByVal pv0190 As Integer ' 81)
Dim l0192 ' 80
Dim l019A As Single ' 83
Dim l019C As Single ' 83
Dim l019E As Single ' 83
' Const mc01A0 = 4 ' &H4%
' Const mc01A8 = 8 ' &H8%
    For l0192 = 0 To mc01A0 - 1
        If  gv14C2(pv0190).M58CB(l0192).M4ED4 > -1 And gv14C2(pv0190).M58CB(l0192).M4EAC > 0 Then
            If  gv14C2(pv0190).M58CB(l0192).M57E1 < gc1D78 Then
                If  gv14C2(pv0190).M58CB(l0192).M57E1 < 0 Then
                    l019E = (((gv14C2(pv0190).M58CB(l0192).M4EB4) - (gv14C2(pv0190).M58CB(l0192).M4EAC)) / (gv14C2(pv0190).M58CB(l0192).M4EB4)) * 15
                Else
                    l019C = (gv14F6(gv14C2(pv0190).M58CB(l0192).M4ED4).M5A7C / Log(3)) * 2
                    l019A = ((fn131D(pv0190) / Log(12))) * Abs(gv14C2(pv0190).M58CB(l0192).M57E1 / 2)
                    l019E = l019C - l019A
                End If
                If  gv14C2(pv0190).M58CB(l0192).M57E1 < 0 Then
                    If  l019E < .5# Then l019E = .5#
                Else
                    If  l019E < 1 Then l019E = 1
                End If
                If  Rnd * 200 < l019E Then
                    If  gv14C2(pv0190).M58CB(l0192).M57E1 > 0 Then
                        gv14C2(pv0190).M58CB(l0192).M57E1 = gv14C2(pv0190).M58CB(l0192).M57E1 - 1
                    Else
                        gv14C2(pv0190).M58CB(l0192).M57E1 = gv14C2(pv0190).M58CB(l0192).M57E1 + 1
                    End If
                    If  gv14C2(pv0190).M58CB(l0192).M57E1 >= 0 Then
                        sub085B Chr(34) + RTrim(gv14C2(pv0190).M548B) + Chr(34) + " - " + fn1235(pv0190, l0192) + " has broken a level of binding!"
                    Else
                        sub085B Chr(34) + RTrim(gv14C2(pv0190).M548B) + Chr(34) + " - " + fn1235(pv0190, l0192) + " is becoming restless!"
                    End If
                    sub0B82 pv0190
                    If  gv1EBC.M57D4 >= 0 Then
                        If  Len(frmCharStat1!lblCall.Tag) Then
                            If  CInt(Left(frmCharStat1!lblCall.Tag, 1)) = mc01A8 Then
                                frmCharStat1!picTabPicture.Refresh
                            End If
                        End If
                    End If
                End If
                If  Rnd * 200 < fn0D78(pv0190, l0192) Or gv14C2(pv0190).M58CB(l0192).M57E1 = 0 Then
                    If  fn0B6C(pv0190, l0192, False) = False Then
                        gv14C2(pv0190).M58CB(l0192).M4ED4 = -1
                        If  pv0190 = gv1A82 Then
                            sub085B fn1235(pv0190, l0192) + " Left!"
                        Else
                            sub085B Chr$(34) + RTrim(gv14C2(pv0190).M548B) + Chr$(34) + ": " + fn1235(pv0190, l0192) + " Left!"
                        End If
                        sub0B82 pv0190
                    End If
                End If
            End If
        End If
    Next l0192
End Sub

Sub sub0A91 (p01AA ' 40)
Dim l01AC ' 80
Dim l01B0 As Integer ' 81
Dim l01B2 As Single ' 83
Dim l01B4 As Single ' 83
Dim l01B6 As Integer ' 81
Dim l01B8 ' 80
' Const mc01BA = 1200 ' &H4B0%
' Const m01BC = 0 ' &H0%
    If  gv14C2(gv1A86).M5470 = 0 Then
        Exit Sub
    End If
    For l01AC = 0 To UBound(gv14C2)
        gv1E7C(l01AC) = -1
    Next l01AC
    sub0C15
    frmDungeonMain!timCombat.Enabled = False
    frmDungeonMain!lblCharacterHit.Caption = ""
    frmDungeonMain!lblMonsterHit.Caption = ""
    gv1E66(gv1A86).M547A = False
    If  fn0E38(p01AA) = False Then
        sub085B "Error reading monsters!"
        Exit Sub
    End If
    l01B0 = True
    For l01AC = 0 To mc0186 - 1
        If  gv1E38(l01AC).M4EDC > 0 Then
            l01B0 = False
            Exit For
        End If
    Next l01AC
    l01B4 = mc01BA + ((5 * (gv14C2(m01BC).M5470 / 2)) * 60)
    l01B4 = l01B4 - ((gv1864.M5CF4 - fn0DDC()) * 5)
    If  l01B4 < (mc01BA / 10) Then l01B4 = (mc01BA / 10)
    sub0BBA -1
    If  l01B0 = False Then
        If  (Abs(Timer - gv1E38(0).M4EE6) > (l01B4 * 2) Or gv1E38(0).M4EE6 = 0) And p01AA > 0 Then
            l01B0 = True
        End If
    End If
    If  l01B0 = True Then
        If  (Abs(Timer - gv1E38(0).M4EE6) > l01B4 Or gv1E38(0).M4EE6 = 0) And p01AA > 0 Then
            l01B2 = gv1E38(0).M4EE6
            If  fn0DCD(-1) = -1 Then l01B6 = True
            If  fn0D4D(p01AA) = False Then
                sub085B "Error generating monsters!"
            Else
                If  l01B2 <> 0 And l01B6 = True Then
                    sub0C29 (fn0DDC() + 1)
                End If
                For l01B8 = False To mc0186 - 1
                    If  gv1E38(l01B8).M4EDC > False Then
                        sub06FE gv1E38(l01B8), False, False, True, gv1A86
                    End If
                Next l01B8
            End If
        End If
    Else
    End If
    sub0BDE -1
    sub0B9B
    sub0BAA p01AA
    gv1EB6 = True
    For l01B8 = False To mc0186 - 1
        If  gv1E38(l01B8).M4EDC > False Then
            sub06FE gv1E38(l01B8), False, False, False, gv1A86
        End If
    Next l01B8
    If  fn0DCD(-1) > -1 Then
        frmDungeonMain!picMonGroups.Visible = True
        gv1E66(gv1A86).M547A = fn0DCD(-1)
        sub0BBA p01AA
        sub0BCD
        sub0BF1
    Else
        sub0BBA -1
    End If
    gv1EB6 = False
End Sub

Function fn0C3B (p01C4 As Integer ' 41, p01C6 As Integer ' 41) As Integer ' 1
' Const mc01C8 = 277 ' &H115%
    If  p01C6 >= False And p01C4 > False Then
        Select Case gv14F6(p01C6).M5467
            Case mc01C8
                fn0C3B = True
            Case Else
        End Select
    End If
End Function

Sub sub0C53 ()
Dim l01CA ' 80
' Const mc01D0 = 9 ' &H9%
Dim l01D2 As Currency ' 85
    frmDungeonMain!picMonGroups.Visible = False
    frmDungeonMain!lblCharacterHit.Caption = ""
    For l01CA = False To mc0186 - 1
        frmDungeonMain!lblMonster(l01CA).Caption = ""
        frmDungeonMain!lblMonster(l01CA).Refresh
    Next l01CA
    frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc01D0)
    If  gv1E38(0).M4ED4 = -1 Then Exit Sub
    If  fn0C3B(1, gv1E38(0).M4ED4) = True Then
        sub0C61 gv1E38(0).M4ED4
        gv1E38(0).M4ED4 = -1
        sub0980
    End If
    gv1E38(0).M4ED4 = -1
    gv1E38(0).M4EE6 = Timer
    gv1E38(0).M4EF9 = False
    l01CA = fn0F88(gv1D68)
    sub0C29 (fn0DDC() - 1)
    sub0BBA -1
    sub0B9B
    sub0BCD
    If  gv1E50.M4F1B = False Then
        l01D2 = fn0DBF()
    Else
        If  frmDungeonMain!lblTrap.Visible = False Then
            sub0BAA gv14C2(m01BC).M59BB
        End If
    End If
    sub0BF1
    l01CA = fn09A4(False, False)
End Sub

Sub sub0C79 (p01D6 ' 40)
Dim l01D8 ' 80
Dim l01DA As Integer ' 81
Dim l01DE As T4E8B ' 8A
Dim l01E2 As T4F0B ' 8A
    For l01D8 = 0 To mc0186 - 1
        gv1E38(l01D8) = l01DE
    Next l01D8
    gv1E50 = l01E2
    l01DA% = fn0F88(p01D6)
End Sub

Sub sub0C8A (ByVal pv01E4 As Integer ' 81)
' called (ByVal p1%, p2%)
Dim l01E8 ' 80
Dim l01EA As Integer ' 81
Dim l01EE As Integer ' 81
Dim l01F0 As Integer ' 81
Dim l01F2 ' 80
Dim l01F8 As String ' 87
Dim l01FA As Integer ' 81
Dim l01FC As Integer ' 81
Dim l01FE As Integer ' 81
Dim l0204 ' 80
Dim l0206 As Integer ' 81
Dim l0208 As Integer ' 81
Dim l020A ' 80
Dim l020C As Integer ' 81
Dim l020E As Integer ' 81
Dim l0210 As Single ' 83
Dim l0212 ' 80
Dim l0214 As Integer ' 81
Dim l0216 As Integer ' 81
Dim l0218 As Integer ' 81
Dim l021A As Integer ' 81
Dim l021C As Integer ' 81
Dim l0220 As Integer ' 81
Dim l0222 As Single ' 83
Dim l0224 As Integer ' 81
' Const mc0226 = 3 ' &H3%
' Const mc0228 = 4 ' &H4%
' Const mc022A = 28 ' &H1C%
' Const mc022C = 1 ' &H1%
' Const mc0230 = 4 ' &H4%
' Const mc0232 = 5 ' &H5%
' Const mc0234 = 50 ' &H32%
' Const mc0236 = 18 ' &H12%
' Const mc023C = 10 ' &HA%
' Const mc023E = 11 ' &HB%
' Const m0240 = 0 ' &H0%
' Const mc0242 = 4 ' &H4%
' Const mc0244 = 8 ' &H8%
' Const mc0246 = 7 ' &H7%
' Const mc0248 = 3 ' &H3%
' Const mc024A = 52 ' &H34%
' Const mc024C = 5 ' &H5%
' Const mc024E = 2 ' &H2%
' Const mc0250 = 6 ' &H6%
' Const mc0252 = 33 ' &H21%
    On Error GoTo L1E8F6
    For l01E8 = 0 To mc01A0 - 1
        If  gv14C2(pv01E4).M58CB(l01E8).M4ED4 > 0 And gv14C2(pv01E4).M58CB(l01E8).M4EAC > 0 Then
            l01EA = l01EA + 1
        End If
    Next l01E8
    If  l01EA = 0 Then
        Exit Sub
    End If
    If  gv1E66(pv01E4).M547A = -1 Or frmDungeonMain!timCombat.Enabled = False Then
        Exit Sub
    End If
    If  gv1E38(gv1E66(pv01E4).M547A).M4EDC < 1 Then
        gv1E66(pv01E4).M547A = fn0DCD(-1)
        Exit Sub
    End If
    l01EA = False
    For l0204 = 0 To mc01A0 - 1
        l0214 = -1
        l0216 = -1
        If  gv14C2(pv01E4).M58CB(l0204).M4ED4 > 0 And gv14C2(pv01E4).M58CB(l0204).M4EAC > 0 Then
            l0206 = -1
            If  fn0380(mc0226, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True Or fn0380(mc0228, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True And l0208 = False Then
                l01FC = gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A7C
                l01FE = 50
                If  gv14F6(gv1E38(0).M4ED4).M5A7C > (l01FC + (l01FC / 4)) Then
                    l01FE = 80
                End If
                If  gv14F6(gv1E38(0).M4ED4).M5A7C < (l01FC - (l01FC / 4)) Then
                    l01FE = 20
                End If
                If  Int(Rnd * 100) < l01FE Then
                    l0224 = fn0D64(pv01E4, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv1DBE)
                    If  l0224 <> False Then
                        l0214 = (l0224 - 1)
                        l01F0 = fn0E4A(gv1DBE, gv14C2(pv01E4).M58CB(l0204).M4ED4, -(l0214 + 1))
                        If  l01F0 > 0 Then
                            If  (gv1A66.M5F48 = True And l0214 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub09DE mc022A
                            End If
                            If  l0214 = gv1A86 Then
                                frmDungeonMain!lblMonsterHit.Visible = True
                                frmDungeonMain!lblMonsterHit.Caption = "You were accidently Breathed on for" + Str$(l01F0) + "!"
                                frmDungeonMain!lblMonsterHit.Refresh
                                sub07E2 .25#
                            End If
                            sub0CA0 l0214, l01F0
                            If  gv14C2(l0214).M4EAC < 1 Then
                                sub091E l0214, mc022C
                                Exit Sub
                            End If
                            sub08A9 False, 7
                        End If
                        l01F8 = ""
                        For l01E8 = 0 To mc01A0 - 1
                            If  gv14C2(l0214).M58CB(l01E8).M4ED4 > -1 And gv14C2(l0214).M58CB(l01E8).M4EAC > 0 Then
                                l01F8 = " and " + fn1286(l0214) + " companions"
                                l01F0 = fn0E4A(gv1DBE, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv14C2(l0214).M58CB(l01E8).M4ED4)
                                gv14C2(l0214).M58CB(l01E8).M4EAC = gv14C2(l0214).M58CB(l01E8).M4EAC - l01F0
                                If  gv14C2(l0214).M58CB(l01E8).M4EAC < 0 Then
                                    If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                        extsub05E7
                                        sub0CB7 gv14C2(l0214).M58CB(l01E8).M4ED4
                                    End If
                                    gv14C2(l0214).M58CB(l01E8).M4EAC = 0
                                    sub0CCC l0214
                                End If
                            End If
                        Next l01E8
                        sub0B82 l0214
                        sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently breathed on " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + l01F8 + "!"
                    Else
                        For l020A = 0 To mc0186 - 1
                            If  gv1E38(l020A).M4EDC > 0 Then
                                l020C = False
                                Do
                                    l01F0 = fn0E4A(gv1DBE, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv1E38(l020A).M4ED4)
                                    l01FA = gv1E38(l020A).M4EAC
                                    If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                        If  l01F0 > False Then
                                            sub09DE mc022A
                                        End If
                                    End If
                                    gv1E38(l020A).M4EAC = gv1E38(l020A).M4EAC - l01F0
                                    If  gv1E38(l020A).M4EAC < False Then
                                        gv1E38(l020A).M4EAC = False
                                    End If
                                    If  gv1E38(l020A).M4EAC < False Then
                                        gv1E38(l020A).M4EAC = False
                                    End If
                                    sub0CDF pv01E4, l01FA - gv1E38(l020A).M4EAC, gv1E38(l020A).M4ED4, gc1D70
                                    If  gv1E38(l020A).M4EAC <= False Then
                                        sub0CF3 gv1E38(l020A).M4ED4
                                        gv1E38(l020A).M4EDC = gv1E38(l020A).M4EDC - 1
                                        l020C = l020C + 1
                                        sub0D08 pv01E4
                                    Else
                                        Exit Do
                                    End If
                                Loop While gv1E38(l020A).M4EDC > 0 And l020C <= mc0230
                            End If
                        Next l020A
                    End If
                    If  l020C > False Then
                        l0208 = True
                    End If
                End If
            End If
            l0214 = -1
            l0216 = -1
            l0224 = fn0D64(pv01E4, gv14C2(pv01E4).M58CB(l0204).M4ED4, gc1DC2)
            If  l0224 <> False Then
                l0214 = (l0224 - 1)
                l0216 = fn0DAB(pv01E4, gv14C2(pv01E4).M58CB(l0204).M4ED4, gc1DC2)
            End If
            If  fn0380(mc0232, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True Then
                If  l0214 > -1 Then
                    If  l0216 = -1 Then
                        l01F0 = fn0E4A(gc1DC4, gv14C2(pv01E4).M58CB(l0204).M4ED4, -(l0214 + 1))
                        If  l01F0 > 0 Then
                            sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently spit on " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + l01F8 + "!"
                            If  (gv1A66.M5F48 = True And l0214 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub09DE mc0234
                            End If
                            If  l0214 = gv1A86 Then
                                frmDungeonMain!lblMonsterHit.Visible = True
                                frmDungeonMain!lblMonsterHit.Caption = "You were accidently Spit on for" + Str$(l01F0) + "!"
                                frmDungeonMain!lblMonsterHit.Refresh
                                sub07E2 .25#
                            End If
                            sub0CA0 l0214, l01F0
                            If  gv14C2(l0214).M4EAC < 1 Then
                                sub091E l0214, mc022C
                                Exit Sub
                            End If
                            sub08A9 False, 7
                        End If
                    Else
                        l01F0 = fn0E4A(gc1DC4, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv14C2(l0214).M58CB(l0216).M4ED4)
                        If  l01F0 > 0 Then
                            sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently spit on " + fn1235(l0214, l0216) + " belonging to " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + "!"
                            gv14C2(l0214).M58CB(l0216).M4EAC = gv14C2(l0214).M58CB(l0216).M4EAC - l01F0
                            If  gv14C2(l0214).M58CB(l0216).M4EAC < 0 Then
                                If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                    extsub05E7
                                    sub0CB7 gv14C2(l0214).M58CB(l0216).M4ED4
                                End If
                                gv14C2(l0214).M58CB(l0216).M4EAC = 0
                                sub0CCC l0214
                            End If
                            sub0B82 l0214
                        End If
                    End If
                Else
                    l020A = gv1E66(pv01E4).M547A
                    If  gv1E38(l020A).M4EDC > 0 Then
                        l01F0 = fn0E4A(gc1DC4, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv1E38(l020A).M4ED4)
                        l01FA = gv1E38(l020A).M4EAC
                        If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                            If  l01F0 > False Then
                                sub09DE mc0234
                            End If
                        End If
                        gv1E38(l020A).M4EAC = gv1E38(l020A).M4EAC - l01F0
                        If  gv1E38(l020A).M4EAC < False Then
                            gv1E38(l020A).M4EAC = False
                        End If
                        sub0CDF pv01E4, l01FA - gv1E38(l020A).M4EAC, gv1E38(l020A).M4ED4, gc1D70
                        If  gv1E38(l020A).M4EAC <= 0 Then
                            sub0CF3 gv1E38(l020A).M4ED4
                            gv1E38(l020A).M4EDC = gv1E38(l020A).M4EDC - 1
                            sub0D08 pv01E4
                        End If
                    End If
                End If
            End If
            If  fn0EEF() <= False Then
                If  gv14C2(pv01E4).M56B9(mc0122) > 0 Then
                    sub0D1D pv01E4, 1, 0
                    sub08A9 False, 12
                End If
                sub0C53
                Exit Sub
            End If
            sub0BBA 0
            If  gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A40 > 0 And l01EA = False Then
                If  fn0380(mc0236, fn0AD3(fn0AE8(gv14C2(pv01E4)))) = False Then
                    l0206 = fn0FF5(gv14C2(pv01E4).M58CB(l0204).M4ED4)
                    If  l0206 > -1 Then
                        l01EA = l01EA + 1
                        l0224 = fn0D64(pv01E4, gv14C2(pv01E4).M58CB(l0204).M4ED4, gc1DC0)
                        If  l0224 <> False Then
                            l0214 = (l0224 - 1)
                            l01F0 = fn0E5F(pv01E4, l0206, -2, l0204, l0214)
                            If  l01F0 > 0 Then
                                If  l0214 = gv1A86 Then
                                    frmDungeonMain!lblMonsterHit.Visible = True
                                    frmDungeonMain!lblMonsterHit.Caption = "You were accidently damaged for" + Str$(l01F0) + "!"
                                    frmDungeonMain!lblMonsterHit.Refresh
                                    sub07E2 .25#
                                End If
                                sub0CA0 l0214, l01F0
                                If  gv14C2(l0214).M4EAC < 1 Then
                                    sub091E l0214, mc022C
                                    Exit Sub
                                End If
                                sub08A9 False, 7
                            End If
                            For l0212 = 0 To gv152A(l0206).M5B1D
                                If  l0212 > mc01A0 - 1 Then Exit For
                                l01F8 = ""
                                If  gv14C2(l0214).M58CB(l0212).M4ED4 > -1 And gv14C2(l0214).M58CB(l0212).M4EAC > 0 Then
                                    l01F8 = " and " + fn1286(l0214) + " companions"
                                    gv14C2(l0214).M58CB(l0212).M4EAC = gv14C2(l0214).M58CB(l0212).M4EAC - fn0E5F(pv01E4, l0206, -(3 + l0212), l0204, l0214)
                                    If  gv14C2(l0214).M58CB(l0212).M4EAC < 1 Then
                                        If  (gv1A66.M5F48 = True And l0214 = gv1A86) Or gv1A66.M5F48 = False Then
                                            extsub05E7
                                            sub0CB7 gv14C2(l0214).M58CB(l0212).M4ED4
                                        End If
                                        gv14C2(l0214).M58CB(l0212).M4EAC = 0
                                        sub0CCC l0214
                                    End If
                                End If
                                sub0B82 l0214
                            Next l0212
                            sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently cast " + Chr(34) + gv152A(l0206).M548B + Chr(34) + " on " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + l01F8 + "!"
                        Else
                            l0224 = fn1173(pv01E4, l0206, False, l0204)
                        End If
                    End If
                End If
            End If
            If  l0206 = -1 Then
                l0222 = 1
                l0218 = gv14C2(pv01E4).M58CB(l0204).M4E97
                l021C = gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M55B5(m0132)
                l0220 = gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A7C
                If  l0214 = -1 Then
                    l021A = gv1E38(gv1E66(pv01E4).M547A).M4EA1
                Else
                    If  l0216 = -1 Then
                        l021A = gv14C2(l0214).M4EA1
                    Else
                        l021A = gv14C2(l0214).M58CB(l0216).M4EA1
                    End If
                End If
                l01EE = 1
                For l01F2 = 1 To l01EE
                    If  l0216 > -1 Then
                        If  gv14C2(l0214).M58CB(l0216).M4ED4 = -1 Or gv14C2(l0214).M58CB(l0216).M4EAC = 0 Then Exit For
                    End If
                    l0222 = l0222 * gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M56F7
                    If  fn0380(mc023C, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True Then
                        l0210 = (((Log((gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A7C / 650) + 1) * 100) * Log((gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5693 + 1))))
                        If  l0214 = -1 Then
                            l0210 = l0210 - (((Log((gv14F6(gv1E38(gv1E66(pv01E4).M547A).M4ED4).M5A7C / 999) + 1)) * 100))
                        Else
                            If  l0216 = -1 Then
                                l0210 = l0210 - (((Log((fn131D(l0214) / 999) + 1)) * 100))
                            Else
                                l0210 = l0210 - (((Log((gv14F6(gv14C2(l0214).M58CB(l0216).M4ED4).M5A7C / 999) + 1)) * 100))
                            End If
                        End If
                        If  l0210 < 2 Then l0210 = 2
                        If  l0210 > 50 Then l0210 = 50
                        l01FC = Int(Rnd * 100) + 1
                        If  l01FC <= l0210 Then
                            l0222 = l0222 + 4
                        End If
                    End If
                    If  fn0380(mc023E, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True Then
                        l0210 = (((Log((gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A7C / 500) + 1) * 100) * Log((gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5693 + 1))))
                        If  l0214 = -1 Then
                            l0210 = l0210 - (((Log((gv14F6(gv1E38(gv1E66(pv01E4).M547A).M4ED4).M5A7C / 999) + 1)) * 100))
                        Else
                            If  l0216 = -1 Then
                                l0210 = l0210 - (((Log((fn131D(l0214) / 999) + 1)) * 100))
                            Else
                                l0210 = l0210 - (((Log((gv14F6(gv14C2(l0214).M58CB(l0216).M4ED4).M5A7C / 999) + 1)) * 100))
                            End If
                        End If
                        If  l0210 < 4 Then l0210 = 4
                        If  l0210 > 75 Then l0210 = 75
                        l01FC = Int(Rnd * 100) + 1
                        If  l01FC <= l0210 Then
                            l0222 = l0222 + 1
                        End If
                    End If
                    If  gv1E38(gv1E66(pv01E4).M547A).M4ED4 < 0 Then Exit Sub
                    If  l0214 = -1 Then
                        If  fn0380(mc0154, gv14F6(gv1E38(gv1E66(pv01E4).M547A).M4ED4).M55BE) = True Then
                            If  fn0380(m0240, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M55BE) = False Then l0222 = l0222 - (l0222 / 2)
                        End If
                    Else
                        If  l0216 = -1 Then
                            If  gv14C2(l0214).M56B9(mc0242) = True Then
                                If  fn0380(m0240, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M55BE) = False Then l0222 = l0222 - (l0222 / 2)
                            End If
                        Else
                            If  fn0380(mc0154, gv14F6(gv14C2(l0214).M58CB(l0216).M4ED4).M55BE) = True Then
                                If  fn0380(m0240, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M55BE) = False Then l0222 = l0222 - (l0222 / 2)
                            End If
                        End If
                    End If
                    l01F0 = fn0DEE(l0218, l021A, l0220, l021C, l0222)
                    If  l0214 = -1 Then
                        l01FA = gv1E38(gv1E66(pv01E4).M547A).M4EAC
                    Else
                        If  l0216 = -1 Then
                            l01FA = gv14C2(l0214).M4EAC
                        Else
                            l01FA = gv14C2(l0214).M58CB(l0216).M4EAC
                        End If
                    End If
                    If  l01F0 < 1 Then
                        l01F2 = l01EE
                    Else
                        If  l0214 = -1 Then
                            gv1E38(gv1E66(pv01E4).M547A).M4EAC = gv1E38(gv1E66(pv01E4).M547A).M4EAC - l01F0
                            If  gv1E38(gv1E66(pv01E4).M547A).M4EAC < False Then gv1E38(gv1E66(pv01E4).M547A).M4EAC = False
                            sub0CDF pv01E4, l01FA - gv1E38(gv1E66(pv01E4).M547A).M4EAC, gv1E38(gv1E66(pv01E4).M547A).M4ED4, gc1D70
                            If  gv1E38(gv1E66(pv01E4).M547A).M4EAC <= 0 Then
                                If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                    sub0CB7 gv1E38(gv1E66(pv01E4).M547A).M4ED4
                                End If
                                sub0CF3 gv1E38(gv1E66(pv01E4).M547A).M4ED4
                                gv1E38(gv1E66(pv01E4).M547A).M4EDC = gv1E38(gv1E66(pv01E4).M547A).M4EDC - 1
                                sub0D08 pv01E4
                            End If
                        Else
                            If  l0216 = -1 Then
                                If  l0214 = gv1A86 Then
                                    frmDungeonMain!lblMonsterHit.Visible = True
                                    frmDungeonMain!lblMonsterHit.Caption = "You were accidently hit for" + Str$(l01F0) + "!"
                                    frmDungeonMain!lblMonsterHit.Refresh
                                    sub07E2 .25#
                                End If
                                sub0CA0 l0214, l01F0
                                sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently hit " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + l01F8 + "!"
                                If  gv14C2(l0214).M4EAC < 1 Then
                                    sub091E l0214, mc022C
                                    Exit Sub
                                End If
                                sub08A9 False, 7
                            Else
                                gv14C2(l0214).M58CB(l0216).M4EAC = gv14C2(l0214).M58CB(l0216).M4EAC - l01F0
                                sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently hit " + fn1235(l0214, l0216) + " belonging to " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + "!"
                                If  gv14C2(l0214).M58CB(l0216).M4EAC < 0 Then
                                    If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                        extsub05E7
                                        sub0CB7 gv14C2(l0214).M58CB(l0216).M4ED4
                                    End If
                                    gv14C2(l0214).M58CB(l0216).M4EAC = 0
                                    sub0CCC l0214
                                    Exit For
                                End If
                            End If
                        End If
                    End If
                    If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                        sub0D35 gv14C2(pv01E4).M58CB(l0204).M4ED4
                    End If
                    If  l01F0 > 0 And gv1E38(gv1E66(pv01E4).M547A).M4EAC > 0 Then
                        If  fn0380(mc0244, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True Then
                            If  l0214 = -1 Then
                                l0210 = gv14F6(gv1E38(gv1E66(pv01E4).M547A).M4ED4).M5548(mc0246)
                            ElseIf l0216 = -1 Then
                                l0210 = gv14C2(l0214).M5548(mc0246)
                            Else
                                l0210 = gv14F6(gv14C2(l0214).M58CB(l0216).M4ED4).M5548(mc0246)
                            End If
                            If  (Int(Rnd * 100) + 1) > l0210 Then
                                If  l0214 = -1 Then
                                    l020E = gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M55B5(mc0248)
                                ElseIf l0216 = -1 Then
                                    l020E = gv14C2(l0214).M55B5(mc0248) + gv14C2(l0214).M584B(mc0248)
                                Else
                                    l020E = gv14F6(gv14C2(l0214).M58CB(l0216).M4ED4).M55B5(mc0248)
                                End If
                                l0210 = Log(l020E) / Log(2.5#)
                                l0210 = ((l020E) * l0210) - (gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5693)
                                If  l0210 > 95 Then l0210 = 95
                                If  Rnd * 100 > l0210 Then
                                    If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                        sub09DE mc024A
                                    End If
                                    If  l0214 = -1 Then
                                        l01FA = gv1E38(gv1E66(pv01E4).M547A).M4EAC
                                        sub0CDF pv01E4, l01FA, gv1E38(gv1E66(pv01E4).M547A).M4ED4, gc1D70
                                        If  pv01E4 = gv1A86 Then
                                            frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc024C)
                                            frmDungeonMain!lblCharacterHit.Caption = fn1235(gv1A86, l0204) + " Stoned one!"
                                            sub07E2 .25#
                                        End If
                                        sub0CF3 gv1E38(gv1E66(pv01E4).M547A).M4ED4
                                        gv1E38(gv1E66(pv01E4).M547A).M4EDC = gv1E38(gv1E66(pv01E4).M547A).M4EDC - 1
                                        sub0D08 pv01E4
                                    ElseIf l0216 = -1 Then
                                        sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently stoned " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + l01F8 + "!"
                                        sub091E l0214, mc024E
                                        Exit Sub
                                    Else
                                        sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently stoned " + fn1235(l0214, l0216) + " belonging to " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + "!"
                                        If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                            extsub05E7
                                            sub0CB7 gv14C2(l0214).M58CB(l0216).M4ED4
                                        End If
                                        gv14C2(l0214).M58CB(l0216).M4EAC = 0
                                        gv14C2(l0214).M58CB(l0216).M4ED4 = -1
                                        sub0CCC l0214
                                        Exit For
                                    End If
                                End If
                            End If
                        End If
                        If  fn0380(mc0250, gv14F6(gv14C2(pv01E4).M58CB(l0204).M4ED4).M5A35) = True Then
                            If  l0214 = -1 Then
                                l01F0 = fn0E4A(gc1DC6, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv1E38(gv1E66(pv01E4).M547A).M4ED4)
                            ElseIf l0216 = -1 Then
                                l01F0 = fn0E4A(gc1DC6, gv14C2(pv01E4).M58CB(l0204).M4ED4, -(l0214 + 1))
                            Else
                                l01F0 = fn0E4A(gc1DC6, gv14C2(pv01E4).M58CB(l0204).M4ED4, gv14C2(l0214).M58CB(l0216).M4ED4)
                            End If
                            If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                If  l01F0 > False Then
                                    sub09DE mc0252
                                End If
                            End If
                            If  l0214 = -1 Then
                                l01FA = gv1E38(gv1E66(pv01E4).M547A).M4EAC
                                gv1E38(gv1E66(pv01E4).M547A).M4EAC = gv1E38(gv1E66(pv01E4).M547A).M4EAC - l01F0
                                If  gv1E38(gv1E66(pv01E4).M547A).M4EAC < False Then
                                    gv1E38(gv1E66(pv01E4).M547A).M4EAC = False
                                End If
                                sub0CDF pv01E4, l01FA - gv1E38(gv1E66(pv01E4).M547A).M4EAC, gv1E38(gv1E66(pv01E4).M547A).M4ED4, gc1D70
                                If  gv1E38(gv1E66(pv01E4).M547A).M4EAC <= 0 Then
                                    If  pv01E4 = gv1A86 Then
                                        frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc024C)
                                        frmDungeonMain!lblCharacterHit.Caption = fn1235(gv1A86, l0204) + " Electrocuted one!"
                                        sub07E2 .25#
                                    End If
                                    sub0CF3 gv1E38(gv1E66(pv01E4).M547A).M4ED4
                                    gv1E38(gv1E66(pv01E4).M547A).M4EDC = gv1E38(gv1E66(pv01E4).M547A).M4EDC - 1
                                    sub0D08 pv01E4
                                End If
                            ElseIf l0216 = -1 Then
                                frmDungeonMain!lblMonsterHit.Visible = True
                                frmDungeonMain!lblMonsterHit.Caption = "You were accidently electrocuted for" + Str$(l01F0) + "!"
                                frmDungeonMain!lblMonsterHit.Refresh
                                sub07E2 .25#
                                sub0CA0 l0214, l01F0
                                If  gv14C2(l0214).M4EAC < 1 Then
                                    sub091E l0214, mc022C
                                    Exit Sub
                                End If
                                sub08A9 False, 7
                                sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently electrocuted " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + l01F8 + "!"
                            Else
                                gv14C2(l0214).M58CB(l0216).M4EAC = gv14C2(l0214).M58CB(l0216).M4EAC - l01F0
                                sub085B RTrim(gv14C2(pv01E4).M548B) + ": " + fn1235(pv01E4, l0204) + " accidently electrocuted " + fn1235(l0214, l0216) + " belonging to " + Chr(34) + RTrim(gv14C2(l0214).M548B) + Chr(34) + "!"
                                If  gv14C2(l0214).M58CB(l0216).M4EAC < 0 Then
                                    If  (gv1A66.M5F48 = True And pv01E4 = gv1A86) Or gv1A66.M5F48 = False Then
                                        extsub05E7
                                        sub0CB7 gv14C2(l0214).M58CB(l0216).M4ED4
                                    End If
                                    gv14C2(l0214).M58CB(l0216).M4EAC = 0
                                    sub0CCC l0214
                                End If
                            End If
                        End If
                    End If
                    If  gv1E38(gv1E66(pv01E4).M547A).M4EDC < 1 Then
                        gv1E66(pv01E4).M547A = fn0DCD(-1)
                        sub0BCD
                    End If
                    If  gv1E66(pv01E4).M547A < 0 Then
                        If  gv14C2(pv01E4).M56B9(mc0122) > 0 Then
                            sub0D1D pv01E4, 1, 0
                            sub08A9 False, 12
                        End If
                        sub0C53
                        Exit Sub
                    End If
                    sub0BBA 0
                Next l01F2
                If  l0216 > -1 Then sub0B82 l0214
            Else
                If  fn0EEF() = False Then
                    If  gv14C2(pv01E4).M56B9(mc0122) > 0 Then
                        sub0D1D pv01E4, 1, 0
                        sub08A9 False, 12
                    End If
                    sub0C53
                    Exit Sub
                End If
                sub0BBA 0
            End If
        End If
    Next l0204
    frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc01D0)
    Exit Sub

L1E8F6:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monCompanionAttack.  Please report."
    Resume L1E974
L1E974:
End Sub

Function fn0D4D (p0256 ' 40) As Integer ' 1
Static m0258 ' 60
Static m025C ' 60
Static m025E As Integer ' 61
Static m0262 As Integer ' 61
Static m0264 As Integer ' 61
Static m0266 As Long ' 62
Static m026A As Single ' 63
Static m026E As Single ' 63
Static m0272 As Integer ' 61
Static m0274 As Integer ' 61
Static m0276 As Single ' 63
Static m027C As Integer ' 61
Static m027E As Single ' 63
Static m0282 As Integer ' 61
Static m0284 As Integer ' 61
Static m0286 ' 60
Static m0288 As Single ' 63
Static m028C As Integer ' 61
Static m028E As Integer ' 61
Static m0290 As Integer ' 61
Static m0292 As Integer ' 61
Static m0294 As Integer ' 61
Static m0296 ' 60
Static m0298 As Integer ' 61
Static m029A As Integer ' 61
Static m029C As Integer ' 61
Static m029E As Integer ' 61
Static m02A0 As Integer ' 61
Static m02A2 As Integer ' 61
Static m02A4 As Long ' 62
Static m02A8 As Single ' 63
Static m02AC As Integer ' 61
Static m02AE As Integer ' 61
Static m02B0 As Integer ' 61
Static m02B2 As Integer ' 61
Static m02B4 As Integer ' 61
Static m02B6() As Integer ' 71
Static m02E8 As Integer ' 61
Static m02EA As Integer ' 61
Static m02EE() As Integer ' 71
Static m0322 As T5D38 ' 6A
' Const mc032C = 18 ' &H12%
' Const mc032E = 68 ' &H44%
' Const mc0330 = 3 ' &H3%
' Const mc0332 = 3 ' &H3%
' Const mc0334 = 1 ' &H1%
' Const mc0336 = 2 ' &H2%
' Const mc0338 = 11 ' &HB%
' Const mc033A = 10 ' &HA%
Static m033C As Integer ' 61
Static m033E As Integer ' 61
' Const mc0340 = 20 ' &H14%
' Const mc0342 = 1 ' &H1%
' Const mc0346 = 50 ' &H32%
' Const mc0348 = 95 ' &H5F%
' Const mc034A = 5 ' &H5%
' Const mc034C = 1 ' &H1%
Static m034E As Integer ' 61
' Const mc0350 = 4 ' &H4%
    If  gv1EB0 = True Then
        Exit Function
    End If
    gv1EB0 = True
    sub0C79 p0256
    On Error GoTo L20CE8
    ReDim m02EE(gv1BF2 - 1)         As Integer
    ReDim v?0306(v?0304 - 1)              As
    m0292 = False
    m02A0 = False
    m0282 = gv14C2(gv1A86).M5470
    If  fn0380(v?031C, fn0AD3(fn0AE8(gv14C2(gv1A86)))) = True Then
        fn0D4D = True
        gv1EB0 = False
        Exit Function
    End If
    If  fn0380(v?031E, fn0AD3(fn0AE8(gv14C2(gv1A86)))) = True Then
        m0282 = m0282 + 1
    End If
    Get #gv1B56, gv1D6E + 2 + (gv1864.M4216 * gv1864.M420C) + gv14C2(gv1A86).M59BB, m0322
    m0266 = m0322.M5D45
    sub0C79 p0256

L1EB02:
    m0294 = -1
    m025E = -1
    m0284 = -1
    If  m0266 = False Then
        gv1EB0 = False
        fn0D4D = True
        Exit Function
    End If
    m0276 = Timer
    If  m0322.M5D55 > False Then
        If  (Rnd * 100) <= gc1DC8 Then
            For m0296 = 0 To v?0304 - 1
                If  gv14F6(m0296).M5467 = m0322.M5D55 Then
                    m0294 = m0296
                    Exit For
                End If
            Next m0296
            GoTo L1F688
        End If
    End If
    If  gv14C2(gv1A86).M5470 = 1 And gv14C2(gv1A86).M59BB < mc032C Then
        m0264 = True
    Else
        m0264 = False
    End If
    If  (Int(Rnd * 100) + 1) < 2 And m0264 = False Then
        m025E = Int(Rnd * gv1BF2)
    Else
        m02EA = 0
        For m0296 = 0 To gv1BF2 - 1
            If  fn0380(m0296, m0266) = True Then
                If  gv1DD2(m0296, 0) <> -1 Then
                    m02EE(m02EA) = m0296
                    m02EA = m02EA + 1
                End If
            End If
        Next m0296
        If  m02EA = 0 Then
            m025E = Int(Rnd * gv1BF2)
        End If
    End If
    m027C = False
    m026A = Int(Rnd * 100) + 1
    If  m026A < 50 Then
        m027C = 1
        ElseIf m026A < 30 Then
        m027C = 2
        ElseIf m026A < 10 Then
        m027C = 3
    End If
    m027C = m027C + gv14C2(gv1A86).M5470 / 5
    If  fn0380(v?031E, fn0AD3(fn0AE8(gv14C2(gv1A86)))) = True Then
        If  Rnd * 75 < 50 Then
            m027C = 1
        End If
    End If
    If  m027C > gv14C2(gv1A86).M5470 Then
        m027C = gv14C2(gv1A86).M5470
    End If
    If  m025E = -1 Then
        m027E = False
        m02E8 = False
        For m0296 = 0 To m02EA - 1
            m0274 = gv1DD2(m02EE(m0296), 1)
            m0272 = -1
            v?0306(m0296) = False
            For m0258 = gv1DD2(m02EE(m0296), 0) To gv1DD2(m02EE(m0296), 1)
                If  m0272 = -1 Then
                    If  gv14F6(m0258).M5693 >= (m0282 - m027C) Then
                        m0272 = m0258
                    End If
                End If
                Select Case gv14F6(m0258).M5693
                    Case Is > m0282
                        m0274 = m0258 - 1
                        If  m0274 < m0272 Then
                            m0274 = m0272
                        End If
                        Exit For
                End Select
            Next m0258
            If  m0272 > -1 And m0274 > -1 Then
                For m0258 = m0272 To m0274
                    Select Case gv14F6(m0258).M5693
                        Case Is < (m0282 - m027C)
                        Case Is > m0282
                        Case Else
                            m027E = m027E + gv14F6(m0258).M56A0
                            v?0306(m0296) = v?0306(m0296) + gv14F6(m0258).M56A0
                            m02E8 = m02E8 + 1
                    End Select
                Next m0258
            End If
        Next m0296
        If  m027E = 0 Or m02E8 = 0 Then
            m025E = m02EE(CInt(Rnd * (UBound(m02EE) - 1)))
        Else
            m026A = Rnd * 101
            m0288 = v?0306(0)
            For m0258 = 0 To m02EA - 1
                If  m026A <= (m0288 / m027E) * 100 Then
                    m025E = m02EE(m0258)
                    Exit For
                End If
                If  m026A > (m0288 / m027E) * 100 Then
                    m0288 = m0288 + v?0306(m0258)
                End If
            Next m0258
            If  m025E = -1 Then
                m025E = m02EE(m02EA - 1)
            End If
        End If
    End If

L1F1B4:
    If  m025E = -1 Then
        GoTo L1EB02
    End If
    m0274 = gv1DD2(m025E, 1)
    m0272 = -1
    For m0258 = gv1DD2(m025E, 0) To gv1DD2(m025E, 1)
        If  m0272 = -1 Then
            m0272 = m0258
        End If
        Select Case gv14F6(m0258).M5693
            Case Is > m0282
                m0274 = m0258 - 1
                If  m0274 < m0272 Then
                    m0274 = m0272
                End If
                Exit For
        End Select
    Next m0258

L1F2A0:
    m027E = 0
    If  m0272 = -1 Or m0274 = -1 Then
        GoTo L1EB02
    End If
    For m0258 = m0272 To m0274
        Select Case gv14F6(m0258).M5693
            Case Is < (m0282 - m027C)
            Case Is > m0282
            Case Else
                m027E = m027E + gv14F6(m0258).M56A0
        End Select
    Next m0258
    If  m027E = 0 Then
        m027C = m027C + 1
        If  m027C > 3 Then
            GoTo L1EB02
        Else
            GoTo L1F1B4
        End If
    End If
    m0274 = gv1DD2(m025E, 1)
    m0272 = -1
    For m0258 = gv1DD2(m025E, 0) To gv1DD2(m025E, 1)
        v?0306(m0258) = False
        If  m0272 = -1 Then
            m0272 = m0258
        End If
        Select Case gv14F6(m0258).M5693
            Case Is < (m0282 - m027C)
            Case Is > m0282
                m0274 = m0258 - 1
                m0258 = gv1DD2(m025E, 1)
                If  m0274 < m0272 Then
                    m0274 = m0272
                End If
            Case Else
                v?0306(m0258) = (gv14F6(m0258).M56A0 / m027E) * 100
        End Select
    Next m0258
    If  m0274 < m0272 Then
        m0274 = m0272
    End If

L1F4F8:
    m026A = Rnd * 100
    If  m0272 = -1 Then
        m027C = m027C + 1
        GoTo L1F2A0
    End If
    m0288 = v?0306(m0272)
    For m0258 = m0272 + 1 To m0274 + 1
        If  m026A <= m0288 Then
            m0294 = m0258 - 1
            Exit For
        End If
        If  m0258 > v?0304 - 1 Then
            m0294 = m0258 - 1
            Exit For
        End If
        If  m026A > m0288 Then
            m0288 = m0288 + v?0306(m0258)
        End If
    Next m0258
    If  m0294 = -1 Then
        GoTo L1EB02
    End If
    If  (gv14F6(m0294).M5A7C > 2 And m0294 <> 4) And gv14C2(gv1A86).M5470 = 1 And gv14C2(gv1A86).M59BB < mc032C Then
        GoTo L1EB02
    End If
    If  gv14F6(m0294).M5467 = mc01C8 Then sub09DE mc032E

L1F688:
    m028C = gv14F6(m0294).M5A89
    m028E = gv14F6(m0294).M5A96
    m0290 = gv14F6(m0294).M5ADA
    m02A2 = m0294
    m026A = Rnd * 99
    gv1E50.M4F24 = m0294
    m026A = Rnd * 99
    gv1E50.M4F1B = False
    m029A = False
    If  m0322.M5D55 > False And gv14F6(m0294).M5467 = m0322.M5D55 Then
        If  gv14F6(m0294).M5A4A(mc0330 - 1) > False Then
            m029A = m029A + gc1DCA
        End If
    End If
    For m0258 = 1 To mc0332 - 1
        If  m026A < gv14F6(m0294).M5A4A(m0258) + m029A Then
            gv1E50.M4F1B = m0258 + 1
        End If
    Next m0258
    m029A = False
    gv1E50.M4F35 = False
    Select Case gv1E50.M4F1B
        Case mc0334
            m029A = 25
        Case mc0336
            m029A = 75
        Case mc0330
            m029A = 90
    End Select
    If  gv1E50.M4F1B > 0 Then
        If  gv14F6(m0294).M5A70 > False Then
            m026A = Int(Rnd * 100) + 1
            If  m026A < m029A Then
                gv1E50.M4F35 = -1
                Do
                    m026A = Int(Rnd * (mc0338 + 1))
                    If  fn0380(m026A, gv14F6(m0294).M5A70) = True Then
                        gv1E50.M4F35 = m026A
                    End If
                Loop While gv1E50.M4F35 = -1
            End If
        End If
    End If

L1F936:
    If  fn0380(mc0236, fn0AD3(fn0AE8(gv14C2(gv1A86)))) = False And fn0380(mc033A, fn0AD3(fn0AE8(gv14C2(gv1A86)))) = False Then
        m026A = Int(Rnd * 100) + 1
        If  m026A <= gv14F6(m0294).M5A26 And gv1E50.M4F1B > mc0334 Then
            gv1E50.M4F3D = gc1D7A
        End If
    End If
    m0284 = m0294
    m0262 = gv14F6(m0294).M5A0E
    If  Int(Rnd * 100) < ((m0262 / (mc0186 * 2)) * 100) Then
        m0262 = m0262 - Int(Rnd * ((gv14F6(m0294).M5A0E / 2) + 1))
    End If
    If  m0262 < 1 Then
        m0262 = 1
        ElseIf m0262 > mc0186 Then
        m0262 = mc0186
    End If
    gv1E38(0).M4ECC = mc018A
    If  gv14F6(m0294).M4EBF = m033C And gv14C2(gv1A86).M4EBF = m033C Then
        gv1E38(0).M4ECC = m033E
    Else
        If  gv14F6(m0294).M4EBF = mc0182 Then
            If  Int(Rnd * 100) < 40 Then
                gv1E38(0).M4ECC = m033E
            Else
                gv1E38(0).M4ECC = mc018A
            End If
        End If
    End If
    gv1E38(0).M4EDC = 1
    sub0B9B
    For m0286 = 0 To m0262 - 1
        If  m0286 = 0 Then
            m0282 = gv14F6(m0294).M5693
            GoTo L2028A
        End If

L1FBE2:
        If  m0292 > 10000 Then
            gv1EB0 = False
            sub085B "MONGEN:piTry>10000"
            Exit Function
        End If
        Select Case m028E
            Case m0034
                m029E = 3
                m029C = -1
            Case mc0036
                m029E = 3
                m029C = 0
            Case mc0038
                m029C = 0
                m029E = 0
                m029E = m029E + m0292
            Case mc003A
                m0284 = m02A2
                GoTo L2028A
            Case mc003C
                m0284 = 4
                GoTo L2028A
            Case mc003E
                m0284 = 5
                GoTo L2028A
            Case mc0040
                m0284 = 4
                GoTo L2028A
            Case Is > mc0042
                m0284 = m028E - mc0042
                GoTo L2028A
        End Select
        If  m0282 + m029C < 1 Then
            m029C = False
        End If
        m0272 = -1: m0274 = -1: m027E = 0
        For m0258 = gv1DD2(m028C, 0) To gv1DD2(m028C, 1)
            If  gv14F6(m0258).M5693 < m0282 - m029E Then
                ElseIf gv14F6(m0258).M5693 > m0282 + m029C Then
                    Exit For
                ElseIf gv14F6(m0258).M5A57 = 1 Then
                ElseIf m0258 <> m02A2 Then
                    If  (m0290 > 0 And gv14F6(m0258).M5ACF = m0290) Or m0290 = 0 Then
                        m027E = m027E + gv14F6(m0258).M56A0
                    End If
            End If
        Next m0258
        If  m027E = 0 Then
            GoTo L1F4F8
        End If
        m0274 = gv1DD2(m028C, 1)
        For m0258 = gv1DD2(m028C, 0) To gv1DD2(m028C, 1)
            v?0306(m0258) = 0
            If  m0272 < 0 Then
                m0272 = m0258
            End If
            If  gv14F6(m0258).M5693 < m0282 - m029E Then
                ElseIf gv14F6(m0258).M5693 > m0282 + m029C Then
                    m0274 = m0258 - 1
                    Exit For
                ElseIf gv14F6(m0258).M5A57 = 1 Then
                ElseIf m0258 <> m02A2 Then
                    If  (m0290 > 0 And gv14F6(m0258).M5ACF = m0290) Or m0290 = 0 Then
                        v?0306(m0258) = (gv14F6(m0258).M56A0 / m027E) * 100
                    End If
            End If
        Next m0258
        If  m0274 < 0 Then
            m0274 = m0272
        End If
        m02A0 = 0

L2003C:
        m0284 = -1
        m026A = Rnd * 99
        m0288 = v?0306(m0274)
        For m025C = m0274 + 1 To m0272 + 1 Step -1
            If  m026A > m0288 Then
                m0288 = m0288 + v?0306(m025C - 1)
            End If
            If  m026A <= m0288 And (m025C - 1 <> m0294) Then
                If  m0290 > 0 Then
                    If  gv14F6(m025C - 1).M5ACF <> m0290 Then
                        m02A0 = m02A0 + 1
                        If  m02A0 > 150 Then
                            m0290 = 0
                        End If
                        If  m02A0 > 300 Then
                            sub085B "TryNumber > 300!"
                            gv1EB0 = False
                            Exit Function
                        End If
                        m0288 = m0288 + v?0306(m025C)
                        m0284 = -1
                        Else
                        m0284 = m025C - 1
                        Exit For
                    End If
                Else
                    m0284 = m025C - 1
                    Exit For
                End If
            End If
        Next m025C
        If  m0290 = 0 Then
            m0290 = gv14F6(m0284).M5ADA
        End If
        If  m0284 > -1 Then
            m028C = gv14F6(m0284).M5A89
            m028E = gv14F6(m0284).M5A96
            m0290 = gv14F6(m0284).M5ADA
            m02A2 = m0284
            m0282 = gv14F6(m0284).M5693
        End If

L2028A:
        If  m0284 = -1 Then
            sub085B "Error finding like-types for '" + gv14F6(m0294).M548B + "'."
            GoTo L2003C
        End If
        gv1E38(m0286).M4EDC = gv14F6(m0284).M5A57
        gv1E38(m0286).M4EDC = gv1E38(m0286).M4EDC - CInt(Rnd * (gv14F6(m0284).M5A57 / 2))
        If  gv1E38(m0286).M4EDC < 1 Then
            gv1E38(m0286).M4EDC = 1
        End If
        If  m0286 = False Then
            gv1E50.M4F2D = False
        End If
        m0264 = gv14F6(m0284).M5A64
        m02A4 = ((m0264 * (10 ^ (m0264 - .5#))) / 4)
        m02A4 = ((m02A4 / 4) + (Rnd * (m02A4 / 2)) + (Rnd * (m02A4 / 2))) * (Log((gv14F6(m0284).M5693 + 1) / Log(2)))
        If  m02A4 < 500 Then
            m02A4 = Int(Rnd * 500) + 2
        End If
        gv1E50.M4F2D = gv1E50.M4F2D + (m02A4 * (Log(gv1E38(m0286).M4EDC + 1) * ((Log(gv1E38(m0286).M4EDC + 1) / 2))))
        gv1E38(m0286).M4E97 = gv14F6(m0284).M4E97
        gv1E38(m0286).M4EA1 = gv14F6(m0284).M4EA1
        gv1E38(m0286).M4EAC = gv14F6(m0284).M4EAC
        m026A = Int(Rnd * 2)
        m026E = Int(Rnd * (gv14F6(m0284).M4EAC * .5#) / 2) + 1
        If  m026A = 0 Then
            gv1E38(m0286).M4EAC = gv1E38(m0286).M4EAC - m026E
        Else
            gv1E38(m0286).M4EAC = gv1E38(m0286).M4EAC + m026E
        End If
        gv1E38(m0286).M4EB4 = gv1E38(m0286).M4EAC
        gv1E38(m0286).M4EBF = gv14F6(m0284).M4EBF
        gv1E38(m0286).M4ED4 = m0284
        gv1E38(m0286).M4F01 = m0284
        gv1E38(m0286).M4EE6 = Timer
        gv1E38(m0286).M4EEE = m0188
        If  fn0380(mc0340, fn0AD3(fn0AE8(gv14C2(gv1A86)))) <> False Then
            gv1E38(m0286).M4EEE = mc0342
        End If
        m02B2 = 0
        m02A8 = fn12AF(m01BC) - fn0DFC(gv1E38(m0286))
        m027E = mc0346 + (m02A8 * 10)
        If  m027E > mc0348 Then
            m027E = mc0348
        End If
        If  m027E < mc034A Then
            m027E = mc034A
        End If
        m026A = Int(Rnd * 100) + 1
        m02B4 = 0
        ReDim m02B6(0)       As Integer
        For m0296 = 0 To v?0304 - 1
            If  gv14F6(m0296).M5ACF = gv14F6(gv1E38(m0286).M4ED4).M5ACF Then
                If  m02B4 > UBound(m02B6) Then
                    ReDim Preserve m02B6(m02B4)            As Integer
                End If
                m02B6(m02B4) = m0296
                m02B4 = m02B4 + 1
            End If
            If  m0296 = gv1E38(m0286).M4ED4 Then
                m0298 = m02B4 - 1
            End If
        Next m0296
        If  m026A > m027E And m02B4 > 1 Then
            m02AE = Rnd * (Log(gv14F6(gv1E38(m0286).M4ED4).M5693) + 2.5#)
            m02AC = -1
            Do
                If  Int(Rnd * 100) + 1 < m027E Then
                    m02B0 = mc034C
                    Else
                    m02B0 = m034E
                End If
                m02AC = Int(Rnd * (m02AE + 1.5#))
                If  m02B0 = mc034C Then
                    If  m0298 + m02AC <= UBound(m02B6) Then
                        m02AC = m02B6(m0298 + m02AC)
                        Else
                        m02AC = -1
                    End If
                    Else
                    If  m0298 - m02AC >= 0 Then
                        m02AC = m02B6(m0298 - m02AC)
                        Else
                        m02AC = -1
                    End If
                End If
                If  m02AC < gv1DD2(gv14F6(gv1E38(m0286).M4ED4).M4ED4, 0) Then
                    m02AC = -1
                End If
                If  m02AC > gv1DD2(gv14F6(gv1E38(m0286).M4ED4).M4ED4, 1) Then
                    m02AC = -1
                End If
                m02B2 = m02B2 + 1
                If  m02B2 > 100 Then
                    m02AC = gv1E38(m0286).M4F01
                End If
            Loop While m02AC = -1
            gv1E38(m0286).M4F01 = m02AC
        End If
        gv1E38(0).M4EF9 = False
        If  gv1E38(m0286).M4ECC = m033E Then
            If  gv14F6(m0284).M4EBF = mc0182 Or gv14F6(m0284).M4EBF = gv14C2(gv1A86).M4EBF Then
                If  gv14F6(m0284).M5A7C <= gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82 Then
                    m026A = Int(Rnd * 3000) + 1
                    m026E = gv14C2(gv1A86).M55B5(mc0350) * 10
                    m026E = m026E - ((gv14F6(m0284).M5693) - 1) * 10
                    If  m026E < 0 Then
                        m026E = 0
                    End If
                    If  m026A <= m026E Then
                        m026A = gv1E38(m0286).M4EDC
                        If  m026A > 4 Then
                            m026A = 4
                        End If
                        gv1E38(m0286).M4EF9 = Int(Rnd * m026A) + 1
                    End If
                End If
            End If
        End If
    Next m0286
    m029A = 0
    For m0296 = 0 To mc0186 - 1
        If  gv1E38(m0296).M4EDC > 0 Then
            m029A = m029A + gv1E38(m0296).M4EDC
        End If
    Next m0296
    gv1E50.M4F2D = gv1E50.M4F2D * (m029A / 2)
    If  gv1E50.M4F3D = gc1D7A Then
        gv1E50.M4F2D = gv1E50.M4F2D * 1.5#
    End If
    m0264 = fn0F88(gv14C2(m01BC).M59BB)
    fn0D4D = True
    gv1EB0 = False
    Exit Function

L20CE8:
    sub085B "Base Error '" + Error$(Err) + "' Generating Monsters!"
    Resume Next
    gv1EB0 = False
    Exit Function
End Function

Sub sub0D08 (ByVal pv0352 As Integer ' 81)
Dim l0354 As Integer ' 81
Dim l0358 As Integer ' 81
Dim l035A As Integer ' 81
    If  gv1E38(gv1E66(pv0352).M547A).M4EDC > 0 Then
        l0354 = gv1E38(gv1E66(pv0352).M547A).M4ED4
        gv1E38(gv1E66(pv0352).M547A).M4E97 = gv14F6(l0354).M4E97
        gv1E38(gv1E66(pv0352).M547A).M4EA1 = gv14F6(l0354).M4EA1
        gv1E38(gv1E66(pv0352).M547A).M4EAC = gv14F6(l0354).M4EAC
        l0358 = Int(Rnd * 2)
        l035A = Int(Rnd * (gv14F6(l0354).M4EAC * .5#) / 2) + 1
        If  l0358 = 0 Then
                gv1E38(gv1E66(pv0352).M547A).M4EAC = gv1E38(gv1E66(pv0352).M547A).M4EAC - l035A
            Else
                gv1E38(gv1E66(pv0352).M547A).M4EAC = gv1E38(gv1E66(pv0352).M547A).M4EAC + l035A
        End If
        gv1E38(gv1E66(pv0352).M547A).M4EB4 = gv1E38(gv1E66(pv0352).M547A).M4EAC
        gv1E38(gv1E66(pv0352).M547A).M4ED4 = l0354
    Else
        If  gv1E66(pv0352).M547A = False Then
            If  fn0C3B(1, gv1E38(0).M4ED4) = True Then
                If  gv1E38(0).M4EDC <= False Then
                    sub0980
                End If
            End If
        End If
    End If
End Sub

Function fn0D64 (ByVal pv035E As Integer ' 81, p0360 As Integer ' 41, p0362 As Integer ' 41) As Integer ' 1
Dim l0368 As Integer ' 81
Dim l036C As Single ' 83
    l0368 = 0
    Select Case p0362
        Case gv1DBE
            l036C = (999 / gv14F6(p0360).M5A7C) * (fn1205() / 20) * 2
            If  l036C < 2 Then l036C = 2
            If  l036C > 40 Then l036C = 40
            If  (Rnd * 100) < l036C Then
                l0368 = CInt(Rnd * UBound(gv14C2)) + 1
                If  l0368 = (pv035E + 1) Then l0368 = 0
            End If
        Case gc1DC0
            l036C = (999 / gv14F6(p0360).M5A7C) * (fn1205() / 20) * 1.5#
            If  l036C < 1 Then l036C = 1
            If  l036C > 40 Then l036C = 40
            If  (Rnd * 100) < l036C Then
                l0368 = CInt(Rnd * UBound(gv14C2)) + 1
                If  l0368 = (pv035E + 1) Then l0368 = 0
            End If
        Case gc1DC2
            l036C = (999 / gv14F6(p0360).M5A7C) * (fn1205() / 20)
            If  l036C < .5# Then l036C = .5#
            If  l036C > 20 Then l036C = 20
            If  (Rnd * 100) < l036C Then
                l0368 = CInt(Rnd * UBound(gv14C2)) + 1
                If  l0368 = (pv035E + 1) Then l0368 = 0
            End If
        Case Else
    End Select
    fn0D64 = l0368
End Function

Function fn0D78 (ByVal pv0372 As Integer ' 81, p0374 As Integer ' 41) As Single ' 3
Dim l0376 As Integer ' 81
Dim l0378 As Single ' 83
Dim l037A As Single ' 83
    l0376 = Abs(gv14C2(pv0372).M58CB(p0374).M57E1) * 4.5#
    l0378 = Log(gv14F6(gv14C2(pv0372).M58CB(p0374).M4ED4).M5A7C + 1) * 6
    l037A = (l0378 * 4) - ((l0376 * 2) + (Log((fn131D(pv0372) / 10) + 1) * 4))
    l037A = l037A - ((gv14C2(pv0372).M55B5(mc0350) + gv14C2(pv0372).M584B(mc0350)) / 2)
    l037A = (l037A / 200) * 100
    l037A = l037A + (((gv14C2(pv0372).M58CB(p0374).M4EB4) - (gv14C2(pv0372).M58CB(p0374).M4EAC)) / (gv14C2(pv0372).M58CB(p0374).M4EB4)) * 15
    l037A = (l037A / 2)
    If  gv14C2(pv0372).M58CB(p0374).M57E1 = gc1D78 Then
        l037A = 0
    End If
    If  l037A > 90 Then
        l037A = 90
    ElseIf l037A < 0 Then
        l037A = 0
    End If
    fn0D78 = l037A
End Function

Function fn0D92 (ByVal pv037E As Integer ' 81, p0380 ' 40) As String ' 7
Dim l0382 As Single ' 83
Dim l0384 As String ' 87
    l0382 = fn0D78(pv037E, p0380)
    Select Case l0382
        Case 0
            l0384 = "Completely"
        Case Is <= 3
            l0384 = "Excellently"
        Case Is <= 10
            l0384 = "Fairly"
        Case Is <= 15
            l0384 = "Marginally"
        Case Is <= 20
            l0384 = "Weakly"
        Case Else
            l0384 = "Very Weakly"
    End Select
    If  gv14C2(pv037E).M58CB(p0380).M57E1 = gc1D78 Then
        fn0D92 = "Bound for Life"
    Else
        If  gv14C2(pv037E).M58CB(p0380).M57E1 < 0 Then
            fn0D92 = l0384 + " content"
        Else
            fn0D92 = l0384 + " bound"
        End If
    End If
End Function

Function fn0DAB (ByVal pv0388 As Integer ' 81) As Integer ' 1
' called (ByVal p1%, p2%, p3%)
Dim l038E ' 80
Dim l0390 As Integer ' 81
Dim l0394 As Integer ' 81
    For l038E = 0 To mc01A0 - 1
        If  gv14C2(pv0388).M58CB(l038E).M4ED4 > -1 And gv14C2(pv0388).M58CB(l038E).M4EAC > 0 Then
            l0390 = l0390 + 1
        End If
    Next l038E
    l0394 = -1
    If  l0390 > 0 Then
        If  (Rnd * 100) < (l0390 / (l0390 + 1) * 100) Then
            Do
                l0394 = Int(Rnd * mc01A0)
            Loop While gv14C2(pv0388).M58CB(l0394).M4ED4 = -1 Or gv14C2(pv0388).M58CB(l0394).M4EAC = 0
        End If
    End If
    fn0DAB = l0394
End Function

Function fn0DBF () As Long ' 2
Dim l039C As Long ' 82
Dim l039E ' 80
Dim l03A0 As Long ' 82
Dim l03A2 As String ' 87
Dim l03A4 As Long ' 82
' Const m03A6 = 0 ' &H0%
    On Error GoTo L21BE4
    l039C = gv1E50.M4F2D
    gv1E50.M4F2D = False
    Select Case gv1E50.M4F1B
        Case False, mc0334
            l039C = l039C * .5#
        Case mc0336
            l039C = l039C * 1
        Case mc0330
            l039C = l039C * 1.5#
    End Select
    For l039E = m01BC To UBound(gv14C2)
        If  gv1E66(l039E).M68C8 > 0 Then
            l03A4 = l03A4 + gv1E66(l039E).M68C8
        End If
    Next l039E
    l039C = l039C + l03A4
    If  l039C > 0 Then
        For l039E = 0 To UBound(gv14C2)
            gv14C2(l039E).M4F2D = gv14C2(l039E).M4F2D + CLng((l039C / (UBound(gv14C2) + 1)))
        Next l039E
        sub08A9 False, 10
    End If
    l03A0 = l039C
    l039C = l03A0
    frmDungeonMain!lblCharacterHit.Visible = True
    If  l039C > 0 Then
        If  gv1E66(gv1A86).M68C8 = False Then
            If  l039C > 0 Then
                l03A2 = "Your share is " + fn036D(CCur(l039C / (UBound(gv14C2) + 1)), m03A6) + " Gold!"
            Else
                l03A2 = "You didn't find any Gold!"
            End If
        Else
            If  l039C Then
                l03A2 = "Your share is " + fn036D(CCur(l039C / (UBound(gv14C2) + 1)), m03A6) + " and you recovered " + fn036D(CCur(gv1E66(gv1A86).M68C8), m03A6) + " Gold!"
            Else
                l03A2 = "You didn't find any gold, but " + fn036D(CCur(gv1E66(gv1A82).M68C8), m03A6) + " Gold was recovered!"
            End If
        End If
    End If
    frmDungeonMain!lblCharacterHit.Caption = l03A2
    sub07E2 .5#
    frmDungeonMain!lblCharacterHit.Visible = False
    fn0DBF = (l039C)
    l039E = fn0F88(gv1D68)
    For l039E = 0 To UBound(gv14C2)
        gv1E66(l039E).M68C8 = False
    Next l039E
    Exit Function

L21BE4:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monGetGold."
    Resume L21C4A
L21C4A:
End Function

Function fn0DCD (p03AC As Integer ' 41) As Integer ' 1
Dim l03AE ' 80
    If  p03AC > -1 Then
        If  gv1E38(p03AC).M4EDC < 1 Then
            p03AC = -1
        Else
            fn0DCD = p03AC
            Exit Function
        End If
    End If
    If  p03AC = -1 Then
        For l03AE = 0 To mc0186 - 1
            If  gv1E38(l03AE).M4EDC > 0 Then
                fn0DCD = l03AE
                Exit Function
            End If
        Next l03AE
    End If
    fn0DCD = -1
End Function

Function fn0DDC () As Integer ' 1
Dim l03B2 ' 80
    Get #gv1E60, 1 + gv14C2(gv1A86).M5470, l03B2
    fn0DDC = l03B2
End Function

Function fn0DEE (p03B6 As Integer ' 41, p03B8 As Integer ' 41, p03BA As Integer ' 41, ByVal pv03BC As Integer ' 81, ByVal pv03BE As Single ' 83) As Integer ' 1
Dim l03C0 As Single ' 83
Dim l03C2 As Single ' 83
Dim l03C4 As Single ' 83
Dim l03C6 As Single ' 83
Dim l03C8 As Single ' 83
Dim l03CA As Single ' 83
Dim l03CC As Integer ' 81
Dim l03CE As Integer ' 81
     If  p03B6 = 0 And p03B8 = 0 Then
        l03C0 = .5#
    Else
        If  p03B6 > p03B8 Then
            l03C0 = .5# + .5# * (p03B6 - p03B8) / p03B6
            Else
            If  p03B8 = 0 Then
                l03C0 = .5# + .5# * p03B6
                Else
                l03C0 = .5# - .5# * (p03B8 - p03B6) / p03B8
            End If
        End If
     End If
     l03C0 = l03C0 * 100
     If  l03C0 > 98 Then l03C0 = 98
     If  l03C0 < 2 Then l03C0 = 2
     If  pv03BE <= 0 Then
        pv03BE = .1#
     End If
     If  pv03BC < 1 Then pv03BC = 1
     pv03BC = CInt(pv03BC - (Log(pv03BC) * ((Log(pv03BC) - 2.4#) * 2.25#))) + 1
     If  pv03BE > 1 Then
        pv03BE = pv03BE - (Log(pv03BE) * Log(pv03BE))
     End If
     l03C2 = pv03BC
     l03C4 = (Log(p03BA + 5) + 1) / Log(1.2#)
     l03C6 = pv03BC / 30
     l03C8 = Int((Rnd * ((pv03BC + 10) / 2)) + ((pv03BC + 10) / 4)) / 10
     l03CE = Int((l03C4 * l03C6 * l03C8) * pv03BE)
     l03CA = Int(((p03B8 - p03B6) / 2) / 4)
     l03CA = l03CA - (Int(Rnd * (l03CA + 1)) / 1) + 1
     l03CC = Int(Rnd * 1000) + 1
     If  l03CC > 1 Then l03CE = l03CE - l03CA
     If  l03CE < 1 Then l03CE = 0
     l03CC = Int(Rnd * 100) + 1
     If  l03CC >= l03C0 Then l03CE = 0
    fn0DEE = l03CE
End Function

Function fn0DFC (p03D4 As T4E8B ' 4A) As Single ' 3
    fn0DFC = Log(gv14F6(p03D4.M4ED4).M5A7C) * (gv14F6(p03D4.M4ED4).M5693 + 1)
End Function

Function fn0E0D (p03D8 As Integer ' 41) As Integer ' 1
Dim l03DA ' 80
    For l03DA = 0 To v?0304 - 1
        If  gv14F6(l03DA).M5467 = p03D8 Then
            fn0E0D = l03DA
            Exit For
        End If
    Next l03DA
End Function

Function fn0E23 (ByVal pv03E0 As Integer ' 81, p03E2 As Integer ' 41, p03E6 As T4E8B ' 4A) As String ' 7
Dim l03E8 As Integer ' 81
Dim l03EC As String ' 87
' Const mc03EE = 2 ' &H2%
    If  p03E6.M4ED4 = -1 Then Exit Function
    l03E8 = p03E6.M4F01
    If  fn0380(mc0154, gv14F6(p03E6.M4ED4).M55BE) = True Then
        If  gv14C2(pv03E0).M56B9(mc0156) = False And gv14C2(pv03E0).M5470 > False Then
            If  p03E2 > 1 Then
                fn0E23 = "Unseen Monsters"
            Else
                fn0E23 = "Unseen Monster"
            End If
            Exit Function
        End If
    End If
    l03EC = gv14F6(l03E8).M548B
    Select Case p03E6.M4EEE
        Case mc0342
            l03EC = gv1662(gv14F6(p03E6.M4ED4).M4ED4).M548B
        Case mc03EE
            l03EC = gv1696(gv1662(gv14F6(p03E6.M4ED4).M4ED4).M550A).M548B
    End Select
    Select Case Right(l03EC, 3)
        Case "sae", "lex", "ish", "asu", "shi", "toa", "ngi", "ubi", "kul"
            fn0E23 = l03EC
            Exit Function
        Case Else
    End Select
    If  Right$(l03EC, 2) = "yr" Then
        fn0E23 = l03EC
        Exit Function
    End If
    If  Right$(l03EC, 2) = "ee" Then
        fn0E23 = l03EC
        Exit Function
    End If
    If  Right$(l03EC, 3) = "man" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 3) + "men"
        Exit Function
    End If
    If  (Right$(l03EC, 3) = "bus" Or Right$(l03EC, 3) = "gus" Or Right$(l03EC, 3) = "eet") And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 2) + "i"
        Exit Function
    End If
    If  (Right$(l03EC, 2) = "ry" Or Right$(l03EC, 2) = "py") And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "ies"
        Exit Function
    End If
    If  Right$(l03EC, 2) = "ch" And p03E2 > 1 Then
        If  Right(l03EC, 5) = "Leech" Then
            fn0E23 = l03EC + "es"
        Else
            fn0E23 = l03EC + "s"
        End If
        Exit Function
    End If
    If  Right$(l03EC, 3) = "sus" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "mi"
        Exit Function
    End If
    If  Right$(l03EC, 3) = "ief" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "ves"
        Exit Function
    End If
    If  Right$(l03EC, 3) = "arf" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "ves"
        Exit Function
    End If
    If  Right$(l03EC, 3) = "Elf" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "ves"
        Exit Function
    End If
    If  Right$(l03EC, 3) = "mmy" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "ies"
        Exit Function
    End If
    If  Right$(l03EC, 3) = "olf" And p03E2 > 1 Then
        fn0E23 = Left$(l03EC, Len(l03EC) - 1) + "ves"
        Exit Function
    End If
    If  p03E2 > 1 And Right(l03EC, 1) <> "s" Then
        fn0E23 = l03EC + "s"
    Else
        fn0E23 = l03EC
    End If
End Function

Function fn0E38 (p03FA As Integer ' 41) As Integer ' 1
Dim l03FC ' 80
' Const mc0400 = 15 ' &HF%
' Const mc0402 = 200 ' &HC8%
    On Error GoTo L229D0
    gv1D68 = p03FA
    If  p03FA = False Then
        sub0C79 0
        gv1E38(0).M4ED4 = -1
        fn0E38 = True
        Exit Function
    End If
    For l03FC = 0 To mc0186 - 1
        Get #gv1E60, (((p03FA - 1) * 5) + l03FC) + ((mc0400 + 2) + ((gv14C2(m01BC).M5470 - 1) * mc0402 * 5)), gv1E38(l03FC)
    Next l03FC
    Get #gv1E60, (((p03FA - 1) * 5) + mc0186) + ((mc0400 + 2) + ((gv14C2(m01BC).M5470 - 1) * mc0402 * 5)), gv1E50
    fn0E38 = True
    Exit Function

L229D0:
    fn0E38 = False
    Exit Function
End Function

Function fn0E4A (p0406 As Integer ' 41, p0408 As Integer ' 41, p040A As Integer ' 41) As Integer ' 1
Dim l040C As Integer ' 81
Dim l040E As Integer ' 81
Dim l0410 As Integer ' 81
Dim l0412 As Integer ' 81
Dim l0414 As Integer ' 81
' Const m0416 = 0 ' &H0%
' Const mc0418 = 1 ' &H1%
' Const mc041A = 10 ' &HA%
' Const mc041C = 2 ' &H2%
    On Error GoTo L230A0
    If  p040A < 0 Then
        p040A = Abs(p040A + 1)
        l0412 = True
        l0414 = fn131D(p040A)
    Else
        l0414 = gv14F6(p040A).M5A7C
    End If
    Select Case p0406
        Case gv1DBE
            l040C = (gv14F6(p0408).M5A7C) + 1
            l040E = Int(((((Log(l040C) + (l040C / 15)) / Log(1.08#)) - (l0414 / 10)) + 1))
            l0410 = (Int(((Rnd * l040E) + 1) / 2) + (l040E / 4)) * .7#
            If  l0412 = False Then
                If  gv14F6(p040A).M5548(m0416) > 0 And fn0380(mc0226, gv14F6(p0408).M5A35) = True Then
                    l0410 = l0410 - (l0410 * (((gv14F6(p040A).M5548(m0416) / 2) * .01#)))
                ElseIf gv14F6(p040A).M5548(mc0418) > 0 And fn0380(mc0228, gv14F6(p0408).M5A35) = True Then
                    l0410 = l0410 - (l0410 * (((gv14F6(p040A).M5548(mc0418) / 2) * .01#)))
                End If
            Else
                If  gv14C2(p040A).M5548(m0416) > 0 And fn0380(mc0226, gv14F6(p0408).M5A35) = True Then
                    l0410 = l0410 - (l0410 * (((gv14C2(p040A).M5548(m0416) / 2) * .01#)))
                ElseIf gv14C2(p040A).M5548(mc0418) > 0 And fn0380(mc0228, gv14F6(p0408).M5A35) = True Then
                    l0410 = l0410 - (l0410 * (((gv14C2(p040A).M5548(mc0418) / 2) * .01#)))
                End If
            End If
        Case gc1DC4
            l040C = (gv14F6(p0408).M5A7C) + 1
            l040E = Int(((((Log(l040C) + (l040C / 15)) / Log(1.08#)) - (l0414 / 10)) + 1))
            l0410 = (Int(((Rnd * l040E) + 1) / 2) + (l040E / 2)) * .7#
            If  l0412 = False Then
                If  gv14F6(p040A).M5548(mc041A) > 0 Then
                    l0410 = l0410 - (l0410 * (((gv14F6(p040A).M5548(mc041A) / 2) * .01#)))
                End If
            Else
                If  gv14C2(p040A).M5548(mc041A) > 0 Then
                    l0410 = l0410 - (l0410 * (((gv14C2(p040A).M5548(mc041A) / 2) * .01#)))
                End If
            End If
        Case gc1DC6
            l040C = (gv14F6(p0408).M5A7C) + 1
            l040E = Int(((((Log(l040C) + (l040C / 15)) / Log(1.08#)) - (l0414 / 10)) + 1))
            l0410 = (Int(((Rnd * l040E) + 1) / 2) + (l040E / 2)) * .7#
            If  l0412 = False Then
                If  gv14F6(p040A).M5548(mc041C) > 0 Then
                    l0410 = l0410 - (l0410 * (((gv14F6(p040A).M5548(mc041C) / 2) * .01#)))
                End If
            Else
                If  gv14C2(p040A).M5548(mc041C) > 0 Then
                    l0410 = l0410 - (l0410 * (((gv14C2(p040A).M5548(mc041C) / 2) * .01#)))
                End If
            End If
        Case Else
    End Select
    fn0E4A = l0410
    Exit Function

L230A0:
    sub085B "Error " + Error + " occurred in MONSMOD:monGetSpecialHits"
    Resume L2310C
L2310C:
End Function

Function fn0E5F (ByVal pv0420 As Integer ' 81, p0422 As Integer ' 41, p0424 As Integer ' 41, p0426 As Integer ' 41, ByVal pv0428 As Integer ' 81) As Integer ' 1
Dim l042A As Integer ' 81
Dim l042C As Single ' 83
Dim l042E As Single ' 83
Dim l0430 As Single ' 83
Dim l0432 As Integer ' 81
' Const mc0436 = 255 ' &HFF%
' Const mc0438 = 7 ' &H7%
' Const mc043A = 3 ' &H3%
' Const mc043C = 2 ' &H2%
' Const mc043E = 75 ' &H4B%
' Const mc0440 = 100 ' &H64%
        On Error GoTo L23948
        If  p0422 < False Then
            p0422 = Abs(p0422)
            l042E = True
        Else
            l042E = False
        End If
        If  p0424 = -1 Then
            If  p0426 = -1 Then
                If  pv0428 = False Then
                    l042A = fn1417(pv0420, p0422)
                Else
                    If  pv0428 <= 0 Then
                        l042A = Int((gv14C2(pv0420).M5584(gv14C2(pv0420).M58BB).M4E82 / 2) + .5#)
                    Else
                        l042A = pv0428
                    End If
                End If
            Else
                l042A = Int((gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M5A7C) / 6)
            End If
        ElseIf p0424 <= -2 Then
            l042A = Int((gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M5A7C) / 6)
        Else
            l042A = Int((gv14F6(gv1E38(p0424).M4ED4).M5A7C) / 4)
        End If
        If  l042A < 1 Then l042A = 1
        If  l042A > mc0436 Then l042A = mc0436
        l042C = (Log(l042A + 1) / Log(5))
        l0430 = gv152A(p0422).M5B33 + (gv152A(p0422).M5B33 * l042C)
        l0430 = l0430 + Int((l042A / 10) * gv152A(p0422).M5B41)
        If  l042E = True Then
            l042E = Int(((l0430 - ((l042A - 1) / l042A ^ 2)) / 2) / 2)
            l0432 = Int(l0430 - l042E)
            fn0E5F = l0432
            Exit Function
        Else
            l042E = Int(Rnd * (l0430 - ((l042A - 1) / l042A ^ 2)) / 2) + 1
            l0432 = Int(l0430 - l042E)
        End If
        If  gv152A(p0422).M5B5B > -1 Then
            Select Case p0424
                Case Is > -1
                    If  p0426 = -1 Then
                        l0432 = l0432 * (1 - (gv14C2(pv0420).M5548(gv152A(p0422).M5B5B) / 100))
                    Else
                        l0432 = l0432 * (1 - (gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M5548(gv152A(p0422).M5B5B) / 100))
                    End If
                Case Is <= -2
                    If  p0424 = -2 Then
                        l0432 = l0432 * (1 - (gv14C2(pv0428).M5548(gv152A(p0422).M5B5B) / 100))
                    Else
                        l0432 = l0432 * (1 - (gv14F6(gv14C2(pv0428).M58CB(Abs(p0424 + 3)).M4ED4).M5548(gv152A(p0422).M5B5B) / 100))
                    End If
                Case Else
                    l0432 = l0432 * (1 - (gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M5548(gv152A(p0422).M5B5B) / 100))
            End Select
        End If
        If  l0432 < 1 Then
            l0432 = 0
        End If
        If  p0424 <= -1 Or p0426 > -1 Then
            If  p0426 = -1 Then
                If  gv152A(p0422).M5709 = mc0438 Then
                    If  fn0380(mc043A, gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M55BE) = True Then
                        l0432 = False
                    End If
                End If
            End If
            If  p0426 = -1 Then
                If  fn0380(mc043C, gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M55BE) = True Then
                    l0432 = False
                End If
            Else
                If  p0424 < -2 Then
                    If  fn0380(mc043C, gv14F6(gv14C2(pv0428).M58CB(Abs(p0424 + 3)).M4ED4).M55BE) = True Then
                        l0432 = False
                    End If
                ElseIf p0424 = -2 Then
                Else
                    If  fn0380(mc043C, gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M55BE) = True Then
                        l0432 = False
                    End If
                End If
            End If
            Select Case gv152A(p0422).M56B9
                Case mc043E To 99
                    If  gv1662(gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M4ED4).M550A <> gv152A(p0422).M56B9 - 75 Then
                        l0432 = 0
                    End If
            End Select
        End If
        If  p0424 > -1 Then
            If  gv152A(p0422).M56B9 = mc0440 Then
                If  p0426 = -1 Then
                    If  gv14C2(pv0420).M4EAC - l0432 > 0 Then
                        l0432 = 0
                    End If
                Else
                    If  gv14C2(pv0420).M58CB(p0426).M4EAC - l0432 > 0 Then
                        l0432 = 0
                    End If
                End If
            End If
        End If
        fn0E5F = Int(l0432)
        Exit Function

L23948:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monGetSpellHits"
    Resume L239B2
L239B2:
End Function

Sub sub0E72 ()
End Sub

Sub sub0E85 (ByVal pv0442 As Integer ' 81, p0444 As Integer ' 41)
' called (ByVal p1%, p2 As type, p3%)
' Const mc0448 = 5 ' &H5%
Dim l044A ' 80
Dim l044C As Integer ' 81
Static m044E As Integer ' 61
Dim l0450() As Integer ' 91
Dim l0456 ' 80
Dim l0458 ' 80
Dim l045A As Integer ' 81
Dim l045C As String ' 87
Dim l045E As Integer ' 81
Dim l0460 As Integer ' 81
Dim l0462 As Integer ' 81
Dim l0464 ' 80
Dim l0466 As Long ' 82
Dim l0468 As Integer ' 81
Dim l046A As Integer ' 81
Dim l046C As Integer ' 81
Dim l046E As Integer ' 81
Dim l0470 As Integer ' 81
Dim l0472 As Integer ' 81
Dim l0474 As Integer ' 81
Dim l0476 As Integer ' 81
Dim l047C As Integer ' 81
Dim l047E As Integer ' 81
Dim l0480 As Integer ' 81
Dim l0482 As Integer ' 81
Dim l0484 As Single ' 83
Dim l0486 As Integer ' 81
Dim l0488 ' 80
Dim l048A As Integer ' 81
Dim l048C As Integer ' 81
Dim l048E As Integer ' 81
Dim l0490 As Integer ' 81
Dim l0492 As Single ' 83
Dim l0494 As Integer ' 81
Dim l0496 As Integer ' 81
' Const mc049C = 9 ' &H9%
Dim l049E As Integer ' 81
Dim l04A0 As Integer ' 81
' Const mc04A2 = 365 ' &H16D%
' Const mc04A4 = 7 ' &H7%
' Const mc04A6 = 9 ' &H9%
Dim l04A8 As Integer ' 81
Dim l04AA As Integer ' 81
' Const mc04AC = 6 ' &H6%
' Const m04AE = 0 ' &H0%
' Const mc04B0 = 1 ' &H1%
' Const mc04B2 = 47 ' &H2F%
' Const mc04B6 = 51 ' &H33%
Static m04B8 As Integer ' 61
' Const mc04BA = 5 ' &H5%
' Const m04BC = 0 ' &H0%
' Const mc04BE = 38 ' &H26%
' Const mc04C0 = 1 ' &H1%
' Const mc04C2 = 4 ' &H4%
' Const mc04C4 = 1 ' &H1%
' Const mc04C6 = 39 ' &H27%
' Const mc04C8 = 2 ' &H2%
' Const mc04CA = 8 ' &H8%
' Const mc04CC = 37 ' &H25%
' Const mc04CE = 12 ' &HC%
' Const mc04D0 = 40 ' &H28%
' Const mc04D2 = 5 ' &H5%
' Const mc04D6 = 49 ' &H31%
' Const mc04D8 = 13 ' &HD%
Dim l04DA As Integer ' 81
Dim l04DC As Integer ' 81
Dim l04DE As Long ' 82
' Const m04E0 = 0 ' &H0%
Static m04E2 As Integer ' 61
' Const mc04E4 = 12 ' &HC%
' Const mc04E6 = 34 ' &H22%
' Const mc04E8 = 56 ' &H38%
    ReDim l0450(m044E To mc01A0)                    As Integer
    On Error GoTo L2878E
    For l0456 = p0444 To p0444
        If  gv14C2(pv0442).M5483 > False Then Exit Sub
        For l0464 = 0 To mc01A0
            l0450(l0464) = False
        Next l0464
        l045E = False
        If  gv1E38(l0456).M4EDC > False Then
            If  gv14C2(pv0442).M5470 = False Then
                Exit Sub
            End If
            If  pv0442 = gv1A86 Then
                frmDungeonMain!lblMonsterHit.Caption = ""
                frmDungeonMain!lblMonsterHit.Refresh
                sub07E2 .25#
            End If
            If  gv1E38(l0456).M4ED4 = -1 Then Exit Sub
            l048A = gv1E38(l0456).M4E97
            l048C = gv14C2(pv0442).M4EA1
            If  gv1E66(pv0442).M4E97 = gc1DB4 Then
                l048C = l048C + (l048C * .5#)
            End If
            l048E = gv14F6(gv1E38(l0456).M4ED4).M55B5(m0132)
            l0490 = gv14F6(gv1E38(l0456).M4ED4).M5A7C
            l045A = gv1E38(l0456).M4EDC
            If  l045A > mc0448 Then
                l045A = mc0448
            End If
            If  fn0380(mc0226, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Or fn0380(mc0228, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                l0468 = gv14F6(gv1E38(l0456).M4ED4).M5A7C
                l046A = 50
                If  fn131D(pv0442) > (l0468 + (l0468 / 4)) Then
                    l046A = 80
                End If
                If  fn131D(pv0442) < (l0468 - (l0468 / 4)) Then
                    l046A = 20
                End If
                If  Int(Rnd * 100) < l046A Then
                    l046C = (gv14F6(gv1E38(l0456).M4ED4).M5A7C * Log(gv14F6(gv1E38(l0456).M4ED4).M5A7C + 1))
                    l0468 = Int(((((Log(l046C) + (l046C / 15)) / Log(1.08#)) - (gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82 / 20)) + 1))
                    l0460 = ((Int(((Rnd * l0468) + 1) / 2) + (l0468 / 4)) * .7#) / 2
                    For l044A = 0 To mc01A0 - 1
                        If  gv14C2(pv0442).M58CB(l044A).M4ED4 > -1 And gv14C2(pv0442).M58CB(l044A).M4EAC > 0 Then
                            If  fn0380(mc0226, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                                If  gv14F6(gv14C2(pv0442).M58CB(l044A).M4ED4).M5548(m0416) > 0 Then
                                    l0460 = l0460 - (l0460 * (((gv14F6(gv14C2(pv0442).M58CB(l044A).M4ED4).M5548(m0416) / 2) * .01#)))
                                End If
                                Else
                                If  gv14F6(gv14C2(pv0442).M58CB(l044A).M4ED4).M5548(mc0418) > 0 Then
                                    l0460 = l0460 - (l0460 * (((gv14F6(gv14C2(pv0442).M58CB(l044A).M4ED4).M5548(mc0418) / 2) * .01#)))
                                End If
                            End If
                            gv14C2(pv0442).M58CB(l044A).M4EAC = gv14C2(pv0442).M58CB(l044A).M4EAC - l0460
                            If  gv14C2(pv0442).M58CB(l044A).M4EAC < 0 Then
                                If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                    extsub05E7
                                    sub0CB7 gv14C2(pv0442).M58CB(l044A).M4ED4
                                End If
                                gv14C2(pv0442).M58CB(l044A).M4EAC = 0
                                sub0CCC pv0442
                            End If
                        End If
                    Next l044A
                    sub0B82 pv0442
                    If  gv14C2(pv0442).M5548(m0416) > 0 And fn0380(mc0226, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                        l0460 = l0460 - (l0460 * (((gv14C2(pv0442).M5548(m0416) / 2) * .01#)))
                        ElseIf gv14C2(pv0442).M5548(mc0418) > 0 And fn0380(mc0228, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                        l0460 = l0460 - (l0460 * (((gv14C2(pv0442).M5548(mc0418) / 2) * .01#)))
                    End If
                    If  l0460 > 0 Then
                        If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                            sub09DE mc022A
                        End If
                        If  pv0442 = gv1A86 Then
                            frmDungeonMain!lblMonsterHit.Visible = True
                            frmDungeonMain!lblMonsterHit.Caption = "You were Breathed on for" + Str$(l0460) + "!"
                            frmDungeonMain!lblMonsterHit.Refresh
                            sub07E2 .25#
                        End If
                        If  gv1E38(l0456).M4ED4 = -1 Then Exit Sub
                        sub0CA0 pv0442, l0460
                        If  gv14C2(pv0442).M4EAC < 1 Then
                            If  UBound(gv14C2) = m01BC Then
                                sub085B "You were killed by the breath attack of a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                            Else
                                sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " was killed by the breath attack of a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                            End If
                            sub06FE gv1E38(l0456), True, False, False, pv0442
                            sub091E pv0442, mc022C
                            Exit Sub
                        End If
                        sub08A9 False, 7
                    End If
                End If
            End If
            If  fn0380(mc0232, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                l0468 = gv14F6(gv1E38(l0456).M4ED4).M5A7C
                l046A = 50
                If  gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82 > (l0468 + (l0468 / 4)) Then
                    l046A = 90
                End If
                If  gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82 < (l0468 - (l0468 / 4)) Then
                    l046A = 10
                End If
                l0474 = -1
                Do
                    If  fn10D1(pv0442) < mc01A0 Then
                        l0474 = Int(Rnd * (mc01A0 + 1))
                        If  l0474 > m044E Then
                            If  gv14C2(pv0442).M58CB(l0474).M4ED4 = -1 Then l0474 = -1
                        End If
                    Else
                        l0474 = m044E
                    End If
                Loop While l0474 = -1
                If  Int(Rnd * 100) < l046A Then
                    l046C = (gv14F6(gv1E38(l0456).M4ED4).M5A7C) + 1
                    l0468 = Int(((((Log(l046C) + (l046C / 15)) / Log(1.08#)) - (gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82 / 10)) + 1))
                    l0460 = (Int(((Rnd * l0468) + 1) / 2) + (l0468 / 2)) * .7#
                    Select Case l0474
                        Case m044E
                            If  gv14C2(pv0442).M5548(mc041A) > 0 Then
                                l0460 = l0460 - (l0460 * (((gv14C2(pv0442).M5548(mc041A) / 2) * .01#)))
                            End If
                        Case Else
                            If  gv14F6(gv14C2(pv0442).M58CB(l0474).M4ED4).M5548(mc041A) > 0 Then
                                l0460 = l0460 - (l0460 * (((gv14F6(gv14C2(pv0442).M58CB(l0474).M4ED4).M5548(mc041A) / 2) * .01#)))
                            End If
                            gv14C2(pv0442).M58CB(l0474).M4EAC = gv14C2(pv0442).M58CB(l0474).M4EAC - l0460
                            If  gv14C2(pv0442).M58CB(l0474).M4EAC < 0 Then
                                If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                    extsub05E7
                                    sub0CB7 gv14C2(pv0442).M58CB(l0474).M4ED4
                                End If
                                gv14C2(pv0442).M58CB(l0474).M4EAC = 0
                                sub0CCC pv0442
                            End If
                    End Select
                    If  l0460 > 0 And l0474 = m044E Then
                            If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub09DE mc0234
                            End If
                            If  pv0442 = gv1A86 Then
                                frmDungeonMain!lblMonsterHit.Visible = True
                                frmDungeonMain!lblMonsterHit.Caption = "You were Spit on for" + Str$(l0460) + "!"
                                frmDungeonMain!lblMonsterHit.Refresh
                                sub07E2 .25#
                            End If
                            If  gv1E38(l0456).M4ED4 = -1 Then Exit Sub
                            sub0CA0 pv0442, l0460
                            If  gv14C2(pv0442).M4EAC < 1 Then
                                If  UBound(gv14C2) = m01BC Then
                                    sub085B "You were killed by the acidic attack of a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                                Else
                                    sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " was killed by the acidic attack of a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                                End If
                                sub091E pv0442, mc022C
                                sub06FE gv1E38(l0456), True, False, False, pv0442
                                Exit Sub
                            End If
                            sub08A9 False, 7
                    End If
                End If
            End If
            l0476 = False
            For l0458 = 1 To l045A
                l0492 = gv14F6(gv1E38(l0456).M4ED4).M56F7
                If  l0492 <= False Then
                    l0492 = 1
                End If
                l0486 = -1
                If  gv14F6(gv1E38(l0456).M4ED4).M5A40 > 0 Then
                    If  fn0380(mc0236, fn0AD3(fn0AE8(gv14C2(pv0442)))) = False And fn0380(mc033A, fn0AD3(fn0AE8(gv14C2(pv0442)))) = False Then
                        l0486 = fn0FF5(gv1E38(l0456).M4ED4)
                        If  l0486 > -1 Then
                            l0450(m044E) = fn0E5F(pv0442, l0486, l0456, -1, False)
                            l0470 = True
                            l045E = l045E + 1
                            If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub0D35 gv1E38(l0456).M4ED4
                            End If
                            If  l0450(m044E) > False Then
                                sub0E99 gv1E38(l0456).M4ED4
                            End If
                            l0476 = True
                            For l0488 = 0 To gv152A(l0486).M5B1D
                                If  l0488 > mc01A0 - 1 Then
                                    Exit For
                                End If
                                If  gv14C2(pv0442).M58CB(l0488).M4ED4 > -1 And gv14C2(pv0442).M58CB(l0488).M4EAC > 0 Then
                                    gv14C2(pv0442).M58CB(l0488).M4EAC = gv14C2(pv0442).M58CB(l0488).M4EAC - fn0E5F(pv0442, l0486, l0456, l0488, False)
                                    If  gv14C2(pv0442).M58CB(l0488).M4EAC < 1 Then
                                        If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                            extsub05E7
                                            sub0CB7 gv14C2(pv0442).M58CB(l0488).M4ED4
                                        End If
                                        gv14C2(pv0442).M58CB(l0488).M4EAC = 0
                                        sub0CCC pv0442
                                    End If
                                End If
                                sub0B82 pv0442
                            Next l0488
                            Exit For
                        End If
                    End If
                End If
                l0472 = False
                l0474 = 0
                For l044A = 0 To mc01A0 - 1
                    If  gv14C2(pv0442).M58CB(l044A).M4ED4 > -1 And gv14C2(pv0442).M58CB(l044A).M4EAC > 0 Then
                        l0472 = l0472 + 1
                    End If
                Next l044A
                If  l0472 > 0 Then
                    If  (Int(Rnd * 100) + 1) < (100 / (l0472 + 1)) Then
                        l0474 = m044E
                    Else
                        Do
                            l0474 = Int(Rnd * mc01A0) + 1
                            If  gv14C2(pv0442).M58CB(l0474 - 1).M4EAC <= 0 Or gv14C2(pv0442).M58CB(l0474 - 1).M4ED4 = -1 Then
                                l0474 = m044E
                            End If
                        Loop While l0474 = m044E
                    End If
                End If
                If  l0474 = m044E Then
                    If  gv14C2(pv0442).M56B9(mc0242) = True Then
                        If  fn0380(m0240, gv14F6(gv1E38(l0456).M4ED4).M55BE) = False Then
                            l0492 = l0492 - .5#
                        End If
                    End If
                Else
                    If  fn0380(mc0154, gv14F6(gv14C2(pv0442).M58CB(l0474 - 1).M4ED4).M55BE) = True Then
                        If  fn0380(m0240, gv14F6(gv1E38(l0456).M4ED4).M55BE) = False Then
                            l0492 = l0492 - .5#
                        End If
                    End If
                End If
                If  gv1E7C(pv0442) > 0 Then
                    l0492 = l0492 + .75#
                End If
                If  l0474 = m044E Then
                    l048C = gv14C2(pv0442).M4EA1 + fn13A8(pv0442)
                    l0476 = True
                Else
                    l048C = gv14C2(pv0442).M58CB(l0474 - 1).M4EA1
                End If
                l0466 = 0
                If  fn0380(mc023C, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                    l0484 = (((Log((gv14F6(gv1E38(l0456).M4ED4).M5A7C / 650) + 1) * 100) * Log((gv14F6(gv1E38(l0456).M4ED4).M5693 + 1))))
                    l0484 = l0484 - (((Log((gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82 / 999) + 1)) * 100))
                    If  l0484 < 2 Then l0484 = 2
                    If  l0484 > 50 Then l0484 = 50
                    l0468 = Int(Rnd * 100) + 1
                    If  l0468 <= l0484 Then
                        l0492 = l0492 + 2
                        l0466 = fn0418(mc023C, l0466, True)
                    End If
                End If
                If  fn0380(mc023E, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                    l0484 = (((Log((gv14F6(gv1E38(l0456).M4ED4).M5A7C / 500) + 1) * 100) * Log((gv14F6(gv1E38(l0456).M4ED4).M5693 + 1))))
                    l0484 = l0484 - (((Log((gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82 / 999) + 1)) * 100))
                    If  l0484 < 4 Then l0484 = 4
                    If  l0484 > 75 Then l0484 = 75
                    l0468 = Int(Rnd * 100) + 1
                    If  l0468 <= l0484 Then
                        l0492 = l0492 + 1
                        l0466 = fn0418(mc023E, l0466, True)
                    End If
                End If
                If  l0474 = False Then
                    l047C = Abs(gv148E(gv14C2(pv0442).M5821).M5565 - gv14F6(gv1E38(l0456).M4ED4).M5565)
                    l047E = gv148E(gv14C2(pv0442).M5821).M5565
                Else
                    l047C = Abs(gv14F6(gv14C2(pv0442).M58CB(l0474 - 1).M4ED4).M5565 - gv14F6(gv1E38(l0456).M4ED4).M5565)
                    l047E = gv14F6(gv14C2(pv0442).M58CB(l0474 - 1).M4ED4).M5565
                End If
                If  l047E < gv14F6(gv1E38(l0456).M4ED4).M5565 Then
                    l0492 = l0492 + (l047C / 10)
                    ElseIf l047E > gv14F6(gv1E38(l0456).M4ED4).M5565 Then
                    l0492 = l0492 - (l047C / 10)
                End If
                l0460 = fn0DEE(l048A, l048C, l0490, l048E, l0492)
                l0462 = False
                If  l0474 = m044E Then
                    l0470 = True
                    If  l0460 > False Then
                        l045E = l045E + 1
                    End If
                End If
                If  l0460 > 0 Then
                    l0462 = True
                    l0450(l0474) = l0450(l0474) + l0460
                    If  l0474 = m044E Then
                    Else
                        gv14C2(pv0442).M58CB(l0474 - 1).M4EAC = gv14C2(pv0442).M58CB(l0474 - 1).M4EAC - l0460
                        If  gv14C2(pv0442).M58CB(l0474 - 1).M4EAC < 1 Then
                            If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                extsub05E7
                                sub0CB7 gv14C2(pv0442).M58CB(l0474 - 1).M4ED4
                            End If
                            gv14C2(pv0442).M58CB(l0474 - 1).M4EAC = 0
                            sub0CCC pv0442
                        End If
                        sub0B82 pv0442
                    End If
                End If
            Next l0458
            If  l0450(m044E) > 0 Then
                If  l0486 > -1 Then
                    l045C = "Monster cast " + Chr$(34) + gv152A(l0486).M548B + Chr$(34) + " for" + Str$(l0450(m044E)) + " damage!"
                Else
                    l045C = LTrim$(Str$(l045E)) + " "
                    l045C = l045C + fn0E23(pv0442, l045E, gv1E38(l0456))
                    If  fn0380(mc023C, l0466) = True And fn0380(mc023E, l0466) = True Then
                        l045C = l045C + " delivered a Lethal"
                    Else
                        If  fn0380(mc023C, l0466) = True Then
                            l045C = l045C + " Critically"
                        End If
                        If  fn0380(mc023E, l0466) = True Then
                            l045C = l045C + " Backstabbed and"
                        End If
                    End If
                    l045C = l045C + " hit for" + Str$(l0450(m044E)) + "!"
                End If
                sub0CA0 pv0442, l0450(m044E)
                sub08A9 False, 7
            Else
                If  l0486 > -1 Then
                    l045C = "Monster's attempt to cast " + Chr$(34) + gv152A(l0486).M548B + Chr$(34) + " failed!"
                Else
                    If  gv1E38(l0456).M4EDC > 1 Then
                        l045C = "Monsters missed."
                    Else
                        l045C = "Monster missed."
                    End If
                End If
            End If
            If  l045E > False Or l0470 = True Then
                If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                    sub0D35 gv1E38(l0456).M4ED4
                    If  l0450(m044E) > 0 Then
                        If  fn0380(mc023C, l0466) = True And fn0380(mc023E, l0466) = True Then
                            sub09DE mc0160
                        ElseIf fn0380(mc023C, l0466) = True Then
                            sub09DE mc0164
                        ElseIf fn0380(mc023E, l0466) = True Then
                            sub09DE mc0162
                        End If
                    End If
                End If
            End If
            If  l0470 = False Then
                l045C = ""
            End If
            If  l0450(m044E) > False Then
                If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                    sub0E99 gv1E38(l0456).M4ED4
                End If
            End If
            If  pv0442 = gv1A86 Then
                frmDungeonMain!lblMonsterHit.Visible = True
                frmDungeonMain!lblMonsterHit.Caption = l045C
                frmDungeonMain!lblMonsterHit.Refresh
                sub07E2 .25#
            End If
            If  gv14C2(pv0442).M4EAC < 1 Then
                If  UBound(gv14C2) = m01BC Then
                    sub085B "You were killed by a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                Else
                    sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " was killed by a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                End If
                sub06FE gv1E38(l0456), True, False, False, pv0442
                sub091E pv0442, mc022C
                Exit Sub
            End If
            If  gv1E38(l0456).M4ED4 = -1 Then Exit Sub
            For l0464 = mc01A0 To m044E Step -1
                If  fn0380(mc0250, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(l0464) > 0 Then
                    l0468 = gv14F6(gv1E38(l0456).M4ED4).M5A7C
                    l046A = 50
                    Select Case l0464
                        Case m044E
                            l0480 = gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82
                        Case Else
                            l0480 = gv14F6(gv14C2(pv0442).M58CB(l0464 - 1).M4ED4).M5A7C
                    End Select
                    If  l0480 > (l0468 + (l0468 / 4)) Then
                        l046A = 90
                    End If
                    If  l0480 < (l0468 - (l0468 / 4)) Then
                        l046A = 10
                    End If
                    If  Int(Rnd * 100) < l046A Then
                        l046C = (gv14F6(gv1E38(l0456).M4ED4).M5A7C) + 1
                        l0468 = Int(((((Log(l046C) + (l046C / 15)) / Log(1.08#)) - (l0480 / 10)) + 1))
                        l0460 = (Int(((Rnd * l0468) + 1) / 2) + (l0468 / 2)) * .7#
                        Select Case l0464
                            Case m044E
                                l0480 = gv14C2(pv0442).M5548(mc041C)
                            Case Else
                                l0480 = gv14F6(gv14C2(pv0442).M58CB(l0464 - 1).M4ED4).M5548(mc041C)
                        End Select
                        If  l0480 > 0 Then
                            l0460 = l0460 - (l0460 * (((l0480 / 2) * .01#)))
                        End If
                        If  l0464 = m044E Then
                            If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub09DE mc0252
                            End If
                            If  pv0442 = gv1A86 Then
                                frmDungeonMain!lblMonsterHit.Caption = "You were Electrocuted for" + Str$(l0460) + "!"
                                sub07E2 .25#
                            End If
                        End If
                        If  l0460 > 0 Then
                            Select Case l0464
                                Case m044E
                                    sub0CA0 pv0442, l0460
                                    If  gv14C2(pv0442).M4EAC < 1 Then
                                        If  UBound(gv14C2) = m01BC Then
                                            sub085B "You were electrocuted to death by a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                                        Else
                                            sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " was electrocuted to death by a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                                        End If
                                        sub06FE gv1E38(l0456), True, False, False, pv0442
                                        sub091E pv0442, mc022C
                                        Exit Sub
                                    End If
                                    sub08A9 False, 7
                                Case Else
                                    gv14C2(pv0442).M58CB(l0464 - 1).M4EAC = gv14C2(pv0442).M58CB(l0464 - 1).M4EAC - l0460
                                    If  gv14C2(pv0442).M58CB(l0464 - 1).M4EAC < 1 Then
                                        If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                            extsub05E7
                                            sub0CB7 gv14C2(pv0442).M58CB(l0464 - 1).M4ED4
                                        End If
                                        gv14C2(pv0442).M58CB(l0464 - 1).M4EAC = 0
                                        sub0CCC pv0442
                                    End If
                                    sub0B82 pv0442
                            End Select
                        End If
                    End If
                End If
            Next l0464
            If  fn0380(mc049C, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(m044E) > 0 And l0462 = True Then
                If  (Int(Rnd * 100) + 1) > ((gv14C2(pv0442).M55B5(mc0248) + gv14C2(pv0442).M584B(mc0248)) * 2.5#) - ((gv14F6(gv1E38(l0456).M4ED4).M5693) * 2) Then
                    l04A0 = (gv14F6(gv1E38(l0456).M4ED4).M5A7C / 50)
                    If  l04A0 < 1 Then
                        l04A0 = 1
                    End If
                    If  l04A0 > 5 Then
                        l04A0 = 5
                    End If
                    l049E = Int(Rnd * (mc04A2 * 5)) + 1
                    If  l049E > l04A0 * mc04A2 Then
                        l049E = l04A0 * mc04A2
                    End If
                    sub0EAE True, pv0442, l049E, False
                    If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                        sub09DE mc024A
                    End If
                    If  pv0442 = gv1A86 Then
                        frmDungeonMain!lblMonsterHit.Caption = "You are now older!"
                        sub07E2 .25#
                    Else
                        sub085B Chr$(34) + RTrim(gv14C2(pv0442).M548B) + Chr$(34) + " is now older!"
                    End If
                End If
            End If
            If  fn0380(mc04A4, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(m044E) > 0 And l0462 = True Then
                l0482 = False
                l0480 = Int(Rnd * CInt((gv14F6(gv1E38(l0456).M4ED4).M5693 / 2) + .5#)) + 1
                For l0464 = 0 To (l0480 - 1)
                    If  (Int(Rnd * 100) + 1) > gv14C2(pv0442).M5548(mc04A6) Then
                        If  (Int(Rnd * 100) + 1) > ((gv14C2(pv0442).M55B5(mc0248) + gv14C2(pv0442).M584B(mc0248)) * 2.5#) - ((gv14F6(gv1E38(l0456).M4ED4).M5693) * 2) Then
                            l04A8 = Int(Rnd * mc04AC + 1)
                            l04AA = 1
                            l0482 = True
                            Select Case l04A8
                                Case False To mc04AC - 1
                                    If  gv14C2(pv0442).M56B9(mc0122) = False Then
                                        sub047C pv0442, m04AE
                                    End If
                                    gv14C2(pv0442).M55B5(l04A8) = gv14C2(pv0442).M55B5(l04A8) - l04AA
                                    If  gv14C2(pv0442).M55B5(l04A8) < gv148E(gv14C2(pv0442).M5821).M5530(l04A8) Then
                                        gv14C2(pv0442).M55B5(l04A8) = gv148E(gv14C2(pv0442).M5821).M5530(l04A8)
                                    End If
                                    sub0EBF pv0442, l04A8, (-l04AA)
                                    If  gv14C2(pv0442).M56B9(mc0122) = False Then
                                        sub047C pv0442, mc04B0
                                    End If
                                    sub08A9 False, 50
                                Case mc04AC
                                    gv14C2(pv0442).M4EB4 = gv14C2(pv0442).M4EB4 - 2
                                    If  gv14C2(pv0442).M4EB4 < fn131D(pv0442) Then
                                        gv14C2(pv0442).M4EB4 = fn131D(pv0442)
                                    End If
                                    If  gv14C2(pv0442).M4EAC > gv14C2(pv0442).M4EB4 Then
                                        gv14C2(pv0442).M4EAC = gv14C2(pv0442).M4EB4
                                    End If
                                    sub08A9 False, 7
                            End Select
                        End If
                    End If
                Next l0464
                If  l0482 Then
                    If  gv1A86 = pv0442 Then
                        sub085B "You have been drained!"
                    Else
                        sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " has been drained!"
                    End If
                    If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                        sub09DE mc04B2
                    End If
                    If  pv0442 = gv1A86 Then
                        frmDungeonMain!lblMonsterHit.Caption = "You have been drained!"
                        sub07E2 .25#
                    End If
                    l044C% = fn1139(pv0442, True)
                End If
            End If
            For l0464 = mc01A0 To m044E Step -1
                If  fn0380(mc0244, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(l0464) > 0 Then
                    Select Case l0464
                        Case m044E
                            l0480 = gv14C2(pv0442).M5548(mc0246)
                        Case Else
                            l0480 = gv14F6(gv14C2(pv0442).M58CB(l0464 - 1).M4ED4).M5548(mc0246)
                    End Select
                    If  (Int(Rnd * 100) + 1) > l0480 Then
                            Select Case l0464
                                Case m044E
                                    l0480 = gv14C2(pv0442).M55B5(mc0248) + gv14C2(pv0442).M584B(mc0248)
                                Case Else
                                    l0480 = gv14F6(gv14C2(pv0442).M58CB(l0464 - 1).M4ED4).M55B5(mc0248)
                            End Select
                            l046E = Int(Rnd * 100) + 1
                            l0484 = Log(l0480) / Log(2.5#)
                            l0484 = ((l0480) * l0484) - (gv14F6(gv1E38(l0456).M4ED4).M5693)
                            If  l0484 > 95 Then l0484 = 95
                            If  l046E > l0484 Then
                                If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                    sub09DE mc04B6
                                End If
                                Select Case l0464
                                    Case m044E
                                        If  pv0442 = gv1A86 Then
                                            frmDungeonMain!lblMonsterHit.Caption = "You are now a statue."
                                            sub07E2 .25#
                                        End If
                                        If  UBound(gv14C2) = m01BC Then
                                            sub085B "You were turned to stone by a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                                        Else
                                            sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " was turned to stone by a " + fn0E23(pv0442, 1, gv1E38(l0456)) + "."
                                        End If
                                        sub06FE gv1E38(l0456), True, False, False, pv0442
                                        sub091E pv0442, mc024E
                                        Exit Sub
                                    Case Else
                                        If  pv0442 = gv1A86 Then
                                            frmDungeonMain!lblMonsterHit.Caption = fn1235(gv1A86, l0464 - 1) + " is now a statue."
                                            sub07E2 .25#
                                        End If
                                        If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                            extsub05E7
                                            sub0CB7 gv14C2(pv0442).M58CB(l0464 - 1).M4ED4
                                        End If
                                        gv14C2(pv0442).M58CB(l0464 - 1).M4ED4 = -1
                                        sub0B82 pv0442
                                End Select
                            End If
                    End If
                End If
            Next l0464
            l0468 = Int(Rnd * 100) + 1
            If  fn0380(m04B8, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(m044E) > 0 And l0462 = True Then
                If  l0468 > gv14C2(pv0442).M5548(mc04BA) Then
                    If  gv14C2(pv0442).M56B9(m04BC) = 0 Then
                        gv14C2(pv0442).M56B9(m04BC) = gv14F6(gv1E38(l0456).M4ED4).M5693
                        If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                            sub09DE mc04BE
                        End If
                        If  pv0442 = gv1A86 Then
                            sub08A9 False, 12
                            frmDungeonMain!lblMonsterHit.Caption = "You have been Poisoned!"
                            sub07E2 .25#
                        End If
                        If  gv1E38(l0456).M4ED4 = -1 Then Exit Sub
                    End If
                End If
            End If
            l0468 = Int(Rnd * 100) + 1
            If  fn0380(mc04C0, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(m044E) > 0 And l0462 = True Then
                If  l0468 > gv14C2(pv0442).M5548(mc04C2) Then
                    If  gv14C2(pv0442).M56B9(mc04C4) = 0 Then
                        gv14C2(pv0442).M56B9(mc04C4) = gv14F6(gv1E38(l0456).M4ED4).M5693
                        If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                            sub09DE mc04C6
                        End If
                        If  pv0442 = gv1A86 Then
                            sub08A9 False, 12
                            frmDungeonMain!lblMonsterHit.Caption = "You have been Diseased!"
                            sub07E2 .25#
                        End If
                        If  gv1E38(l0456).M4ED4 = -1 Then Exit Sub
                    End If
                End If
            End If
            If  fn0380(mc04C8, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True And l0450(m044E) > 0 And l0462 = True Then
                l0468 = (gv14C2(pv0442).M5548(mc04CA) + gv14C2(pv0442).M55B5(mc0248) + gv14C2(pv0442).M584B(mc0248))
                If  l0468 > 95 Then
                    l0468 = 95
                End If
                If  (Int(Rnd * 100) + 1) > l0468 And gv14C2(pv0442).M56B9(mc0122) = 0 Then
                    sub0D1D pv0442, 0, gv14F6(gv1E38(l0456).M4ED4).M5A7C
                    If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                        sub09DE mc04CC
                    End If
                    If  pv0442 = gv1A86 Then
                        frmDungeonMain!lblMonsterHit.Caption = "You have been Paralyzed!"
                        sub08A9 False, 12
                        sub07E2 .25#
                    Else
                        sub085B RTrim(gv14C2(pv0442).M548B) + " - " + Chr$(34) + "I've been Paralyzed!"
                    End If
                End If
            End If
            If  fn0380(mc04CE, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                l0494 = Int(Rnd * (mc04D0 - 1)) + 1
                If  gv14C2(pv0442).M5857(l0494).M4ED4 > 0 Then
                    l0496 = gv1E38(l0456).M4ED4
                    If  gv14C2(pv0442).M56B9(mc0122) = False Then
                        l044C% = ((45 - gv14F6(l0496).M5693) + ((gv14C2(pv0442).M55B5(mc04D2) + gv14C2(pv0442).M55B5(mc04D2)) * 2) - (gv14F6(l0496).M55B5(mc04D2)) * 2)
                    Else
                        l044C% = ((45 - gv14F6(l0496).M5693) + ((gv14C2(pv0442).M55B5(mc04D2) + gv14C2(pv0442).M55B5(mc04D2)) / 2) - (gv14F6(l0496).M55B5(mc04D2)) * 2)
                    End If
                    If  l044C% > 90 Then l044C% = 90
                    If  l044C% < 25 Then l044C% = 25
                    If  (Int(Rnd * 100) + 1) > l044C% Then
                        If  (gv1426(gv14C2(pv0442).M5857(l0494).M4ED4).M5693 - 2) <= gv14F6(l0496).M5693 Then
                            If  fn1121(gv14C2(pv0442).M5857(l0494).M4ED4) = True Then
                                If  pv0442 = gv1A86 Then
                                    sub085B fn0E23(pv0442, 1, gv1E38(l0456)) + ": " + gv1426(gv14C2(pv0442).M5857(l0494).M4ED4).M548B + " destroyed!."
                                Else
                                    sub085B RTrim(gv14C2(pv0442).M548B) + ", " + fn0E23(pv0442, 1, gv1E38(l0456)) + ": " + gv1426(gv14C2(pv0442).M5857(l0494).M4ED4).M548B + " destroyed!."
                                End If
                                If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                    sub09DE mc04D6
                                End If
                                sub0EDA pv0442, l0494
                                sub08A9 False, 50
                            End If
                        End If
                    End If
                End If
            End If
            If  fn0380(mc04D8, gv14F6(gv1E38(l0456).M4ED4).M5A35) = True Then
                l0468 = Int(Rnd * 100)
                l04DA = 50
                l04DC = gv14F6(gv1E38(l0456).M4ED4).M5A7C
                l044C% = CInt(fn11D4(gv1A86, m04E0, False))
                l0468 = l0468 + Int((Rnd * (gv141C.M5B9F * gv141C.M5B95)) + (gv141C.M5B9F / 2) * 1.5#)
                If  gv1E66(gv1A86).M4E97 = gc1DB4 Then l0468 = l0468 + (l0468 / 2)
                l0468 = l0468 - ((l0450(m044E) / gv14C2(pv0442).M4EB4) * 100)
                If  (l0468 - (l04DC * 2)) < 50 Then
                        l04DE = Int(Rnd * (((gv14C2(pv0442).M5470 + gv1E38(l0456).M4E97) * (3353.452# * l04DC)) / gv14C2(pv0442).M5584(gv14C2(pv0442).M58BB).M4E82))
                        If  gv14C2(pv0442).M4F2D - l04DE < 0 Then
                            l04DE = gv14C2(pv0442).M4F2D
                        End If
                        If  l04DE > 0 Then
                            If  pv0442 = gv1A86 Then
                                frmDungeonMain!lblMonsterHit.Caption = fn036D(CCur(l04DE), m03A6) + " Gold Stolen!"
                                sub07E2 .25#
                            Else
                                sub085B Chr(34) + RTrim(gv14C2(pv0442).M548B) + Chr(34) + " had " + fn036D(CCur(l04DE), m03A6) + " Gold Stolen!"
                            End If
                            gv14C2(pv0442).M4F2D = gv14C2(pv0442).M4F2D - l04DE
                            If  gv14C2(pv0442).M4F2D < False Then
                                gv14C2(pv0442).M4F2D = False
                            End If
                            sub08A9 False, 10
                        End If
                        l0494 = -1
                        If  (l0468 - (l04DC * 2)) <= 10 Then
                            l0494 = Int(Rnd * (mc04D0 - 1)) + 2
                            If  fn1121(gv14C2(pv0442).M5857(l0494).M4ED4) = True Then
                                If  gv14C2(pv0442).M5857(l0494).M577E = m04E2 And gv14C2(pv0442).M5857(l0494).M4ED4 > 0 Then
                                    sub085B fn0E23(pv0442, 1, gv1E38(l0456)) + ": " + Chr$(34) + "Thanks for the " + gv1426(gv14C2(pv0442).M5857(l0494).M4ED4).M548B + ", " + RTrim(gv14C2(pv0442).M548B) + "!" + Chr$(34)
                                    sub0EDA pv0442, l0494
                                Else
                                    l0494 = -1
                                End If
                            Else
                                l0494 = -1
                            End If
                        End If
                        If  l04DE > False Or l0494 > -1 Then
                            If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub09DE mc04E4
                            End If
                        End If
                        If  gv1E66(pv0442).M547A < 0 Then
                            Exit Sub
                        End If
                        If  ((Int(Rnd * 100) + 1) > 30 And l04DE > 0) Or l0494 > -1 Then
                            If  (gv1A66.M5F48 = True And pv0442 = gv1A86) Or gv1A66.M5F48 = False Then
                                sub09DE mc04E6
                            End If
                            gv1E38(l0456).M4EDC = gv1E38(l0456).M4EDC - 1
                            If  gv1E38(l0456).M4EDC > 0 Then
                                sub0D08 pv0442
                            Else
                                If  gv1E38(gv1E66(pv0442).M547A).M4EDC < 1 Then
                                    gv1E66(pv0442).M547A = fn0DCD(-1)
                                    sub0BCD
                                End If
                                If  gv1E66(pv0442).M547A < 0 Then
                                    sub0C53
                                    Exit Sub
                                End If
                            End If
                            sub0BBA 0
                        Else
                            gv1E66(pv0442).M68C8 = gv1E66(pv0442).M68C8 + l04DE
                        End If
                End If
            End If
            If  frmDungeonMain!timCombat.Enabled = False Then
                Exit Sub
            End If
        End If
    Next l0456
    If  UBound(gv14C2) > False Then
        If  gv14C2(pv0442).M4EAC < 10 Or gv14C2(pv0442).M4EAC <= (gv14C2(pv0442).M4EB4 * .1#) Then
            If  Not gv1A66.M5F71 Then
                sub09DE mc04E8
            End If
            sub085B RTrim(gv14C2(pv0442).M548B) + " - " + Chr$(34) + "Help! My hits are " + LTrim(CStr(gv14C2(pv0442).M4EAC)) + "/" + LTrim(CStr(gv14C2(pv0442).M4EB4)) + "!"
        End If
    End If
    Exit Sub

L2878E:
    sub04FC "Error '" + Error + "' occured in MONSMOD:monMonsterAttack."
    Resume L287FA
L287FA:
End Sub

Function fn0EEF () As Variant ' 6
Dim l04EE ' 80
Dim l04F0 As Integer ' 81
    If  gv14C2(m01BC).M5470 = False Then
        Exit Function
    End If
    For l04EE = 0 To mc0186 - 1
        If  gv1E38(l04EE).M4EDC > 0 Then
            l04F0 = l04F0 + gv1E38(l04EE).M4EDC
        End If
    Next l04EE
    If  l04F0 < 0 Then l04F0 = 0
    fn0EEF = l04F0
End Function

Sub sub0F01 (ByVal pv04F2 As Integer ' 81)
Dim l04F4 ' 80
Dim l04F8 ' 80
Dim l04FA As Integer ' 81
Dim l04FC As Integer ' 81
Dim l04FE As Integer ' 81
Dim l0500 As Integer ' 81
Dim l0502 As Single ' 83
Dim l0504 As Single ' 83
Dim l0506 As Integer ' 81
Dim l0508 As Integer ' 81
Dim l050C As Single ' 83
Dim l0510 As String ' 87
Dim l0514 As Integer ' 81
Dim l0516 As Integer ' 81
Dim l0518 As Integer ' 81
Dim l051A As Integer ' 81
Dim l051C ' 80
Dim l051E As Integer ' 81
Dim l0520 As Integer ' 81
Dim l0522 As Long ' 82
Dim l0524 As Long ' 82
Dim l0526 As Integer ' 81
Dim l0528 As Integer ' 81
Dim l052E As Integer ' 81
Dim l0532() As Single ' 93
' Const mc0538 = 5 ' &H5%
Static m0540 As Integer ' 61
' Const mc0542 = 1 ' &H1%
' Const mc0544 = 2 ' &H2%
' Const mc0546 = 43 ' &H2B%
' Const mc0548 = 35 ' &H23%
' Const mc054A = 3 ' &H3%
' Const mc054C = 4 ' &H4%
' Const mc054E = 5 ' &H5%
' Const mc0550 = 44 ' &H2C%
' Const mc0552 = 6 ' &H6%
' Const mc0554 = 29 ' &H1D%
' Const mc0556 = 4 ' &H4%
Static m055E As Integer ' 61
' Const mc0564 = 14 ' &HE%
' Const mc056A = 1 ' &H1%
' Const m056C = 0 ' &H0%
' Const mc056E = 2 ' &H2%
Dim l0572 As T5810 ' 8A
' Const mc0574 = 7 ' &H7%
' Const mc0576 = 7 ' &H7%
' Const mc0578 = 11 ' &HB%
' Const mc057A = 3 ' &H3%
' Const mc057C = 8 ' &H8%
' Const mc057E = 48 ' &H30%
' Const mc0580 = 9 ' &H9%
' Const mc0582 = 28 ' &H1C%
' Const mc0584 = 2 ' &H2%
' Const mc058A = 10 ' &HA%
' Const mc0596 = 3 ' &H3%
' Const mc059A = 41 ' &H29%
' Const mc05A4 = 10 ' &HA%
' Const mc05A6 = 61 ' &H3D%
' Const mc05A8 = 63 ' &H3F%
Dim l05AC As T4F0B ' 8A
    On Error GoTo L2A838
    If  (fn0DCD(-1) <> -1 And gv1E7C(pv04F2) <> -1) Or gv1EB2 = True Then
        Exit Sub
    End If
    gv1EB2 = True
    gv1E7C(pv04F2) = 0
    ReDim l0532(gv1BEC - 1)             As Single
    l0510 = "Not Trapped"
    l0502 = Int(Rnd * 100) + 1
    sub09DE mc0538
    If  l0502 <= fn11D4(pv04F2, m04E0, False) And gv1E50.M4F35 > 0 Then
        l0510 = "Trap Disarmed"
        l0502 = 1 + (gv14C2(0).M5584(gv14C2(0).M58BB).M4E82 / mc00BC) * 3
        sub0F11 pv04F2, CLng((fn11D4(pv04F2, m04E0, False) * (gv14F6(gv1E50.M4F24).M5A7C / 2)) / l0502)
        l0528 = -1
    Else
        l0510 = gv08AA$(gv1E50.M4F35)
        l0528 = gv1E50.M4F35
        gv1E50.M4F35 = False
        l0500 = fn0F88(gv1D68)
        Select Case l0528 - 1
            Case m0540
                sub09DE mc04BE
                For l0500 = m01BC To UBound(gv14C2)
                    If  (Rnd * 100) < (gv14C2(l0500).M5548(mc04BA) / 2) Then
                        gv14C2(l0500).M56B9(m04BC) = gv14C2(l0500).M5470
                    End If
                Next l0500
            Case mc0542
                sub09DE mc04C6
                For l0500 = m01BC To UBound(gv14C2)
                    If  (Rnd * 100) < (gv14C2(l0500).M5548(mc04C2) / 2) Then
                        gv14C2(l0500).M56B9(mc04C4) = gv14C2(l0500).M5470
                    End If
                Next l0500
            Case mc0544
                sub09DE mc0546: sub09DE mc0548
                For l0500 = m01BC To UBound(gv14C2)
                    l0502 = Int(Rnd * (gv14C2(l0500).M5470 * 4 * Log(gv14C2(l0500).M5470 + 2))) + 1
                    gv14C2(l0500).M4EAC = gv14C2(l0500).M4EAC - l0502
                Next l0500
            Case mc054A
                sub09DE mc022A: sub09DE mc0548
                For l0500 = m01BC To UBound(gv14C2)
                    l0502 = Int(Rnd * (gv14C2(l0500).M5470 * 6 * Log(gv14C2(l0500).M5470 + 2))) + 1
                    l0502 = l0502 - (l0502 * (((gv14C2(l0500).M5548(m0416) / 2) * .01#)))
                    gv14C2(l0500).M4EAC = gv14C2(l0500).M4EAC - l0502
                Next l0500
            Case mc054C
                sub09DE mc04D6
                l0502 = Int(Rnd * 100) + 1
                If  l0502 < (50 + (gv14C2(pv04F2).M5470 * 2)) Then
                    l0502 = Int(Rnd * (mc04D0 - 1)) + 1
                    If  gv14C2(pv04F2).M5857(l0502).M4ED4 > 0 Then
                        If  fn1121(gv14C2(pv04F2).M5857(CInt(l0502)).M4ED4) = True Then
                            sub085B "SLIME: " + gv1426(gv14C2(pv04F2).M5857(l0502).M4ED4).M548B + " Destroyed!"
                            sub0EDA pv04F2, CInt(l0502)
                        End If
                    End If
                End If
            Case mc054E
                sub09DE mc0550
                sub0F29 pv04F2
            Case mc0552
                sub09DE mc0554
                frmDungeonMain!lblDisarm.Caption = ""
                frmDungeonMain!lblDisarm.Refresh
                frmDungeonMain!lblTrap.ForeColor = QBColor(mc0556)
                frmDungeonMain!lblTrap.Caption = l0510
                frmDungeonMain!lblTrap.Refresh
                sub07E2 1
                gv1E50.M4F35 = False
                l0500 = fn0F88(gv1D68)
                gv1D6A = gv14C2(m01BC).M59BB
                gv1D6C = gv14C2(m01BC).M5470
                If  gv1D64 <> m055E Then frmAutoMap!lblCall = "CLEARSQ"
                Do
                    gv14C2(pv04F2).M583F = Int(Rnd * 30) + 1
                    gv14C2(pv04F2).M5845 = Int(Rnd * 30) + 1
                    If  fn0380(v?031C, fn0AD3(fn0AE8(gv14C2(pv04F2)))) = False Then
                        If  fn0380(mc0564, fn0AD3(fn0AE8(gv14C2(pv04F2)))) = False Then
                            gv14C2(pv04F2).M59BB = fn0992(fn0AE8(gv14C2(pv04F2)))
                            l0524 = fn0A34(gv14C2(pv04F2).M583F, gv14C2(pv04F2).M5845)
                            If  l0524 = False Then
                                gv14C2(pv04F2).M59F4(mc056A) = True
                                gv14C2(pv04F2).M59F4(m056C) = True
                                gv14C2(pv04F2).M59F4(mc056E) = True
                                If  UBound(gv14C2) = m01BC Then sub08E1 pv04F2
                            End If
                            If  pv04F2 = m01BC And UBound(gv14C2) > m01BC Then
                                l0572 = gv14C2(1)
                                gv14C2(1) = gv14C2(m01BC)
                                gv14C2(m01BC) = l0572
                            End If
                            sub0908
                            If  UBound(gv14C2) = m01BC Then sub0980
                            gv1EB2 = False
                            sub0BAA gv14C2(m01BC).M59BB
                            Exit Do
                        End If
                    End If
                Loop
                If  gv1D64 <> m055E Then
                    frmAutoMap!lblCall = "DRAW"
                    frmAutoMap!lblCall = "UPDATE"
                End If
                Exit Sub
            Case mc0574
                sub09DE mc0576
                gv14C2(pv04F2).M591F = False
                For l051C = 0 To mc0578 - 1
                    gv14C2(pv04F2).M592F(l051C) = 0
                Next l051C
                sub0894 pv04F2
                If  Val(frmCharStat1!picTabPicture.Tag) = mc057A Then
                    frmCharStat1!picTabPicture.Refresh
                End If
                sub08B9 False
            Case mc057C
                sub09DE mc057E
                l051E = 0
                For l051C = 0 To mc01A0 - 1
                    If  gv14C2(pv04F2).M58CB(l051C).M4ED4 > -1 And gv14C2(pv04F2).M58CB(l051C).M4EAC > 0 Then
                        If  gv14C2(pv04F2).M58CB(l051C).M57E1 <> gc1D78 Then
                            l051E = l051E + 1
                            gv14C2(pv04F2).M58CB(l051C).M4ED4 = -1
                        End If
                    End If
                Next l051C
                If  gv14C2(pv04F2).M5943 < mc01A0 Then gv14C2(pv04F2).M5943 = -1
                If  l051E > 0 Then
                    sub0B82 pv04F2
                    sub0F38
                    sub085B "Your companions were scared away!"
                End If
            Case mc0580
                sub09DE mc024A
                sub0EAE True, pv04F2, mc0582, False
        End Select
        For l0500 = 0 To UBound(gv14C2)
            If  gv14C2(l0500).M4EAC < 1 Then gv14C2(l0500).M4EAC = 0
        Next l0500
        sub08A9 True, 50
    End If
    frmDungeonMain!lblTrap.Caption = ""
    frmDungeonMain!lblDisarm.Caption = ""
    frmDungeonMain!lblDisarm.Refresh
    If  l0528 <= 0 Then
        frmDungeonMain!lblTrap.ForeColor = QBColor(mc0584)
    Else
        frmDungeonMain!lblTrap.ForeColor = QBColor(mc0556)
    End If
    frmDungeonMain!lblTrap.Refresh
    frmDungeonMain!lblTrap.Caption = l0510
    sub07E2 .5#
    frmDungeonMain!picTrap.Visible = False
    If  UBound(gv14C2) > False Then frmParty!lblCall = "UPDATE"
    If  gv14C2(m01BC).M4EAC < 1 Then
        sub091E pv04F2, mc022C
        gv1EB2 = False
        sub0BAA gv14C2(m01BC).M59BB
        Exit Sub
    End If
    If  pv04F2 > UBound(gv14C2) Then pv04F2 = m01BC
    l0522 = fn0DBF()
    l0520 = gv14F6(gv1E50.M4F24).M5AEE
    l0502 = Int(Rnd * 100) + 1
    Select Case gv1E50.M4F1B
        Case mc0334
            l0502 = l0502 + 15
        Case mc0336
        Case mc0330
            l0502 = l0502 - 25
    End Select
    If  gv1E50.M4F3D = gc1D7C Then
        l0502 = l0502 + (Log(gv14C2(m01BC).M5470 + 10) * 5)
    End If
    If  l0502 > 90 And gv14F6(gv1E50.M4F24).M5AEE <> 100 Then l0502 = 90
    Do
        If  l0502 <= l0520 Then
L298A4:
            frmDungeonMain!lblCharacterHit.Caption = "Going through Treasure..."
            l04FC = gv1E50.M4F24
            l0506 = 0
            l0508 = 0
            l0518 = gv14F6(l04FC).M560D
            l0516 = gv14F6(l04FC).M560D / 2
            If  Rnd * 100 < gv14F6(l04FC).M5A4A(mc0330) Then
                l0516 = (l0518 - 1)
            End If
            Select Case gv1E50.M4F1B
                Case mc0334
                    l0518 = l0518 - 1
                    l0516 = l0516 - 1
                Case mc0336
                Case mc0330
                    l0516 = l0516 + 1
            End Select
            If  l0518 > gv14F6(l04FC).M560D Then
                l0518 = gv14F6(l04FC).M560D
            End If
            If  l0516 < 1 Then l0516 = 1
            If  l0518 < 1 Then l0518 = 1
            If  l0516 > l0518 Then
                l0516 = l0518
            End If
            If  gv14F6(l04FC).M5467 = mc01C8 Then
                l0518 = gv14F6(l04FC).M560D
                l0516 = gv14F6(l04FC).M560D - 2
            End If

L29AA2:
            l0504 = Int(Rnd * (mc058A))
            l0514 = gv14F6(l04FC).M5AC3(l0504)
            If  l0514 = -1 Then
                l0514 = Int(Rnd * gv1BEE)
            End If
            l0504 = False
            If  l0514 < -1 Then
                l04FA = Abs(l0514) - 2
                For l051C = False To gv1BEC - 1
                    If  gv1426(l051C).M5467 = l04FA Then
                        l0504 = True
                        l04FA = l051C
                        Exit For
                    End If
                Next l051C
                If  l0504 = True Then
                    GoTo L29E74
                Else
                    GoTo L29AA2
                End If
            End If
            l0506 = False
            For l04F4 = 0 To gv1BEC - 1
                If  gv1426(l04F4).M5709 = l0514 And gv1426(l04F4).M5693 >= l0516 Then
                    l0506 = l04F4
                    Exit For
                End If
            Next l04F4
            If  l0506 > False Then
                If  gv1426(l0506).M5693 = l0518 Then
                    If  l0516 > 1 Then
                        l0516 = l0516 - 1
                        GoTo L29AA2
                    End If
                End If
            End If
            If  l0506 = 0 Or gv1426(l0506).M5693 > l0518 Then
                GoTo L298A4
            End If
            If  gv1426(l0506).M5693 > l0518 Then
                GoTo L29AA2
            End If
            For l04F4 = l0506 To gv1BEC - 1
                If  gv1426(l04F4).M5693 > l0518 Or gv1426(l04F4).M5709 <> l0514 Then
                    l0508 = l04F4 - 1
                    Exit For
                End If
            Next l04F4
            If  l0508 < l0506 Then
                l0508 = l0506
            End If
            l050C = 0
            For l04F4 = l0506 To l0508
                l050C = l050C + gv1426(l04F4).M56A0
            Next l04F4
            For l04F4 = l0506 To l0508
                l0532(l04F4) = (gv1426(l04F4).M56A0 / l050C) * 100
            Next l04F4
            If  l0508 < l0506 Then
                GoTo L29AA2
            End If
L29DF8:
            l0502 = Rnd * 100
            l0504 = False
            For l04F8 = l0506 To l0508
                l0504 = l0504 + l0532(l04F8)
                If  l0502 <= l0504 Then
                    l04FA = l04F8
                    Exit For
                End If
            Next l04F8

L29E74:
            If  l04FA = False Then
                sub085B "ITEM ERROR: 0, CLASS:" + gv1592(l0514).M548B + ",  RND1:" + CStr(l0502) + ", RND2:" + CStr(l0504) + " - RESELECTING"
                GoTo L29AA2
            End If
            l052E = False
            l051A = False
            Do
                l0526 = CInt(Rnd * UBound(gv14C2))
                For l04F4 = 1 To mc04D0 - 1
                    If  gv14C2(l0526).M5857(l04F4).M4ED4 = 0 Then
                        l051A = l04F4
                        Exit For
                    End If
                Next l04F4
                If  l051A = False Then
                    l052E = l052E + 1
                    If  l052E >= 10 Then
                        Exit Do
                    End If
                End If
            Loop While l051A = False
            If  l051A = False Then
                sub085B "An item was found, but nobody had room to carry it."
                GoTo L2A7D6
            End If
            l04FE = False
            If  gv1426(l04FA).M5557 > 1 Then
                Do
                    l04FE = Int(Rnd * (mc0596 + 1))
                Loop While fn0380(l04FE, gv1426(l04FA).M5557) = False
            End If
            gv14C2(l0526).M5857(l051A).M4E97 = gv1426(l04FA).M4E97
            gv14C2(l0526).M5857(l051A).M4EA1 = gv1426(l04FA).M4EA1
            gv14C2(l0526).M5857(l051A).M4ED4 = l04FA
            gv14C2(l0526).M5857(l051A).M4EBF = l04FE
            If  gv1426(l04FA).M56DB > 0 Then
                gv14C2(l0526).M5857(l051A).M56DB = gv1426(l04FA).M56DB
                If  gv1426(l04FA).M56DB > 1 Then
                    If  Int(Rnd * 2) = False Then
                        gv14C2(l0526).M5857(l051A).M56DB = gv14C2(l0526).M5857(l051A).M56DB + Int(((Rnd * gv1426(l04FA).M56DB / 2)))
                    Else
                        gv14C2(l0526).M5857(l051A).M56DB = gv14C2(l0526).M5857(l051A).M56DB - Int(((Rnd * gv1426(l04FA).M56DB / 2)))
                    End If
                End If
            Else
                gv14C2(l0526).M5857(l051A).M56DB = 0
            End If
            gv14C2(l0526).M5857(l051A).M4EEE = fn129A(l0526, l04FA)
            gv14C2(l0526).M5857(l051A).M5467 = gv1426(l04FA).M5467
            gv14C2(l0526).M5857(l051A).M572A = gv1426(l04FA).M572A
            sub09DE mc059A
            If  UBound(gv14C2) = m01BC Then
                sub085B UCase$(gv0878$(gv1E50.M4F1B - 1)) + ": Slot #" + LTrim$(Str$(l051A + 1)) + ", " + fn12EF(gv14C2(l0526).M5857(l051A).M4ED4, gv14C2(l0526).M5857(l051A).M4EEE, gv14C2(l0526).M5857(l051A).M4EBF, gv14C2(l0526).M5857(l051A).M56DB)
                For l051C = 0 To mc05A4 - 1
                    sub0F4C l051C
                Next l051C
            Else
                sub085B Chr$(34) + RTrim(gv14C2(l0526).M548B) + Chr$(34) + " - " + UCase$(gv0878$(gv1E50.M4F1B - 1)) + ": Slot #" + LTrim$(Str$(l051A + 1)) + ", " + fn12EF(gv14C2(l0526).M5857(l051A).M4ED4, gv14C2(l0526).M5857(l051A).M4EEE, gv14C2(l0526).M5857(l051A).M4EBF, gv14C2(l0526).M5857(l051A).M56DB)
            End If
            If  gv1E50.M4F24 = gv1E38(0).M4F01 Then
                If  fn0380(mc0154, gv14F6(gv1E50.M4F24).M55BE) = True And gv14C2(l0526).M56B9(mc0156) = False Then
                    sub0730 l0526, l04FA, gv14C2(l0526).M5857(l051A).M4EEE, -2, True
                Else
                    sub0730 l0526, l04FA, gv14C2(l0526).M5857(l051A).M4EEE, l04FC, True
                End If
            Else
                sub0730 l0526, l04FA, gv14C2(l0526).M5857(l051A).M4EEE, -2, True
            End If
            sub0F61 l0526, m01BC, l051A
            If  gv1426(l04FA).M572A = gc1DD0 Then
                sub0F74 l0526, l051A
                If  l0526 = gv1A86 Then
                    sub085B "An item you found has attached itself to you!!"
                Else
                    sub085B "A found item has attached itself to " + Chr(34) + RTrim(gv14C2(l0526).M548B) + Chr(34) + "!!"
                End If
                sub086D mc05A6
                sub09DE mc05A8
            End If
        Else
            Exit Do
        End If
        l0502 = Int(Rnd * 100) + 1
        l0520 = ((gv14F6(gv1E50.M4F24).M5AEE / 10))
    Loop

L2A7D6:
    gv1E50 = l05AC
    l0500 = fn0F88(gv1D68)
    frmDungeonMain!lblCharacterHit.Caption = ""
    gv1EB2 = False
    sub0BAA gv14C2(l0526).M59BB
    Exit Sub

L2A838:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monOpenChest (" + l0510 + ")."
    gv1E50 = l05AC
    gv1EB2 = False
    sub0BAA gv14C2(l0526).M59BB
    Resume L2A8E2
L2A8E2:
End Sub

Sub sub0D1D (ByVal pv05AE As Integer ' 81, p05B0 As Integer ' 41, p05B2 As Integer ' 41)
Dim l05B4 As Integer ' 81
Dim l05B6 As Integer ' 81
    If  p05B0 = 0 And gv14C2(pv05AE).M56B9(mc0122) <> False Then Exit Sub
    If  p05B0 = 1 And gv14C2(pv05AE).M56B9(mc0122) = False Then Exit Sub
    l05B4 = gv14C2(pv05AE).M4EA1
    l05B6 = gv14C2(pv05AE).M4E97
    sub047C pv05AE, m04AE
    l05B4 = l05B4 - gv14C2(pv05AE).M4EA1
    l05B6 = l05B6 - gv14C2(pv05AE).M4E97
    sub047C pv05AE, mc04B0
    Select Case p05B0
        Case 0
            gv14C2(pv05AE).M4EA1 = gv14C2(pv05AE).M4EA1 - l05B4
            gv14C2(pv05AE).M4E97 = gv14C2(pv05AE).M4E97 - l05B6
            gv14C2(pv05AE).M56B9(mc0122) = p05B2
        Case 1
            gv14C2(pv05AE).M4EA1 = gv14C2(pv05AE).M4EA1 + l05B4
            gv14C2(pv05AE).M4E97 = gv14C2(pv05AE).M4E97 + l05B6
            gv14C2(pv05AE).M56B9(mc0122) = 0
    End Select
    sub08A9 False, 8
End Sub

Function fn0F88 (p05BA As Integer ' 41) As Integer ' 1
Dim l05BC ' 80
' Const mc05CC = 28 ' &H1C%
    On Error GoTo L2ACF8
    If  p05BA <= False Then
        fn0F88 = True
        Exit Function
    End If
    If  gv1AEC(m01BC) <> gv14C2(m01BC).M5470 And gv1AEC(m01BC) > 0 Then
        Close #gv1E60
        gv1E60 = FreeFile
        Open gv19E8 + gc1C74 + gc1C30 + LTrim$(Str$(gv1AEC(m01BC))) For Random As #gv1E60 Len = mc05CC
    End If
    For l05BC = 0 To mc0186 - 1
        Put #gv1E60, (((p05BA - 1) * 5) + l05BC) + ((mc0400 + 2) + ((gv14C2(m01BC).M5470 - 1) * mc0402 * 5)), gv1E38(l05BC)
    Next l05BC
    Put #gv1E60, (((p05BA - 1) * 5) + mc0186) + ((mc0400 + 2) + ((gv14C2(m01BC).M5470 - 1) * mc0402 * 5)), gv1E50
    If  gv1AEC(m01BC) <> gv14C2(m01BC).M5470 And gv1AEC(m01BC) > 0 Then
        Close #gv1E60
        gv1E60 = FreeFile
        Open gv19E8 + gc1C74 + gc1C30 + LTrim$(Str$(gv14C2(m01BC).M5470)) For Random As #gv1E60 Len = mc05CC
    End If
    fn0F88 = True
    Exit Function

L2ACF8:
    fn0F88 = False
    Exit Function
End Function

Sub sub06FE (p05D0 As T4E8B ' 4A, p05D2 As Integer ' 41, p05D4 As Integer ' 41, p05D6 As Integer ' 41, p05D8 As Integer ' 41)
Dim l05DC As T5BF1 ' 8A
Dim l05E0 As Integer ' 81
Dim l05E2 As Integer ' 81
Dim l05E4 As Integer ' 81
Static m05E6 As Integer ' 61
' Const mc05EA = 4 ' &H4%
' Const mc05EC = 1 ' &H1%
' Const mc05EE = 3 ' &H3%
' Const mc05F0 = 2 ' &H2%
' Const mc05F2 = 2 ' &H2%
' Const mc05F4 = 1 ' &H1%
    If  p05D0.M4ED4 < False Then
        p05D0.M4ED4 = Abs(p05D0.M4ED4)
        l05E4 = True
    Else
        If  p05D0.M4ED4 <> p05D0.M4F01 Then
            Exit Sub
        End If
    End If
    If  (fn0380(mc0154, gv14F6(p05D0.M4ED4).M55BE) And gv14C2(p05D8).M56B9(mc0156) = False) Then
        If  gv14C2(p05D8).M5470 > 0 And p05D4 = False Then
            Exit Sub
        End If
    End If
    sub0F9A p05D0.M4ED4, m05E6, l05DC
    If  p05D4 = False Then
        l05E0 = fn121C(p05D8, gv14F6(p05D0.M4ED4).M5A7C, gv14F6(p05D0.M4ED4).M5693, False)
    Else
        l05E0 = p05D0.M4EEE
    End If
    If  l05E0 <= m0188 Then
        l05E2 = mc05EA
    ElseIf l05E0 <= mc05EC Then
        l05E2 = mc05EE
    ElseIf l05E0 <= mc05F0 Then
        l05E2 = mc05F2
    Else
        l05E2 = mc05F4
    End If
    If  l05DC.M4EEE = False Then
        sub0FB0 m05E6, (fn1BD5(m05E6) + 1)
        If  l05E4 = False Then
            l05DC.M5C09 = gv14C2(p05D8).M548B
        Else
            l05DC.M5C09 = ""
        End If
    End If
    If  l05DC.M4EEE < l05E2 Then l05DC.M4EEE = l05E2
    If  gv14C2(m01BC).M59F4(mc056A) = False And gv14C2(m01BC).M59F4(m056C) = False Then
        If  gv14C2(m01BC).M5470 > 0 Then
            l05DC.M5C2F = CStr(gv14C2(m01BC).M583F) + "," + CStr(gv14C2(m01BC).M5845) + "," + CStr(gv14C2(m01BC).M5470)
        End If
    End If
    If  p05D4 = False Then l05DC.M5C21 = CLng(Date)
    If  p05D6 Then
        If  l05E4 = True Then
            l05DC.M5C2F = "?"
        Else
            If  gv14C2(m01BC).M5470 = 0 And (l05DC.M5C2F = "" Or l05DC.M5C21 = 0) Then
                l05DC.M5C2F = "the City"
            End If
        End If
    End If
    If  p05D2 Then l05DC.M5C3D = l05DC.M5C3D + 1
    If  p05D6 Then l05DC.M5C00 = l05DC.M5C00 + p05D0.M4EDC
    l05DC.M5467 = gv14F6(p05D0.M4ED4).M5467
    sub0FCB p05D0.M4ED4, m05E6, l05DC
End Sub

Sub sub0C29 (p05F8 ' 40)
    Put #gv1E60, 1 + gv14C2(m01BC).M5470, p05F8
End Sub

Sub sub06C6 ()
Dim l05FA ' 80
Dim l05FC ' 80
    ReDim gv1E04(gv1BEE - 1, 1)          As Integer
    For l05FA = 0 To gv1BEE - 1
        gv1E04(l05FA, 0) = -1
        gv1E04(l05FA, 1) = -1
    Next l05FA
    For l05FA = 0 To gv1BEE - 1
        For l05FC = 0 To gv1BEC - 1
            If  gv1E04(l05FA, 0) = -1 Then
                If  gv1426(l05FC).M5709 = l05FA Then
                    gv1E04(l05FA, 0) = l05FC
                End If
            End If
            If  gv1426(l05FC).M5709 <> l05FA Then
                If  gv1E04(l05FA, 0) > -1 Then
                    gv1E04(l05FA, 1) = l05FC - 1
                    l05FC = gv1BEC - 1
                End If
            End If
        Next l05FC
    Next l05FA
    gv1E04(gv1BEE - 1, 1) = gv1BEC - 1
End Sub

Sub sub06D7 ()
Dim l05FE ' 80
Dim l0600 ' 80
    ReDim gv1DD2(gv1BF2 - 1, 1)        As Integer
    For l05FE = 0 To gv1BF2 - 1
        gv1DD2(l05FE, 0) = -1
        gv1DD2(l05FE, 1) = -1
    Next l05FE
    For l05FE = 0 To gv1BF2 - 1
        For l0600 = 1 To v?0304 - 1
            If  gv1DD2(l05FE, 0) = -1 Then
                If  gv14F6(l0600).M4ED4 = l05FE Then
                    gv1DD2(l05FE, 0) = l0600
                End If
            End If
            If  gv14F6(l0600).M4ED4 <> l05FE Then
                If  gv1DD2(l05FE, 0) > -1 Then
                    gv1DD2(l05FE, 1) = l0600 - 1
                    l0600 = v?0304 - 1
                End If
            End If
        Next l0600
    Next l05FE
    gv1DD2(gv1BF2 - 1, 1) = v?0304 - 1
End Sub

Sub sub0BAA ()
' called (p1%)
Dim l0604 As Integer ' 81
Dim l0606 As Integer ' 81
Dim l0608 As Integer ' 81
Dim l060A As Integer ' 81
Dim l060C As Single ' 83
Dim l060E As Single ' 83
Dim l0610 As Single ' 83
Dim l0612 As Single ' 83
' Const mc0614 = 13 ' &HD%
' Const mc0622 = 45 ' &H2D%
' Const mc0626 = 32 ' ? &H 0020 00CC
' Const mc062C = 2 ' &H2%
Dim l0630 As Integer ' 81
Dim l0632 As Integer ' 81
Dim l0634 As Single ' 83
Dim l0636 As Integer ' 81
Dim l0638 As Integer ' 81
Dim l063A As Integer ' 81
Dim l063C As String ' 87
Dim l063E As String ' 87
' Const mc0640 = 2 ' &H2%
Static m0642 As Integer ' 61
    On Error GoTo L2BE46
    If  gv1EB2 = True Then Exit Sub
    If  gv14C2(gv1A86).M4EAC <= False Then Exit Sub
    gv1EB6 = True
    l0608 = True
    If  gv1A66.M5F04 = False Then
        l0610 = frmDungeonMain.ScaleWidth / gv19C2(mc0614).M5E20
    Else
        l0610 = 1
    End If
    l0612 = l0610
    l060C = CInt(((frmDungeonMain!picMonsters.Width / Screen.TwipsPerPixelX) - ((mc0622 + 6) * l0610)))
    l060E = 8 * l0612
    If  gv1E50.M4F1B > False Then
        If  gv1A66.M5F04 = False Then
            If  gv14F6(gv1E50.M4F24).M5467 = mc01C8 Then
                l060A = extfn01C4(frmDungeonMain!picMonsters.hDC, l060C, l060E, mc0622 * l0610, mc0622 * l0612, gv2BBC, mc0622 * 4, 0, mc0622, mc0622, mc0626)
            Else
                l060A = extfn01C4(frmDungeonMain!picMonsters.hDC, l060C, l060E, mc0622 * l0610, mc0622 * l0612, gv2BBC, (mc062C * mc0622) + ((gv1E50.M4F1B - 2) * mc0622), 0, mc0622, mc0622, mc0626)
            End If
        Else
            If  gv14F6(gv1E50.M4F24).M5467 = mc01C8 Then
                l060A = extfn182D(frmDungeonMain!picMonsters.hDC, l060C, l060E, mc0622, mc0622, gv2BBC, mc0622 * 4, 0, mc0626)
            Else
                l060A = extfn182D(frmDungeonMain!picMonsters.hDC, l060C, l060E, mc0622, mc0622, gv2BBC, (mc062C * mc0622) + ((gv1E50.M4F1B - 2) * mc0622), 0, mc0626)
            End If
        End If
    Else
        frmDungeonMain!picMonsters.Line (l060C, l060E)-(l060C + (mc0622 * l0610), l060E + (mc0622 * l0612)), frmDungeonMain!picMonsters.BackColor, BF
        frmDungeonMain!picTrap.Visible = False
        gv1EB6 = False
        Exit Sub
    End If
    If  fn0EEF() > False Then
        l0606 = True
    End If
    If  l0606 = True And gv1E50.M4F1B <> False Then
        If  Abs((Log(gv14C2(gv1A86).M55B5(mc04D2) / 4) + ((Log(gv14C2(gv1A86).M55B5(mc04D2) / 4) * ((fn11D4(gv1A86, m04E0, False) / 100) - .5#))))) - Log(gv14F6(gv1E38(0).M4ED4).M55B5(mc04D2) / 8) < .5# Then
            l0608 = False
        End If
    End If
    If  gv1E50.M4F1B > 0 And l0608 = True Then
        If  frmDungeonMain!picTrap.Visible = False Then
            frmDungeonMain!picTrap.Visible = True
        End If
        If  gv1E50.M4F3D <= gv1D7E Then
            l0630 = (gv14C2(gv1A86).M55B5(mc0640) + gv14C2(gv1A86).M584B(mc0640) / 4)
            l0632 = (Log(gv14F6(gv1E50.M4F24).M5A7C) * Log(gv14F6(gv1E50.M4F24).M55B5(mc04D2))) * 2.5#
            l0630 = (l0630 - l0632)
            l0634 = Log(gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82) / Log(2)
            l0604 = CInt(fn11D4(gv1A86, m04E0, False))
            l0636 = l0630 + ((gv141C.M5B95) + (l0634)) * gv141C.M5B95 - l0632
            l0636 = fn11D4(gv1A86, m04E0, False)
            If  l0636 < 5 Then l0636 = 5
            If  l0630 < 2 Then l0630 = 2
            If  l0630 > 98 Then l0630 = 98
            l0630 = Int(l0630 + ((l0636 / 1.2#))) + (Log(gv141C.M5B9F) * Log(gv141C.M5B9F))
            If  l0636 > 98 Then l0636 = 98
            l0638 = Int(Rnd * 100) + 1
            If  l0630 < l0638 Then
                l063A = Int(Rnd * (mc0338))
            Else
                l063A = gv1E50.M4F35
            End If
            If  l0630 > 100 Then l0630 = 100
            If  l0630 < 1 Then l0630 = 1
            l0630 = Int(((l0630 / 10)) / 2.3#)
            If  l0630 < 1 Then
                l0630 = 1
            End If
            If  l0636 > 44 And l0636 < 56 Then
                l063C = "*"
                l0636 = 1
                ElseIf l0636 < 45 Then
                    l063C = "-"
                    l0636 = Int(5 - (l0636 / 15) - .5#)
                ElseIf l0636 > 55 Then
                    l063C = "+"
                    l0636 = Int((l0636 - 50) / 15)
            End If
            If  l0636 < 1 Then l0636 = 1
            If  l0636 > 3 Then l0636 = 3
            l063C = String$(l0636, l063C)
            l063E = String$(l0630, "•")
            frmDungeonMain!lblTrap.ForeColor = QBColor(m0642)
            frmDungeonMain!lblTrap.Caption = gv08AA$(l063A)
            frmDungeonMain!lblTrap.Visible = True
            frmDungeonMain!lblDisarm.Caption = l063C + " " + l063E
            frmDungeonMain!lblDisarm.Visible = True
        Else
            frmDungeonMain!lblTrap.Caption = "Magically Locked"
            frmDungeonMain!lblTrap.Visible = True
            frmDungeonMain!lblDisarm.Visible = False
        End If
        frmDungeonMain!lblTrap.Refresh
        frmDungeonMain!lblDisarm.Refresh
    Else
        frmDungeonMain!picTrap.Visible = False
        frmDungeonMain!lblTrap.Visible = False
        frmDungeonMain!lblDisarm.Visible = False
    End If
    gv1EB6 = False
    Exit Sub

L2BE46:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monShowChest."
    Resume L2BEAE
L2BEAE:
End Sub

Sub sub0BCD ()
    On Error GoTo L2C1B4
    If  gv1EE6 = True Or gv1A86 > UBound(gv14C2) Then
        Exit Sub
    End If
    If  fn0EEF() > False And gv1E66(gv1A86).M547A = -1 Then
        gv1E66(gv1A86).M547A = fn0DCD(-1)
    End If
    If  fn0EEF() > 0 And gv14C2(gv1A86).M59BB > -1 And gv1E66(gv1A86).M547A > -1 Then
        If  fn0EEF() > False And gv1E38(gv1E66(gv1A86).M547A).M4EDC = False Then
            gv1E66(gv1A86).M547A = fn0DCD(-1)
        End If
        If  gv1E66(gv1A86).M4E97 = gc1DB2 Then
            frmDungeonMain!lblCurrentGroup.Caption = "+"
            ElseIf gv1E66(gv1A86).M4E97 = gc1DB4 Then
                frmDungeonMain!lblCurrentGroup.Caption = "["
            ElseIf gv1E66(gv1A86).M56C4 > 0 Then
                frmDungeonMain!lblCurrentGroup.Caption = ">"
            Else
                frmDungeonMain!lblCurrentGroup.Caption = "•"
        End If
    Else
        frmDungeonMain!lblCurrentGroup.Caption = ""
        frmDungeonMain!lblCurrentGroup.Refresh
    End If
    If  fn0EEF() > 0 And gv1E66(gv1A86).M547A > -1 Then
        frmDungeonMain!lblCurrentGroup.Top = frmDungeonMain!lblMonster(gv1E66(gv1A86).M547A).Top
        frmDungeonMain!lblCurrentGroup.Left = frmDungeonMain!lblMonster(gv1E66(gv1A86).M547A).Left - frmDungeonMain!lblCurrentGroup.Width
        frmDungeonMain!lblCurrentGroup.Visible = True
    Else
        frmDungeonMain!lblCurrentGroup.Visible = False
    End If
    sub0BF1
    Exit Sub

L2C1B4:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monShowCursor.  Please Report."
    Resume L2C22E
L2C22E:
End Sub

Sub sub0C61 (p064A As Integer ' 41)
Dim l064C As String ' 87
Dim l064E ' 80
' Const mc0650 = 64 ' &H40%
    On Error GoTo L2C9E4
    Select Case gv14F6(p064A).M5467
        Case mc01C8
            l064C = "As the dust settles from the ferocious battle, "
            If  UBound(gv14C2) > m01BC Then
                l064C = l064C + "the party suddenly realizes "
            Else
                l064C = l064C + "you suddenly realize "
            End If
            l064C = l064C + "that the Prince of the Underworld was just defeated!" + Chr(13) + Chr(13)
            If  UBound(gv14C2) > m01BC Then
                l064C = l064C + "As everybody regains their composure and gives thanks for their life, "
                l064C = l064C + "a member of the party notices that the body of Asmodeus has disappeared!"
                l064C = l064C + Chr(13) + Chr(13)
                l064C = l064C + "It is then that the party looks around at each other with wide eyes and the "
            Else
                l064C = l064C + "As you regain your composure and give thanks for your life, "
                l064C = l064C + "you notice that the body of Asmodeus has disappeared!"
                l064C = l064C + Chr(13) + Chr(13)
                l064C = l064C + "It is then that you look around with wide eyes and the "
            End If
            l064C = l064C + "realization of only one thing..." + Chr(13) + Chr(13)
            l064C = l064C + "Something - or Someone - has magically taken the body!" + Chr(13) + Chr(13)
            l064C = l064C + "Even though today has been victorious and will be recorded in the history books, "
            If  UBound(gv14C2) > m01BC Then
                l064C = l064C + "the party continues on with uneasiness, wondering if there's some darker force at work..."
            Else
                l064C = l064C + "you continue on with uneasiness, wondering if there's some darker force at work..."
            End If
            l064C = l064C + Chr(13) + Chr(13)
            l064C = l064C + "...is this really the last of Asmodeus?"
            If  UBound(gv14C2) > m01BC Then
                For l064E = m01BC To UBound(gv14C2)
                    sub0578 gv14C2(l064E).M58BB, Chr$(34) + RTrim(gv14C2(l064E).M548B) + Chr$(34) + " was part of the party that defeated Asmodeus."
                Next l064E
            Else
                sub0578 gv14C2(m01BC).M58BB, Chr$(34) + RTrim(gv14C2(m01BC).M548B) + Chr$(34) + " single handedly defeated Asmodeus."
            End If
        Case Else
    End Select
    If  Len(l064C) Then
        MsgBox l064C, mc0650, "A dark realization..."
    End If
    Exit Sub

L2C9E4:
    Resume L2C9F0
L2C9F0:
End Sub

Sub sub0AA6 ()
' called (p1%)
Dim l0654 As Integer ' 81
' Const mc0658 = 100 ' &H64%
' Const mc065A = 100 ' &H64%
    If  gv1A66.M5F04 = False Then
        l0654 = extfn01C4(frmDungeonMain!picMaze2.hDC, 0, 0, frmDungeonMain!picMaze2.ScaleWidth, frmDungeonMain!picMaze2.ScaleHeight, gv2BB4, 0, 0, mc0658, mc065A, mc0626)
    Else
        l0654 = extfn182D(frmDungeonMain!picMaze2.hDC, (frmDungeonMain!picMaze2.ScaleWidth / 2) - 50, (frmDungeonMain!picMaze2.ScaleHeight / 2) - 50, 100, 100, gv2BB4, 0, 0, mc0626)
    End If
End Sub

Sub sub0BBA (ByVal pv065C As Integer ' 81)
Dim l065E ' 80
Dim l0660 ' 80
Dim l0662 As Integer ' 81
Dim l0664 As Integer ' 81
Dim l0666 As Single ' 83
Dim l066A As Integer ' 81
Dim l066C As Integer ' 81
Dim l066E As Single ' 83
Dim l0670 As Single ' 83
Dim l0672 As Single ' 83
' Const mc0674 = 60 ' &H3C%
' Const mc0678 = 12 ' &HC%
    On Error GoTo L2D578
    If  gv1EE6 = True Then
        Exit Sub
    End If
    gv1EB4 = True
    If  gv14C2(m01BC).M5483 And UBound(gv14C2) = m01BC Then pv065C = -1
    If  fn0EEF() > False And pv065C <> -1 Then
        If  frmDungeonMain!picMonGroups.Visible = False Then
            frmDungeonMain!picMonGroups.Visible = True
        End If
    Else
        frmDungeonMain!picMonGroups.Visible = False
    End If
    If  pv065C > -1 Then
        sub0B9B
    Else
        frmDungeonMain!picMonGroups.Visible = False
        For l0660 = False To mc0186 - 1
            frmDungeonMain!lblMonster(l0660).Caption = ""
        Next l0660
        frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc01D0)
    End If
    If  pv065C > -1 Then
        If  gv1E38(0).M4EF9 > 0 Then
            frmDungeonMain!lblMonsterHit.Visible = True
            If  gv1E38(0).M4EF9 = 1 Then
                frmDungeonMain!lblMonsterHit.Caption = LTrim$(Str$(gv1E38(0).M4EF9)) + " " + fn0E23(m01BC, gv1E38(0).M4EF9, gv1E38(0)) + " offers to 'j'oin."
            Else
                frmDungeonMain!lblMonsterHit.Caption = LTrim$(Str$(gv1E38(0).M4EF9)) + " " + fn0E23(m01BC, gv1E38(0).M4EF9, gv1E38(0)) + " offer to 'j'oin."
            End If
        End If
    End If
    l0664 = True
    For l065E = 0 To mc0186 - 1
        If  gv1E38(l065E).M4EDC > 0 And pv065C > -1 Then
            l0662 = l0662 + 1
        End If
    Next l065E
    If  fn0C3B(gv1E38(0).M4EDC, gv1E38(0).M4ED4) = True Then
        l0662 = l0662 - 1
        If  l0662 < 1 Then l0662 = 1
    End If
    l0670 = frmDungeonMain.ScaleWidth / gv19C2(mc0614).M5E20
    l0672 = l0670
    l066E = (frmDungeonMain!picMonsters.ScaleWidth / 2)
    If  l0662 <> gv1EAE Or pv065C = -1 Then
        frmDungeonMain!picMonsters.Line (l066E - ((mc0674 + 1) * l0670 * 2), 7 * l0672)-(l066E + ((mc0674 + 1) * l0670 * 2), (7 * l0672) + mc0674 * l0670), frmDungeonMain!picMonsters.BackColor, BF
    End If
    l0664 = False
    gv1EAE = False
    If  pv065C > -1 Then
        For l065E = 0 To mc0186 - 1
            If  gv1E38(l065E).M4EDC > 0 And pv065C > -1 Then
                l066A = ((gv14F6(gv1E38(l065E).M4ED4).M5A1B - 1) Mod 10)
                l066C = Int((gv14F6(gv1E38(l065E).M4ED4).M5A1B - 1) / 10)
                If  fn0C3B(gv1E38(l065E).M4EDC, gv1E38(l065E).M4ED4) = False Then
                    l0664 = l0664 + 1
                    gv1EAE = gv1EAE + 1
                    If  gv1A66.M5F04 = False Then
                        l0666 = l066E - (((mc0674 * l0670) / 2) * l0662) + ((l0664 - 1) * (mc0674 * l0670))
                    Else
                        l0666 = l066E - ((mc0674 / 2) * l0662) + ((l0664 - 1) * mc0674)
                    End If
                    If  fn0380(mc0154, gv14F6(gv1E38(l065E).M4ED4).M55BE) = False Or (fn0380(mc0154, gv14F6(gv1E38(l065E).M4ED4).M55BE) = True And gv14C2(gv1A86).M56B9(mc0156)) Then
                        If  gv1A66.M5F04 = False Then
                            l0660 = extfn01C4(frmDungeonMain!picMonsters.hDC, l0666, 7 * l0672, mc0674 * l0670, mc0674 * l0672, gv2BB8, (l066A * mc0674), (l066C * mc0674), mc0674, mc0674, mc0626)
                        Else
                            l0660 = extfn182D(frmDungeonMain!picMonsters.hDC, l0666, 7 * l0672, mc0674, mc0674, gv2BB8, (l066A * mc0674), (l066C * mc0674), mc0626)
                        End If
                    Else
                        If  gv1A66.M5F04 = False Then
                            frmDungeonMain!picMonsters.Line (l0666, 7 * l0672)-(l0666 + (mc0674 * l0670), (7 * l0672) + (mc0674 * l0672)), frmDungeonMain!picMonsters.BackColor, BF
                        Else
                            frmDungeonMain!picMonsters.Line (l0666, 7 * l0672)-(l0666 + mc0674, (7 * l0672) + mc0674), frmDungeonMain!picMonsters.BackColor, BF
                        End If
                    End If
                End If
            End If
        Next l065E
        For l065E = 0 To mc0186 - 1
            If  gv1E38(l065E).M4EDC > 0 And pv065C > -1 Then
                If  gv14F6(gv1E38(l065E).M4ED4).M5A57 > 1 And gv14F6(gv1E38(l065E).M4ED4).M5A57 <= mc0678 Then
                    frmDungeonMain!lblMonster(l065E).Caption = LTrim$(Str$(l065E + 1)) + "." + Str$(gv1E38(l065E).M4EDC) + " " + fn0E23(gv1A86, gv1E38(l065E).M4EDC, gv1E38(l065E))
                Else
                    frmDungeonMain!lblMonster(l065E).Caption = LTrim$(Str$(l065E + 1)) + ". " + fn0E23(gv1A86, gv1E38(l065E).M4EDC, gv1E38(l065E))
                End If
                frmDungeonMain!lblMonster(l065E).Visible = True
            Else
                frmDungeonMain!lblMonster(l065E).Visible = False
            End If
        Next l065E
    End If
    If  gv14C2(m01BC).M5470 = 0 Then
        gv1EB4 = False
        Exit Sub
    End If
    If  l0662 = 0 Or pv065C = -1 Then
        frmDungeonMain!timCombat.Enabled = False
        gv1E66(m01BC).M547A = -1
        frmDungeonMain!lblCurrentGroup.Caption = ""
        frmDungeonMain!lblCurrentGroup.Visible = False
    Else
        frmDungeonMain!timCombat.Enabled = True
        If  gv1E66(m01BC).M547A = -1 Then
            gv1E66(m01BC).M547A = 0
        End If
    End If
    gv1EB4 = False
    Exit Sub

L2D578:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monShowMonsters.  Please Report."
    gv1EB4 = False
    Resume L2D5FC
L2D5FC:
End Sub

Sub sub0B9B ()
Dim l067E As Integer ' 81
Dim l0680 As Single ' 83
Dim l0682 As Single ' 83
Dim l0684 As Single ' 83
Dim l0686 As Single ' 83
    gv1EB8 = True
    l0684 = (frmDungeonMain.ScaleWidth) / gv19C2(mc0614).M5E20
    l0686 = l0684
    l0680 = 3 * l0684
    l0682 = 8 * l0686
    If  fn0EEF() > False Then
        If  gv1E38(0).M4ECC = mc018A Then
            If  gv1A66.M5F04 = False Then
                If  gv14F6(gv1E38(0).M4ED4).M5467 = mc01C8 Then
                    l067E = extfn01C4(frmDungeonMain!picMonsters.hDC, l0680, l0682, mc0622 * l0684, mc0622 * l0686, gv2BBC, mc0622 * 5, 0, mc0622, mc0622, mc0626)
                Else
                    l067E = extfn01C4(frmDungeonMain!picMonsters.hDC, l0680, l0682, mc0622 * l0684, mc0622 * l0686, gv2BBC, 0, 0, mc0622, mc0622, mc0626)
                End If
            Else
                If  gv14F6(gv1E38(0).M4ED4).M5467 = mc01C8 Then
                    l067E = extfn182D(frmDungeonMain!picMonsters.hDC, l0680, l0682, mc0622, mc0622, gv2BBC, mc0622 * 5, 0, mc0626)
                Else
                    l067E = extfn182D(frmDungeonMain!picMonsters.hDC, l0680, l0682, mc0622, mc0622, gv2BBC, 0, 0, mc0626)
                End If
            End If
        Else
            If  gv1A66.M5F04 = False Then
                l067E = extfn01C4(frmDungeonMain!picMonsters.hDC, l0680, l0682, mc0622 * l0684, mc0622 * l0686, gv2BBC, mc0622, 0, mc0622, mc0622, mc0626)
            Else
                l067E = extfn182D(frmDungeonMain!picMonsters.hDC, l0680, l0682, mc0622, mc0622, gv2BBC, mc0622, 0, mc0626)
            End If
        End If
    Else
        frmDungeonMain!picMonsters.Line (l0680, l0682)-(l0680 + (mc0622 * l0684), l0682 + (mc0622 * l0686)), frmDungeonMain!picMonsters.BackColor, BF
        frmDungeonMain!lblMonsterHit.Caption = ""
    End If
    gv1EB8 = False
End Sub

Sub sub0FE1 ()
    If  fn0EEF() > False Then
        If  gv1A84 = gv1A86 Then
            If  gv1E7C(gv1A86) > False Then
                frmDungeonMain!lblCharacterHit.Caption = "Opening Chest (" + LTrim$(Str$(gv1E7C(gv1A86))) + " round(s) to go)"
                frmDungeonMain!lblCharacterHit.Visible = True
            Else
                frmDungeonMain!lblCharacterHit.Caption = ""
            End If
        End If
    End If
End Sub

Function fn0B4E () As Integer ' 1
Dim l068C As Integer ' 81
Dim l068E ' 80
    On Error GoTo L2DB08
    For l068E = 0 To UBound(gv1E38)
        If  gv1E38(l068E).M4EDC > 0 And gv1E38(l068E).M4ED4 > False Then
            If  fn0380(m0240, gv14F6(gv1E38(l068E).M4ED4).M55BE) = True Then l068C = True
        End If
    Next l068E
    fn0B4E = l068C

L2DAFA:
    Exit Function

L2DB08:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monCanMonsterSeeInvisible"
    Resume L2DAFA
End Function
