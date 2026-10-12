Function fn10E5 (ByVal pv026C As Integer ' 81, ByVal pv026E As Integer ' 81, p0270 As Integer ' 41, p0272 As Integer ' 41) As Integer ' 1
Dim l0274 ' 80
Dim l0276 As Integer ' 81
Dim l027C As Single ' 83
Dim l027E As Integer ' 81
Dim l0280 As Integer ' 81
Dim l0282 ' 80
' Const mc0286 = 6 ' &H6%
' Const mc028E = 18 ' &H12%
' Const mc0290 = 10 ' &HA%
' Const mc0292 = 7 ' &H7%
' Const m0294 = 0 ' &H0%
    On Error GoTo L33F74
    gv1E66(pv026C).M4E97 = False
    If  pv026E >= 1000 Then
        pv026E = pv026E - 1000
    End If
    For l0274 = 0 To gv1BEA - 1
        If  gv14C2(pv026C).M5584(l0274).M4E82 > False Then
            If  (gv145A(l0274).M55F6(gv152A(pv026E).M5709, 0) > False And gv145A(l0274).M55F6(gv152A(pv026E).M5709, 1) >= gv152A(pv026E).M4E82) Or p0270 <> False Then
                l0276 = True
            End If
        End If
    Next l0274
    If  l0276 = False And p0270 = False Then
        If  p0272 Then
            Exit Function
        End If
        If  pv026C <> gv1A82 Then
            sub085B Chr$(34) + RTrim(gv14C2(pv026C).M548B) + Chr$(34) + " does not know " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "."
        Else
            sub085B "You do not know " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "."
        End If
        gv1E66(pv026C).M56C4 = -1
        Exit Function
    End If
    l0276 = False
    For l0274 = 0 To gv1BEA - 1
        If  gv14C2(pv026C).M5584(l0274).M4E82 > False Then
            If  gv145A(l0274).M55F6(gv152A(pv026E).M5709, 0) > False Then
                l027C = gv145A(l0274).M55F6(gv152A(pv026E).M5709, 0)
                l027E = gv152A(pv026E).M4E82 * l027C
                l0280 = Int((gv14C2(pv026C).M5584(l0274).M4E82 / 2) + .5#)
                If  l027E <= l0280 Then
                    l0276 = True
                    Exit For
                End If
            End If
        End If
    Next l0274
    If  l0276 = False And p0270 = False Then
        If  p0272 Then
            Exit Function
        End If
        If  pv026C <> gv1A82 Then
            sub085B Chr$(34) + RTrim(gv14C2(pv026C).M548B) + Chr$(34) + ", your Spell Level is too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        Else
            sub085B "Spell Level too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        End If
        gv1E66(pv026C).M56C4 = -1
        Exit Function
    End If
    If  p0270 = False Then
        For l0282 = 0 To mc0286 - 1
            If  (gv14C2(pv026C).M55B5(l0282) + gv14C2(pv026C).M584B(l0282)) < gv152A(pv026E).M5B4F(l0282) Then
                If  p0272 Then
                    Exit Function
                End If
                If  pv026C <> gv1A82 Then
                    sub085B RTrim(gv14C2(pv026C).M548B) + "s " + gv05EE$(l0282) + " is too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
                Else
                    sub085B "Your " + gv05EE$(l0282) + " is too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
                End If
                gv1E66(pv026C).M56C4 = -1
                Exit Function
            End If
        Next l0282
    End If
    If  p0272 Then
        fn10E5 = True
        Exit Function
    End If
    If  fn142F(pv026C, pv026E) > gv14C2(pv026C).M5830 And p0270 = False Then
        If  pv026C <> gv1A82 Then
            sub085B RTrim(gv14C2(pv026C).M548B) + " doesn't have enough spell points to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        Else
            sub085B "Not enough spell points to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        End If
        gv1E66(pv026C).M56C4 = -1
        Exit Function
    End If
    If  fn0EEF() > 0 And gv1E38(0).M4ECC = mc0220 And fn1448(pv026E) = gc1EE2 Then
        If  pv026C <> gv1A82 Then
            sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " is a Non-Combat Spell, " + RTrim(gv14C2(pv026C).M548B) + "."
        Else
            sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " is a Non-Combat Spell!"
        End If
        gv1E66(pv026C).M56C4 = -1
        gv1E66(pv026C).M5766 = -1
        Exit Function
    End If
    If  fn0380(mc028E, fn0AD3(fn0AE8(gv14C2(pv026C)))) = True Or fn0380(mc0290, fn0AD3(fn0AE8(gv14C2(pv026C)))) = True Then
        sub085B "Anti-Magic area!"
        sub087C mc028E, True
        If  gv1D64 <> m01AA Then frmAutoMap!lblCall = "DRAWSQ"
        sub102F pv026C, -1
        Exit Function
    End If
    If  fn1448(pv026E) = gv1EE0 Or fn1448(pv026E) = gc1EE4 Then
        If  fn0EEF() <= False Then
            If  fn1448(pv026E) = gv1EE0 Then
                sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " is a Combat Spell!"
                gv1E66(pv026C).M56C4 = -1
                gv1E66(pv026C).M5766 = -1
                Exit Function
            End If
        Else
            If  gv152A(pv026E).M4E82 > mc0292 And gv1E38(0).M4ECC = m0294 Then
                sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " Takes too long to throw when peaced, " + RTrim(gv14C2(pv026C).M548B) + "."
                gv1E66(pv026C).M56C4 = -1
                gv1E66(pv026C).M5766 = -1
                Exit Function
            End If
            If  gv1E38(0).M4ECC = m0294 Then
                gv1E38(0).M4ECC = mc0220
                sub0BDE -1
            End If
            sub0BBA gv14C2(pv026C).M59BB
        End If
    End If
    sub0BCD
    fn10E5 = True
    Exit Function

L33F74:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharCheckCast."
    Resume L33FE2
L33FE2:
End Function
