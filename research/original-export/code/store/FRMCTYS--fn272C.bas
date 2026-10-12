Function fn272C (p01FE As Integer ' 41, p0200 As Integer ' 41) As Long ' 2
Dim l0202 As Integer ' 81
Dim l0206 As Currency ' 85
Dim l0208 As Integer ' 81
Dim l020A As Integer ' 81
Dim l020C As Integer ' 81
Dim l020E As Single ' 83
    If  gv1426(p0200).M5693 = 0 Then
        fn272C = gv1426(p0200).M5686
        Exit Function
    End If
    On Error GoTo L65DAC
    l0206 = gv1426(p0200).M5686
    l0208 = gv15FA(p0200).M5557(p01FE) - 1
    If  l0208 > mc00B6 Then
        l0208 = mc00B6
    End If
    l020A = 0
    l020C = gv1426(p0200).M56DB
    l020E = Log(Abs(l020C - gv1426(l0202).M56DB) + 1)
    fn272C = (((1.5# * l0206) / (Log(l0208 + 1) + 1.15#)) / ((l020A + 1))) - l020E * (.05# * l0206)
    Exit Function

L65DAC:
    sub04FC "Error '" + Error + "' occurred in FRMCTYS:modItemCost."
    Resume L65E14
L65E14:
End Function
