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
