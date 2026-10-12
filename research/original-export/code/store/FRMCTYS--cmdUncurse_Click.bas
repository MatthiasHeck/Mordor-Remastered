Sub cmdUncurse_Click ()
Dim l0130 As String ' 87
Dim l0132 As Integer ' 81
Dim l013E As Integer ' 81
Static m0146 As Integer ' 61
' Const m0148 = 0 ' &H0%
    l0130 = txtUncurse.Text
    l0132 = fn12C4(l0130)
    If  l0132 > -1 Then
        If  gv14C2(gv1A86).M5857(l0132).M572A = False Then
            sub085B "Item is not cursed!"
            Exit Sub
        End If
        If  gv14C2(gv1A86).M5857(l0132).M577E = m0146 Then
            Beep
            sub085B "Item isn't equipped!"
            Exit Sub
        End If
        If  fn114E(fn274F(gv14C2(gv1A86).M5857(l0132).M4ED4)) = False Then
            l013E% = MsgBox("Not enough gold!", 64, "UNCURSE ITEM")
            Exit Sub
        End If
        sub0F74 gv1A84, -l0132
        gv14C2(gv1A86).M5857(l0132).M4EEE = m0148
        sub0730 gv1A86, gv14C2(gv1A86).M5857(l0132).M4ED4, gv14C2(gv1A86).M5857(l0132).M4EEE, -1, False
        sub0F61 gv1A86, m00C4, l0132
        If  gv1426(gv14C2(gv1A86).M5857(l0132).M4ED4).M572A = False Then
            gv14C2(gv1A86).M5857(l0132).M572A = False
        End If
        sub08A9 False, 50
        sub0F61 gv1A86, m00C4, l0132
        sub085B "Item has been separated from you."
        txtUncurse.Text = ""
        lblUncurse.Caption = ""
        cmdUncurse.Enabled = False
    End If
End Sub
