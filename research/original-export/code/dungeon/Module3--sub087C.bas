Sub sub087C (p0188 As Integer ' 41, p018A As Integer ' 41)
Dim l018C As Integer ' 81
Dim l018E As Long ' 82
Dim l0190 As Single ' 83
Dim l0192 As Integer ' 81
Dim l0194 ' 80
Dim l0196 As String ' 87
Dim l0198 As Integer ' 81
' Const mc019A = 23 ' &H17%
    On Error GoTo L1192E
    If  gv14C2(m00C0).M5914(mc017E) And p018A = False Then Exit Sub
    If  p018A = False Then
        For l0194 = m00C0 To UBound(gv14C2)
            If  fn11D4(l0194, mc0180, False) > l0190 Then
                l0190 = fn11D4(l0194, mc0180, False)
                l0192 = l0194
            End If
        Next l0194
        If  (Int(Rnd * 100) + 1) > l0190 And p0188 <> gc1D32 Then
            Exit Sub
        End If
    End If
    l018E = fn0A34(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845)
    If  fn0380(p0188, l018E) And p0188 <> gc1D32 Then
        Exit Sub
    End If
    If  (Int(Rnd * 100) + 1) <= (l0190 / 2) Or p0188 = gc1D32 Or p018A = True Then
        l018C = p0188
        If  gv14C2(m00C0).M59F4(mc007E) = False And gv14C2(m00C0).M59F4(m0088) = False Then
            l0198 = True
            l018E = fn0418(p0188, l018E, True)
            If  fn0ABD(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845, l018E) = False Then
                MsgBox "Error updating AutoMap!", mc0152, "Error!"
            End If
            If  gv1D64 <> gv1D4A Then
                If  p0188 = gc1D32 Then
                    frmAutoMap!lblCall = "CLEARSQ"
                    frmAutoMap!lblCall = "DRAWSQ"
                Else
                    frmAutoMap!lblCall = "DRAW"
                End If
            End If
        End If
    Else
        Do
            l018C = Int(Rnd * mc019A)
            Select Case l018C
                Case 0 To 5, 11, 12, 13, 15, 16, 19, 20, 21, gc1D32, p0188
                Case Else
                    Exit Do
            End Select
        Loop
    End If
    If  p018A Then Exit Sub
    If  p0188 = gc1D32 Then
        If  UBound(gv14C2) = m00C0 Then
            sub085B "You just hit a teleporter!"
        Else
            sub085B "The party just hit a teleporter!"
        End If
        Exit Sub
    End If
    If  l0198 Then
        l0196 = "completely"
    Else
        Select Case Int(l0190)
            Case Is <= 39
                l0196 = "kind of"
            Case 40 To 49
                l0196 = "fairly"
            Case 50 To 59
                l0196 = "strongly"
            Case 60 To 69
                l0196 = "almost very"
            Case 70 To 85
                l0196 = "very"
            Case 86 To 95
                l0196 = "almost absolutely"
            Case Else
                l0196 = "absolutely"
        End Select
    End If
    If  gv14C2(m00C0).M5914(mc017E) = False Then
        Select Case l0190
            Case Is <= 35
                If  UBound(gv14C2) = m00C0 Then
                    sub085B "You sense something different here..."
                Else
                    sub085B Chr(34) + RTrim(gv14C2(l0192).M548B) + Chr(34) + " senses something different here..."
                End If
            Case Is > 35
                If  l018C = 14 Then
                    If  UBound(gv14C2) = m00C0 Then
                        sub085B "You are " + l0196 + " certain you just hit a " + gv194E(l018C) + "."
                    Else
                        sub085B Chr(34) + RTrim(gv14C2(l0192).M548B) + Chr(34) + " is " + l0196 + " certain the party just hit a " + gv194E(l018C) + "."
                    End If
                Else
                    If  UBound(gv14C2) = m00C0 Then
                        sub085B "You are " + l0196 + " certain you're standing on a " + gv194E(l018C) + " square."
                    Else
                        sub085B Chr(34) + RTrim(gv14C2(l0192).M548B) + Chr(34) + " is " + l0196 + " certain the party is standing on a " + gv194E(l018C) + " square."
                    End If
                End If
        End Select
    End If
    Exit Sub

L1192E:
    sub04FC "Error '" + Error + "' occurred in MAZEMOD:mdrmazPerceiveSquare"
    Resume L1199E
L1199E:
End Sub
