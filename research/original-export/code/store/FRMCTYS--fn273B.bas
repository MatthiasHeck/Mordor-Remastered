Function fn273B (p0228 As Integer ' 41) As Long ' 2
Dim l022A ' 80
Dim l022C As Integer ' 81
Dim l022E As Integer ' 81
Dim l0230 As Currency ' 85
Dim l0232 As Integer ' 81
Dim l0234 As Integer ' 81
Dim l0236 As Integer ' 81
Dim l0238 As Single ' 83
Dim l023A As Long ' 82
Dim l023C As Integer ' 81
' Const mc023E = 1 ' &H1%
' Const mc0240 = 3 ' &H3%
    l022C = gv14C2(gv1A86).M5857(p0228).M4ED4
    l022E = gv14C2(gv1A86).M5857(p0228).M4EBF
    l0230 = gv1426(l022C).M5686
    l0232 = gv15FA(l022C).M5557(l022E)
    If  gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M572A >= mc023E Then
        If  gv14C2(gv1A86).M5857(p0228).M577E = mc0118 Then
            l0230 = 0
        End If
    End If
    If  l0232 = 0 Then
        For l022A = 0 To mc0240
            If  gv15FA(l022C).M5557(l022A) > 0 Then
                l023C = True
            End If
        Next l022A
        If  l023C = True Then
            l0232 = 1
        End If
    End If
    If  l0232 > mc00B6 Then
        l0232 = mc00B6
    End If
    l0234 = gv14C2(gv1A86).M5857(p0228).M4EEE
    l0236 = gv14C2(gv1A86).M5857(p0228).M56DB
    l0238 = 1
    If  gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M56DB > 0 Then
        Select Case gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M5709
            Case 23, 24, 25, 26, 27, 28, 30, 31
                l0238 = 5
                If  gv14C2(gv1A86).M5857(p0228).M56DB > gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M56DB Then
                    l0236 = gv1426(gv14C2(gv1A86).M5857(p0228).M4ED4).M56DB
                End If
        End Select
    End If
    l0238 = l0238 * Log(Abs(l0236 - gv1426(l022C).M56DB) + 1)
    If  l0234 = m0148 And gv1426(l022C).M572A <> False Then
        fn273B = 0
    Else
        l023A = (((.9# * l0230) / (l0232 + 1.15#)) / ((l0234 + 1)))
        fn273B = l023A - (l0238 * (.05# * l023A))
    End If
End Function
