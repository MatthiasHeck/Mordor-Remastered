Sub sub0A1D ()
Dim l016A As Single ' 83
Dim l016C ' 80
Dim l016E As Long ' 82
Dim l0170 As Long ' 82
Dim l0172 As Long ' 82
Dim l0174 As Integer ' 81
Dim l0176 As Integer ' 81
Dim l0178 As Integer ' 81
Dim l017A As Integer ' 81
Dim l017C As Integer ' 81
' Const mc017E = 4 ' &H4%
' Const mc0180 = 5 ' &H5%
    On Error GoTo L10F1A
    If  gv14C2(m00C0).M5914(mc017E) Then
        Exit Sub
    End If
    For l016C = m00C0 To UBound(gv14C2)
        If  fn11D4(l016C, mc0180, False) > l016A Then
            l016A = fn11D4(l016C, mc0180, False)
            l0178 = l016C
        End If
    Next l016C
    If  l016A > 95 Then
        l016A = 95
    End If
    l0174 = gv14C2(m00C0).M583F
    l0176 = gv14C2(m00C0).M5845
    l017A = True
    Select Case gv14C2(m00C0).M5899
        Case mc00D2
            l016E = fn0AD3(fn0B01(l0174, l0176))
            If  fn0380(gc1D18, l016E) Or fn0380(gc1D1C, l016E) Or fn0380(gc1D20, l016E) Then
                l017A = False
            End If
            l0176 = l0176 + 1
        Case mc00D4
            l016E = fn0AD3(fn0B01(l0174, l0176))
            If  fn0380(gv1D16, l016E) Or fn0380(gc1D1A, l016E) Or fn0380(gc1D1E, l016E) Then
                l017A = False
            End If
            l0174 = l0174 + 1
        Case mc00D6
            If  l0176 > 1 Then
                l016E = fn0AD3(fn0B01(l0174, l0176 - 1))
                If  fn0380(gc1D18, l016E) Or fn0380(gc1D1C, l016E) Or fn0380(gc1D20, l016E) Then
                    l017A = False
                End If
            Else
                l017A = False
            End If
            l0176 = l0176 - 1
        Case mc00D8
            If  l0174 > 1 Then
                l016E = fn0AD3(fn0B01(l0174 - 1, l0176))
                If  fn0380(gv1D16, l016E) Or fn0380(gc1D1A, l016E) Or fn0380(gc1D1E, l016E) Then
                    l017A = False
                End If
            Else
                l017A = False
            End If
            l0174 = l0174 - 1
        Case Else
    End Select
    If  l0174 < 1 Or l0174 > gv1864.M4216 Then Exit Sub
    If  l0176 < 1 Or l0176 > gv1864.M420C Then Exit Sub
    If  l017A = False Then Exit Sub
    l016E = fn0AD3(fn0B01(l0174, l0176))
    l0170 = fn0A34(l0174, l0176)
    l0172 = fn0AD3(fn0B01(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845))
    If  fn0380(gc1D36, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D36, l0170, True)
        If  fn0380(gc1D36, l0172) = False Then
            If  UBound(gv14C2) = m00C0 Then
                sub085B "You detect Quicksand ahead of you."
            Else
                sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects Quicksand ahead of the party."
            End If
        End If
    End If
    If  fn0380(gc1D2E, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D2E, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect Stairs Up ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects Stairs Up ahead of the party."
        End If
    End If
    If  fn0380(gc1D30, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D30, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect Stairs Down ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects Stairs Down ahead of the party."
        End If
    End If
    If  fn0380(gc1D32, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D32, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect a Teleporter ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects a Teleporter ahead of the party."
        End If
    End If
    If  fn0380(gc1D40, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D40, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect a Chute ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects a Chute ahead of the party."
        End If
    End If
    If  fn0380(gc1D2C, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D2C, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect a Pit ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects a Pit ahead of the party."
        End If
    End If
    If  fn0380(gc1D38, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D38, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect a rotator ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects a Rotator ahead of the party."
        End If
    End If
    If  fn0380(gc1D2A, l016E) And (Rnd * 100) < (l016A) Then
        l017C = True
        l0170 = fn0418(gc1D2A, l0170, True)
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You detect an Extinguish square ahead of you."
        Else
            sub085B Chr(34) + RTrim(gv14C2(l0178).M548B) + Chr(34) + " detects an Extinguish Square ahead of the party."
        End If
    End If
    If  l017C Then
        If  fn0ABD(l0174, l0176, l0170) = False Then
            MsgBox "Error updating AutoMap!", mc0152, "Error!"
        End If
        If  gv1D64 <> gv1D4A Then
            frmAutoMap!lblCall = CStr(l0174) + "," + CStr(l0176)
        End If
    End If
    Exit Sub

L10F1A:
    sub04FC "Error '" + Error + "' occurred in MAZEMOD:mdrmazPerceiveAhead."
    Resume L10F8A
L10F8A:
End Sub
