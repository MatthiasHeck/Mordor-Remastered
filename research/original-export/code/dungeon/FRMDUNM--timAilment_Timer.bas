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
