' Module9
Option Explicit
Declare Function extfn19CA Lib "MMSYSTEM" Alias "mciSendCommand" (ByVal p1%, ByVal p2%, p3 As type, ByVal p4&) As Long ' 2
Declare Function extfn197E Lib "MMSYSTEM" Alias "midiOutGetVolume" (ByVal p1%, p2&) As Integer ' 1
Declare Function extfn19BA Lib "MMSYSTEM" Alias "midiOutReset" (ByVal p1%) As Integer ' 1
Declare Function extfn196A Lib "MMSYSTEM" Alias "midiOutSetVolume" (ByVal p1%, ByVal p2&) As Integer ' 1
Declare Function extfn19A6 Lib "MMSYSTEM" Alias "waveOutGetVolume" (ByVal p1%, ByVal p2 As Any) As Integer ' 1
Declare Function extfn1992 Lib "MMSYSTEM" Alias "waveOutSetVolume" (ByVal p1%, ByVal p2&) As Integer ' 1
Dim m00C4 As Integer ' 61
Const mc00C6 = 1 ' &H1%
Const mc00C8 = 2 ' &H2%
Dim m00EE As Integer ' 61
Const mc0104 = 1 ' &H1%
Const mc0134 = 4 ' &H4%
Const mc0136 = 1 ' &H1%
Const mc0138 = 2 ' &H2%
Const mc014A = 2 ' &H2%
Const mc014C = 1 ' &H1%
Const mc014E = 9 ' &H9%
Const mc0176 = 1 ' &H1%
Const mc018A = 526 ' &H20E%
Const mc01A4 = 1 ' &H1%
Const mc01A6 = 2 ' &H2%

Sub sub1A31 (p00F0 As Integer ' 41, p00F2 As Integer ' 41)
Dim l00F8 As Integer ' 81
Dim l00FA As Integer ' 81
' Const mc0104 = 1 ' &H1%
    If  fn034F(gv19E8 + gc1C78 + gv20CA(p00F0)) = False Then
        gv20FE(p00F0).M7208 = False
        gv20FE(p00F0).M5467 = False
        gv20FE(p00F0).M4EE6 = False
        If  gv1B52 = True Then
            sub04FC "Error 'file not found' playing " + gv19E8 + gc1C78 + gv20CA(p00F0) + "!"
        End If
        Exit Sub
    End If
    If  gv20FE(p00F0).M7208 = False Then
        If  UBound(gv2130) = 7 Then
            sub1A3F
        Else
            ReDim Preserve gv2130(UBound(gv2130) + 1)               As Integer
        End If
        l00F8 = UBound(gv2130)
        gv20FE(p00F0).M7208 = extfn1DDF(gv20C8, gv19E8 + gc1C78 + gv20CA(p00F0), 0, mc0104)
        gv2130(l00F8) = p00F0
        If  p00F2 = mc00C8 Then
            gv20FE(p00F0).M4EE6 = Timer
            gv20FE(p00F0).M5467 = fn19F4()
        Else
            gv20FE(p00F0).M4EE6 = False
        End If
    End If
    l00FA = True
    If  p00F2 = m00C4 Then
        gv20FE(p00F0).M5467 = gv2162
    Else
        If  p00F2 = mc00C8 Then
            If  gv20FE(p00F0).M4EE6 > False Then
                If  gv20FE(p00F0).M4EE6 + 5 > Timer Then
                    l00FA = False
                End If
            End If
        End If
        If  (p00F2 = mc00C8 And l00FA = True) Or p00F2 = mc00C6 Then
            gv20FE(p00F0).M5467 = fn19F4()
            If  p00F2 = mc00C8 Then
                gv20FE(p00F0).M4EE6 = Timer
            End If
        End If
    End If
End Sub

Sub sub1A50 ()
Static m0112 As Integer ' 61
    If  gv1A66.M5EF1 <> False Or gv1D06 = True Then
        Exit Sub
    End If
    If  gv1B52 = False Then
        sub063F gc20A4
    Else
        If  Int(Rnd * 100) <= 25 Then
            sub063F Val(frmMain!mciMusic.Tag)
        Else
            If  gv14C2(m0112).M5470 = False Then
                sub063F gv2096
            Else
                sub063F Int(Rnd * (gc2094 - 1)) + 1
            End If
        End If
    End If
End Sub

Sub sub0CB7 (p011C As Integer ' 41)
    If  gv1A66.M5EFC = True Then
        Exit Sub
    End If
    Select Case gv14F6(p011C).M4ED4
        Case 0, 14, 15, 16
            sub09DE gc2042
        Case 2, 6, 11
            sub09DE gc2040
        Case 3, 7, 12, 13
            Select Case gv14F6(p011C).M5A1B
                Case 18
                    sub09DE gc207C
                Case Else
                    sub09DE gc2044
            End Select
        Case 8
            sub09DE gc2070
        Case 9
            sub09DE gc2084
        Case Else
            sub09DE gc200A
    End Select
End Sub

Sub sub0E99 (p0126 As Integer ' 41)
    If  gv1A66.M5EFC = True Then
        Exit Sub
    End If
    Select Case gv14F6(p0126).M4ED4
        Case 2, 3, 4, 7
            sub09DE gc2072
        Case Else
    End Select
    sub09DE gc204A
End Sub

Sub sub09DE (p0128 ' 40)
Dim l012C As Integer ' 81
Dim l0130 As T7DD6 ' 8A
Dim l0132 As Long ' 82
' Const mc0134 = 4 ' &H4%
' Const mc0136 = 1 ' &H1%
' Const mc0138 = 2 ' &H2%
    If  gv1A66.M5EFC <> False Then
        Exit Sub
    End If
    sub1A31 p0128, mc00C8
    If  gv20FE(p0128).M7208 = False Then
        Exit Sub
    End If
    l0130.M7DE7 = Len(l0130)
    l0130.M7DF0 = gv20C8
    l0130.M7DFF = gv20FE(p0128).M5467
    l0130.M7E0B = gv20FE(p0128).M7208
    l0130.M7E18 = 0
    l0130.M7E26 = mc0134 And mc0136
    l0130.M7E31 = 0
    If  gv219A <> False Then
        l012C = extfn19A6(0, l0132)
        If  l0132 <> gv219A Then
            l012C = extfn1992(0, gv219A)
        End If
    Else
        l012C = extfn19A6(0, gv219A)
    End If
    extsub05E7
    l012C = extfn1E17(gv20C8, gv20FE(p0128).M5467, mc0138)
    l012C = extfn1E08(l0130)
    extsub05E7
End Sub

Sub sub1005 (p013E As Integer ' 41)
Static m0148 As Integer ' 61
' Const mc014A = 2 ' &H2%
' Const mc014C = 1 ' &H1%
' Const mc014E = 9 ' &H9%
    If  gv1A66.M5EFC <> False Then
        Exit Sub
    End If
    Select Case gv152A(p013E).M5709
        Case m0148
            sub09DE gc203C
        Case mc014A
            sub09DE gc2046
        Case mc014C
            sub09DE gc2058
        Case mc014E
            sub09DE gc205C
        Case Else
            sub09DE gc200C
    End Select
    Select Case gv152A(p013E).M5709
        Case m0148, mc014A, mc014C
            If  gv152A(p013E).M4E82 >= 7 Then
                sub09DE gc205A
            End If
        Case Else
    End Select
End Sub

Sub sub086D (p0150 ' 40)
Dim l0154 As Integer ' 81
Dim l0158 As T7DD6 ' 8A
Dim l015A As Long ' 82
    If  gv1A66.M5EFC <> False Then
        Exit Sub
    End If
    sub1A31 p0150, mc00C6
    If  gv20FE(p0150).M7208 = False Then
        Exit Sub
    End If
    l0158.M7DE7 = Len(l0158)
    l0158.M7DF0 = gv20C8
    l0158.M7DFF = gv20FE(p0150).M5467
    l0158.M7E0B = gv20FE(p0150).M7208
    l0158.M7E18 = 0
    l0158.M7E26 = mc0134 And mc0136
    l0158.M7E31 = 0
    If  gv219A <> False Then
        l0154 = extfn19A6(0, l015A)
        If  l015A <> gv219A Then
            l0154 = extfn1992(0, gv219A)
        End If
    Else
        l0154 = extfn19A6(0, gv219A)
    End If
    extsub05E7
    l0154 = extfn1E08(l0158)
    extsub05E7
End Sub

Sub sub08D1 (p015C ' 40)
Dim l0160 As Integer ' 81
Dim l0164 As T7DD6 ' 8A
Static m0166 As Integer ' 61
    If  gv1A66.M5EFC <> False Then
        Exit Sub
    End If
    sub1A31 p015C, m00C4
    l0164.M7DE7 = Len(l0164)
    l0164.M7DF0 = gv20C8
    l0164.M7DFF = gv20FE(p015C).M5467
    l0164.M7E0B = gv20FE(p015C).M7208
    l0164.M7E18 = 0
    l0164.M7E26 = m0166
    l0164.M7E31 = 0
    l0160 = extfn1E08(l0164)
    extsub05E7
End Sub

Sub sub1A3F ()
Dim l0168 ' 80
Dim l016A As Integer ' 81
    If  gv20FE(gv2130(1)).M7208 <> False Then
        l016A = extfn1E45(gv20C8, gv20FE(gv2130(1)).M7208)
        gv20FE(gv2130(1)).M7208 = False
        gv20FE(gv2130(1)).M4EE6 = False
    End If
    For l0168 = 1 To 6
        gv2130(l0168) = gv2130(l0168 + 1)
    Next l0168
End Sub

Sub sub064E (p016E As Long ' 42)
Dim l0170 As Integer ' 81
    l0170 = extfn196A(-1, p016E)
End Sub

Sub sub0618 ()
Dim l0172 ' 80
Dim l0174 As Integer ' 81
' Const mc0176 = 1 ' &H1%
    On Error GoTo L5372E
    If  gv20C8 <> False Then
        l0174 = extfn1E2E(gv20C8, 0, mc0176)
        For l0172 = 0 To gc2002 - 1
            If  gv20FE(l0172).M7208 <> False Then
                gv20FE(l0172).M7208 = extfn1E45(gv20C8, gv20FE(l0172).M7208)
            End If
        Next l0172
        l0174 = extfn1E58(gv20C8)
    End If

L53720:
    Exit Sub

L5372E:
    MsgBox "Error '" + Error + "' occurred in MUSIC:mdrDeInitializeFX"
    Resume L53720
End Sub

Function fn19DC () As Integer ' 1
    On Error GoTo L53804
    frmMain!mciMusic.Command = "Stop"
    frmMain!mciMusic.Command = "Close"
    frmMain!mciMusic.Tag = ""
    fn19DC = True
    Exit Function

L53804:
    Resume L53810
L53810:
End Function

Sub sub062D ()
Dim l017E As String ' 87
Dim l0182 As Integer ' 81
Dim l0184 As Long ' 82
Dim l0186 As Long ' 82
Dim l0188 As Long ' 82
' Const mc018A = 526 ' &H20E%
    On Error GoTo L53A8A
    If  frmMain!mciMusic.Mode <> mc018A Then
        Exit Sub
    End If
    l0186 = gv2196 And &HFFFF&
    l0188 = frmMain!mciMusic.Position
    Do
        If  frmMain!mciMusic.Mode <> mc018A Then
            Exit Do
        End If
        If  frmMain!mciMusic.Position = frmMain!mciMusic.Length Or frmMain!mciMusic.Position = False Then
            Exit Do
        End If
        If  l0188 <> frmMain!mciMusic.Position Then
            l0186 = l0186 - 7500
            If  l0186 < 7500 Or frmMain!mciMusic.Mode <> mc018A Then
                Exit Do
            End If
            l017E = Hex(l0186)
            If  Len(l017E) < 4 Then
                l017E = String(4 - Len(l017E), "0") + l017E
            End If
            l0184 = CLng("&H" + l017E + l017E)
            l0182 = extfn196A(-1, l0184)
            l0188 = frmMain!mciMusic.Position
        End If
    Loop
    l0186 = extfn19CA(frmMain!mciMusic.DeviceID, gc1FFC, gv1FFE, 0&)
    Exit Sub

L53A1A:
    sub04FC "Error '" + Error + "' occurred in MUSIC:mdrFadeOutMIDI."
    m00EE = False
    Resume L53A8A
L53A8A:
End Sub

Function fn19F4 () As Integer ' 1
Dim l018E ' 80
Dim l0190 As Integer ' 81
Dim l0192 As Integer ' 81
    Do
        l0192 = False
        gv2162 = gv2162 + 1
        If  gv2162 > 7 Then
            gv2162 = 1
        End If
        If  l0190 > 7 Then
            Exit Do
        End If
        For l018E = 1 To UBound(gv2130)
            If  gv20FE(gv2130(l018E)).M4EE6 > False And gv20FE(gv2130(l018E)).M5467 = gv2162 Then
                If  (gv20FE(gv2130(l018E)).M4EE6 + 5) > Timer Then
                    l0192 = True
                Else
                    gv20FE(gv2130(l018E)).M4EE6 = False
                End If
                Exit For
            End If
        Next l018E
        l0190 = l0190 + 1
    Loop While l0192 = True
    fn19F4 = gv2162
End Function

Function fn1A08 () As Integer ' 1
Dim l0198 As T7EB7 ' 8A
Dim l019A As Integer ' 81
' Const mc01A4 = 1 ' &H1%
' Const mc01A6 = 2 ' &H2%
    If  fn03BD(frmWelcome) Then
        frmWelcome!lblLoading.Caption = "Initializing Sound FX..."
    End If
    l0198.M7DE7 = Len(l0198)
    l0198.M7E26 = mc01A4 Or mc01A6
    l0198.M7EC4 = 1
    l0198.M7ED1 = 22
    gv20C8 = extfn1DB4(l0198)
    If  gv20C8 = False Then
        Exit Function
    End If
    l019A = extfn1DF2(gv20C8, 0, mc0176)
    If  (l019A) Then
        gv1A66.M5EFC = gc20A6
        Exit Function
    End If
    l019A = extfn1DCC(gv20C8, True)
    fn1A08 = True
End Function

Sub sub170B ()
    ReDim gv2164(gc2094 - 1)            As String
    If  gv1A66.M5F39 = True Then
        gv2164(gv2096) = "CITYSC.MID"
        gv2164(gc2098) = "MAINSC.MID"
        gv2164(gc209C) = "INTROSC.MID"
        gv2164(gc209A) = "DUNGEOSC.MID"
        gv2164(gc209E) = "GENERASC.MID"
        gv2164(gc20A0) = "GEN2SC.MID"
        gv2164(gc20A2) = "GEN3SC.MID"
        gv2164(gc20A4) = "THEMESC.MID"
    Else
        gv2164(gv2096) = "CITY.MID"
        gv2164(gc2098) = "MAIN.MID"
        gv2164(gc209C) = "INTRO.MID"
        gv2164(gc209A) = "DUNGEON.MID"
        gv2164(gc209E) = "GENERAL.MID"
        gv2164(gc20A0) = "GEN2.MID"
        gv2164(gc20A2) = "GEN3.MID"
        gv2164(gc20A4) = "THEME.MID"
    End If
End Sub

Function fn1A1B () As Integer ' 1
    On Error GoTo L53F44
    fn1A1B = True
    Exit Function
L53F44:
    Resume L53F50
L53F50:
End Function

Sub sub063F (p01B2 As Integer ' 41)
Dim l01B4 As Integer ' 81
    If  gv1A66.M5EF1 <> False Or m00EE = True Then
        Exit Sub
    End If
    If  Val(frmMain!mciMusic.Tag) = p01B2 Then
        Exit Sub
    End If
    If  frmMain!mciMusic.Mode = mc018A Then
        sub062D
    End If
    frmMain!mciMusic.Command = "Close"
    frmMain!mciMusic.Notify = False
    frmMain!mciMusic.Wait = False
    frmMain!mciMusic.Shareable = False
    frmMain!mciMusic.DeviceType = ""
    If  fn034F(gv19E8 + gc1C78 + gv2164(p01B2)) = False Then
        If  gv1B52 = True Then
            sub04FC "Error finding " + gv19E8 + gc1C78 + gv2164(p01B2) + "!"
        End If
        Exit Sub
    End If
    frmMain!mciMusic.FileName = gv19E8 + gc1C78 + gv2164(p01B2)
    frmMain!mciMusic.Tag = CStr(p01B2)
    l01B4 = extfn19BA(frmMain!mciMusic.DeviceID)
    frmMain!mciMusic.Command = "Open"
    frmMain!mciMusic.Command = "Play"
    DoEvents
    If  gv219E = -1 Then
        l01B4 = extfn197E(-1, gv219E)
    End If
    If  gv2196 <> False Then
        l01B4 = extfn196A(-1, gv2196)
    Else
        l01B4 = extfn197E(-1, gv2196)
    End If
End Sub

Sub sub0D35 (p01B6 As Integer ' 41)
' Const mc01B8 = 277 ' &H115%
    If  gv1A66.M5EFC = True Then
        Exit Sub
    End If
    If  gv14F6(p01B6).M5467 = mc01B8 Then
        sub09DE gc208C
    Else
        Select Case gv14F6(p01B6).M4ED4
            Case 0, 14
                sub09DE gc2022
            Case 1, 4
                sub09DE gc2020
            Case 2
                sub09DE gc2076
            Case 3
                sub09DE gc2026
            Case 5
                sub09DE gc2028
            Case 6
                sub09DE gc2078
            Case 7
                Select Case gv14F6(p01B6).M5A1B
                    Case 18
                        sub09DE gc207A
                    Case Else
                        sub09DE gc2024
                End Select
            Case 8
                sub09DE gc201E
            Case 9
                sub09DE gc202A
            Case 10
                sub09DE gc202C
            Case 11
                sub09DE gc202E
            Case 12
                sub09DE gc2030
            Case 13
                sub09DE gc2032
            Case 15
                sub09DE gc2034
            Case 16
                sub09DE gc2036
            Case 17
                sub09DE gc208E
            Case Else
        End Select
    End If
End Sub
