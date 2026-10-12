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
