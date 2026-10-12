Function fn14CB (p054E ' 40, p0550 ' 40) As Integer ' 1
Dim l0552 As String ' 87
Dim l0554 As Integer ' 81
Dim l0556 As Long ' 82
Dim l0558 As Long ' 82
Dim l055A As Integer ' 81
Dim l055C As Integer ' 81
Dim l055E ' 80
Dim l0564 As T5810 ' 8A
Dim l0566 As Integer ' 81
Dim l0568 As Integer ' 81
Dim l056A As Integer ' 81
' Const mc056C = 27 ' &H1B%
' Const mc0572 = 188 ' &HBC%
' Const mc0574 = 1 ' &H1%
' Const mc0576 = 1 ' &H1%
' Const mc0578 = 190 ' &HBE%
' Const mc057A = 112 ' &H70%
' Const mc057C = 1 ' &H1%
' Const mc0580 = 83 ' &H53%
' Const mc0582 = 4 ' &H4%
Dim l0586 As T576E ' 8A
' Const mc0588 = 10 ' &HA%
' Const mc058A = 65 ' &H41%
' Const mc058C = 4 ' &H4%
' Const mc0590 =-2 ' &HFFFE%
' Const mc0592 = 192 ' &HC0%
' Const mc0594 = 191 ' &HBF%
' Const mc0596 = 77 ' &H4D%
' Const mc0598 = 113 ' &H71%
' Const mc059A = 4 ' &H4%
' Const mc059C = 114 ' &H72%
' Const m059E = 0 ' &H0%
' Const mc05A0 = 115 ' &H73%
' Const mc05A2 = 3 ' &H3%
' Const mc05A4 = 116 ' &H74%
' Const mc05A6 = 2 ' &H2%
' Const mc05A8 = 117 ' &H75%
' Const mc05AA = 6 ' &H6%
' Const mc05AC = 118 ' &H76%
' Const mc05AE = 7 ' &H7%
' Const mc05B0 = 119 ' &H77%
' Const mc05B2 = 120 ' &H78%
' Const mc05B4 = 5 ' &H5%
' Const mc05B6 = 121 ' &H79%
' Const mc05BC = 1 ' &H1%
' Const mc05BE = 90 ' &H5A%
' Const m05C2 = 0 ' &H0%
' Const mc05C4 = 1 ' &H1%
' Const mc05C6 = 67 ' &H43%
' Const mc05C8 = 1 ' &H1%
' Const m05CA = 0 ' &H0%
' Const mc05CC = 69 ' &H45%
Static m05CE As Integer ' 61
' Const mc05D0 = 68 ' &H44%
' Const mc05D8 = 2 ' &H2%
' Const mc05DA = 2 ' &H2%
' Const mc05DC = 73 ' &H49%
' Const mc05DE = 3 ' &H3%
' Const mc05E0 = 85 ' &H55%
' Const mc05E2 = 1 ' &H1%
' Const mc05E4 = 81 ' &H51%
' Const mc05E6 = 80 ' &H50%
' Const mc05EA = 2 ' &H2%
' Const mc05EC = 76 ' &H4C%
' Const mc05EE = 71 ' &H47%
Dim l05F0 As Long ' 82
Dim l05F2 As Integer ' 81
' Const mc05F4 = 78 ' &H4E%
' Const mc05F6 = 82 ' &H52%
' Const mc05FE = 38 ' &H26%
' Const mc0600 = 39 ' &H27%
' Const mc0602 = 37 ' &H25%
' Const mc0604 = 40 ' &H28%
Static m060A As Integer ' 61
' Const mc060C = 1 ' &H1%
' Const mc060E = 2 ' &H2%
' Const mc0610 = 5 ' &H5%
' Const mc0612 = 3 ' &H3%
' Const mc0614 = 1 ' &H1%
' Const mc0618 = 35 ' &H23%
' Const mc0620 = 4 ' &H4%
' Const mc0622 = 2 ' &H2%
Static m0624 As Integer ' 61
' Const mc0628 = 20 ' &H14%
' Const mc062A = 84 ' &H54%
' Const mc062C = 12 ' &HC%
' Const mc0630 = 13 ' &HD%
' Const mc0632 = 21 ' &H15%
' Const mc0634 = 15 ' &HF%
' Const mc0636 = 70 ' &H46%
' Const mc0638 = 32 ' &H20%
Static m063A As Integer ' 61
' Const mc063C = 79 ' &H4F%
' Const mc0642 = 1 ' &H1%
' Const mc0644 = 74 ' &H4A%
Dim l0646 As Integer ' 81
    DoEvents
    On Error GoTo L4154E
    If  gv1B52 = False Then Exit Function
    If  fn1589(p054E, p0550) Then Exit Function
    If  p054E = mc056C Then
        fn14CB = True
        gv1BFC.SetFocus
        Exit Function
    End If
    Select Case p054E
        Case mc0572
            fn14CB = True
            If  gv1D64 = mc0574 Then
                If  p0550 = mc0576 Then
                    If  frmAutoMap!hsbLevel.Value > 1 Then
                        frmAutoMap!hsbLevel.Value = frmAutoMap!hsbLevel.Value - 1
                    End If
                End If
            End If
        Case mc0578
            fn14CB = True
            If  gv1D64 = mc0574 Then
                If  p0550 = mc0576 Then
                    If  frmAutoMap!hsbLevel.Value < frmAutoMap!hsbLevel.Max Then
                        frmAutoMap!hsbLevel.Value = frmAutoMap!hsbLevel.Value + 1
                    End If
                End If
            End If
        Case mc057A
            fn14CB = True
            l0552 = Space$(Len(App.HelpFile))
            l0552 = App.HelpFile
            l0554 = extfn012C(frmMain.hWnd, l0552, mc057C, CLng(Screen.ActiveForm.HelpContextID))
        Case mc0580
            fn14CB = True
            If  p0550 = mc0582 Then
                If  gv1A82 <> gv1A86 Then sub14E0 gv1A86
            Else
                l0552 = fn16A0("Swap Items", "Enter the Item Slots to Swap" + Chr$(13) + "(i.e '12,17')", "", "TELEPORT")
                If  l0552 = "" Or InStr(l0552, ",") = False Or Len(l0552) > 5 Then
                    Exit Function
                End If
                l0568 = CInt(Left(l0552, InStr(l0552, ",") - 1))
                l056A = CInt(Right(l0552, Len(l0552) - InStr(l0552, ",")))
                If  l0568 <= 1 Or l0568 > mc02D6 Then
                    Exit Function
                End If
                If  l056A <= 1 Or l056A > mc02D6 Then
                    Exit Function
                End If
                l0568 = l0568 - 1
                l056A = l056A - 1
                l0586 = gv14C2(gv1A86).M5857(l0568)
                gv14C2(gv1A86).M5857(l0568) = gv14C2(gv1A86).M5857(l056A)
                gv14C2(gv1A86).M5857(l056A) = l0586
                sub0F61 gv1A86, m00DC, l0568
                sub0F61 gv1A86, m00DC, l056A
                sub085B "Item swap completed!"
                For l055E = 0 To mc0588 - 1
                    sub0F4C l055E
                Next l055E
            End If
        Case mc058A
            fn14CB = True
            If  gv14C2(m00DC).M5483 = False Then
                If  UBound(gv14C2) >= mc058C - 1 Then
                    sub085B "Your party is too full!"
                    Exit Function
                End If
                l055C = Val(fn16A0("Ask to Join", "Character's Name?", "", "JOIN"))
                If  l055C = -1 Then
                    Exit Function
                End If
                l0566 = FreeFile
                Open gv19E8 + gc1C74 + gc1C10 For Random As #l0566 Len = mc01EC
                Get #l0566, gv1732(l055C).M5467, l0564
                Close #l0566
                If  RTrim(l0564.M594C) <> "" Then
                    l0552 = fn16A0("Ask to Join", "Enter Password", "", "PASSWORD")
                    If  l0552 = "-1" Then
                        Exit Function
                    End If
                Else
                    l0552 = ""
                End If
                l055A = fn04CD(gv1732(l055C).M548B, l0552, UBound(gv14C2) + 1, False)
                Select Case l055A
                    Case True
                        For l055E = 0 To UBound(gv14C2) - 1
                            If  Abs(gv14C2(l055E).M4EBF - gv14C2(UBound(gv14C2)).M4EBF) > 1 Then
                                sub085B Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is oppositely aligned to one or more members of the party!"
                                sub04DC UBound(gv14C2)
                                Exit Function
                            End If
                        Next l055E
                        sub0848 True
                        If  gv14C2(UBound(gv14C2)).M5483 <> False Then
                            If  fn0EEF() > False Then
                                sub085B "Cannot raise character in Combat!"
                                sub04DC UBound(gv14C2)
                                Exit Function
                            End If
                            If  gv14C2(gv1A86).M5943 >= mc018A Then
                                If  RTrim(gv14C2(UBound(gv14C2)).M548B) = RTrim(gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B) Then
                                    sub085B "Drop the character before you raise them!"
                                    sub04DC UBound(gv14C2)
                                    Exit Function
                                End If
                            End If
                            If  gv14C2(UBound(gv14C2)).M58E9 > False Then
                                If  fn10A3(UBound(gv14C2)) = False Then
                                    sub04DC UBound(gv14C2)
                                    Exit Function
                                End If
                            Else
                                sub085B Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is Dead!  Cast a Resurrect spell on the character to have them re-join!"
                                sub04DC UBound(gv14C2)
                                Exit Function
                            End If
                        End If
                        If  UBound(gv14C2) > m00DC Then
                            If  gv14C2(m00DC).M5470 = False Then
                                gv14C2(UBound(gv14C2)).M4EAC = gv14C2(UBound(gv14C2)).M4EB4
                            End If
                        End If
                        gv14C2(UBound(gv14C2)).M583F = gv14C2(m00DC).M583F
                        gv14C2(UBound(gv14C2)).M5845 = gv14C2(m00DC).M5845
                        gv14C2(UBound(gv14C2)).M5470 = gv14C2(m00DC).M5470
                        If  gv14C2(m00DC).M5470 = 0 Then gv14C2(UBound(gv14C2)).M5830 = fn1338(UBound(gv14C2))
                        sub14F4
                        If  fn0EEF() > False Then sub0BDE UBound(gv14C2)
                    Case False
                        l0554 = MsgBox("An error occurred while trying" + Chr$(13) + "to load " + gv1732(l055C).M548B + "!", 64, "ERROR!")
                        Exit Function
                    Case mc0590
                        l0554 = MsgBox("Incorrect Password!", 64, "SORRY!")
                        Exit Function
                    Case Else
                        l0554 = MsgBox("Unknown error" + Str$(l055A) + " reading character!", 64, "SORRY!")
                        Exit Function
                End Select
            End If
        Case mc0592
        Case mc0594
        Case mc0596
            fn14CB = True
        Case mc0598
            fn14CB = True
            sub150A mc059A, 0, 0, 0, 0, 0
        Case mc059C
            fn14CB = True
            frmCharStat1!tabStatTab.P?C01E = m059E
            frmCharStat1!lblCall = "UPDATE"
        Case mc05A0
            If  p0550 = mc0582 Then
                Exit Function
            Else
                fn14CB = True
                sub150A mc05A2, 0, 0, 0, 0, 0
            End If
        Case mc05A4
            fn14CB = True
            sub151C mc05A6, 0, 0, 0, 0, 0
        Case mc05A8
            fn14CB = True
            If  p0550 = False Then
                sub150A mc05AA, 0, 0, 0, 0, 0
            Else
                sub150A mc05AA, True, 0, 0, 0, 0
                sub150A mc05AA, 0, 0, 0, 0, 0
            End If
        Case mc05AC
            fn14CB = True
            sub150A mc05AE, 0, 0, 0, 0, 0
        Case mc05B0
            fn14CB = True
            frmAutoMap.Show
            frmAutoMap.WindowState = False
        Case mc05B2
            fn14CB = True
            frmCharStat1!tabStatTab.P?C01E = mc05B4
            frmCharStat1!lblCall = "UPDATE"
        Case mc05B6
            frmControlPanel.Show mc05BC
            fn14CB = True
            If  gv14C2(m00DC).M5470 = 0 Then
                frmCityMain.SetFocus
            Else
                frmDungeonMain.SetFocus
            End If
        Case mc05BE
            If  gv19D8 = m05C2 Then
                sub152F mc05C4
            Else
                sub152F m05C2
            End If
        Case mc05C6
            fn14CB = True
            If  gv14C2(gv1A86).M5470 = 0 Or gv14C2(gv1A86).M5483 <> False Then
                Exit Function
            End If
            If  frmCharStat3.WindowState = mc05C8 Then
                frmCharStat3.WindowState = m05CA
            End If
            frmCharStat3!lblCall = "SPELL"
        Case mc05CC
            fn14CB = True
            frmCharStat3!lblCall = Str$(m05CE + 1)
        Case mc05D0
            fn14CB = True
            If  fn0EEF() > False And gv14C2(gv1A86).M56B9(mc0152) = False Then
                If  gv1E7C(gv1A86) > 0 Then
                    frmDungeonMain!lblCharacterHit.Caption = ""
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                gv1E66(gv1A86).M4E97 = mc05D8
                gv1E66(gv1A86).M56C4 = -1
                gv1E66(gv1A86).M5766 = -1
                sub0BCD
            Else
                frmCharStat3!lblCall = Str$(mc05DA + 1)
            End If
        Case mc05DC
            fn14CB = True
            If  gv14C2(gv1A86).M5470 > 0 Then
                frmCharStat3!lblCall = Str$(mc05DE + 1)
            End If
        Case mc05E0
            fn14CB = True
            If  gv14C2(gv1A86).M5470 > 0 Then
                frmCharStat3!lblCall = Str$(mc05E2 + 1)
            End If
        Case mc05E4
            fn14CB = True
            If  (fn0EEF() = False And gv14C2(m00DC).M5470 > False) Or gv14C2(0).M5470 = False Or gv14C2(gv1A86).M5483 > 0 Then
                l0552 = "Exit to Main Menu?"
                If  MsgBox(l0552, 36, "EXIT") = mc00BE Then
                    gv1ACC.M6023 = True
                    gv1ACC.M6014 = True
                    Exit Function
                End If
            Else
                Beep
                sub085B "Cannot exit while monsters are in the area!"
                Exit Function
            End If
        Case mc05E6
            fn14CB = True
            Select Case p0550
                Case mc0582
                    If  fn0EEF() > 0 And gv1E38(0).M4ECC = mc0220 Then
                        sub085B "Cannot pool gold while in combat!"
                    Else
                        If  UBound(gv14C2) > m00DC Then
                            For l055E = False To UBound(gv14C2)
                                If  l055E = gv1A84 Then
                                Else
                                    gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + gv14C2(l055E).M4F2D
                                    gv14C2(l055E).M4F2D = False
                                End If
                            Next l055E
                            sub08A9 True, 10
                            sub085B "Pool of party's on-hand gold to " + Chr(34) + RTrim(gv14C2(gv1A86).M548B) + Chr(34) + " completed!"
                        Else
                            sub085B "Nobody else in party to Pool to!"
                        End If
                    End If
                Case Else
                    If  gv14C2(gv1A86).M5483 = False And gv14C2(gv1A86).M56B9(mc0152) = 0 Then
                        l055C = Val(fn16A0("Pickup Character", "Character's Name?", "", "PICKUP"))
                        If  l055C = -1 Then
                            Exit Function
                        End If
                        l0566 = FreeFile
                        Open gv19E8 + gc1C74 + gc1C10 For Random As #l0566 Len = mc01EC
                        Get #l0566, gv1732(l055C).M5467, l0564
                        Close #l0566
                        If  l0564.M5914(mc05EA) = True Then
                            sub085B Chr$(34) + l0564.M548B + Chr$(34) + " is Hidden!"
                            Exit Function
                        End If
                        If  gv14C2(gv1A86).M5943 <> -1 Then
                            If  gv14C2(gv1A86).M5943 < mc018A Then
                                gv14C2(gv1A86).M58CB(gv14C2(gv1A86).M5943).M4ED4 = -1
                                sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + fn1235(gv1A86, gv14C2(gv1A86).M5943) + "."
                                sub0B82 gv1A86
                            Else
                                sub0A7C gv14C2(gv1A86).M5943 - mc018A, 0, 0
                                sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34) + "."
                            End If
                            gv14C2(gv1A86).M5943 = -1
                            sub0F38
                        End If
                        gv14C2(gv1A86).M5943 = l055C + mc018A
                        sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is now carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34) + "."
                        sub0F38
                    End If
            End Select
        Case mc05EC
            fn14CB = True
            If  p0550 = mc0582 Then
                sub1547 gv1A86
            Else
                If  gv14C2(gv1A86).M56B9(mc0152) = 0 Then
                    If  gv14C2(gv1A86).M5943 <> -1 Then
                        If  gv14C2(gv1A86).M5943 < mc018A Then
                            gv14C2(gv1A86).M58CB(gv14C2(gv1A86).M5943).M4ED4 = -1
                            sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + fn1235(gv1A86, gv14C2(gv1A86).M5943) + "."
                            sub0B82 gv1A86
                        Else
                            sub0A7C gv14C2(gv1A86).M5943 - mc018A, 0, 0
                            sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34) + "."
                        End If
                        gv14C2(gv1A86).M5943 = -1
                        sub0F38
                    End If
                End If
            End If
        Case mc05EE
            fn14CB = True
            If  gv14C2(gv1A86).M56B9(mc0152) = False Then
                If  UBound(gv14C2) = False Then
                    sub085B "Nobody in party to give to!"
                    Exit Function
                End If
                l055C = Val(fn16A0("Give to Character", "Character's Name?", "", "GIVE"))
                If  l055C = -1 Then
                    Exit Function
                End If
                l05F0 = CLng(fn16A0("Give to " + Chr$(34) + RTrim(gv14C2(l055C).M548B) + Chr$(34), "How much Gold?", "", "GIVEGOLD"))
                If  l05F0 = -1 Then
                    Exit Function
                End If
                l05F2 = Val(fn16A0("Give to " + Chr$(34) + RTrim(gv14C2(l055C).M548B) + Chr$(34), "Which Item #?", "", "GIVEITEM"))
                If  l05F2 = -1 Then
                    Exit Function
                End If
                If  l05F2 > 1 Then
                    l05F2 = l05F2 - 1
                Else
                    l05F2 = False
                End If
                sub145F gv1A86, l055C, l05F2, l05F0
            End If
        Case mc05F4
            fn14CB = True
            If  UBound(gv14C2) > False Then
                l055E = gv1A86 + 1
                If  l055E > UBound(gv14C2) Then
                    l055E = False
                End If
                frmParty!lblCall = CStr(l055E)
            End If
        Case mc05F6
            If  p0550 = mc0582 Then
                If  fn0EEF() = False Or gv1E38(0).M4ECC = m0294 Then
                    If  fn03BD(frmAutoMap) Then
                        sub085B "Printing Current Automap Level..."
                        frmPrint.Show mc05BC
                        Unload frmPrint
                    Else
                        sub085B "Must have Automap open to print!"
                    End If
                Else
                    sub085B "Cannot print the Automap while in Combat!"
                End If
            End If
        Case 48 To 57
        Case Else
    End Select
    If  gv14C2(gv1A86).M5470 > 0 And gv14C2(gv1A86).M5483 = False Then
        Select Case p054E
            Case mc05FE, mc0600, mc0602, mc0604
                fn14CB = True
                If  gv1E7C(gv1A86) > 0 Then
                    frmDungeonMain!lblCharacterHit.Caption = ""
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                If  gv14C2(gv1A86).M56B9(mc0152) = False And gv1EB2 = False Then
                    If  gv1E38(0).M4ED4 > -1 Then
                        sub0BCD
                    End If
                    If  p054E = mc05FE Then
                        l0558 = fn0B1B(gv14C2(m00DC))
                        If  fn0380(m060A, l0558) = False Then
                            If  gv14C2(gv1A86).M5899 = mc01B6 Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845)
                                    If  fn0380(mc060E, l0558) Then
                                        l0556 = fn0418(mc0610, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0612, l0556, True)
                                    End If
                                    l0556 = fn0418(mc0614, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D54% = gv14C2(m00DC).M5845
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + 1
                                If  gv14C2(m00DC).M5845 > gv1864.M420C Then
                                    gv14C2(m00DC).M5845 = gv1864.M420C
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv14C2(m00DC).M5899 = mc01B8 Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845)
                                    If  gv1B5C(2) = mc0620 + 10 Then
                                        l0556 = fn0418(mc0620, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0622, l0556, True)
                                    End If
                                    l0556 = fn0418(m0624, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D52% = gv14C2(m00DC).M583F
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + 1
                                If  gv14C2(m00DC).M583F > gv1864.M4216 Then
                                    gv14C2(m00DC).M583F = gv1864.M4216
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv14C2(m00DC).M5899 = mc01BA Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845 - 1)
                                    If  gv1B5C(2) = mc0610 + 10 Then
                                        l0556 = fn0418(mc0610, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0612, l0556, True)
                                    End If
                                    l0556 = fn0418(mc0614, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845 - 1, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D54% = gv14C2(m00DC).M5845
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - 1
                                If  gv14C2(m00DC).M5845 < 1 Then
                                    gv14C2(m00DC).M5845 = 1
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv14C2(m00DC).M5899 = mc01BC Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F - 1, gv14C2(m00DC).M5845)
                                    If  gv1B5C(2) = mc0620 + 10 Then
                                        l0556 = fn0418(mc0620, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0622, l0556, True)
                                    End If
                                    l0556 = fn0418(m0624, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F - 1, gv14C2(m00DC).M5845, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D52% = gv14C2(m00DC).M583F
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - 1
                                If  gv14C2(m00DC).M583F < 1 Then
                                    gv14C2(m00DC).M583F = 1
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv1D52% <> gv14C2(m00DC).M583F Or gv1D54% <> gv14C2(m00DC).M5845 Then
                                sub0835 gv14C2(m00DC).M5470
                            End If
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                            End If
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            sub0980
                        Else
                            If  fn0380(mc0628, fn0AD3(fn0AE8(gv14C2(m00DC)))) = True Then
                                Select Case gv14C2(m00DC).M5899
                                    Case mc01B6
                                        l0568 = gv14C2(m00DC).M583F
                                        l056A = gv14C2(m00DC).M5845
                                    Case mc01B8
                                        l0568 = gv14C2(m00DC).M583F
                                        l056A = gv14C2(m00DC).M5845
                                    Case mc01BA
                                        l0568 = gv14C2(m00DC).M583F
                                        l056A = gv14C2(m00DC).M5845 - 1
                                    Case mc01BC
                                        l0568 = gv14C2(m00DC).M583F - 1
                                        l056A = gv14C2(m00DC).M5845
                                    Case Else
                                End Select
                                If  l0568 > False And l056A > False And l0568 <= gv1864.M4216 And l056A <= gv1864.M420C Then
                                    Select Case gv14C2(m00DC).M5899
                                        Case mc01B6, mc01BA
                                            l0556 = fn0A34(l0568, l056A)
                                            l0556 = fn0418(mc0614, l0556, True)
                                        Case Else
                                            l0556 = fn0A34(l0568, l056A)
                                            l0556 = fn0418(m0624, l0556, True)
                                    End Select
                                    If  fn0ABD(l0568, l056A, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                    If  gv1D64 <> m01AA Then
                                        frmAutoMap!lblCall = "DRAW"
                                    End If
                                End If
                            End If
                            sub09DE mc0618
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                    If  p054E = mc0600 Then
                        gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 + 1
                        If  gv14C2(m00DC).M5899 > mc01BC Then
                            gv14C2(m00DC).M5899 = mc01B6
                        End If
                        sub0980
                        If  p0550 = mc0576 Then
                            l0554 = fn14CB(mc05FE, False)
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                    If  p054E = mc0602 Then
                        gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 - 1
                        If  gv14C2(m00DC).M5899 < mc01B6 Then
                            gv14C2(m00DC).M5899 = mc01BC
                        End If
                        sub0980
                        If  p0550 = mc0576 Then
                            l0554 = fn14CB(mc05FE, False)
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                    If  p054E = mc0604 Then
                        gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 - 2
                        If  gv14C2(m00DC).M5899 < mc01B6 Then
                            gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 + mc01BC
                        End If
                        sub0980
                        If  p0550 = mc0576 Then
                            l0554 = fn14CB(mc05FE, False)
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                End If
            Case mc062A
                fn14CB = True
                If  gv1E7C(gv1A86) > 0 Then
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                gv1D6C = gv14C2(m00DC).M5470
                If  gv14C2(gv1A86).M5483 = False And gv14C2(gv1A86).M56B9(mc0152) = False Then
                    If  fn0380(mc062C, fn0AD3(fn0AE8(gv14C2(gv1A86)))) <> False Then
                        If  gv14C2(m00DC).M5470 = 1 Then
                            gv14C2(m00DC).M5470 = 0
                            Unload frmDungeonMain
                            frmCityMain.Show
                            Exit Function
                        Else
                            gv14C2(m00DC).M5470 = gv14C2(m00DC).M5470 - 1
                            If  fn0A0B(m00DC) = False Then
                                l0554 = MsgBox("Failure opening " + gv19E8 + gc1C34 + "!", 64, "ERROR")
                                Unload frmDungeonMain
                                gv14C2(m00DC).M5470 = 0
                                frmCityMain.Show
                            End If
                            sub0835 gv1D6C
                            sub0980
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            Exit Function
                        End If
                    End If
                End If
                If  fn0380(mc0630, fn0AD3(fn0AE8(gv14C2(gv1A86)))) Then
                    If  gv14C2(m00DC).M5470 = mc01F8 Then
                        Exit Function
                    Else
                        gv14C2(m00DC).M5470 = gv14C2(m00DC).M5470 + 1
                        If  fn0A0B(m00DC) = False Then
                            l0554 = MsgBox("Failure opening " + gv19E8 + gc1C34 + "!", 64, "ERROR")
                            Unload frmDungeonMain
                            gv14C2(m00DC).M5470 = 0
                            frmCityMain.Show
                        End If
                        sub0835 gv1D6C
                        sub0980
                        If  gv1D64 <> m01AA Then
                            frmAutoMap!lblCall = "UPDATE"
                        End If
                        Exit Function
                    End If
                End If
                If  fn0380(mc0632, fn0AD3(fn0AE8(gv14C2(gv1A86)))) Then
                    If  m00B6 = True And gv14C2(m00DC).M5470 = mc0634 Then
                        sub085B "You cannot take this Chute in the Limited Version."
                    Else
                        For l055E = m00DC To UBound(gv14C2)
                            sub08F5 l055E
                        Next l055E
                        l0554 = fn0A0B(m00DC)
                        sub0835 gv14C2(m00DC).M5470
                        sub0980
                        If  gv1D64 <> m01AA Then
                            frmAutoMap!lblCall = "UPDATE"
                        End If
                    End If
                End If
            Case mc0636
                fn14CB = True
                l0554 = False
                If  gv1E7C(gv1A86) > 0 Then
                    frmDungeonMain!lblCharacterHit.Caption = ""
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                If  gv1E38(0).M4EF9 > 0 Then
                    frmDungeonMain!lblMonsterHit = ""
                    gv1E38(0).M4EF9 = 0
                End If
                If  gv14C2(gv1A86).M5483 = False Then
                    If  gv1E38(0).M4ED4 > -1 Then
                        If  gv1E38(0).M4ECC = m0294 Then
                            gv1E38(0).M4ECC = mc0220
                            sub0BDE -1
                            l0554 = True
                        End If
                        gv1E66(gv1A86).M4E97 = mc0122
                        gv1E66(gv1A86).M56C4 = -1
                        gv1E66(gv1A86).M5766 = -1
                        sub0BBA 0
                        sub0BCD
                        If  l0554 = True Then
                            sub155A gv14C2(m00DC).M59BB
                        End If
                    End If
                End If
            Case mc0638
                fn14CB = True
                If  gv1E7C(gv1A86) > 0 Then
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                If  gv14C2(gv1A86).M5483 = False Then
                    If  gv1E38(0).M4ED4 > -1 Then
                        gv1E66(gv1A86).M4E97 = m063A
                        gv1E66(gv1A86).M56C4 = -1
                        gv1E66(gv1A86).M5766 = -1
                        sub0BBA 0
                        sub0BCD
                    End If
                End If
            Case mc063C
                fn14CB = True
                If  p0550 = mc0582 Then
                    If  fn0EEF() = False Then
                        frmPartyOptions.Show mc05BC
                    Else
                        sub085B "Cannot set default options while monsters are in the area!"
                    End If
                Else
                    If  gv14C2(gv1A86).M5483 = False And gv14C2(gv1A86).M56B9(mc0152) = 0 And gv1E50.M4F3D <= m0184 Then
                        If  fn0EEF() <= False And gv1E50.M4F1B > False And gv1E50.M4F2D > 0 And gv1E50.M4F3D <= m0184 Then
                            sub0F01 gv1A86
                        Else
                            If  gv1E38(0).M4ED4 <> -1 And gv1E50.M4F1B > False Then
                                gv1E38(0).M4ECC = mc0220
                                sub0BDE -1
                                gv1E66(gv1A86).M4E97 = False
                                gv1E66(gv1A86).M56C4 = -1
                                gv1E66(gv1A86).M5766 = -1
                                sub0BBA gv14C2(gv1A86).M59BB
                                sub0BCD
                                If  frmDungeonMain!lblTrap.Visible = True Then
                                    If  gv1E7C(gv1A86) > 0 Then
                                        gv1E7C(gv1A86) = 0
                                    Else
                                        gv1E7C(gv1A86) = CInt(10 - (Log(fn11D4(gv1A86, m0350, False) - 10) * 2))
                                        If  gv1E7C(gv1A86) < 2 Then
                                            gv1E7C(gv1A86) = 2
                                        End If
                                    End If
                                    sub0FE1
                                End If
                            End If
                        End If
                        If  gv14C2(gv1A86).M4EAC < 1 Then
                            gv14C2(gv1A86).M5906(mc0642) = gv14C2(gv1A86).M5906(mc0642) + 1
                            sub0930 l055C
                        End If
                    End If
                End If
            Case mc0644
                fn14CB = True
                If  gv1E38(0).M4EF9 > 0 And gv1E38(0).M4EDC > 0 Then
                    l0646 = gv1E38(0).M4EF9
                    frmDungeonMain!lblMonsterHit.Visible = False
                    If  fn10D1(gv1A86) > 0 Then
                        gv1E38(0).M4EF9 = 0
                        For l055E = 0 To l0646 - 1
                            If  fn10D1(gv1A86) > 0 And gv1E38(0).M4EDC > 0 Then
                                l0554 = fn10BA(gv1A86, gv1E38(0), gv1E38(0).M4EAC, -10)
                                gv1E38(0).M4EDC = gv1E38(0).M4EDC - 1
                            Else
                                Exit For
                            End If
                        Next l055E
                        If  gv1E38(0).M4EDC > 0 Then
                            sub0D08 gv1A86
                        Else
                            If  fn0DCD(-1) = -1 Then
                                sub0C53
                            Else
                                gv1E66(gv1A86).M547A = fn0DCD(-1)
                                sub0BCD
                            End If
                        End If
                    Else
                        gv1E38(0).M4EF9 = l0646
                        sub085B "Join - No room for more Companions!"
                    End If
                    sub0BBA gv14C2(gv1A86).M59BB
                    sub0BCD
                End If
            Case 48 To 57
                fn14CB = True
                Select Case p0550
                    Case False
                        If  p054E > 48 And p054E < 53 Then
                            If  gv1E38(p054E - 49).M4EDC > 0 Then
                                gv1E66(gv1A86).M547A = p054E - 49
                                sub0BCD
                            End If
                        End If
                    Case mc0576
                        If  p054E = 48 Then
                            p054E = 58
                        End If
                        If  gv14C2(gv1A86).M59B0(p054E - 49) > -1 Then
                            If  gv1E7C(gv1A86) > 0 Then
                                frmDungeonMain!lblCharacterHit.Caption = ""
                                gv1E7C(gv1A86) = 0
                                sub0FE1
                            End If
                            If  gv14C2(gv1A86).M59B0(p054E - 49) < mc02D6 Then
                                sub1577 gv1A86, gv14C2(gv1A86).M59B0(p054E - 49)
                            Else
                                l0554 = gv14C2(gv1A86).M59B0(p054E - 49) - mc02D6
                                If  fn0EEF() > False And (gv1E38(0).M4ECC = mc0220 Or (gv1E38(0).M4ECC = m0294 And (fn1448(l0554) = gv1EE0 Or fn1448(l0554) = gc1EE4))) Then
                                    gv1E66(gv1A86).M56C4 = l0554
                                    gv1E66(gv1A86).M5766 = -1
                                    l0554 = fn10E5(gv1A86, gv1E66(gv1A86).M56C4, False, False)
                                    sub0BCD
                                    frmDungeonMain.SetFocus
                                    Exit Function
                                End If
                                l0554 = fn1173(gv1A86, gv14C2(gv1A86).M59B0(p054E - 49) - mc02D6, 0, -1)
                            End If
                        End If
                    Case Else
                End Select
            Case Else
        End Select
    End If
    Exit Function

L4154E:
    sub04FC "Error '" + Error + "' Occurred in MAINMOD2:mdrcharProcessKey.  Please Report."
    Resume L415CC
L415CC:
End Function
