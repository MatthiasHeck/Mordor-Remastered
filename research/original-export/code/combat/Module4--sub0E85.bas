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
