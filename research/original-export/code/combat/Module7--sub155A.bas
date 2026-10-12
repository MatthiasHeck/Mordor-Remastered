Sub sub155A (p00E2 As Integer ' 41)
Dim l00E4 As Integer ' 81
Dim l00E6 ' 80
Dim l00EE As Integer ' 81
Dim l00F0 As Integer ' 81
' Const mc00F2 = 4 ' &H4%
Static m00F4 As Integer ' 61
' Const mc00F6 = 1 ' &H1%
' Const mc00F8 = 2 ' &H2%
    On Error GoTo L512C2
    If  m000C = True Then Exit Sub
    m000C = True
    If  gv1E38(0).M4ECC = mc005C Then
        For l00E6 = 0 To UBound(gv14C2)
            If  l00E6 > UBound(gv14C2) Then
                l00E6 = UBound(gv14C2)
                Exit For
            End If
            If  gv14C2(l00E6).M5483 = False Then
                If  fn0EEF() = False Then Exit For
                If  gv1E7C(l00E6) <= False Then
                    If  l00E6 = gv1A86 Then
                        frmDungeonMain!lblCharacterHit.Caption = ""
                        frmDungeonMain!lblCharacterHit.Visible = True
                    End If
                Else
                    If  gv1E50.M4F2D > False Then
                        gv1E7C(l00E6) = gv1E7C(l00E6) - 1
                        If  gv1E7C(l00E6) <= False Then
                            gv1E7C(l00E6) = -1
                            sub0F01 l00E6
                        End If
                        sub0FE1
                    Else
                        gv1E7C(l00E6) = -1
                    End If
                End If
                If  gv1E66(l00E6).M4E97 = mc0068 Or gv1E66(l00E6).M56C4 > -1 And fn0EEF() > 0 And p00E2 = gv14C2(m0022).M59BB Then
                    sub1019 l00E6, p00E2
                End If
                If  gv1E38(0).M4ECC = mc005C And fn0EEF() > 0 And p00E2 = gv14C2(m0022).M59BB Then
                    sub0C8A l00E6, p00E2
                End If
            End If
        Next l00E6
        For l00E6 = 0 To UBound(gv14C2)
            If  gv14C2(l00E6).M5483 <> False Then l00E4 = True
            If  gv1E66(l00E6).M547A > -1 And gv14C2(l00E6).M5483 = False Then
                If  gv1E38(gv1E66(l00E6).M547A).M4EDC <= False Then
                    gv1E66(l00E6).M547A = fn0DCD(-1)
                    If  l00E6 = gv1A82 Then
                        sub0BCD
                    End If
                End If
            End If
        Next l00E6
        If  l00E4 Then frmParty!lblCall = "UPDATE"
    End If
    sub0BCD
    If  gv1E38(0).M4ECC = mc005C And fn0EEF() > 0 And p00E2 = gv14C2(m0022).M59BB Then
        sub0A64 m00A8
    Else
        If  gv14C2(m0022).M59BB > 0 And gv1E38(0).M4ED4 > -1 And gv1E38(0).M4EF9 = False Then
            l00F0 = 7.5# * Log(gv14C2(m0022).M55B5(mc00F2))
            Select Case gv14F6(gv1E38(0).M4ED4).M4EBF
                Case m00F4
                    If  gv14C2(m0022).M4EBF = mc00F6 Then
                        l00EE = 15
                    End If
                    If  gv14C2(m0022).M4EBF = mc00F8 Then
                        l00EE = 100
                    End If
                Case mc00F6
                    If  gv14C2(m0022).M4EBF = mc00F6 Then
                        l00EE = 15
                    Else
                        l00EE = 25
                    End If
                Case mc00F8
                    If  gv14C2(m0022).M4EBF = mc00F8 Then
                        l00EE = 25
                    Else
                        l00EE = 35
                    End If
            End Select
            If  Int(Rnd * 100) + 1 < (l00EE - l00F0) Then
                gv1E38(0).M4ECC = mc005C
                sub0BDE -1
                sub0BBA gv14C2(m0022).M59BB
                sub0A64 m00A8
            End If
        End If
    End If
    sub0941 "STATS"
    m000C = False
    Exit Sub

L512C2:
    sub04FC "Error '" + Error + "' occurred in MULTIMOD:mdrmulInitiateCombatRound"
    m000C = False
    Resume L51340
L51340:
End Sub
