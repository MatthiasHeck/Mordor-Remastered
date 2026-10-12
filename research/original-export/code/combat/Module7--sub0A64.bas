Sub sub0A64 (p008A As Integer ' 41)
Dim l008C ' 80
Dim l008E As Integer ' 81
Dim l0090 As Integer ' 81
Dim l0092 As Integer ' 81
Dim l0094 As Integer ' 81
Dim l0096 As Single ' 83
Dim l0098 As Integer ' 81
Dim l009A As Integer ' 81
Dim l009C As Integer ' 81
Dim l009E As Integer ' 81
Dim l00A0 As Integer ' 81
' Const mc00A6 = 4 ' &H4%
' Const m00A8 = 0 ' &H0%
' Const mc00AA = 1 ' &H1%
' Const mc00AC = 5 ' &H5%
' Const mc00B6 = 2 ' &H2%
    On Error GoTo L505D0
    frmDungeonMain!lblMonsterHit.Caption = ""
    l0092 = 100
    l0096 = False
    l00A0 = gv14C2(m0022).M59BB
    For l008C = 0 To UBound(gv14C2)
        l0096 = l0096 + l0092
        l0092 = l0092 / 2
    Next l008C
    l008E = m0022
    For l008C = 0 To mc00A6 - 1
        If  gv1E38(l008C).M4EDC > False Then
            l0094 = False
            l0090 = 100
            l008E = m0022
            l0092 = Int(Rnd * 100) + 1
            l0098 = 100
            Select Case p008A
                Case m00A8
                    Do While (l0090 / l0096) * 100 < l0092
                        l008E = l008E + 1
                        If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                        l0098 = l0098 / 2
                        l0090 = l0090 + l0098
                    Loop
                    If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                    If  l00A0 = gv14C2(m0022).M59BB Then l0094 = True
                Case mc00AA
                    Do While (l0090 / l0096) * 100 < l0092
                        l008E = l008E + 1
                        If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                        l0098 = l0098 / 2
                        l0090 = l0090 + l0098
                    Loop
                    If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                    l009A = (gv14C2(l008E).M55B5(mc00AC) + gv14C2(l008E).M584B(mc00AC))
                    l009C = (gv14F6(gv1E38(l008C).M4ED4).M55B5(mc00AC))
                    l009E = 50 + ((l009C - l009A) * 5)
                    If  l009E < 5 Then l009E = 5
                    If  (Int(Rnd * 100) + 1) < l009E Then
                        l0094 = True
                        If  UBound(gv14C2) > m0022 Then
                        End If
                    End If
                Case mc00B6
                    Do While (l0090 / l0096) * 100 < l0092
                        l008E = l008E + 1
                        If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                        l0098 = l0098 / 2
                        l0090 = l0090 + l0098
                    Loop
                    If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                    l0092 = Int(Rnd * 100) + 1
                    l009A = (gv14C2(l008E).M55B5(mc00AC) + gv14C2(l008E).M584B(mc00AC))
                    l009C = (gv14F6(gv1E38(l008C).M4ED4).M55B5(mc00AC))
                    l009E = 50 + ((l009C - l009A) * 5)
                    If  l009E > 98 Then l009E = 98
                    If  l009E < 5 Then l009E = 5
                    If  l0092 < l009E Then l0094 = True
                Case Else
            End Select
            If  l0094 = True Then sub0E85 l008E, l008C, l00A0
            If  gv14C2(l008E).M4EAC <= False Then
                sub0930 l008E
                If  UBound(gv14C2) = False Then Exit For
            Else
                If  UBound(gv14C2) > m0022 Then frmParty!lblCall = "STATS"
            End If
        End If
    Next l008C
    Exit Sub

L505D0:
    sub04FC "Error '" + Error + "' in MULTIMOD:mdrmulMonsterAttack"
    Resume L50636
L50636:
End Sub
