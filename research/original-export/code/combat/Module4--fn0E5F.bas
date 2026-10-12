Function fn0E5F (ByVal pv0420 As Integer ' 81, p0422 As Integer ' 41, p0424 As Integer ' 41, p0426 As Integer ' 41, ByVal pv0428 As Integer ' 81) As Integer ' 1
Dim l042A As Integer ' 81
Dim l042C As Single ' 83
Dim l042E As Single ' 83
Dim l0430 As Single ' 83
Dim l0432 As Integer ' 81
' Const mc0436 = 255 ' &HFF%
' Const mc0438 = 7 ' &H7%
' Const mc043A = 3 ' &H3%
' Const mc043C = 2 ' &H2%
' Const mc043E = 75 ' &H4B%
' Const mc0440 = 100 ' &H64%
        On Error GoTo L23948
        If  p0422 < False Then
            p0422 = Abs(p0422)
            l042E = True
        Else
            l042E = False
        End If
        If  p0424 = -1 Then
            If  p0426 = -1 Then
                If  pv0428 = False Then
                    l042A = fn1417(pv0420, p0422)
                Else
                    If  pv0428 <= 0 Then
                        l042A = Int((gv14C2(pv0420).M5584(gv14C2(pv0420).M58BB).M4E82 / 2) + .5#)
                    Else
                        l042A = pv0428
                    End If
                End If
            Else
                l042A = Int((gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M5A7C) / 6)
            End If
        ElseIf p0424 <= -2 Then
            l042A = Int((gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M5A7C) / 6)
        Else
            l042A = Int((gv14F6(gv1E38(p0424).M4ED4).M5A7C) / 4)
        End If
        If  l042A < 1 Then l042A = 1
        If  l042A > mc0436 Then l042A = mc0436
        l042C = (Log(l042A + 1) / Log(5))
        l0430 = gv152A(p0422).M5B33 + (gv152A(p0422).M5B33 * l042C)
        l0430 = l0430 + Int((l042A / 10) * gv152A(p0422).M5B41)
        If  l042E = True Then
            l042E = Int(((l0430 - ((l042A - 1) / l042A ^ 2)) / 2) / 2)
            l0432 = Int(l0430 - l042E)
            fn0E5F = l0432
            Exit Function
        Else
            l042E = Int(Rnd * (l0430 - ((l042A - 1) / l042A ^ 2)) / 2) + 1
            l0432 = Int(l0430 - l042E)
        End If
        If  gv152A(p0422).M5B5B > -1 Then
            Select Case p0424
                Case Is > -1
                    If  p0426 = -1 Then
                        l0432 = l0432 * (1 - (gv14C2(pv0420).M5548(gv152A(p0422).M5B5B) / 100))
                    Else
                        l0432 = l0432 * (1 - (gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M5548(gv152A(p0422).M5B5B) / 100))
                    End If
                Case Is <= -2
                    If  p0424 = -2 Then
                        l0432 = l0432 * (1 - (gv14C2(pv0428).M5548(gv152A(p0422).M5B5B) / 100))
                    Else
                        l0432 = l0432 * (1 - (gv14F6(gv14C2(pv0428).M58CB(Abs(p0424 + 3)).M4ED4).M5548(gv152A(p0422).M5B5B) / 100))
                    End If
                Case Else
                    l0432 = l0432 * (1 - (gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M5548(gv152A(p0422).M5B5B) / 100))
            End Select
        End If
        If  l0432 < 1 Then
            l0432 = 0
        End If
        If  p0424 <= -1 Or p0426 > -1 Then
            If  p0426 = -1 Then
                If  gv152A(p0422).M5709 = mc0438 Then
                    If  fn0380(mc043A, gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M55BE) = True Then
                        l0432 = False
                    End If
                End If
            End If
            If  p0426 = -1 Then
                If  fn0380(mc043C, gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M55BE) = True Then
                    l0432 = False
                End If
            Else
                If  p0424 < -2 Then
                    If  fn0380(mc043C, gv14F6(gv14C2(pv0428).M58CB(Abs(p0424 + 3)).M4ED4).M55BE) = True Then
                        l0432 = False
                    End If
                ElseIf p0424 = -2 Then
                Else
                    If  fn0380(mc043C, gv14F6(gv14C2(pv0420).M58CB(p0426).M4ED4).M55BE) = True Then
                        l0432 = False
                    End If
                End If
            End If
            Select Case gv152A(p0422).M56B9
                Case mc043E To 99
                    If  gv1662(gv14F6(gv1E38(gv1E66(pv0420).M547A).M4ED4).M4ED4).M550A <> gv152A(p0422).M56B9 - 75 Then
                        l0432 = 0
                    End If
            End Select
        End If
        If  p0424 > -1 Then
            If  gv152A(p0422).M56B9 = mc0440 Then
                If  p0426 = -1 Then
                    If  gv14C2(pv0420).M4EAC - l0432 > 0 Then
                        l0432 = 0
                    End If
                Else
                    If  gv14C2(pv0420).M58CB(p0426).M4EAC - l0432 > 0 Then
                        l0432 = 0
                    End If
                End If
            End If
        End If
        fn0E5F = Int(l0432)
        Exit Function

L23948:
    sub04FC "Error '" + Error + "' occurred in MONSMOD:monGetSpellHits"
    Resume L239B2
L239B2:
End Function
