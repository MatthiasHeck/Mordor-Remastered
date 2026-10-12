' Module3
Option Explicit
Const mc007E = 1 ' &H1%
Const m0088 = 0 ' &H0%
Const mc00B0 = 200 ' &HC8%
Const mc00B2 = 2 ' &H2%
Const mc00B4 = 3 ' &H3%
Const m00C0 = 0 ' &H0%
Const mc00D2 = 1 ' &H1%
Const mc00D4 = 2 ' &H2%
Const mc00D6 = 3 ' &H3%
Const mc00D8 = 4 ' &H4%
Const mc00F8 = 2900 ' &HB54%
Const mc0122 = 1 ' &H1%
Const mc0140 = 4 ' &H4%
Const mc0142 = 63 ' &H3F%
Const mc0144 = 62 ' &H3E%
Const mc014E = 10 ' &HA%
Const mc0152 = 48 ' &H30%
Const mc015C = 15 ' &HF%
Const mc015E = 15 ' &HF%
Const mc0162 = 20 ' &H14%
Const mc0168 = 28 ' &H1C%
Const mc017E = 4 ' &H4%
Const mc0180 = 5 ' &H5%
Const mc019A = 23 ' &H17%
Const mc01AC = 30 ' &H1E%
Const mc01AE = 30 ' &H1E%
Const mc01B0 = 1000 ' &H3E8%
Const mc0204 = 8 ' &H8%
Const mc0218 = 1 ' &H1%
Const mc021A = 2 ' &H2%
Const mc022C = 1 ' &H1%
Const mc022E = 2 ' &H2%
Const mc0232 = 50 ' &H32%
Const mc0236 = 32 ' ? &H 0020 00CC
Const mc025E = 1 ' &H1%
Const mc0262 = 277 ' &H115%
Const mc028C = 22 ' &H16%
Const mc0296 = 45 ' &H2D%
Const mc0298 = 61 ' &H3D%
Const mc029A = 11 ' &HB%
Const mc029C = 6 ' &H6%
Const mc029E = 2 ' &H2%
Const mc02A0 = 29 ' &H1D%
Const mc02A8 = 4 ' &H4%
Const mc02AA = 6 ' &H6%

Sub sub08E1 (ByVal pv007A As Integer ' 81)
' Const mc007E = 1 ' &H1%
' Const m0088 = 0 ' &H0%
    If  gv1A86 = pv007A Then
        If  gv14C2(pv007A).M59F4(mc007E) = True And gv14C2(pv007A).M59F4(m0088) = True Then
            sub085B "You realize that you're completely lost..."
        Else
            sub085B "You realize that you're lost..."
        End If
    End If
End Sub

Function fn0AD3 (p008C As Integer ' 41) As Long ' 2
Dim l0090 As T5D20 ' 8A
    On Error GoTo LE718
    Get #gv1B56, gv1D6E + p008C, l0090
    fn0AD3 = l0090.M5D2C
    Exit Function
LE718:
    fn0AD3 = 0
    Resume LE72E
LE72E:
End Function

Function fn0AE8 (p0098 As T5810 ' 4A) As Integer ' 1
    On Error GoTo LE774
    fn0AE8 = p0098.M583F + (gv1864.M420C * (p0098.M5845 - 1))
    Exit Function
LE774:
    fn0AE8 = 0
    Resume LE788
LE788:
End Function

Function fn0B01 (p00A0 As Integer ' 41, p00A2 As Integer ' 41) As Integer ' 1
    On Error GoTo LE7C6
    fn0B01 = p00A0 + (gv1864.M420C * (p00A2 - 1))
    Exit Function
LE7C6:
    fn0B01 = 0
    Resume LE7DA
LE7DA:
End Function

Sub sub08F5 (ByVal pv00A4 As Integer ' 81)
Dim l00A6 ' 80
Dim l00A8 As Integer ' 81
Dim l00AC As T5DA4 ' 8A
Dim l00AE As Long ' 82
' Const mc00B0 = 200 ' &HC8%
' Const mc00B2 = 2 ' &H2%
' Const mc00B4 = 3 ' &H3%
Dim l00B6 As Integer ' 81
' Const m00C0 = 0 ' &H0%
    l00A8 = fn0A0B(pv00A4)
    For l00A6 = 0 To gv1864.M5D01
        Get #gv1B56, gv1D6E + 5 + (gv1864.M4216 * gv1864.M420C) + mc00B0 + gv1864.M5D0E + l00A6, l00AC
        If  l00AC.M5D74 = gv14C2(pv00A4).M583F And l00AC.M5D7E = gv14C2(pv00A4).M5845 Then
            If  l00AC.M5DB1 > 0 Then
                gv1D6A = gv14C2(pv00A4).M59BB
                gv14C2(pv00A4).M5470 = gv14C2(pv00A4).M5470 + l00AC.M5DB1
                l00A8 = fn0A0B(pv00A4)
                gv14C2(pv00A4).M59BB = fn0992(fn0AE8(gv14C2(pv00A4)))
                Exit For
            End If
        End If
    Next l00A6
    l00AE = fn0A34(gv14C2(pv00A4).M583F, gv14C2(pv00A4).M5845)
    If  l00AE = False Then
        gv14C2(pv00A4).M59F4(mc007E) = True
        gv14C2(pv00A4).M59F4(m0088) = True
        gv14C2(pv00A4).M59F4(mc00B2) = True
        sub08E1 pv00A4
    End If
    If  gv14C2(pv00A4).M56B9(mc00B4) = False Then
        l00B6 = Int(Rnd * (gv14C2(pv00A4).M5470 * 10.5#)) * Log(gv148E(gv14C2(pv00A4).M5821).M5565 + 2) + 5
        If  pv00A4 = gv1A86 Then
            sub085B "You have fallen into a chute for" + Str$(l00B6) + " hits."
        Else
            If  gv14C2(m00C0).M5470 = gv14C2(pv00A4).M5470 Then
                sub085B Chr$(34) + RTrim(gv14C2(pv00A4).M548B) + Chr$(34) + " has fallen into a chute for" + Str$(l00B6) + " hits."
            End If
        End If
        gv14C2(pv00A4).M4EAC = gv14C2(pv00A4).M4EAC - l00B6
    End If
End Sub

Function fn0B1B (p00C6 As T5810 ' 4A) As Long ' 2
Dim l00C8 As Long ' 82
Dim l00CA As Long ' 82
Dim l00CC As Integer ' 81
Dim l00CE As Integer ' 81
Dim l00D0 As Integer ' 81
' Const mc00D2 = 1 ' &H1%
' Const mc00D4 = 2 ' &H2%
' Const mc00D6 = 3 ' &H3%
' Const mc00D8 = 4 ' &H4%
    l00CC = p00C6.M583F
    l00CE = p00C6.M5845
    l00CA = 0
    l00D0 = True
    Select Case p00C6.M5899
        Case mc00D2
            If  l00CE = gv1864.M420C Then l00D0 = False
        Case mc00D4
            If  l00CC = gv1864.M4216 Then l00D0 = False
        Case mc00D6
            l00CE = p00C6.M5845 - 1
            If  l00CE = 0 Then l00D0 = False
        Case mc00D8
            l00CC = p00C6.M583F - 1
            If  l00CC = 0 Then l00D0 = False
        Case Else
    End Select
    If  l00D0 Then
        l00C8 = fn0AD3(fn0B01(l00CC, l00CE))
        Select Case p00C6.M5899
            Case mc00D2, mc00D6
                If  fn0380(gc1D18, l00C8) Then l00CA = fn0418(gv1D44, l00CA, True)
                If  fn0380(gc1D1C, l00C8) Then l00CA = fn0418(gc1D46, l00CA, True)
                If  fn0380(gc1D20, l00C8) Then l00CA = fn0418(gc1D48, l00CA, True)
            Case mc00D4, mc00D8
                If  fn0380(gv1D16, l00C8) Then l00CA = fn0418(gv1D44, l00CA, True)
                If  fn0380(gc1D1A, l00C8) Then l00CA = fn0418(gc1D46, l00CA, True)
                If  fn0380(gc1D1E, l00C8) Then l00CA = fn0418(gc1D48, l00CA, True)
            Case Else
        End Select
    Else
        l00CA = fn0418(gv1D44, l00C8, True)
    End If
    fn0B1B = l00CA
End Function

Sub sub096E ()
Dim l00DE ' 80
Dim l00E4 As T5810 ' 8A
Dim l00E6 ' 80
Dim l00E8 As Integer ' 81
' Const mc00F8 = 2900 ' &HB54%
Dim l00FA As Integer ' 81
    ReDim gv1732(0) As T544D
    On Error GoTo LF0DC
    l00E8 = FreeFile
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l00E8 Len = mc00F8
    Get #l00E8, 2, l00E6
    If  l00E6 = 0 Then
        Exit Sub
    Else
        ReDim gv1732(l00E6 - 1)   As T544D
        For l00DE = 1 To l00E6
            Do
                Get #l00E8, l00DE + 2 + l00FA, l00E4
                If  RTrim(l00E4.M548B) <> "" Then
                    Exit Do
                End If
                l00FA = l00FA + 1
            Loop
            gv1732(l00DE - 1).M5470 = l00E4.M5470
            gv1732(l00DE - 1).M547A = l00E4.M59BB
            gv1732(l00DE - 1).M5467 = l00DE + 2 + l00FA
            gv1732(l00DE - 1).M4E82 = l00E4.M5584(l00E4.M58BB).M4E82
            gv1732(l00DE - 1).M4EAC = l00E4.M4EAC
            gv1732(l00DE - 1).M5493 = l00E4.M58BB
            gv1732(l00DE - 1).M548B = RTrim(l00E4.M548B)
            gv1732(l00DE - 1).M549C = l00E4.M58E9
            If  l00E4.M4EAC < 1 Then
                gv1732(l00DE - 1).M5483 = l00E4.M5483
            Else
                gv1732(l00DE - 1).M5483 = 0
            End If
        Next l00DE
    End If
    Close #l00E8
    Exit Sub

LF0DC:
    sub04FC "Error '" + Error + "' occurred in MAZEMOD:mdrmazGetChars."
    Resume LF146
LF146:
End Sub

Function fn0992 (p00FE As Integer ' 41) As Integer ' 1
Dim l0102 As T5D20 ' 8A
    On Error GoTo LF1BA
    If  gv14C2(gv1A86).M5470 = 0 Then
        fn0992 = -1
    Else
        Get #gv1B56, gv1D6E + p00FE, l0102
        fn0992 = l0102.M547A
    End If
    Exit Function

LF1BA:
    If  gv14C2(gv1A86).M5470 = 0 Then
        fn0992 = -1
    Else
        fn0992 = 0
    End If
    Exit Function
End Function

Function fn09A4 (p0106 As Integer ' 41, p0108 As Integer ' 41) As Integer ' 1
Dim l010A As Integer ' 81
Dim l010C As Integer ' 81
Dim l010E As Integer ' 81
Dim l0110 As String ' 87
Dim l0114 As T3751 ' 8A
Dim l0116 As Integer ' 81
Dim l0118 As Integer ' 81
' Const mc0122 = 1 ' &H1%
Static m0124 As Integer ' 61
    l010E = extfn00D1(frmCharStat1!picTabPicture.hDC, l0114)
    On Error GoTo LFA64
    If  gv1A82 > UBound(gv14C2) Then gv1A82 = m00C0
    l010A = 0
    l010C = 0
    Select Case p0106
        Case 1, 3
            frmCharStat1!picTabPicture.Cls
            sub09B8 frmCharStat1!picTabPicture, 2, 1, "Name", mc0122
            sub09B8 frmCharStat1!picTabPicture, 2, 9, "Guild", mc0122
            sub09B8 frmCharStat1!picTabPicture, 2, 15, "Level", mc0122
            sub09B8 frmCharStat1!picTabPicture, 2, 19, "Hits", mc0122
    End Select
    For l010E = 0 To UBound(gv1732)
        If  gv1732(l010E).M5467 = gv14C2(gv1A82).M5962 Then
            gv1732(l010E).M4EAC = gv14C2(gv1A82).M4EAC
            gv1732(l010E).M4E82 = gv14C2(gv1A82).M5584(gv14C2(gv1A82).M58BB).M4E82
            gv1732(l010E).M5493 = gv14C2(gv1A82).M58BB
            gv1732(l010E).M5470 = gv14C2(gv1A82).M5470
            gv1732(l010E).M547A = gv14C2(gv1A82).M59BB
        End If
        If  (gv1732(l010E).M5470 = gv14C2(m00C0).M5470) Or p0106 > 1 Then
                If  (gv1732(l010E).M547A = gv14C2(m00C0).M59BB Or gv1732(l010E).M5467 = gv14C2(m00C0).M5962) Or p0106 > 1 Then
                    If  gv1732(l010E).M5483 > 0 And gv1732(l010E).M5467 <> gv14C2(m00C0).M5962 Then
                        l010C = l010C + 1
                    Else
                        l010A = l010A + 1
                    End If
                    If  p0106 = 1 Or p0106 = 3 Then
                        sub09B8 frmCharStat1!picTabPicture, l010A + l010C + 2, 1, gv1732(l010E).M548B, m0124
                        l0116 = (l0114.M37C0 * Screen.TwipsPerPixelX) * 9
                        l0118 = ((l010A + l010C + 1) * l0114.M375F) * Screen.TwipsPerPixelY
                        frmCharStat1!picTabPicture.Line (l0116, l0118)-(l0116 + (frmCharStat1!picTabPicture.Width - l0116), l0118 + (l0114.M375F * Screen.TwipsPerPixelY)), frmCharStat1!picTabPicture.BackColor, BF
                        sub09B8 frmCharStat1!picTabPicture, l010A + l010C + 2, 9, gv145A(gv1732(l010E).M5493).M548B, m0124
                        sub09B8 frmCharStat1!picTabPicture, l010A + l010C + 2, 15, LTrim$(Str$(gv1732(l010E).M4E82)), m0124
                        sub09B8 frmCharStat1!picTabPicture, l010A + l010C + 2, 19, LTrim$(Str$(gv1732(l010E).M4EAC)), m0124
                    End If
                End If
        End If
    Next l010E
    Select Case p0106
        Case 1
        Case 3
        Case Else
            If  gv14C2(gv1A82).M5483 Then
                frmDungeonMain!lblRoom.Caption = "(You are Dead)"
            Else
                If  gv14C2(gv1A82).M5470 > 0 Then
                    If  gv14C2(m00C0).M59F4(mc007E) = False Then
                        l0110 = CStr(gv14C2(m00C0).M583F) + "," + CStr(gv14C2(m00C0).M5845) + "," + CStr(gv14C2(m00C0).M5470) + " "
                    Else
                        If  gv14C2(m00C0).M59F4(m0088) = False Then
                            l0110 = "(Lost on " + CStr(gv14C2(m00C0).M5470) + ") "
                        Else
                            l0110 = "(Lost) "
                        End If
                    End If
                    If  gv14C2(m00C0).M59F4(mc00B2) = False Then
                        l0110 = l0110 + gv06E8(gv14C2(m00C0).M5899 - 1)
                    Else
                        l0110 = l0110 + "?"
                    End If
                    If  l010C > 0 Then
                        frmDungeonMain!lblRoom.Caption = l0110 + " [ " + LTrim$(Str$(l010A)) + "+" + LTrim$(Str$(l010C)) + " ]"
                    Else
                        frmDungeonMain!lblRoom.Caption = l0110 + " [ " + LTrim$(Str$(l010A)) + " ]"
                    End If
                End If
            End If
    End Select
    If  p0108 Then
        fn09A4 = l010C
    Else
        fn09A4 = l010A + l010C
    End If
    Exit Function

LFA64:
    sub04FC "Error '" + Error + "' occurred in MAZEMOD:mdrmazLookAround."
    Resume LFAD0
LFAD0:
End Function

Sub sub09CC ()
Dim l013C As Integer ' 81
Dim l013E ' 80
' Const mc0140 = 4 ' &H4%
' Const mc0142 = 63 ' &H3F%
' Const mc0144 = 62 ' &H3E%
    l013C = fn09A4(False, True)
    For l013E = False To UBound(gv14C2)
        If  gv14C2(l013E).M5943 >= mc0140 Then
            l013C = l013C - 1
        End If
    Next l013E
    If  l013C < False Then l013C = False
    If  l013C Then
        If  l013C = 1 Then
            sub085B "There is a dead body here!"
        Else
            sub085B "There are dead bodies here!"
        End If
        sub09DE mc0142
    End If
    l013C = fn09A4(False, True)
    l013C = fn09A4(False, False) - l013C
    If  (l013C - (UBound(gv14C2) + 1)) > False Then
        sub09DE mc0144
    End If
    Select Case l013C - (UBound(gv14C2) + 1)
        Case 1
            sub085B "Somebody else is in the room!"
        Case Is > 1
            sub085B "Other characters are in the room!"
        Case Else
    End Select
End Sub

Function fn09F6 () As Integer ' 1
Dim l0148 As String ' 87
' Const mc014E = 10 ' &HA%
' Const mc0152 = 48 ' &H30%
    On Error GoTo LFE38
    If  gv1B58 <> False Then
        fn09F6 = True
        Exit Function
    End If
    gv1B58 = FreeFile
    Open gv19E8 + gc1C74 + gc1C20 For Random As #gv1B58 Len = mc014E
    Get #gv1B58, 1, l0148
    If  fn0326(l0148) = True Then
        MsgBox "AutoMap file Version not current!  Will attempt to update...", mc0152, "ERROR"
        l0148 = gc0186
        Put #gv1B58, 1, l0148
    End If
    fn09F6 = True
    Exit Function

LFE38:
    Resume LFE44
LFE44:
End Function

Function fn0A0B (ByVal pv0158 As Integer ' 81) As Integer ' 1
Dim l015A As Integer ' 81
' Const mc015C = 15 ' &HF%
' Const mc015E = 15 ' &HF%
' Const mc0162 = 20 ' &H14%
' Const mc0168 = 28 ' &H1C%
    On Error GoTo L100AE
    If  gv14C2(pv0158).M5470 < 0 Or gv14C2(pv0158).M5470 > mc015C Then
        Exit Function
    End If
    If  gv14C2(pv0158).M5470 > mc015E Then
        sub085B "LIMITED VERSION: Request to go to Level " + LTrim$(Str$(gv14C2(pv0158).M5470)) + " is Denied."
        gv14C2(m00C0).M5470 = mc015E
        gv14C2(pv0158).M5470 = mc015E
    End If
    If  gv1B56 = False Then
        gv1B56 = FreeFile
        Open gv19E8 + gc1C74 + gc1C34 For Random As #gv1B56 Len = mc0162
    End If
    If  gv14C2(pv0158).M5470 > 0 Then
        l015A = gv14C2(pv0158).M5470 + 1
    Else
        l015A = 2
    End If
    Get #gv1B56, l015A, gv1D6E
    Get #gv1B56, gv1D6E, gv1864
    If  gv1E60 = False Then
        gv1E60 = FreeFile
        Open gv19E8 + gc1C74 + gc1C30 For Random As #gv1E60 Len = mc0168
    End If
    sub096E
    If  fn09F6() = False Then
        MsgBox "Error '" + Error + "' opening AutoMap File!", mc0152, "Error!"
        End
    End If
    fn0A0B = True
    Exit Function
L100AE:
    fn0A0B = False
    Exit Function
End Function

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

Function fn0A34 (p01A4 ' 40, p01A6 ' 40) As Long ' 2
Dim l01A8 As Integer ' 81
Dim l01AA As Long ' 82
' Const mc01AC = 30 ' &H1E%
' Const mc01AE = 30 ' &H1E%
' Const mc01B0 = 1000 ' &H3E8%
    If  gv14C2(m00C0).M5470 >= 1 And gv14C2(m00C0).M5470 <= mc015C Then
        l01A8 = ((gv14C2(m00C0).M5470 - 1) * (mc01AC * mc01AE)) + fn0B01(p01A4, p01A6)
        Get #gv1B58, l01A8 + 2, l01AA
    End If
    fn0A34 = l01AA
End Function

Sub sub0A49 ()
    If  gv14C2(gv1A86).M5470 > 0 Then
        frmDungeonMain!timCombat.Interval = mc01B0
    End If
End Sub

Sub sub0980 ()
Static m01B4 ' 60
Static m01B6 As Integer ' 61
Static m01B8 As Integer ' 61
Static m01BA As Integer ' 61
Static m01BC As Integer ' 61
Static m01C0 As Integer ' 61
Static m01C2 As Integer ' 61
Static m01C4 ' 60
Static m01C6 As Integer ' 61
Static m01C8 As Integer ' 61
Static m01D0 As Integer ' 61
Static m01D2() As Integer ' 71
' Const mc0204 = 8 ' &H8%
' Const mc0218 = 1 ' &H1%
' Const mc021A = 2 ' &H2%
' Const mc022C = 1 ' &H1%
' Const mc022E = 2 ' &H2%
' Const mc0232 = 50 ' &H32%
' Const mc0236 = 32 ' ? &H 0020 00CC
Static m0240 As Integer ' 61
Static m0242 As Integer ' 61
Static m0244 As Integer ' 61
Static m0246 As Integer ' 61
Static m0254 As Integer ' 61
Static m0256 As Integer ' 61
Static m025C As Integer ' 61
' Const mc025E = 1 ' &H1%
' Const mc0262 = 277 ' &H115%
    On Error GoTo L1605E
    If  gv14C2(m00C0).M5483 > 0 Or gv14C2(m00C0).M5470 = 0 Then
        gv1B50 = False
        Exit Sub
    End If
    ReDim m01D2(1)   As Integer
    ReDim v?01E8(1) As
    gv1B50 = True
    frmDungeonMain!shpMazeBox.BorderStyle = 1
    frmDungeonMain!shpMazeBox.Refresh
    For m01B4 = 1 To 25
        v?01FE(m01B4) = 0
    Next m01B4
    For m01B4 = 1 To mc0204
        gv1B72(m01B4) = 0
    Next m01B4
    m01C0 = fn0AE8(gv14C2(m00C0))
    If  gv1D6A = -1 Then
        gv1D66 = gv14C2(m00C0).M59BB
    End If
    If  gv1A84 > UBound(gv14C2) Then
        gv1A84 = UBound(gv14C2)
    End If
    m01D0 = gv1A84
    m01C8 = True
    m01C2 = True
    If  fn0992(fn0AE8(gv14C2(m00C0))) <> gv14C2(m00C0).M59BB Or gv1D6A <> -1 Or (gv1D6C <> gv14C2(m00C0).M5470) Then
        m01C8 = False
        m01C2 = False
        If  gv1D6C <> gv14C2(m00C0).M5470 Then
            m01C2 = gv14C2(m00C0).M5470
            gv14C2(m00C0).M5470 = gv1D6C
            m01B4 = fn0A0B(m00C0)
            If  gv1D6A = -1 Then
                gv1D6A = gv1D68
            End If
        Else
            gv1D6A = gv1D68
        End If
        m01B4 = fn0F88(gv1D6A)
        If  m01C2 <> False Then
            gv14C2(m00C0).M5470 = m01C2
            m01B4 = fn0A0B(m00C0)
        End If
        If  gv1E38(0).M4ED4 <> -1 And gv1E38(0).M4ECC = mc0218 Then
            frmDungeonMain!timCombat.Enabled = False
            sub0A64 mc021A
            sub0941 "UPDATE"
        End If
        If  gv14C2(m00C0).M5470 = 0 Then
            gv14C2(m00C0).M59BB = -1
        Else
            gv14C2(m00C0).M59BB = fn0992(fn0AE8(gv14C2(m00C0)))
        End If
        gv1A84 = m01D0
        frmParty!lblCall = "UPDATE"
        frmDungeonMain!timCombat.Enabled = False
        m01C2 = False
    End If
    gv1D6A = -1
    sub0956
    If  m01C8 = False Then
        m01D0 = gv1A84
        For gv1A84 = 0 To UBound(gv14C2)
            If  Not gv1A66.M5F80 Then
                m01C2 = fn04ED(gv14C2(gv1A84))
            End If
            If  gv14C2(gv1A84).M5943 >= mc0140 Then
                sub0A7C gv14C2(gv1A84).M5943 - mc0140, 0, 0
            End If
        Next gv1A84
        gv1A84 = m01D0
        sub09CC
    End If
    gv1AEC(m00C0) = gv14C2(m00C0).M5470
    If  gv14C2(m00C0).M5483 > 0 Or gv14C2(m00C0).M5470 = 0 Then
        gv1B50 = False
        Exit Sub
    End If
    Select Case gv14C2(m00C0).M5899
        Case mc00D2
            m01B6 = 30: m01B8 = -1
        Case mc00D4
            m01B6 = 1: m01B8 = 30
        Case mc00D6
            m01B6 = -30: m01B8 = 1
        Case mc00D8
            m01B6 = -1: m01B8 = -30
    End Select
       m01BA = -m01B8

L12048:
       If  gv14C2(m00C0).M583F = 2 Then
           If  gv14C2(m00C0).M5899 = 1 Then v?01FE(13) = 1
           If  gv14C2(m00C0).M5899 = 3 Then v?01FE(14) = 1
           If  gv14C2(m00C0).M5899 = 4 Then v?01FE(7) = 1: v?01FE(6) = 1: v?01FE(8) = 1: v?01FE(21) = 1: v?01FE(22) = 1
       End If
       If  gv14C2(m00C0).M583F = 1 Then
           If  gv14C2(m00C0).M5899 = 1 Then v?01FE(4) = 1: v?01FE(11) = 1
           If  gv14C2(m00C0).M5899 = 3 Then v?01FE(5) = 1: v?01FE(12) = 1
           If  gv14C2(m00C0).M5899 = 4 Then v?01FE(1) = 1: v?01FE(2) = 1: v?01FE(3) = 1
       End If
       If  gv14C2(m00C0).M5845 = 2 Then
           If  gv14C2(m00C0).M5899 = 3 Then v?01FE(6) = 1: v?01FE(7) = 1: v?01FE(8) = 1: v?01FE(21) = 1: v?01FE(22) = 1
           If  gv14C2(m00C0).M5899 = 2 Then v?01FE(14) = 1
           If  gv14C2(m00C0).M5899 = 4 Then v?01FE(13) = 1
       End If
       If  gv14C2(m00C0).M5845 = 1 Then
           If  gv14C2(m00C0).M5899 = 3 Then v?01FE(1) = 1: v?01FE(2) = 1: v?01FE(3) = 1
           If  gv14C2(m00C0).M5899 = 2 Then v?01FE(5) = 1: v?01FE(12) = 1
           If  gv14C2(m00C0).M5899 = 4 Then v?01FE(4) = 1: v?01FE(11) = 1
       End If
       If  gv14C2(m00C0).M583F = 29 Then
           If  gv14C2(m00C0).M5899 = 1 Then v?01FE(14) = 1
           If  gv14C2(m00C0).M5899 = 2 Then v?01FE(6) = 1: v?01FE(7) = 1: v?01FE(8) = 1: v?01FE(21) = 1: v?01FE(22) = 1
           If  gv14C2(m00C0).M5899 = 3 Then v?01FE(13) = 1
       End If
       If  gv14C2(m00C0).M583F = 30 Then
           If  gv14C2(m00C0).M5899 = 1 Then v?01FE(5) = 1: v?01FE(12) = 1
           If  gv14C2(m00C0).M5899 = 2 Then v?01FE(1) = 1: v?01FE(2) = 1: v?01FE(3) = 1
           If  gv14C2(m00C0).M5899 = 3 Then v?01FE(4) = 1: v?01FE(11) = 1
       End If
       If  gv14C2(m00C0).M5845 = 29 Then
           If  gv14C2(m00C0).M5899 = 1 Then v?01FE(6) = 1: v?01FE(7) = 1: v?01FE(8) = 1: v?01FE(21) = 1: v?01FE(22) = 1
           If  gv14C2(m00C0).M5899 = 2 Then v?01FE(13) = 1
           If  gv14C2(m00C0).M5899 = 4 Then v?01FE(14) = 1
       End If
       If  gv14C2(m00C0).M5845 = 30 Then
           If  gv14C2(m00C0).M5899 = 1 Then v?01FE(1) = 1: v?01FE(2) = 1: v?01FE(3) = 1
           If  gv14C2(m00C0).M5899 = 2 Then v?01FE(4) = 1: v?01FE(11) = 1
           If  gv14C2(m00C0).M5899 = 4 Then v?01FE(5) = 1: v?01FE(12) = 1
       End If
       m01BC = m01C0 + m01B8
       If  m01BC > 900 Or m01BC < 1 Then GoTo L12782
       For m01C4 = 0 To 5
           If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(4) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(1) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(1) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(4) = m01C4 + 10
               End If
           End If
       Next m01C4

L12782:
       m01BC = m01C0
       For m01C4 = 0 To 5
           If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(5) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(2) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(4) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(2) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(4) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(5) = m01C4 + 10
               End If
           End If
       Next m01C4
L1291E:
       m01BC = m01C0 + m01BA
       If  m01BC > 900 Or m01BC < 1 Then GoTo L12A8E
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(3) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(5) = m01C4 + 10
               End If
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(3) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(5) = m01C4 + 10
               End If
           End If
       Next m01C4
L12A8E:
       m01BC = m01C0 + m01B8 + m01B8 + m01B6
       If  m01BC < 1 Or m01BC > 900 Then GoTo L12C12
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(13) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(21) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(13) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(21) = m01C4 + 10
               End If
           End If
       Next m01C4
L12C12:
       m01BC = m01C0 + m01B8 + m01B6
       If  m01BC < 1 Or m01BC > 900 Then GoTo L12E30
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(11) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(6) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(13) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(1) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(6) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(13) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(1) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(11) = m01C4 + 10
               End If
           End If
       Next m01C4
L12E30:
       m01BC = m01C0 + m01B6
       If  m01BC < 1 Or m01BC > 900 Then GoTo L13048
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(12) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(7) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(11) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(2) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(7) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(11) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(2) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(12) = m01C4 + 10
               End If
           End If
       Next m01C4
L13048:
       m01BC = m01C0 + m01B6 + m01BA
       If  m01BC < 1 Or m01BC > 900 Then GoTo L13266
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(14) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(8) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(12) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(3) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 1 Then v?01FE(8) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 2 Then v?01FE(12) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(3) = m01C4 + 10
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(14) = m01C4 + 10
               End If
           End If
       Next m01C4
L13266:
L1326C:
       m01BC = m01C0 + m01B6 + m01B6
       If  m01BC < 1 Or m01BC > 900 Then GoTo L13392
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                    If  gv14C2(m00C0).M5899 = 4 Then v?01FE(7) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                       If  gv14C2(m00C0).M5899 = 3 Then v?01FE(7) = m01C4 + 10
               End If
           End If
       Next m01C4
L13392:
       m01BC = m01C0 + m01B6 + m01B6 + m01BA
       If  m01BC < 1 Or m01BC > 900 Then GoTo L134C0
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(8) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(8) = m01C4 + 10
               End If
           End If
       Next m01C4

L134C0:
       m01BC = m01C0 + m01B6 + m01B6 + m01B8
       If  m01BC < 1 Or m01BC > 900 Then GoTo L135EC
       For m01C4 = 0 To 5
            If  fn0380(m01C4, fn0AD3(m01BC)) = True Then
               If  m01C4 = gv1D16 Or m01C4 = gc1D1A Or m01C4 = gc1D1E Then
                   If  gv14C2(m00C0).M5899 = 4 Then v?01FE(6) = m01C4 + 10
               End If
               If  m01C4 = gc1D18 Or m01C4 = gc1D1C Or m01C4 = gc1D20 Then
                   If  gv14C2(m00C0).M5899 = 3 Then v?01FE(6) = m01C4 + 10
               End If
           End If
       Next m01C4
L135EC:
L135F2:
L135F8:
    GoSub L14530
    If  v?01FE(1) > 0 Then
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) = 0 Then
            m01D2(0) = 7
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) > 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) = 0 Then
            m01D2(0) = 8
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) > 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) > 0 Then
            m01D2(0) = 9
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) > 0 And v?01FE(7) = 0 Then
            m01D2(0) = 10
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) > 0 And v?01FE(7) > 0 Then
            m01D2(0) = 11
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) > 0 Then
            m01D2(0) = 12
            GoTo L13D8C
        End If
        If  v?01FE(2) > 0 Then
            m01D2(0) = 16
            GoTo L13D8C
        End If
    End If
    If  v?01FE(2) > 0 Then
        If  v?01FE(4) > 0 Then
            m01D2(0) = 17
            GoTo L13D8C
        End If
        If  v?01FE(1) > 0 Then
            m01D2(0) = 16
            GoTo L13D8C
        End If
        If  v?01FE(9) > 0 Then
            m01D2(0) = 19
            GoTo L13D8C
        End If
        m01D2(0) = 18
        GoTo L13D8C
    End If
    If  v?01FE(4) > 0 Then
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) = 0 Then
            m01D2(0) = 1
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) > 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) = 0 Then
            m01D2(0) = 2
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) > 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) Then
            m01D2(0) = 3
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) > 0 And v?01FE(7) = 0 Then
            m01D2(0) = 4
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) > 0 And v?01FE(7) Then
            m01D2(0) = 5
            GoTo L13D8C
        End If
        If  v?01FE(2) = 0 And v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) Then
            m01D2(0) = 6
            GoTo L13D8C
        End If
        If  v?01FE(2) > 0 Then
            m01D2(0) = 17
            GoTo L13D8C
        End If
    End If
    If  v?01FE(11) > 0 Then
        If  v?01FE(9) = 0 And v?01FE(7) = 0 Then
            m01D2(0) = 20
            GoTo L13D8C
        End If
        If  v?01FE(9) > 0 And v?01FE(7) = 0 Then
            m01D2(0) = 21
            GoTo L13D8C
        End If
        If  v?01FE(9) > 0 And v?01FE(7) > 0 Then
            m01D2(0) = 23
            GoTo L13D8C
        End If
        If  v?01FE(9) = 0 And v?01FE(7) > 0 Then
            m01D2(0) = 22
            GoTo L13D8C
        End If
    End If
    If  v?01FE(9) > 0 Then
        m01D2(0) = 24
        GoTo L13D8C
    End If
    If  v?01FE(6) > 0 Then
        If  v?01FE(7) > 0 Then
            m01D2(0) = 14
            GoTo L13D8C
        End If
        If  v?01FE(7) = 0 Then
            m01D2(0) = 25
            GoTo L13D8C
        End If
    End If
    If  v?01FE(7) > 0 Then
        m01D2(0) = 13
        GoTo L13D8C
    End If

L13D8C:
    If  v?01FE(3) > 0 Then
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) = 0 Then
            m01D2(1) = 7
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) > 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) = 0 Then
            m01D2(1) = 8
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) > 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) > 0 Then
            m01D2(1) = 9
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) > 0 And v?01FE(7) = 0 Then
            m01D2(1) = 10
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) > 0 And v?01FE(7) > 0 Then
            m01D2(1) = 11
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) > 0 Then
            m01D2(1) = 12
            GoTo L14A56
        End If
        If  v?01FE(2) > 0 Then
            m01D2(1) = 16
            GoTo L14A56
        End If
    End If
    If  v?01FE(2) > 0 Then
        If  v?01FE(5) > 0 Then
            m01D2(1) = 17
            GoTo L14A56
        End If
        If  v?01FE(3) > 0 Then
            m01D2(1) = 16
            GoTo L14A56
        End If
        If  v?01FE(10) > 0 Then
            m01D2(1) = 19
            GoTo L14A56
        End If
        m01D2(1) = 18
        GoTo L14A56
    End If
    If  v?01FE(5) > 0 Then
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) = 0 Then
            m01D2(1) = 1
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) > 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) = 0 Then
            m01D2(1) = 2
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) > 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) > 0 Then
            m01D2(1) = 3
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) > 0 And v?01FE(7) = 0 Then
            m01D2(1) = 4
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) > 0 And v?01FE(7) > 0 Then
            m01D2(1) = 5
            GoTo L14A56
        End If
        If  v?01FE(2) = 0 And v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) > 0 Then
            m01D2(1) = 6
            GoTo L14A56
        End If
        If  v?01FE(2) > 0 Then
            m01D2(1) = 17
            GoTo L14A56
        End If
    End If
    If  v?01FE(12) > 0 Then
        If  v?01FE(10) = 0 And v?01FE(7) = 0 Then
            m01D2(1) = 20
            GoTo L14A56
        End If
        If  v?01FE(10) > 0 And v?01FE(7) = 0 Then
            m01D2(1) = 21
            GoTo L14A56
        End If
        If  v?01FE(10) > 0 And v?01FE(7) > 0 Then
            m01D2(1) = 23
            GoTo L14A56
        End If
        If  v?01FE(10) > 0 = 0 And v?01FE(7) > 0 Then
            m01D2(1) = 22
            GoTo L14A56
        End If
    End If
    If  v?01FE(10) > 0 Then
        m01D2(1) = 24
        GoTo L14A56
    End If
    If  v?01FE(8) > 0 Then
        If  v?01FE(7) > 0 Then
            m01D2(1) = 14
            GoTo L14A56
        End If
        If  v?01FE(7) = 0 Then
            m01D2(1) = 25
            GoTo L14A56
        End If
    End If
    If  v?01FE(7) > 0 Then
        m01D2(1) = 13
        GoTo L14A56
    End If
    GoTo L14A56

L14530:
    If  v?01FE(5) > 0 Or v?01FE(3) > 0 Then v?01FE(10) = 0: v?01FE(14) = 0: v?01FE(22) = 0
    If  v?01FE(4) > 0 And v?01FE(6) > 0 Then v?01FE(15) = v?01FE(6): v?01FE(6) = 0: v?01FE(21) = 0
    If  v?01FE(1) > 0 And v?01FE(6) > 0 Then v?01FE(15) = v?01FE(6): v?01FE(6) = 0
    If  v?01FE(5) > 0 And v?01FE(8) > 0 Then v?01FE(16) = v?01FE(8): v?01FE(8) = 0
    If  v?01FE(3) > 0 And v?01FE(8) > 0 Then v?01FE(16) = v?01FE(8): v?01FE(8) = 0
    If  v?01FE(2) > 0 Then v?01FE(11) = 0: v?01FE(12) = 0: v?01FE(7) = 0
    If  v?01FE(5) > 0 Then v?01FE(3) = 0
    If  v?01FE(4) > 0 Then v?01FE(1) = 0
    If  v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(7) = 0 Then v?01FE(19) = 0
    If  v?01FE(12) > 0 And v?01FE(8) > 0 Then v?01FE(10) = v?01FE(8): v?01FE(8) = 0: v?01FE(16) = 0
    If  v?01FE(11) > 0 And v?01FE(6) > 0 Then v?01FE(9) = v?01FE(6): v?01FE(6) = 0: v?01FE(15) = 0
    If  v?01FE(2) > 0 Then v?01FE(15) = 0: v?01FE(16) = 0: v?01FE(19) = 0: v?01FE(20) = 0
    If  v?01FE(2) > 0 And v?01FE(8) > 0 Then v?01FE(10) = v?01FE(8): v?01FE(8) = 0
    If  v?01FE(2) > 0 And v?01FE(6) > 0 Then v?01FE(9) = v?01FE(6): v?01FE(6) = 0
    If  v?01FE(11) = 0 And v?01FE(6) = 0 And v?01FE(15) = 0 And v?01FE(9) = 0 And v?01FE(7) = 0 Then v?01FE(19) = 0
    If  v?01FE(1) = 0 And v?01FE(4) = 0 And v?01FE(2) = 0 And v?01FE(11) = 0 Then v?01FE(17) = 0
    If  v?01FE(5) = 0 And v?01FE(3) = 0 And v?01FE(2) = 0 And v?01FE(12) = 0 Then v?01FE(18) = 0
    If  v?01FE(12) = 0 And v?01FE(8) = 0 And v?01FE(16) = 0 And v?01FE(7) = 0 Then v?01FE(20) = 0
    If  v?01FE(14) > 0 Then v?01FE(22) = 0
    If  v?01FE(13) > 0 Then v?01FE(21) = 0
    If  v?01FE(12) > 0 Then v?01FE(16) = 0
    If  v?01FE(11) > 0 Then v?01FE(15) = 0
Return

L14A56:
    For m01B4 = 1 To 16
        If  m01B4 <> 13 And m01B4 <> 14 Then
            If  v?01FE(m01B4) = gc1D1A + 10 Or v?01FE(m01B4) = gc1D1C + 10 Then
                Select Case m01B4
                    Case 1
                        gv1B72(2) = fn0418(mc022C, gv1B72(2), 1)
                    Case 3
                        gv1B72(2) = fn0418(mc022E, gv1B72(2), 1)
                    Case 2
                        gv1B72(3) = fn0418(mc022C, gv1B72(3), 1)
                    Case 4
                        gv1B72(1) = fn0418(mc022C, gv1B72(1), 1)
                    Case 5
                        gv1B72(1) = fn0418(mc022E, gv1B72(1), 1)
                    Case 9
                        gv1B72(4) = fn0418(mc022C, gv1B72(4), 1)
                    Case 10
                        gv1B72(4) = fn0418(mc022E, gv1B72(4), 1)
                    Case 15
                        gv1B72(5) = fn0418(mc022C, gv1B72(5), 1)
                    Case 16
                        gv1B72(5) = fn0418(mc022E, gv1B72(5), 1)
                    Case 6
                        gv1B72(6) = fn0418(mc022C, gv1B72(6), 1)
                    Case 8
                        gv1B72(6) = fn0418(mc022E, gv1B72(6), 1)
                    Case 11
                        gv1B72(7) = fn0418(mc022C, gv1B72(7), 1)
                    Case 12
                        gv1B72(7) = fn0418(mc022E, gv1B72(7), 1)
                    Case 7
                        gv1B72(8) = fn0418(mc022C, gv1B72(8), 1)
                End Select
            End If
        End If
    Next m01B4
    m01C6 = False
    extsub05E7
    If  fn0380(gc1D3E, fn0AD3(fn0AE8(gv14C2(m00C0)))) <> False Then
        m01C2 = extfn182D(gv2BB2, 0, 0, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 0, 50, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 50, 0, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 50, 50, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
    Else
        If  m01D2(0) > 0 Then
            m01C2 = extfn182D(gv2BB2, 0, 0, mc0232, mc0232, gv2BB6, ((m01D2(0) - 1) * mc0232), mc0232 * 2, mc0236)
            m01C2 = extfn182D(gv2BB2, 0, 50, mc0232, mc0232, gv2BB6, ((m01D2(0) - 1) * mc0232), mc0232 * 3, mc0236)
        Else
            m01C2 = extfn182D(gv2BB2, 0, 0, mc0232, mc0232 * 2, gv2BBE, 0, 0, mc0236)
        End If
        If  m01D2(1) > 0 Then
            m01C2 = extfn182D(gv2BB2, 50, 0, mc0232, mc0232, gv2BB6, ((m01D2(1) - 1) * mc0232), 0, mc0236)
            m01C2 = extfn182D(gv2BB2, 50, 50, mc0232, mc0232, gv2BB6, ((m01D2(1) - 1) * mc0232), mc0232, mc0236)
        Else
            m01C2 = extfn182D(gv2BB2, 50, 0, mc0232, mc0232 * 2, gv2BBE, 50, 0, mc0236)
        End If
        For m01B4 = 1 To mc0204
            m0240% = 0: m0242% = 0: m0244% = gv1BB6(m01B4 - 1).M4216: m0246% = gv1BB6(m01B4 - 1).M420C
            If  gv1B72(m01B4) > 0 Then
                If  fn0380(mc022C, gv1B72(m01B4)) <> 0 Then
                    Select Case m01B4
                        Case 1
                            m0240% = 0
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C)
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 2
                            m0240% = 0
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 16
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 3
                            m0240% = ((mc0232 * 2) / 2) - (gv1BB6(m01B4 - 1).M4216 / 2)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 16
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 4
                            m0240% = 16 - (gv1BB6(m01B4 - 1).M4216)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 5
                            m0240% = 17
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 6
                            m0240% = ((gv1BB6(m01B4 - 1).M4216) / 3)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 7
                            m0240% = 25 - ((gv1BB6(m01B4 - 1).M4216) / 2)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 20
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 8
                            m0240% = 50 - ((gv1BB6(m01B4 - 1).M4216) / 2)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(5).M425F, 0, m0244%, m0246%, mc0236)
                    End Select
                End If
                If  fn0380(mc022E, gv1B72(m01B4)) <> 0 Then
                    Select Case m01B4
                        Case 1
                            m0240% = (mc0232 * 2) - gv1BB6(m01B4 - 1).M4216
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C)
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(6).M425F + gv1BB6(6).M4216 + gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 2
                            m0240% = (mc0232 * 2) - gv1BB6(m01B4 - 1).M4216
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 16
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(6).M425F + gv1BB6(6).M4216 + gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 4
                            m0240% = (mc0232 * 2) - (16 - (gv1BB6(m01B4 - 1).M4216))
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(6).M425F + gv1BB6(6).M4216 + gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 5
                            m0240% = (mc0232 * 2) - 18 - gv1BB6(m01B4 - 1).M4216
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(6).M425F + gv1BB6(6).M4216 + gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 6
                            m0240% = (mc0232 * 2) - ((gv1BB6(m01B4 - 1).M4216) / 3) - (gv1BB6(m01B4 - 1).M4216)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 32
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(6).M425F + gv1BB6(6).M4216 + gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                        Case 7
                            m0240% = (mc0232 * 2) - 24 - ((gv1BB6(m01B4 - 1).M4216) / 2)
                            m0242% = ((mc0232 * 2) - gv1BB6(m01B4 - 1).M420C) - 19
                            m01C2 = extfn01C4(gv2BB2, m0240%, m0242%, m0244%, m0246%, gv2BBA, gv1BB6(6).M425F + gv1BB6(6).M4216 + gv1BB6(m01B4 - 1).M425F, 0, m0244%, m0246%, mc0236)
                    End Select
                End If
            End If
        Next m01B4
    End If
    extsub05E7
    If  m01C6 = True Then
        m01C2 = extfn182D(gv2BB2, 0, 0, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 0, 50, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 50, 0, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 50, 50, mc0232, mc0232, gv2BC0, 0, 0, mc0236)
    End If
    If  fn0380(gc1D34, fn0AD3(fn0AE8(gv14C2(m00C0)))) <> False Then
        m0254 = 18
        m0256 = 50
        m01C2 = extfn182D(gv2BB2, 0, 100 - m0254, m0256, m0254, gv2BC2, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 50, 100 - m0254, m0256, m0254, gv2BC2, 0, 0, mc0236)
    End If
    If  fn0380(gc1D36, fn0AD3(fn0AE8(gv14C2(m00C0)))) <> False Then
        m0254 = 18
        m0256 = 50
        m01C2 = extfn182D(gv2BB2, 0, 100 - m0254, m0256, m0254, gv2BC4, 0, 0, mc0236)
        m01C2 = extfn182D(gv2BB2, 50, 100 - m0254, m0256, m0254, gv2BC4, 0, 0, mc0236)
    End If
    m01C2 = fn09A4(False, False)
    If  gv14C2(m00C0).M59BB <> gv1D66 Or gv14C2(m00C0).M5470 <> gv1D6C Then
        sub0A91 gv14C2(m00C0).M59BB
        If  gv1E38(0).M4ED4 <> -1 And gv1E38(0).M4ECC <> m025C Then
            frmDungeonMain!timCombat.Enabled = False
            sub0A64 mc025E
            frmDungeonMain!timCombat.Enabled = True
        End If
    End If
    gv1D6C = gv14C2(m00C0).M5470
    extsub05E7
    If  gv14C2(gv1A86).M5483 = False Then
        If  fn0C3B(gv1E38(0).M4EDC, gv1E38(0).M4ED4) = True Then
            sub0AA6 mc0262
        Else
            If  gv1A66.M5F04 = False Then
                m01C2 = extfn01C4(frmDungeonMain!picMaze2.hDC, 0, 0, frmDungeonMain!picMaze2.ScaleWidth, frmDungeonMain!picMaze2.ScaleHeight, gv2BB2, 0, 0, gc1D12, gc1D14, mc0236)
            Else
                m01C2 = extfn182D(frmDungeonMain!picMaze2.hDC, (frmDungeonMain!picMaze2.ScaleWidth / 2) - 50, (frmDungeonMain!picMaze2.ScaleHeight / 2) - 50, 100, 100, gv2BB2, 0, 0, mc0236)
            End If
        End If
    End If
    sub0A1D
    extsub05E7
    frmDungeonMain!shpMazeBox.BorderStyle = 0
    gv1B50 = False
    Exit Sub

L1605E:
    MsgBox "Error '" + Error + "' occurred in MAZEMOD:mdrmazShowMaze.", mc0152, "Error!"
    Resume L160CE
L160CE:
End Sub

Function fn0ABD (p0266 ' 40, p0268 ' 40, p026A ' 40) As Integer ' 1
Dim l026C As Integer ' 81
    If  gv14C2(m00C0).M5470 >= 1 And gv14C2(m00C0).M5470 <= mc015C Then
        If  gv14C2(m00C0).M59F4(mc007E) = False And gv14C2(m00C0).M59F4(m0088) = False And gv14C2(m00C0).M59F4(mc00B2) = False Then
            l026C = ((gv14C2(m00C0).M5470 - 1) * (mc01AC * mc01AE)) + fn0B01(p0266, p0268)
            Put #gv1B58, l026C + 2, p026A
        End If
    End If
    fn0ABD = True
End Function

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
