Sub sub0835 (p026E As Integer ' 41)
Dim l0270 As Integer ' 81
Dim l0272 As Integer ' 81
Dim l0276 ' 80
Dim l0278 ' 80
Dim l027A As Long ' 82
Dim l027C As Long ' 82
Dim l027E As Long ' 82
Dim l0280 As Integer ' 81
Dim l0282 As Integer ' 81
Dim l0284 As Integer ' 81
Dim l0286 As Integer ' 81
Dim l0288 As Integer ' 81
Dim l028A ' 80
' Const mc028C = 22 ' &H16%
Dim l028E() As Integer ' 91
Dim l0294 As Integer ' 81
' Const mc0296 = 45 ' &H2D%
' Const mc0298 = 61 ' &H3D%
' Const mc029A = 11 ' &HB%
' Const mc029C = 6 ' &H6%
' Const mc029E = 2 ' &H2%
' Const mc02A0 = 29 ' &H1D%
Dim l02A4 As T5D64 ' 8A
Static m02A6 As Integer ' 61
' Const mc02A8 = 4 ' &H4%
' Const mc02AA = 6 ' &H6%
' Const mc02AC = 1 ' &H1%
    ReDim l028E(mc028C)               As Integer
    On Error GoTo L181F8
    If  gv14C2(m00C0).M5470 = 0 Then
        Exit Sub
    End If
    gv1D6C = p026E
    frmDungeonMain!lblSquareInfo.Caption = ""
    If  gv14C2(m00C0).M59F4(mc007E) = True Or gv14C2(m00C0).M59F4(m0088) = True Then
        If  gv14C2(m00C0).M59F4(m0088) = True Then
            If  (Log(fn11D4(m00C0, mc0180, False)) * Log(fn11D4(m00C0, mc0180, False)) / 15) > Rnd * 100 Then
                gv14C2(m00C0).M59F4(m0088) = False
                sub0848 False
                sub085B "You've figured out what level you're on..."
            End If
        End If
        If  gv14C2(m00C0).M59F4(mc00B2) = True Then
            If  (Log(fn11D4(m00C0, mc0180, False)) * Log(fn11D4(m00C0, mc0180, False)) / 20) > Rnd * 100 Then
                gv14C2(m00C0).M59F4(mc00B2) = False
                sub0848 False
                sub085B "You've figured out what direction you're facing..."
            End If
        End If
        If  (Log(fn11D4(m00C0, mc0180, False)) * Log(fn11D4(m00C0, mc0180, False)) / 25) > Rnd * 100 Then
            gv14C2(m00C0).M59F4(mc007E) = False
            gv14C2(m00C0).M59F4(m0088) = False
            gv14C2(m00C0).M59F4(mc00B2) = False
            sub085B "You've figured out where you are!"
            sub0848 False
        End If
    End If
    l027C = fn0A34(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845)
    l027E = fn0AD3(fn0AE8(gv14C2(m00C0)))
    If  fn0380(gc1D50, l027C) <> False Then
        If  gv14C2(m00C0).M59F4(mc007E) = True Or gv14C2(m00C0).M59F4(m0088) = True Then
            sub085B "You've found yourself!"
        End If
        gv14C2(m00C0).M59F4(mc00B2) = False
        gv14C2(m00C0).M59F4(mc007E) = False
        gv14C2(m00C0).M59F4(m0088) = False
        sub0848 False
    Else
        If  gv14C2(m00C0).M59F4(mc007E) = False And gv14C2(m00C0).M59F4(m0088) = False Then
            l0284 = True
        End If
    End If
    For l028A = 0 To mc028C
        l028E(l028A) = fn0380(l028A, fn0AD3(fn0AE8(gv14C2(m00C0))))
        If  gv14C2(m00C0).M59F4(mc007E) = False And gv14C2(m00C0).M59F4(m0088) = False Then
            Select Case l028A
                Case gv1D16, gc1D18, gc1D1A, gc1D1C
                    If  l028E(l028A) <> False Then
                        If  fn0380(gc1D3E, l027E) = False Then
                            l027C = fn0418(l028A, l027C, True)
                        End If
                    End If
                Case gc1D1E, gc1D20
                    If  l028E(l028A) <> False Then
                        If  fn0380(gc1D3E, l027E) = False Then
                            If  fn0380(l028A, l027C) = False Then
                                If  Int(Rnd * 100) < (fn11D4(m00C0, mc0180, False) / 5) Then
                                    l027C = fn0418(l028A, l027C, True)
                                    If  l028A = gc1D1E Then
                                        l027C = fn0418(gv1D16, l027C, False)
                                    Else
                                        l027C = fn0418(gc1D18, l027C, False)
                                    End If
                                Else
                                    If  l028A = gc1D1E Then
                                        l027C = fn0418(gv1D16, l027C, True)
                                    Else
                                        l027C = fn0418(gc1D18, l027C, True)
                                    End If
                                End If
                            End If
                        End If
                    End If
                Case gc1D2C, gc1D2E, gc1D30, gc1D34, gc1D36, gc1D3E, gc1D40
                    If  l028E(l028A) <> False Then
                        l027C = fn0418(l028A, l027C, True)
                    End If
                Case Else
            End Select
        End If
    Next l028A
    If  gv14C2(m00C0).M583F = gv1864.M4216 And l028E(gc1D3E) = False Then
        l027C = fn0418(gv1D16, l027C, True)
    End If
    If  gv14C2(m00C0).M5845 = gv1864.M420C And l028E(gc1D3E) = False Then
        l027C = fn0418(gc1D18, l027C, True)
    End If
    If  gv14C2(m00C0).M59F4(mc007E) = False And gv14C2(m00C0).M59F4(m0088) = False Then
        l027C = fn0418(gc1D50, l027C, True)
    End If
    If  gv14C2(m00C0).M59F4(m0088) = False Then
        Get #gv1B58, 2, l0278
        If  l0278 < gv14C2(m00C0).M5470 Then
            Put #gv1B58, 2, gv14C2(m00C0).M5470
            sub0578 gv14C2(m00C0).M58BB, Chr$(34) + RTrim(gv14C2(m00C0).M548B) + Chr$(34) + " was the first to go to level " + CStr(gv14C2(m00C0).M5470) + "."
        End If
    End If
    If  gv14C2(m00C0).M59F4(mc007E) = False And gv14C2(m00C0).M59F4(m0088) = False Then
        If  fn0ABD(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845, l027C) = False Then
            MsgBox "Error updating AutoMap!", mc0152, "Error!"
        End If
        If  gv14C2(m00C0).M583F > 1 Then
            l027C = fn0A34(gv14C2(m00C0).M583F - 1, gv14C2(m00C0).M5845)
            l027A = fn0AD3(fn0AE8(gv14C2(m00C0)) - 1)
            If  fn0380(gc1D3E, l027E) = False Then
                If  fn0380(gv1D16, l027A) = True Then
                    l027C = fn0418(gv1D16, l027C, True)
                End If
                If  fn0380(gc1D1A, l027A) = True Then
                    l027C = fn0418(gc1D1A, l027C, True)
                End If
                If  fn0380(gc1D1E, l027A) = True Then
                    If  fn0380(gc1D1E, l027C) = False Then
                        If  Int(Rnd * 100) < (fn11D4(m00C0, mc0180, False) / 5) Then
                            l027C = fn0418(gc1D1E, l027C, True)
                            l027C = fn0418(gv1D16, l027C, False)
                        Else
                            l027C = fn0418(gv1D16, l027C, True)
                        End If
                    End If
                End If
                If  fn0ABD(gv14C2(m00C0).M583F - 1, gv14C2(m00C0).M5845, l027C) = False Then
                    MsgBox "Error updating AutoMap!", mc0152, "Error!"
                End If
            End If
        End If
        If  gv14C2(m00C0).M5845 > 1 Then
            l027C = fn0A34(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845 - 1)
            l027A = fn0AD3(fn0AE8(gv14C2(m00C0)) - gv1864.M4216)
            If  fn0380(gc1D3E, l027E) = False Then
                If  fn0380(gc1D18, l027A) = True Then
                    l027C = fn0418(gc1D18, l027C, True)
                End If
                If  fn0380(gc1D1C, l027A) = True Then
                    l027C = fn0418(gc1D1C, l027C, True)
                End If
                If  fn0380(gc1D20, l027A) = True Then
                    If  fn0380(gc1D20, l027C) = False Then
                        If  Int(Rnd * 100) < (fn11D4(m00C0, mc0180, False) / 5) Then
                            l027C = fn0418(gc1D20, l027C, True)
                            l027C = fn0418(gc1D18, l027C, False)
                        Else
                            l027C = fn0418(gc1D18, l027C, True)
                        End If
                    End If
                End If
                If  fn0ABD(gv14C2(m00C0).M583F, gv14C2(m00C0).M5845 - 1, l027C) = False Then
                    MsgBox "Error updating AutoMap!", mc0152, "Error!"
                End If
            End If
        End If
    End If
    If  l0284 = True And gv1D64 <> gv1D4A Then
        frmAutoMap!lblCall = "DRAW"
    End If
    l0294 = gv1A84
    For l0276 = m00C0 To UBound(gv14C2)
        gv14C2(l0276).M583F = gv14C2(m00C0).M583F
        gv14C2(l0276).M5845 = gv14C2(m00C0).M5845
        gv14C2(l0276).M5470 = gv14C2(m00C0).M5470
    Next l0276
    If  l028E(gc1D34) <> False Or l028E(gc1D36) <> False Then
        If  gv14C2(m00C0).M56B9(mc00B4) = False Then
            sub086D mc0296
        End If
    End If
    If  l028E(gc1D3A) Then sub087C gc1D3A, False
    If  l028E(gc1D42) Then sub087C gc1D42, False
    If  l028E(gc1D2A) Then
        sub087C gc1D2A, False
        sub086D mc0298
    End If
    If  l028E(gc1D22) Then
        sub087C gc1D22, False
        gv14C2(m00C0).M5899 = mc00D2
    End If
    If  l028E(gc1D24) Then
        sub087C gc1D24, False
        gv14C2(m00C0).M5899 = mc00D4
    End If
    If  l028E(gc1D26) Then
        sub087C gc1D26, False
        gv14C2(m00C0).M5899 = mc00D6
    End If
    If  l028E(gc1D28) Then
        sub087C gc1D28, False
        gv14C2(m00C0).M5899 = mc00D8
    End If
    If  l028E(gc1D38) Then
        sub087C gc1D38, False
        gv14C2(m00C0).M5899 = Int(Rnd * mc00D8) + 1
        If  fn11D4(m00C0, mc0180, False) < (Rnd * 70) + (gv14C2(m00C0).M5470 * 2) Then
            gv14C2(m00C0).M59F4(mc007E) = True
            gv14C2(m00C0).M59F4(mc00B2) = True
            If  UBound(gv14C2) > m00C0 Then
                sub085B "The party leader lost their sense of direction!"
            Else
                sub085B "You've lost your sense of direction!"
            End If
        End If
    End If
    For gv1A84 = 0 To UBound(gv14C2)
        If  l028E(gc1D2A) <> False Then
            gv14C2(gv1A84).M591F = False
            For l0276 = 0 To mc029A - 1
                gv14C2(gv1A84).M592F(l0276) = 0
            Next l0276
            sub0894 gv1A84
            sub08A9 False, 50
            sub08B9 False
        End If
        If  l028E(gc1D2C) <> False Then
            l0272 = True
            If  gv14C2(gv1A84).M56B9(mc00B4) <> False Then
                If  5 + (gv14C2(gv1A84).M5470 / 4) < (Rnd * 100) Then
                    l0272 = False
                End If
            End If
            If  l0272 = True Then
                If  gv1A84 = gv1A82 Then
                    sub086D mc029C: sub08D1 mc029E
                End If
                l0270 = Int(Rnd * (((gv14C2(gv1A84).M5470 + 1) / 2) * 15.5#)) * Log(gv148E(gv14C2(gv1A84).M5821).M5565 + 2) + 1
                If  gv1A84 = gv1A86 Then
                    frmDungeonMain!lblSquareInfo.Caption = "You have fallen into a pit for" + Str$(l0270) + " hits."
                Else
                    sub085B Chr(34) + RTrim(gv14C2(gv1A84).M548B) + Chr(34) + " has fallen into a pit for" + Str$(l0270) + " hits."
                End If
                gv14C2(gv1A84).M4EAC = gv14C2(gv1A84).M4EAC - l0270
                l0280 = True
            Else
                If  gv1A84 = gv1A82 Then
                    frmDungeonMain!lblSquareInfo.Caption = "You are hovering over a pit."
                End If
            End If
        End If
        If  gv1A84 = gv1A82 Then
            If  l028E(gc1D2E) <> False Then
                frmDungeonMain!lblSquareInfo.Caption = "There are Stairs Up here."
            End If
            If  l028E(gc1D30) <> False Then
                frmDungeonMain!lblSquareInfo.Caption = "There are Stairs Down here."
            End If
        End If
    Next gv1A84
    gv1A84 = l0294
    If  l028E(gc1D32) <> False Then
        sub086D mc02A0
        sub087C gc1D32, False
        For l0276 = 0 To gv1864.M5D0E - 1
            Get #gv1B56, gv1D6E + 4 + (gv1864.M4216 * gv1864.M420C) + mc00B0 + l0276, l02A4
            If  l02A4.M5D74 = gv14C2(gv1A86).M583F And l02A4.M5D7E = gv14C2(gv1A86).M5845 Then
                If  m02A6 = True And l02A4.M5D98 > mc015E Then
                    sub085B "..but it doesn't go anywhere in the limited version..."
                    Exit For
                Else
                    For gv1A84 = 0 To UBound(gv14C2)
                        If  l02A4.M5D88 = 0 Or l02A4.M5D90 = 0 Then
                            Do
                                gv14C2(gv1A84).M583F = Int(Rnd * gv1864.M4216) + 1
                                gv14C2(gv1A84).M5845 = Int(Rnd * gv1864.M420C) + 1
                                If  fn0380(gc1D3C, fn0AD3(fn0B01(gv14C2(gv1A84).M583F, gv14C2(gv1A84).M5845))) = False Then
                                    If  fn0380(gc1D32, fn0AD3(fn0B01(gv14C2(gv1A84).M583F, gv14C2(gv1A84).M5845))) = False Then
                                        Exit Do
                                    End If
                                End If
                            Loop
                        Else
                            gv14C2(gv1A84).M583F = l02A4.M5D88
                            gv14C2(gv1A84).M5845 = l02A4.M5D90
                        End If
                        gv1D6A = gv14C2(gv1A84).M59BB
                        If  l02A4.M5D98 <> gv14C2(gv1A84).M5470 And l02A4.M5D98 > 0 Then
                            gv14C2(gv1A84).M5470 = l02A4.M5D98
                        End If
                        l0278 = fn0A0B(m00C0)
                        gv14C2(gv1A84).M59BB = fn0992(fn0AE8(gv14C2(gv1A84)))
                        l027C = fn0A34(gv14C2(gv1A84).M583F, gv14C2(gv1A84).M5845)
                        If  l027C = False Then
                            gv14C2(gv1A84).M59F4(mc007E) = True
                            gv14C2(gv1A84).M59F4(m0088) = True
                            gv14C2(gv1A84).M59F4(mc00B2) = True
                            sub08E1 gv1A84
                        End If
                    Next gv1A84
                    gv1A84 = l0294
                    l0278 = fn0A0B(m00C0)
                    l0282 = True
                    l0286 = True
                    Exit For
                End If
            End If
        Next l0276
        If  gv1D64 <> gv1D4A Then
            frmAutoMap!lblCall = "UPDATE"
        End If
    End If
    If  l028E(gc1D40) <> False Then
        If  m02A6 = True And gv14C2(m00C0).M5470 = mc015E Then
            sub085B "There is a chute here, but it doesn't do anything in the Limited Version."
        Else
            l0270 = False
            l0288 = False
            For l0276 = m00C0 To UBound(gv14C2)
                l0272 = True
                If  gv14C2(l0276).M56B9(mc00B4) <> False Then
                    If  5 + (gv14C2(l0276).M5470 / 4) < (Rnd * 100) Then
                        l0272 = False
                    End If
                End If
                If  l0272 = True Or l0288 = True Then
                    If  l0276 = m00C0 And UBound(gv14C2) > m00C0 Then
                        If  MsgBox("Your party leader has fallen down a chute.  Do you wish the party to follow them?", mc0152 & mc02A8, "Follow Leader?") = mc02AA Then
                            l0288 = True
                        End If
                        l0286 = True
                    End If
                    l0270 = l0270 + 1
                    sub08F5 l0276
                Else
                    If  l0276 = gv1A86 Then
                        frmDungeonMain!lblSquareInfo.Caption = "There is a chute here.  Select TAKE to use."
                    End If
                End If
            Next l0276
            If  l0270 > False Then
                sub086D mc029C: sub08D1 mc029E
            End If
            l0278 = fn0A0B(m00C0)
            l0280 = True
        End If
        If  gv1D64 <> gv1D4A Then
            frmAutoMap!lblCall = "UPDATE"
        End If
    End If
    gv1A84 = l0294
    sub0908
    If  UBound(gv14C2) = m00C0 Then
        If  gv14C2(m00C0).M4EAC <= False Then
            sub091E m00C0, mc02AC
            sub0930 m00C0
        End If
    End If
    If  l0280 = True Then
        sub08A9 True, 7
        sub0941 "UPDATE"
        sub0956
        sub096E
    End If
    If  l0286 Then
        sub0835 gv14C2(m00C0).M5470
    End If
    If  l0282 = True Then
        sub0980
    End If
    Exit Sub

L181F8:
    Resume L18204
L18204:
End Sub
