Sub timCombat_Timer ()
    If  m0024 = True Or gv1ACC.M602F = True Then
        Exit Sub
    Else
        If  gv14C2(m00A4).M5470 = 0 Then
            timCombat.Enabled = False
            m0024 = False
            Exit Sub
        Else
            m0024 = True
            sub155A gv14C2(m00A4).M59BB
            m0024 = False
        End If
    End If
End Sub
