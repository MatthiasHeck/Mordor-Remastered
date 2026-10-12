Sub sub0A7C (p0844 As Integer ' 41, p0846 As Integer ' 41, p0848 As Integer ' 41)
Dim l084A As Integer ' 81
Dim l084E As T5810 ' 8A
    On Error GoTo L4CF98
    l084A = FreeFile
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l084A Len = mc01EC
        Get #l084A, gv1732(p0844).M5467, l084E
        l084E.M583F = gv14C2(gv1A86).M583F
        l084E.M5845 = gv14C2(gv1A86).M5845
        l084E.M5470 = gv14C2(gv1A86).M5470
        If  p0846 > 0 Then
            l084E.M58E9 = p0846
            l084E.M58F9 = RTrim(gv14C2(gv1A86).M548B)
            l084E.M58DC = p0848
            gv1732(p0844).M549C = p0846
        End If
        gv1732(p0844).M547A = gv14C2(gv1A86).M59BB
        gv1732(p0844).M5470 = gv14C2(gv1A86).M5470
        l084E.M59BB = gv14C2(gv1A86).M59BB
        l084E.M5470 = gv14C2(gv1A86).M5470
        Put #l084A, gv1732(p0844).M5467, l084E
    Close #l084A
    Exit Sub

L4CF98:
    sub04FC "Error '" + Error$ + "' updating Character Carried!"
    sub085B "Drop and pick up again. Err=" + Str$(Err)
    Exit Sub
End Sub
