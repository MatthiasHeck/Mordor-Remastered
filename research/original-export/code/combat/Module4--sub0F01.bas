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
