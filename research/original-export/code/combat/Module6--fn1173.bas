Function fn1173 (ByVal pv00FA As Integer ' 81, ByVal pv00FC As Integer ' 81, p00FE ' 40, p0100 As Integer ' 41) As Integer ' 1
Dim l0104 As T5810 ' 8A
Dim l010A As Integer ' 81
Dim l010C As Integer ' 81
Dim l010E As Integer ' 81
Dim l0110 As String ' 87
Dim l0112 As String ' 87
Dim l0114 As Integer ' 81
Dim l0116 As String ' 87
Dim l0118 As Integer ' 81
Dim l011A As Integer ' 81
Dim l011C As Integer ' 81
Dim l011E As Integer ' 81
Dim l0120 As Long ' 82
' Const mc0122 = 1 ' &H1%
Dim l0124 As Integer ' 81
' Const mc0138 = 200 ' &HC8%
' Const mc013A = 9 ' &H9%
' Const mc013C = 150 ' &H96%
' Const mc013E = 100 ' &H64%
' Const mc0148 = 8 ' &H8%
' Const mc014A = 40 ' &H28%
' Const mc014C = 6 ' &H6%
' Const mc014E = 19 ' &H13%
' Const mc0150 = 10 ' &HA%
' Const mc0152 = 2 ' &H2%
' Const m0154 = 0 ' &H0%
' Const mc0156 = 18 ' &H12%
Dim l0158 As Single ' 83
Dim l015A As Single ' 83
Dim l015C As Integer ' 81
Dim l015E As Single ' 83
Dim l0160 As Integer ' 81
' Const m0162 = 0 ' &H0%
' Const mc0164 = 1 ' &H1%
' Const mc0166 = 1 ' &H1%
' Const mc0168 = 2 ' &H2%
' Const mc016A = 3 ' &H3%
' Const mc016C = 3 ' &H3%
' Const mc0170 = 4 ' &H4%
' Const mc0172 = 4 ' &H4%
' Const mc0174 = 5 ' &H5%
' Const mc0176 = 5 ' &H5%
' Const mc0178 = 6 ' &H6%
' Const mc017A = 6 ' &H6%
' Const mc017C = 30 ' &H1E%
' Const mc017E = 32 ' &H20%
' Const m0184 = 0 ' &H0%
' Const mc0186 =-1 ' &HFFFF%
' Const mc0188 = 20 ' &H14%
' Const mc018A = 4 ' &H4%
Dim l018C As Integer ' 81
' Const mc018E = 3 ' &H3%
' Const mc0198 = 22 ' &H16%
' Const mc019A = 50 ' &H32%
' Const mc019C = 1 ' &H1%
' Const mc019E = 8 ' &H8%
' Const mc01A0 = 7 ' &H7%
Dim l01A2 As String ' 87
Dim l01A4 As Integer ' 81
' Const mc01A6 = 1 ' &H1%
' Const m01AA = 0 ' &H0%
' Const mc01B0 = 11 ' &HB%
Dim l01B2 As Integer ' 81
Dim l01B4 As Integer ' 81
' Const mc01B6 = 1 ' &H1%
' Const mc01B8 = 2 ' &H2%
' Const mc01BA = 3 ' &H3%
' Const mc01BC = 4 ' &H4%
' Const mc01C4 = 19 ' &H13%
' Const mc01C8 = 8 ' &H8%
' Const mc01D0 = 1 ' &H1%
' Const m01D2 = 0 ' &H0%
' Const mc01D4 = 23 ' &H17%
' Const mc01D6 = 12 ' &HC%
' Const mc01DA = 13 ' &HD%
' Const mc01E2 = 2 ' &H2%
' Const mc01E4 = 14 ' &HE%
' Const mc01EC = 2900 ' &HB54%
' Const mc01F6 = 15 ' &HF%
' Const mc01F8 = 15 ' &HF%
' Const mc01FA = 16 ' &H10%
' Const mc01FC = 17 ' &H11%
' Const mc0202 = 52 ' &H34%
' Const mc0204 = 365 ' &H16D%
Dim l0206 As Integer ' 81
Dim l0208 As Integer ' 81
Dim l020A As Integer ' 81
Dim l020C ' 80
Dim l020E As Integer ' 81
Dim l0210 As Integer ' 81
Dim l0212 As Integer ' 81
Dim l0214 As Integer ' 81
Dim l0216 As Integer ' 81
Dim l0218 As Integer ' 81
Dim l021A As Integer ' 81
Dim l021C As Integer ' 81
' Const mc0220 = 1 ' &H1%
' Const mc022A = 7 ' &H7%
' Const mc022C = 5 ' &H5%
' Const mc0232 = 4 ' &H4%
' Const mc0236 = 100 ' &H64%
' Global Const gc1D70 = .25
' Const m023C = 0 ' &H0%
' Const mc0244 = 1 ' &H1%
' Const mc0246 = 6 ' &H6%
' Const mc0250 = 9 ' &H9%
    On Error GoTo L32FC2
    If  gv14C2(pv00FA).M5470 = 0 Or m0078 = True Or pv00FC = -1 Then
        Exit Function
    End If
    l0114 = gv14C2(pv00FA).M59BB
    If  p0100 = -1 Then
        If  fn10E5(pv00FA, pv00FC, p00FE, False) = False Then
            sub102F pv00FA, mc0122
            m0078 = False
            Exit Function
        End If
    End If
    If  pv00FC >= 1000 Then
        pv00FC = pv00FC - 1000
    End If
    l0124 = Int(Rnd * 100)
    If  gv1E66(pv00FA).M5766 > -1 Then
        If  gv14C2(pv00FA).M5857(gv1E66(pv00FA).M5766).M56DB > 0 Then
            sub1187 pv00FA, gv1E66(pv00FA).M5766, 1
        Else
            If  pv00FA = gv1A86 Then
                sub085B "Your item has run out of charges!"
            Else
                sub085B "The item " + Chr(34) + RTrim(gv14C2(pv00FA).M548B) + Chr(34) + " was using ran out of charges!"
            End If
            sub102F pv00FA, -1
            Exit Function
        End If
    End If
    m0078 = True
    l011A = gv152A(pv00FC).M56B9
    If  (fn1448(pv00FC) = gc1EE2 Or (fn1448(pv00FC) = gc1EE4 And fn0EEF() = False)) And p0100 = -1 Then
        If  l011A >= mc0138 Then
            l0118 = True
            l011A = l011A - mc0138
            l011C = m00DC
            l011E = UBound(gv14C2)
        End If
        Select Case l011A
            Case mc013A
                extsub05E7
                sub1005 pv00FC
            Case Else
        End Select
        Select Case l011A
            Case mc013C
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Which Companion?", "", "COMP"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l011C = Abs(l010A) - 10
                gv14C2(pv00FA).M58CB(l011C).M57E1 = mc013E
                sub085B fn1235(pv00FA, l011C) + " is now bound to you for life!"
                If  gv1EBC.M57D4 >= 0 Then
                    If  Len(frmCharStat1!lblCall.Tag) Then
                        If  CInt(Left(frmCharStat1!lblCall.Tag, 1)) = mc0148 Then
                            frmCharStat1!picTabPicture.Refresh
                        End If
                    End If
                End If
                l010E = True
            Case mc014A To mc014A + 2
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Which Companion?", "", "COMP"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l011C = Abs(l010A) - 10
                l011E = CInt(gv152A(pv00FC).M4E82 + Log((10 + fn1417(pv00FA, pv00FC)) / 5))
                If  gv14C2(pv00FA).M58CB(l011C).M57E1 >= l011E Then
                    sub085B Chr(34) + gv152A(pv00FC).M548B + Chr(34) + " had no effect!"
                Else
                    gv14C2(pv00FA).M58CB(l011C).M57E1 = l011E
                    sub085B Chr(34) + gv152A(pv00FC).M548B + Chr(34) + " raised the Bind Level of companion #" + CStr(l011C + 1) + " to " + CStr(l011E) + "."
                    If  frmCharStat1!tabStatTab.P?C01E = mc014C Then
                        If  Left(frmCharStat1!lblCall.Tag, 1) = CStr(mc0148) Then
                            If  gv1EBC.M57D4 = l011C Then
                                gv1EBC.M57E1 = l011E
                                frmCharStat1!picTabPicture.Refresh
                            End If
                        End If
                    End If
                    If  gv1EBC.M57D4 >= 0 Then
                        If  Val(Left(frmCharStat1!lblCall.Tag, 1)) = mc0148 Then
                            frmCharStat1!picTabPicture.Refresh
                        End If
                    End If
                End If
                l010E = True
            Case mc014E
                sub0F29 pv00FA
            Case mc0150
                gv1E66(pv00FA).M56C4 = -1
                sub0BCD
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELLHEAL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                If  gv14C2(pv00FA).M56B9(mc0152) > False Then
                    l011C = pv00FA
                    sub0D1D pv00FA, 1, 0
                    sub08A9 False, 12
                End If
            Case m0154, mc0156
                If  gv152A(pv00FC).M5B33 > 0 Then
                    If  l0118 = False Then
                        l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELLHEAL"))
                        If  l010A = -1 Then
                            m0078 = False
                            Exit Function
                        Else
                            If  l010A < -1 Then
                                If  gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC < 1 Then
                                    sub085B "Companion is Dead!"
                                    m0078 = False
                                    Exit Function
                                End If
                            End If
                            l011C = l010A
                            l011E = l010A
                        End If
                    Else
                        l010A = m00DC
                    End If
                    For l010A = l011C To l011E
                        If  p00FE <= False Then
                            l0160 = Int((gv14C2(pv00FA).M5584(gv14C2(pv00FA).M58BB).M4E82 / 2) + .5#)
                        Else
                            l0160 = p00FE
                        End If
                        If  l0160 < 1 Then l0160 = 1
                        l0158 = Log(l0160) / Log(10)
                        l015E = gv152A(pv00FC).M5B33 + (gv152A(pv00FC).M5B33 * l0158)
                        l015E = l015E + Int((l0160 / 10) * gv152A(pv00FC).M5B41)
                        l015A = Int(Rnd * (l015E - ((l0160 - 1) / l0160 ^ 2)) / 2) + 1
                        l015C = Int(l015E - l015A)
                        If  l010A < -1 Then
                            gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC + l015C
                            If  gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC > gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EB4 Then
                                gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EB4
                            End If
                            sub0B82 pv00FA
                        Else
                            gv14C2(l010A).M4EAC = gv14C2(l010A).M4EAC + l015C
                            If  gv14C2(l010A).M4EAC > gv14C2(l010A).M4EB4 Then
                                gv14C2(l010A).M4EAC = gv14C2(l010A).M4EB4
                            End If
                            If  l011A = mc0156 Then
                                gv14C2(l010A).M56B9(m0162) = False
                                gv14C2(l010A).M56B9(mc0164) = False
                            End If
                        End If
                    Next l010A
                    l010A = l010A - 1
                    sub08A9 True, 7
                End If
            Case mc0166
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                gv14C2(l010A).M56B9(m0162) = False
            Case mc0168
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                gv14C2(l010A).M56B9(mc0164) = False
            Case mc016A
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    gv14C2(l010A).M56B9(mc016C) = 1
                    gv14C2(l010A).M591F = fn0418(mc016C, gv14C2(l010A).M591F, True)
                Next l010A
                l010A = l010A - 1
            Case mc0170
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    gv14C2(l010A).M56B9(mc0172) = 1
                    gv14C2(l010A).M591F = fn0418(mc0172, gv14C2(l010A).M591F, True)
                Next l010A
                l010A = l010A - 1
            Case mc0174
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                gv14C2(l010A).M56B9(mc0176) = True
                gv14C2(l010A).M591F = fn0418(mc0176, gv14C2(l010A).M591F, True)
            Case mc0178
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    gv14C2(l010A).M56B9(mc017A) = Int(fn1417(pv00FA, pv00FC) / 2) + 1
                    gv14C2(l010A).M591F = fn0418(mc017A, gv14C2(l010A).M591F, True)
                Next l010A
                l010A = l010A - 1
            Case mc017C To mc017E
                If  gv1E50.M4F3D <= m0184 Then
                    sub085B "There is no locked chest here!"
                    m0078 = False
                    Exit Function
                End If
                If  gv1E50.M4F3D <= l011A - (mc017C - 1) Then
                    gv1E50.M4F3D = mc0186
                    sub0BAA gv14C2(pv00FA).M59BB
                End If
                l010A = -1
            Case mc0188 To mc0188 + 5
                If  gv14C2(pv00FA).M5943 > mc018A - 1 Then
                    sub085B Chr$(34) + RTrim(gv14C2(pv00FA).M548B) + Chr$(34) + ", drop who you're carrying to raise the dead."
                    m0078 = False
                    Exit Function
                End If
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELLRAISE"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                If  l010A < -1 Then
                    l018C = 85 + gv14F6(gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4ED4).M55B5(mc018E)
                    If  l018C > 98 Then l018C = 98
                    If  Int(Rnd * 100) > l018C Then
                        sub085B "Raise Failed!"
                        gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4ED4 = -1
                    Else
                        sub085B "Raise Was Successful!"
                        If  l011A = mc0198 Then
                            gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EB4
                        Else
                            gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = 1
                        End If
                    End If
                    gv14C2(pv00FA).M5943 = -1
                    sub0B82 pv00FA
                    sub0F38
                Else
                    If  fn13D7(l010A, l011A) > 0 Then
                        sub0A7C l010A, fn13D7(l010A, l011A), l011A
                    Else
                        l010E = True
                    End If
                End If
            Case mc019A To mc019A + mc0060 - 1
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    If  gv14C2(l010A).M592F(l011A - 50) < 95 Then
                        gv14C2(l010A).M592F(l011A - 50) = 95
                        sub0894 l010A
                    End If
                Next l010A
                If  frmCharStat1!tabStatTab.P?C01E = mc019C Then
                    frmCharStat1!tabStatTab.P?C01E = mc019C
                End If
                sub08B9 False
                l010A = l010A - 1
            Case mc019E, mc01A0
                Select Case l011A
                    Case mc019E
                        l01A2 = fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Enter coords as follows (using +/-):" + Chr$(13) + "Right, Forwards (ie +3,-2)", "", "DISPLACEMENT")
                        If  l01A2 = "-1" Then
                            m0078 = False
                            Exit Function
                        End If
                        l01A4 = fn164C("DISPLACEMENT", l01A2)
                        If  l01A4 = False Or l01A4 = mc01A6 Then
                            m0078 = False
                            Exit Function
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            sub1005 pv00FC
                            l010E = True
                        End If
                    Case mc01A0
                        l01A2 = fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Enter coords as follows (using +/-):" + Chr$(13) + "Right,Fwds,Down(max 3)(ie -3,+2,-1)", "", "TELEPORT")
                        If  l01A2 = "-1" Then
                            m0078 = False
                            Exit Function
                        End If
                        l01A4 = fn164C("TELEPORT", l01A2)
                        If  l01A4 = False Or l01A4 = mc01A6 Then
                            m0078 = False
                            Exit Function
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            sub1005 pv00FC
                            l010E = True
                        End If
                End Select
            Case mc013A, mc01B0
                Select Case gv14C2(m00DC).M5899
                    Case mc01B6
                        l01B2 = 30
                    Case mc01B8
                        l01B2 = 1
                    Case mc01BA
                        l01B2 = -30
                    Case mc01BC
                        l01B2 = -1
                End Select
                l01B4 = fn0AE8(gv14C2(m00DC)) + l01B2
                Select Case l011A
                    Case mc013A
                        Select Case gv14C2(m00DC).M5899
                            Case mc01B6
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + 1
                            Case mc01B8
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + 1
                            Case mc01BA
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - 1
                            Case mc01BC
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - 1
                        End Select
                        If  gv14C2(m00DC).M583F > gv1864.M4216 Then gv14C2(m00DC).M583F = 1
                        If  gv14C2(m00DC).M583F < 1 Then gv14C2(m00DC).M583F = gv1864.M4216
                        If  gv14C2(m00DC).M5845 > gv1864.M420C Then gv14C2(m00DC).M5845 = 1
                        If  gv14C2(m00DC).M5845 < 1 Then gv14C2(m00DC).M5845 = gv1864.M420C
                        If  fn0380(mc01C4, fn0AD3(fn0AE8(gv14C2(m00DC)))) = True Then
                            gv14C2(m00DC).M59BB = False
                            sub0956
                            Do
                                sub091E pv00FA, mc01C8
                                sub0930 pv00FA
                            Loop While UBound(gv14C2) > m00DC
                            sub091E m00DC, mc01C8
                            sub0930 m00DC
                            sub085B "You walked into solid rock!"
                            l011C = gv14C2(m00DC).M583F
                            l011E = gv14C2(m00DC).M5845
                            If  l011C > False And l011C <= gv1864.M4216 And l011E > False And l011E <= gv1864.M420C Then
                                l0120 = fn0A34(l011C, l011E)
                                l0120 = fn0418(mc01C4, l0120, True)
                                If  fn0ABD(l011C, l011E, l0120) = False Then
                                    MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                                End If
                            End If
                            If  gv1D64 <> m01AA Then frmAutoMap!lblCall = "DRAW"
                            l010E = True
                            m0078 = False
                            Exit Function
                        Else
                            l010A = -1
                            sub0835 gv14C2(m00DC).M5470
                            sub0980
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    Case mc01B0
                        Select Case gv14C2(pv00FA).M5899
                            Case mc01B6
                                l011C = gv14C2(pv00FA).M583F
                                l011E = gv14C2(pv00FA).M5845 + 1
                            Case mc01B8
                                l011C = gv14C2(pv00FA).M583F + 1
                                l011E = gv14C2(pv00FA).M5845
                            Case mc01BA
                                l011C = gv14C2(pv00FA).M583F
                                l011E = gv14C2(pv00FA).M5845 - 1
                            Case mc01BC
                                l011C = gv14C2(pv00FA).M583F - 1
                                l011E = gv14C2(pv00FA).M5845
                            Case Else
                        End Select
                        If  l011C > gv1864.M4216 Then l011C = 1
                        If  l011C < 1 Then l011C = gv1864.M4216
                        If  l011E > gv1864.M420C Then l011E = 1
                        If  l011E < 1 Then l011E = gv1864.M420C
                        If  fn0380(mc01C4, fn0AD3(fn0B01(l011C, l011E))) = True Then
                            sub085B "The square ahead is Rock."
                            If  gv14C2(pv00FA).M59F4(mc01D0) = False And gv14C2(pv00FA).M59F4(m01D2) = False Then
                                l0120 = fn0A34(l011C, l011E)
                                l0120 = fn0418(mc01C4, l0120, True)
                                If  fn0ABD(l011C, l011E, l0120) = False Then
                                    MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                                End If
                                If  gv1D64 <> m01AA Then
                                    frmAutoMap!lblCall = CStr(l011C) + "," + CStr(l011E)
                                End If
                            End If
                        Else
                            l0120 = fn0A34(l011C, l011E)
                            l0120 = fn0418(mc01D4, l0120, True)
                            If  fn0ABD(l011C, l011E, l0120) = False Then
                                MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                            End If
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = CStr(l011C) + "," + CStr(l011E)
                            End If
                            sub085B "The ahead square is not Rock."
                        End If
                        l010E = True
                End Select
            Case mc01D6
                sub085B "You are on level" + Str$(gv14C2(pv00FA).M5470) + "."
                gv14C2(m00DC).M59F4(m01D2) = False
                sub0848 False
                l01A4 = fn09A4(False, False)
                l010E = True
                If  gv1D64 <> m01AA Then
                    frmAutoMap!lblCall = "UPDATE"
                End If
            Case mc01DA
                sub085B "You are facing " + gv06E8$(gv14C2(pv00FA).M5899 - 1) + "."
                gv14C2(m00DC).M59F4(mc01E2) = False
                sub0848 False
                l01A4 = fn09A4(False, False)
                l010E = True
                If  gv1D64 <> m01AA Then
                    frmAutoMap!lblCall = "UPDATE"
                End If
            Case mc01E4
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Locate Who?", "", "LOCATE"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l010C = FreeFile
                Open gv19E8 + gc1C74 + gc1C10 For Random As #l010C Len = mc01EC
                    Get #l010C, gv1732(l010A).M5467, l0104
                    If  Abs(l0104.M5470 - gv14C2(pv00FA).M5470) > 3 Then
                        sub085B Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is too far away to locate."
                    Else
                        If  l0104.M5470 = 0 Then
                            sub085B Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is in the city."
                        Else
                            Select Case gv14C2(pv00FA).M5899
                                Case mc01B6
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(l0104.M583F - gv14C2(gv1A86).M583F)) + ", forward " + LTrim$(Str$(l0104.M5845 - gv14C2(gv1A86).M5845)) + ",  and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case mc01B8
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(gv14C2(gv1A86).M5845 - l0104.M5845)) + ", forward " + LTrim$(Str$(l0104.M583F - gv14C2(gv1A86).M583F)) + ", and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case mc01BA
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(gv14C2(gv1A86).M583F - l0104.M583F)) + ", forward " + LTrim$(Str$(gv14C2(gv1A86).M5845 - l0104.M5845)) + ", and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case mc01BC
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(l0104.M5845 - gv14C2(gv1A86).M5845)) + ", forward " + LTrim$(Str$(gv14C2(gv1A86).M583F - l0104.M583F)) + ", and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case Else
                                    l0116 = ""
                            End Select
                            sub085B l0116
                        End If
                    End If
                Close #l010C
                l010E = True
            Case mc01F6
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Fetch Who?", "", "FETCH"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l010C = FreeFile
                Open gv19E8 + gc1C74 + gc1C10 For Random As #l010C Len = mc01EC
                    Get #l010C, gv1732(l010A).M5467, l0104
                    If  l0104.M5470 = gv14C2(m00DC).M5470 Or l0104.M5470 > mc01F8 Then
                        l0104.M583F = gv14C2(m00DC).M583F
                        l0104.M5845 = gv14C2(m00DC).M5845
                        l0104.M59BB = gv14C2(m00DC).M59BB
                        Put #l010C, gv1732(l010A).M5467, l0104
                        gv1732(l010A).M547A = gv14C2(m00DC).M59BB
                        sub085B "Fetch of " + Chr$(34) + gv1732(l010A).M548B + Chr$(34) + " was successful!"
                    Else
                        sub085B Chr$(34) + gv1732(l010A).M548B + Chr$(34) + " is not within reach from here!"
                    End If
                Close #l010C
                l01A4 = fn09A4(False, False)
                l010E = True
            Case mc01FA
                gv14C2(pv00FA).M59E7.M4E78 = gv14C2(pv00FA).M583F
                gv14C2(pv00FA).M59E7.M4E7D = gv14C2(pv00FA).M5845
                gv14C2(pv00FA).M59E7.M4E82 = gv14C2(pv00FA).M5470
                l010A = -1
            Case mc01FC
                If  gv14C2(pv00FA).M59E7.M4E78 = 0 Or gv14C2(pv00FA).M59E7.M4E7D = 0 Then
                    sub085B Chr$(34) + "Set Sanctuary" + Chr$(34) + " has not been cast!"
                    m0078 = False
                    Exit Function
                End If
                gv14C2(m00DC).M583F = gv14C2(pv00FA).M59E7.M4E78
                gv14C2(m00DC).M5845 = gv14C2(pv00FA).M59E7.M4E7D
                gv14C2(m00DC).M5470 = gv14C2(pv00FA).M59E7.M4E82
                l01A4 = fn0A0B(m00DC)
                sub0835 gv1D6C
                sub0980
                sub086D mc0202
                If  gv1D64 <> m01AA Then frmAutoMap!lblCall = "UPDATE"
                sub0EAE True, pv00FA, mc0204, False
                l010A = -1
        End Select
        If  p00FE = False And pv00FA <= UBound(gv14C2) Then
            gv14C2(pv00FA).M5830 = gv14C2(pv00FA).M5830 - fn142F(pv00FA, pv00FC)
        End If
        sub08A9 True, 50
        sub0941 "STATS"
        If  l010E = False Then
            If  pv00FA > UBound(gv14C2) Then
                sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " was thrown..."
                pv00FA = m00DC
            Else
                If  l0118 = True Then
                    sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on the party."
                Else
                    If  l010A = -1 Then
                        sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown."
                    Else
                        If  l010A < -1 Then
                            sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on " + fn1235(gv1A86, (Abs(l010A + 10))) + "."
                        Else
                            If  l011A >= mc0188 And l011A <= mc0188 + 5 Then
                                sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on " + Chr$(34) + gv1732(l010A).M548B + Chr$(34) + "."
                            Else
                                If  UBound(gv14C2) = False Then
                                    sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on yourself."
                                Else
                                    If  l010A = gv1A86 Then
                                        If  gv14C2(l010A).M5829 = False Then
                                            sub085B Chr$(34) + RTrim(gv14C2(l010A).M548B) + Chr$(34) + " threw " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " on himself."
                                        Else
                                            sub085B Chr$(34) + RTrim(gv14C2(l010A).M548B) + Chr$(34) + " threw " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " on herself."
                                        End If
                                    Else
                                        sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " threw " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " on " + Chr$(34) + RTrim(gv14C2(l010A).M548B) + Chr$(34) + "."
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
        If  pv00FA = gv1A86 And p0100 = -1 Then
            Select Case l011A
                Case mc013A, mc019E, mc01A0
                Case Else
                    extsub05E7
                    sub1005 pv00FC
            End Select
        End If
    Else
        l0206 = gv152A(pv00FC).M5B28
        l0208 = gv1E66(pv00FA).M547A
        l021A = gv1E66(pv00FA).M547A
        gv1E38(0).M4ECC = mc0220
        sub0BBA 0
        If  gv152A(pv00FC).M5709 = mc022A Then
            If  fn10D1(pv00FA) = 0 Then
                sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " - No room for more Companions!"
                m0078 = False
                Exit Function
            End If
        End If
        l0210 = False
        If  pv00FA = gv1A86 Then
            If  p0100 = -1 Then
                l0112 = "You "
            Else
                l0112 = "Comp. #" + LTrim$(Str$(p0100 + 1)) + " "
                frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc022C)
            End If
        End If
        Do
            If  l0208 > mc0232 - 1 Then
                l0208 = False
            End If
            If  l0208 = -1 Then
                m0078 = False
                Exit Function
            End If
            If  gv1E38(l0208).M4EDC < 1 Then
                Do
                    l0210 = l0210 + 1
                    l0208 = l0208 + 1
                    If  l0208 > mc0232 - 1 Then
                        l0208 = 0
                    End If
                    If  l0210 >= mc0232 Then
                        Exit Do
                    End If
                    If  gv1E38(l0208).M4EDC > 0 Then
                        Exit Do
                    End If
                Loop While l0210 < mc0232
                If  l0210 >= mc0232 Then
                    Exit Do
                End If
            End If
            If  (gv1A66.M5F48 = True And pv00FA = gv1A86) Or gv1A66.M5F48 = False Then
                extsub05E7
                sub1005 pv00FC
            End If
            gv1E66(pv00FA).M547A = l0208
            If  pv00FA = gv1A86 Then
                frmDungeonMain!lblCurrentGroup.Top = frmDungeonMain!lblMonster(l0208).Top
                frmDungeonMain!lblCurrentGroup.Left = frmDungeonMain!lblMonster(l0208).Left - frmDungeonMain!lblCurrentGroup.Width
            End If
            l020E = gv152A(pv00FC).M5B1D
            If  l020E > gv1E38(l0208).M4EDC Then
                l020E = gv1E38(l0208).M4EDC
            End If
            l0214 = 0
            For l020C = 1 To l020E
                l0212 = fn0E5F(pv00FA, pv00FC, -1, p0100, p00FE)
                If  l011A = mc0236 And gv1E38(l0208).M4EAC - l0212 > 0 Then
                    l0212 = 0
                    Exit For
                End If
                l0218 = gv1E38(l0208).M4EAC
                If  gv152A(pv00FC).M5709 = mc022A Then
                    If  l0218 - l0212 > 0 Then
                        l0212 = 0
                    End If
                End If
                gv1E38(l0208).M4EAC = gv1E38(l0208).M4EAC - l0212
                If  gv1E38(l0208).M4EAC < False Then
                    gv1E38(l0208).M4EAC = False
                End If
                If  p0100 = -1 Then
                    sub0CDF pv00FA, l0218 - gv1E38(gv1E66(pv00FA).M547A).M4EAC, gv1E38(gv1E66(pv00FA).M547A).M4ED4, 1
                Else
                    sub0CDF pv00FA, l0218 - gv1E38(gv1E66(pv00FA).M547A).M4EAC, gv1E38(gv1E66(pv00FA).M547A).M4ED4, gc1D70
                End If
                sub08A9 False, 9
                If  gv1E38(l0208).M4EAC > 0 Then
                    l0216 = l0212
                    Exit For
                End If
                If  gv1E38(l0208).M4EAC < 1 Then
                    If  gv152A(pv00FC).M5709 = mc022A Then
                        l021C = l021C + 1
                    Else
                        l0214 = l0214 + 1
                    End If
                    gv1E38(l0208).M4EDC = gv1E38(l0208).M4EDC - 1
                    If  l0208 = False Then
                        If  fn0C3B(1, gv1E38(0).M4ED4) = True Then
                            If  gv1E38(0).M4EDC <= False Then
                                sub0980
                            End If
                        End If
                    End If
                    If  p0100 = -1 Then
                        gv14C2(pv00FA).M5906(m023C) = gv14C2(pv00FA).M5906(m023C) + 1
                        sub0CF3 gv1E38(l0208).M4ED4
                    End If
                    If  p0100 = -1 Then
                        If  gv152A(pv00FC).M5709 = mc022A Then
                            If  fn10D1(pv00FA) > 0 Then
                                l01A4 = fn10BA(pv00FA, gv1E38(l0208), l0218, pv00FC)
                            Else
                                l021C = l021C - 1
                                Exit For
                            End If
                        End If
                    End If
                    If  gv1E38(l0208).M4EDC > 0 Then
                        sub0D08 pv00FA
                    Else
                        Exit For
                    End If
                End If
            Next l020C
            If  l021C > 0 Then
                l0110 = "You charmed " + gv0846$(l021C)
            Else
                If  l0214 > 0 Then
                    If  (gv1A66.M5F48 = True And pv00FA = gv1A86) Or gv1A66.M5F48 = False Then
                        sub0CB7 gv1E38(l0208).M4ED4
                    End If
                    If  gv1E38(l0208).M4F01 = gv1E38(l0208).M4ED4 Then
                        If  fn0380(mc0244, gv14F6(gv1E38(l0208).M4ED4).M55BE) = True Then
                            If  gv14C2(pv00FA).M56B9(mc0176) <> False Then
                                sub1043 mc0246, pv00FA, gv14F6(gv1E38(l0208).M4ED4).M5467
                            End If
                        Else
                            sub1043 mc0246, pv00FA, gv14F6(gv1E38(l0208).M4ED4).M5467
                        End If
                    End If
                    If  l0214 > 10 Then
                        l0214 = 11
                    End If
                    l0110 = l0112 + gv0972$(gv152A(pv00FC).M5B12) + " " + gv0846$(l0214)
                End If
                If  l0216 > 0 Then
                    If  l0214 > 0 Then
                        l0110 = l0110 + " and damaged one for" + Str$(l0216)
                    Else
                        l0110 = l0112 + "damaged one for" + Str$(l0216)
                    End If
                Else
                    If  l0214 = 0 Then
                        If  p0100 = -1 Then
                            sub102F pv00FA, mc0122
                            l0110 = "Failed"
                        Else
                            l0110 = l0112 + "failed in casting " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34)
                        End If
                    End If
                End If
            End If
            l0216 = False
            If  pv00FA = gv1A86 Then
                frmDungeonMain!lblCharacterHit.Caption = l0110 + "!"
                sub07E2 .5#
            End If
            sub0BBA gv14C2(pv00FA).M59BB
            If  pv00FA = gv1A86 Then
                frmDungeonMain!lblCharacterHit.Caption = ""
            End If
            If  fn0DCD(-1) = -1 Then
                sub0BCD
                Exit Do
            End If
            l0208 = l0208 + 1
            l020A = l020A + 1
            l0210 = l0210 + 1
        Loop While l020A < l0206 And l0210 < l0206
        If  gv1E38(l021A).M4EDC < 1 Then
            gv1E66(pv00FA).M547A = fn0DCD(-1)
        Else
            gv1E66(pv00FA).M547A = l021A
        End If
        If  pv00FA = gv1A86 Then
            frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc0250)
        End If
        If  p0100 = -1 Then
            If  p00FE = False Then
                gv14C2(pv00FA).M5830 = gv14C2(pv00FA).M5830 - fn142F(pv00FA, pv00FC)
                sub08A9 False, 5
            End If
        End If
        sub0BBA gv14C2(pv00FA).M59BB
        sub0BCD
        If  fn0DCD(-1) = -1 Then
            sub0C53
        End If
        sub08A9 False, 50
    End If
    If  pv00FA > UBound(gv14C2) Then pv00FA = UBound(gv14C2)
    If  p0100 = -1 Then
        If  l0114 = gv14C2(pv00FA).M59BB Then
            sub0BBA gv14C2(pv00FA).M59BB
            sub0BCD
        End If
    End If
    fn1173 = True
    m0078 = False
    Exit Function

L32FC2:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharCastSpell.  Please Report."
    m0078 = False
    Resume L33048
L33048:
End Function
