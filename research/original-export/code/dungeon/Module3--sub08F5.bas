Sub sub08F5 (ByVal pv00A4 As Integer ' 81)
Dim l00A6 ' 80
Dim l00A8 As Integer ' 81
Dim l00AC As T5DA4 ' 8A
Dim l00AE As Long ' 82
' Const mc00B0 = 200 ' &HC8%
' Const mc00B2 = 2 ' &H2%
' Const mc00B4 = 3 ' &H3%
Dim l00B6 As Integer ' 81
' Const m00C0 = 0 ' &H0%
    l00A8 = fn0A0B(pv00A4)
    For l00A6 = 0 To gv1864.M5D01
        Get #gv1B56, gv1D6E + 5 + (gv1864.M4216 * gv1864.M420C) + mc00B0 + gv1864.M5D0E + l00A6, l00AC
        If  l00AC.M5D74 = gv14C2(pv00A4).M583F And l00AC.M5D7E = gv14C2(pv00A4).M5845 Then
            If  l00AC.M5DB1 > 0 Then
                gv1D6A = gv14C2(pv00A4).M59BB
                gv14C2(pv00A4).M5470 = gv14C2(pv00A4).M5470 + l00AC.M5DB1
                l00A8 = fn0A0B(pv00A4)
                gv14C2(pv00A4).M59BB = fn0992(fn0AE8(gv14C2(pv00A4)))
                Exit For
            End If
        End If
    Next l00A6
    l00AE = fn0A34(gv14C2(pv00A4).M583F, gv14C2(pv00A4).M5845)
    If  l00AE = False Then
        gv14C2(pv00A4).M59F4(mc007E) = True
        gv14C2(pv00A4).M59F4(m0088) = True
        gv14C2(pv00A4).M59F4(mc00B2) = True
        sub08E1 pv00A4
    End If
    If  gv14C2(pv00A4).M56B9(mc00B4) = False Then
        l00B6 = Int(Rnd * (gv14C2(pv00A4).M5470 * 10.5#)) * Log(gv148E(gv14C2(pv00A4).M5821).M5565 + 2) + 5
        If  pv00A4 = gv1A86 Then
            sub085B "You have fallen into a chute for" + Str$(l00B6) + " hits."
        Else
            If  gv14C2(m00C0).M5470 = gv14C2(pv00A4).M5470 Then
                sub085B Chr$(34) + RTrim(gv14C2(pv00A4).M548B) + Chr$(34) + " has fallen into a chute for" + Str$(l00B6) + " hits."
            End If
        End If
        gv14C2(pv00A4).M4EAC = gv14C2(pv00A4).M4EAC - l00B6
    End If
End Sub
