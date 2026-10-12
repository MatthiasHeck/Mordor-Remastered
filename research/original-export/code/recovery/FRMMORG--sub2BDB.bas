Sub sub2BDB ()
Dim l00CC ' 80
    For l00CC = 0 To mc0034 - 1
        If  gv14C2(gv1A86).M58CB(l00CC).M4ED4 > -1 And gv14C2(gv1A86).M58CB(l00CC).M4EAC = 0 Then
            m0022 = (gv14C2(gv1A86).M58CB(l00CC).M4EB4 * 1244.34#) * (gv14F6(gv14C2(gv1A86).M58CB(l00CC).M4ED4).M5693)
            m0026 = l00CC
            cmdCommand(mc001E).Caption = "Raise " + fn1235(gv1A86, l00CC) + " for " + fn036D(CCur(m0022), m0050)
            cmdCommand(mc001E).Visible = True
            Exit For
        End If
    Next l00CC
End Sub
