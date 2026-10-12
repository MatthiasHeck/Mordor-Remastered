Function fn131D (ByVal pv041C As Integer ' 81) As Integer ' 1
Dim l041E ' 80
Dim l0420 As Integer ' 81
    For l041E = 0 To gv1BEA - 1
        If  gv14C2(pv041C).M5584(l041E).M4E82 > l0420 Then
            l0420 = gv14C2(pv041C).M5584(l041E).M4E82
        End If
    Next l041E
    fn131D = l0420
End Function
