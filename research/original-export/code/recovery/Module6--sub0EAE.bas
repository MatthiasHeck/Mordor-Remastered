Sub sub0EAE (p00C0 As Integer ' 41, p00C2 As Integer ' 41, ByVal pv00C4 As Integer ' 81, p00C6 As Integer ' 41)
Dim l00C8 As String ' 87
Dim l00CA As Integer ' 81
Dim l00CC As Integer ' 81
Dim l00CE As Integer ' 81
Dim l00D0 As Integer ' 81
' Const mc00DA = 7 ' &H7%
' Const m00DC = 0 ' &H0%
    On Error GoTo L2E46E
    If  p00C6 = True And pv00C4 = False Then
        If  gv14C2(p00C2).M4EAC < gv14C2(p00C2).M4EB4 Then
            l00CA = ((100 - (gv14C2(p00C2).M4EAC / gv14C2(p00C2).M4EB4 * 100)) / 3.25#)
            gv14C2(p00C2).M4EAC = gv14C2(p00C2).M4EB4
        End If
        gv14C2(p00C2).M5577 = gv14C2(p00C2).M5577 + l00CA
        l00D0 = l00CA
    Else
        gv14C2(p00C2).M5577 = gv14C2(p00C2).M5577 + pv00C4
        l00CA = pv00C4
    End If
    If  l00CA > mc00DA Then
        l00CC = Int(l00CA / mc00DA)
    End If
    l00CE = l00CA - (l00CC * mc00DA)
    If  l00CE > 0 Then
        l00CA = l00CE
    Else
        l00CA = 0
    End If
    If  l00CC = 0 And l00CA = 0 Then
        Exit Sub
    End If
    If  l00CC > 0 Then
        If  l00CA > 0 Then
            l00C8 = LTrim$(Str$(l00CC)) + " week(s) and " + LTrim$(Str$(l00CA)) + " day(s)"
        Else
            l00C8 = LTrim$(Str$(l00CC)) + " week(s)"
        End If
    Else
        l00C8 = LTrim$(Str$(l00CA)) + " day(s)"
    End If
    If  p00C6 = True Then
        If  p00C2 = m00DC Then
            sub071B l00D0
            sub06E8 l00D0
        End If
    End If
    If  p00C0 Then
        If  p00C6 = True Then
            If  UBound(gv14C2) > False Then
                sub085B Chr$(34) + RTrim(gv14C2(p00C2).M548B) + Chr$(34) + " rested for " + l00C8 + "."
            Else
                sub085B "You rested for " + l00C8 + "."
            End If
        Else
            If  UBound(gv14C2) > False Then
                sub085B Chr$(34) + RTrim(gv14C2(p00C2).M548B) + Chr$(34) + " is now " + l00C8 + " older."
            Else
                sub085B "You are now " + l00C8 + " older."
            End If
        End If
    End If
    sub08A9 False, 4
    Exit Sub

L2E46E:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharAddAge"
    Resume L2E4D8
L2E4D8:
End Sub
