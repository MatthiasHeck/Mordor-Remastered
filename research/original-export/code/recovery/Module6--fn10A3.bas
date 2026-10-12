Function fn10A3 (ByVal pv0822 As Integer ' 81) As Integer ' 1
Dim l0824 As Integer ' 81
Dim l0826 As Integer ' 81
Dim l0828 As String ' 87
' Const mc082C = 124 ' &H7C%
' Const mc082E = 23 ' &H17%
' Const mc0830 = 20 ' &H14%
    l0824 = mc02FE
    If  gv14C2(pv0822).M5483 = mc01C8 Then
        l0824 = mc082C
        gv14C2(pv0822).M58E9 = False
    End If
    Beep
    If  UBound(gv14C2) = m00DC Then
        l0828 = Chr(34) + RTrim(gv14C2(pv0822).M58F9) + Chr(34) + " has initiated a raise on your character." + Chr$(13) + "Chance of success is" + Str$(gv14C2(pv0822).M58E9) + "%." + Chr(13) + "Do you accept?"
    Else
        l0828 = Chr(34) + RTrim(gv14C2(pv0822).M58F9) + Chr(34) + " has initiated a raise on " + Chr(34) + RTrim(gv14C2(pv0822).M548B) + Chr(34) + "." + Chr$(13) + "Chance of success is" + Str$(gv14C2(pv0822).M58E9) + "%." + Chr(13) + "Does " + Chr(34) + RTrim(gv14C2(pv0822).M548B) + Chr(34) + " accept?"
    End If
    If  MsgBox(l0828, 36, "RAISE") = mc00BE Then
        If  Int(Rnd * 100) > gv14C2(pv0822).M58E9 Then
            l0826 = MsgBox("Raise Failed!", mc00A4, "Raise Info")
            If  fn11A1(pv0822) = False Then
                Exit Function
            End If
        Else
            sub086D mc04E6
            l0826 = MsgBox("Success!", 64, "RAISE")
        End If
        If  gv14C2(pv0822).M5483 = mc0472 Then
            gv14C2(pv0822).M55B5(mc018E) = gv14C2(pv0822).M55B5(mc018E) - 1
            sub0EBF pv0822, mc018E, (-1)
            l0824 = mc04E8
        End If
        If  gv14C2(pv0822).M58DC = mc082E Then
            If  Rnd * 100 < (50 - gv14C2(pv0822).M55B5(mc018E) * 2) Then
                sub085B "MORGUE: " + Chr(34) + RTrim(gv14C2(pv0822).M548B) + Chr(34) + " lost a point of Constution during the raise."
                gv14C2(pv0822).M55B5(mc018E) = gv14C2(pv0822).M55B5(mc018E) - 1
            End If
        End If
        sub0EAE True, pv0822, l0824, False
        gv14C2(pv0822).M5483 = 0
        Select Case gv14C2(pv0822).M58DC
            Case mc0830, mc0474
                gv14C2(pv0822).M4EAC = 1
            Case mc0198, mc082E
                gv14C2(pv0822).M4EAC = gv14C2(pv0822).M4EB4
            Case Else
                gv14C2(pv0822).M4EAC = 1
        End Select
        sub0578 gv14C2(pv0822).M58BB, Chr$(34) + RTrim(gv14C2(pv0822).M548B) + Chr$(34) + " was resurrected by " + Chr$(34) + RTrim(gv14C2(pv0822).M58F9) + Chr$(34) + "."
        gv14C2(pv0822).M58F9 = " "
        gv14C2(pv0822).M58E9 = 0
        sub08A9 False, 50
        l0826 = fn04ED(gv14C2(pv0822))
        sub096E
        fn10A3 = True
    End If
End Function
