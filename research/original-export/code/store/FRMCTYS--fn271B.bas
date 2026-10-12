Function fn271B (p01EE As Integer ' 41) As Long ' 2
Dim l01F0 As Integer ' 81
Dim l01F2 As Integer ' 81
Dim l01F4 As Currency ' 85
Dim l01F6 As Integer ' 81
Dim l01F8 As Integer ' 81
Dim l01FA As Integer ' 81
    l01F0 = gv14C2(gv1A86).M5857(p01EE).M4ED4
    l01F2 = gv14C2(gv1A86).M5857(p01EE).M4EBF
    l01F4 = gv1426(l01F0).M5686
    l01F6 = gv15FA(l01F0).M5557(l01F2)
    If  l01F6 > mc00B6 Then
        l01F6 = mc00B6
    End If
    l01F8 = gv14C2(gv1A86).M5857(p01EE).M4EEE
    l01FA = gv14C2(gv1A86).M5857(p01EE).M56DB
    fn271B = ((.23# * l01F4) / (((l01F6 / 2) + 1) * .9#) / l01F8 + 1)
End Function
