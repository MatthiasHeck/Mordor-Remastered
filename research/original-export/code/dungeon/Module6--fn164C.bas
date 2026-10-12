Function fn164C (ByVal p0800 As String ' 47, p0802 As String ' 47) As Variant ' 6
Dim l0804 As Integer ' 81
Dim l0806() As Integer ' 91
Dim l080C As Integer ' 81
Dim l080E As Integer ' 81
Dim l0810 As Integer ' 81
Dim l0812 As Integer ' 81
Dim l0814 As Integer ' 81
Dim l0816 As Long ' 82
Dim l0818 As String ' 87
' Const mc081E = 29 ' &H1D%
    On Error GoTo L4C1D6
    If  p0802 = "" Then
        Exit Function
    End If
    l0804 = 0
    l080E = 1
    l080C = 0
    gv1D6A = gv14C2(m00DC).M59BB
    gv1D6C = gv14C2(m00DC).M5470
    Do
        l0804 = l0804 + 1
        If  Mid$(p0802, l0804, 1) = gc01A2 Or l0804 = Len(p0802) Then
            l080C = l080C + 1
            If  l0804 = Len(p0802) Then
                l0804 = l0804 + 1
            End If
            ReDim Preserve l0806(l080C - 1)     As Integer
            l0806(l080C - 1) = Val(Mid$(p0802, l080E, l0804 - l080E))
            l080E = l0804 + 1
        End If
        If  l0804 >= Len(p0802) Then
            Exit Do
        End If
    Loop
    If  UBound(l0806) = False Then Exit Function
    If  p0800 = "EDITTELEPORT" Then
        If  l0806(1) < False Or l0806(1) > gv1864.M4216 Then
            Exit Function
        End If
        If  l0806(0) < False Or l0806(0) > gv1864.M420C Then
            Exit Function
        End If
        gv14C2(m00DC).M583F = l0806(0)
        gv14C2(m00DC).M5845 = l0806(1)
    Else
        Select Case gv14C2(m00DC).M5899
            Case mc01B6
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + l0806(0)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + l0806(1)
            Case mc01B8
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + l0806(1)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - l0806(0)
            Case mc01BA
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - l0806(0)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - l0806(1)
            Case mc01BC
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - l0806(1)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + l0806(0)
        End Select
    End If
    If  gv14C2(m00DC).M583F < 1 Or gv14C2(m00DC).M583F > gv1864.M4216 Then
        l0810 = Abs(Int((gv14C2(m00DC).M583F - 1) / 30) * 30)
        If  gv14C2(m00DC).M583F < 1 Then
            gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + l0810
        Else
            gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - l0810
        End If
    End If
    If  gv14C2(m00DC).M5845 < 1 Or gv14C2(m00DC).M5845 > gv1864.M420C Then
        l0810 = Abs(Int((gv14C2(m00DC).M5845 - 1) / 30) * 30)
        If  gv14C2(m00DC).M5845 < 1 Then
            gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + l0810
        Else
            gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - l0810
        End If
    End If
    sub086D mc081E
    If  (p0800 = "TELEPORT" Or p0800 = "EDITTELEPORT") And UBound(l0806) > 1 Then
        If  l0806(2) <> 0 Then
            If  p0800 = "EDITTELEPORT" Then
                If  l0806(2) < 1 Or l0806(2) > mc01F8 Then
                    Exit Function
                End If
                gv14C2(m00DC).M5470 = l0806(2)
            Else
                If  Abs(l0806(2)) > 3 Then
                    If  l0806(2) < 0 Then
                        l0806(2) = -3
                    Else
                        l0806(2) = 3
                    End If
                End If
                gv14C2(m00DC).M5470 = gv14C2(m00DC).M5470 + l0806(2)
            End If
            l0810 = fn0A0B(m00DC)
            If  gv14C2(m00DC).M5470 < 0 Then
                gv14C2(m00DC).M5470 = 0
            End If
        End If
    End If
    If  gv14C2(m00DC).M5470 <= False Then
        If  UBound(gv14C2) = m00DC Then
            l0818 = "You have teleported hundreds of feet above the city and fallen to your death!"
        Else
            l0818 = "The party has teleported hundreds of feet above the city and fallen to their deaths!"
        End If
        gv14C2(m00DC).M5470 = 0
        MsgBox l0818, mc00A4, "Teleport"
        For l0804 = m00DC To UBound(gv14C2)
            sub091E l0804, mc04DC
        Next l0804
        Do
            gv1A84 = m00DC
            sub0930 gv1A84
        Loop While UBound(gv14C2) > m00DC
        gv1A84 = m00DC
        sub091E gv1A84, mc04DC
        sub0930 gv1A84
        fn164C = mc01A6
        Exit Function
    End If
    If  fn0380(mc01C4, fn0AD3(fn0AE8(gv14C2(m00DC)))) = True Or gv14C2(m00DC).M5470 > mc01F8 Then
        If  UBound(gv14C2) = m00DC Then
            sub085B "You teleported into solid rock!"
        Else
            sub085B Chr$(34) + RTrim(gv14C2(m00DC).M548B) + Chr$(34) + " teleported into solid rock!"
        End If
        l0812 = gv14C2(m00DC).M583F
        l0814 = gv14C2(m00DC).M5845
        If  gv14C2(m00DC).M5470 >= 1 And gv14C2(m00DC).M5470 <= mc01F8 Then
            If  l0812 > False And l0812 <= gv1864.M4216 And l0814 > False And l0814 <= gv1864.M420C Then
                l0816 = fn0A34(l0812, l0814)
                l0816 = fn0418(mc01C4, l0816, True)
                If  fn0ABD(l0812, l0814, l0816) = False Then
                    MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                End If
                If  gv1D64 <> m01AA Then
                    frmAutoMap!lblCall = "DRAW"
                    frmAutoMap!lblCall = "UPDATE"
                End If
            End If
        End If
        If  gv14C2(m00DC).M5470 < False Then gv14C2(m00DC).M5470 = False
        If  gv14C2(m00DC).M5470 = False Then
            gv14C2(m00DC).M59BB = -1
        Else
            gv14C2(m00DC).M59BB = False
        End If
        sub0956
        Do
            gv1A84 = m00DC
            sub091E gv1A84, mc01C8
            sub0930 gv1A84
        Loop While UBound(gv14C2) > m00DC
        gv1A84 = m00DC
        sub091E gv1A84, mc01C8
        sub0930 gv1A84
        fn164C = mc01A6
    Else
        fn164C = True
        sub0835 gv1D6C
        sub0980
    End If
    If  gv1D64 <> m01AA Then
        frmAutoMap!lblCall = "UPDATE"
    End If
    Exit Function

L4C1D6:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharTeleport"
    fn164C = False
    Resume L4C24C
L4C24C:
End Function
