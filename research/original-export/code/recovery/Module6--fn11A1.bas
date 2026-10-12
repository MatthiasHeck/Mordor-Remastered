Function fn11A1 (ByVal pv02E4 As Integer ' 81) As Integer ' 1
Dim l02E6 As Integer ' 81
Dim l02E8 ' 80
' Const mc02F2 = 38 ' &H26%
' Const mc02F4 = 2 ' &H2%
' Const m02F6 = 0 ' &H0%
' Const mc02F8 = 1 ' &H1%
' Const mc02FA = 5475 ' &H1563%
' Const mc02FC = 64 ' &H40%
' Const mc02FE = 54 ' &H36%
    If  (Int(Rnd * 100) < ((gv14C2(pv02E4).M5577 / mc0204) / (gv148E(gv14C2(pv02E4).M5821).M5577 / 2)) * 100) Or gv14C2(pv02E4).M5483 = mc01C8 Then
        sub086D mc02F2
        l02E6 = MsgBox("There are complications...", mc00A4, "Raise Info")
        gv14C2(pv02E4).M5906(mc02F4) = gv14C2(pv02E4).M5906(mc02F4) + 1
        sub047C pv02E4, m02F6
        For l02E8 = 0 To mc0286 - 1
            gv14C2(pv02E4).M55B5(l02E8) = gv14C2(pv02E4).M55B5(l02E8) - 5
            If  gv14C2(pv02E4).M55B5(l02E8) < gv148E(gv14C2(pv02E4).M5821).M5530(l02E8) Then
                gv14C2(pv02E4).M55B5(l02E8) = gv148E(gv14C2(pv02E4).M5821).M5530(l02E8)
            End If
        Next l02E8
        sub047C pv02E4, mc02F8
        sub0EAE True, pv02E4, mc02FA, False
        gv14C2(pv02E4).M4EB4 = Int(gv14C2(pv02E4).M4EB4 / 1.2#)
        gv14C2(pv02E4).M4EAC = gv14C2(pv02E4).M4EB4
        l02E6 = False
        For l02E8 = 1 To mc02D6
            If  gv14C2(pv02E4).M5857(l02E8 - 1).M577E = mc02D8 Then
                If  fn110D(pv02E4, gv14C2(pv02E4).M5857(l02E8 - 1).M4ED4, 0, 1) = False Then
                    l02E6 = True
                    sub0F74 pv02E4, (l02E8 - 1)
                End If
            End If
        Next l02E8
        If  l02E6 = True Then
            MsgBox "One or more items were unequipped due to lack of stats...", mc02FC, "Notice!"
        End If
        fn11A1 = True
    Else
        sub0EAE True, pv02E4, mc02FE, False
        gv14C2(pv02E4).M58DC = False
        gv14C2(pv02E4).M58E9 = False
        gv14C2(pv02E4).M58F9 = ""
        sub08A9 True, 4
        l02E6 = fn04ED(gv14C2(UBound(gv14C2)))
    End If
End Function
