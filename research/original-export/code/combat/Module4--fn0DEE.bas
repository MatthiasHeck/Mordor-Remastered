Function fn0DEE (p03B6 As Integer ' 41, p03B8 As Integer ' 41, p03BA As Integer ' 41, ByVal pv03BC As Integer ' 81, ByVal pv03BE As Single ' 83) As Integer ' 1
Dim l03C0 As Single ' 83
Dim l03C2 As Single ' 83
Dim l03C4 As Single ' 83
Dim l03C6 As Single ' 83
Dim l03C8 As Single ' 83
Dim l03CA As Single ' 83
Dim l03CC As Integer ' 81
Dim l03CE As Integer ' 81
     If  p03B6 = 0 And p03B8 = 0 Then
        l03C0 = .5#
    Else
        If  p03B6 > p03B8 Then
            l03C0 = .5# + .5# * (p03B6 - p03B8) / p03B6
            Else
            If  p03B8 = 0 Then
                l03C0 = .5# + .5# * p03B6
                Else
                l03C0 = .5# - .5# * (p03B8 - p03B6) / p03B8
            End If
        End If
     End If
     l03C0 = l03C0 * 100
     If  l03C0 > 98 Then l03C0 = 98
     If  l03C0 < 2 Then l03C0 = 2
     If  pv03BE <= 0 Then
        pv03BE = .1#
     End If
     If  pv03BC < 1 Then pv03BC = 1
     pv03BC = CInt(pv03BC - (Log(pv03BC) * ((Log(pv03BC) - 2.4#) * 2.25#))) + 1
     If  pv03BE > 1 Then
        pv03BE = pv03BE - (Log(pv03BE) * Log(pv03BE))
     End If
     l03C2 = pv03BC
     l03C4 = (Log(p03BA + 5) + 1) / Log(1.2#)
     l03C6 = pv03BC / 30
     l03C8 = Int((Rnd * ((pv03BC + 10) / 2)) + ((pv03BC + 10) / 4)) / 10
     l03CE = Int((l03C4 * l03C6 * l03C8) * pv03BE)
     l03CA = Int(((p03B8 - p03B6) / 2) / 4)
     l03CA = l03CA - (Int(Rnd * (l03CA + 1)) / 1) + 1
     l03CC = Int(Rnd * 1000) + 1
     If  l03CC > 1 Then l03CE = l03CE - l03CA
     If  l03CE < 1 Then l03CE = 0
     l03CC = Int(Rnd * 100) + 1
     If  l03CC >= l03C0 Then l03CE = 0
    fn0DEE = l03CE
End Function
