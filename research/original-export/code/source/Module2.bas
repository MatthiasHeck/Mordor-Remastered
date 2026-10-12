' Module2
Option Explicit
Const mc002A = 18 ' &H12%
Const mc002C = 16 ' &H10%
Const mc002E = 17 ' &H11%
Const mc0048 = 128 ' &H80%
Const mc004E = 10 ' &HA%
Const mc0052 = 16 ' &H10%
Const mc0056 = 16 ' &H10%
Const mc0058 =-1 ' &HFFFF%
Const mc0064 = 2900 ' &HB54%
Const mc0066 = 48 ' &H30%
Const m0070 = 0 ' &H0%
Const mc0072 = 40 ' &H28%
Const mc0074 = 1 ' &H1%
Const mc0076 = 6 ' &H6%
Const mc0078 = 2 ' &H2%
Const mc007A = 10 ' &HA%
Const mc007C = 10 ' &HA%
Const mc0080 = 1 ' &H1%
Const mc0086 = 4 ' &H4%
Const mc0088 = 11 ' &HB%
Const mc00CE =-2 ' &HFFFE%
Const mc0118 = 15 ' &HF%
Const mc011A = 30 ' &H1E%
Const mc011C = 30 ' &H1E%
Const mc0162 = 45 ' &H2D%
Const mc0166 = 1 ' &H1%
Const mc0168 = 2 ' &H2%
Const mc016A = 3 ' &H3%
Const mc016C = 4 ' &H4%
Const mc016E = 5 ' &H5%
Const mc0170 = 6 ' &H6%
Const mc0172 = 7 ' &H7%
Const mc0174 = 8 ' &H8%
Const mc0176 = 9 ' &H9%
Const mc0178 = 10 ' &HA%
Const mc017A = 11 ' &HB%
Const mc017C = 12 ' &HC%
Const mc0190 = 100 ' &H64%
Const mc0194 = 4 ' &H4%
Const mc01B2 = 28 ' &H1C%
Const mc01B8 = 20 ' &H14%
Const mc01C0 = 200 ' &HC8%
Const mc01D6 = 11 ' &HB%
Const mc01DC = 3 ' &H3%
Const mc01E6 = 2 ' &H2%
Const mc0200 = "MORDOR.TST"
Const mc0208 = 32 ' &H20%
Const mc020A = 4 ' &H4%
Const mc020C = 7 ' &H7%
Const mc0212 = 64 ' &H40%
Const mc0226 = 112 ' &H70%
Const mc0228 = 121 ' &H79%
Const mc022A = 38 ' &H26%
Const mc022C = 37 ' &H25%
Const mc022E = 39 ' &H27%
Const mc0230 = 40 ' &H28%
Const mc0232 = 13 ' &HD%
Const mc0234 = 27 ' &H1B%
Const mc0236 = 9 ' &H9%
Const mc0238 = 190 ' &HBE%
Const mc023A = 1 ' &H1%
Const mc023C = 188 ' &HBC%
Const mc023E = 2 ' &H2%
Const mc0240 = 4 ' &H4%
Const mc0262 = 9 ' &H9%
Const mc0266 = 8 ' &H8%
Const mc0298 = 9 ' &H9%
Const m029E = 0 ' &H0%
Const mc02A0 = 3 ' &H3%
Const mc02A2 = 4 ' &H4%
Const mc02E2 = 20 ' &H14%
Const m02EC = 0 ' &H0%
Const mc02F2 = 10 ' &HA%
Const mc02F4 = 13 ' &HD%
Const mc0332 = 32 ' &H20%
Const mc0336 = 33 ' &H21%
Const mc0338 = 4 ' &H4%
Const mc0366 = 20 ' &H14%
Const mc0368 = 800 ' &H320%
Const mc036A = 600 ' &H258%

Sub sub0456 (p0026 As Integer ' 41, p0028 As Integer ' 41)
' Const mc002A = 18 ' &H12%
' Const mc002C = 16 ' &H10%
' Const mc002E = 17 ' &H11%
    Select Case p0026
        Case mc002A, mc002C, mc002E
        Case Else
            gv1CC6 = gv1CC6 + 1
            ReDim Preserve gv1CCA(gv1CC6 - 1)      As T6536
            gv1CCA(gv1CC6 - 1).M6541 = p0026
            gv1CCA(gv1CC6 - 1).M654C = p0028
    End Select
End Sub

Sub sub046B ()
Dim l0030 ' 80
Dim l0032 ' 80
Dim l0036 As Integer ' 81
Dim l0038 As Integer ' 81
Dim l003A As Integer ' 81
Dim l003C As String ' 87
Dim l003E As String ' 87
Dim l0040 As String ' 87
' Const mc0048 = 128 ' &H80%
' Const mc004E = 10 ' &HA%
' Const mc0052 = 16 ' &H10%
' Const mc0056 = 16 ' &H10%
' Const mc0058 =-1 ' &HFFFF%
' Const mc0064 = 2900 ' &HB54%
' Const mc0066 = 48 ' &H30%
' Const m0070 = 0 ' &H0%
' Const mc0072 = 40 ' &H28%
' Const mc0074 = 1 ' &H1%
' Const mc0076 = 6 ' &H6%
' Const mc0078 = 2 ' &H2%
' Const mc007A = 10 ' &HA%
' Const mc007C = 10 ' &HA%
' Const mc0080 = 1 ' &H1%
' Const mc0086 = 4 ' &H4%
' Const mc0088 = 11 ' &HB%
    On Error GoTo L64C2
    l003A = FreeFile
    Open gv19E8 + gc1C74 + gc1C1C For Random Shared As #l003A Len = mc0048
        l0040$ = gc0186
        Put #l003A, 1, l0040$
    Close #l003A
    l003A = FreeFile
    Open gv19E8 + gc1C74 + gc1C20 For Random Shared As #l003A Len = mc004E
        l0040$ = gc0186
        Put #l003A, 1, l0040$
    Close #l003A
    l003A = FreeFile
    Open gv19E8 + gc1C74 + gc1C18 For Random Shared As #l003A Len = mc0052
        l0040$ = gc0186
        Put #l003A, 1, l0040$
    Close #l003A
    l003A = FreeFile
    Open gv19E8 + gc1C74 + gc1C44 For Random Shared As #l003A Len = mc0056
        l0040$ = gc0186
        Put #l003A, 1, l0040$
    Close #l003A
    If  mc0058 = True Then
        ReDim gv14C2(0) As T5810
        l003A = FreeFile
        Open gv19E8 + gc1C74 + gc1C10 For Random As #l003A Len = mc0064
            Get #l003A, 1, l003C
            If  l003C <> gc0186 Then
                l003E = "BETA NOTICE:" + Chr$(13) + "All characters will be returned to the city and have their items unequipped because of possible "
                l003E = l003E + "changes to Game Data." + Chr$(13)
                l003E = l003E + "Remember to re-equip all of your characters items!"
                l003E = l003E + Chr(13) + Chr(13) + "Also be sure to check your spell buffers, for they may have changed as well."
                MsgBox l003E, mc0066, "NOTICE"
                frmWelcome!lblLoading.Caption = "Updating Character File..."
                l003C = gc0186
                Put #l003A, 1, l003C
                Get #l003A, 2, gv1ACC.M5FF2
                If  gv1ACC.M5FF2 > False Then
                    Get #l003A, 3, gv14C2(m0070)
                    Do While Not EOF(l003A)
                        If  Trim(gv14C2(m0070).M548B) <> "" Then
                            For l0030 = 0 To mc0072 - 1
                                If  gv14C2(m0070).M5857(l0030).M577E = mc0074 Then
                                    gv14C2(m0070).M5857(l0030).M577E = False
                                End If
                            Next l0030
                            For l0032 = 0 To mc0076 - 1
                                gv14C2(m0070).M584B(l0032) = False
                            Next l0032
                            gv14C2(0).M56B9(mc0078) = False
                            gv14C2(m0070).M4E97 = mc007A
                            gv14C2(m0070).M4EA1 = mc007C
                            sub047C gv1A84, mc0080
                            l0036 = False
                            l0038 = False
                            For l0030 = 0 To gv1BEA - 1
                                If  gv14C2(m0070).M5584(l0030).M4E97 > l0036 Then
                                    l0036 = gv14C2(m0070).M5584(l0030).M4E97
                                End If
                                If  gv14C2(m0070).M5584(l0030).M4EA1 > l0038 Then
                                    l0038 = gv14C2(m0070).M5584(l0030).M4EA1
                                End If
                            Next l0030
                            gv14C2(0).M4E97 = gv14C2(0).M4E97 + l0036
                            gv14C2(0).M4EA1 = gv14C2(0).M4EA1 + l0038
                            gv14C2(0).M5997(0) = -1
                            gv14C2(0).M5997(1) = -1
                            gv14C2(0).M5700 = False
                            For l0030 = 0 To gv1BF0 - 1
                                gv14C2(m0070).M586D(l0030) = False
                            Next l0030
                            For l0030 = 0 To gv1BEA - 1
                                gv14C2(m0070).M5584(l0030).M55CB = False
                            Next l0030
                            For l0030 = 0 To mc0086 - 1
                                If  gv14C2(m0070).M58CB(l0030).M4ED4 > -1 Then
                                    gv14C2(m0070).M58CB(l0030).M57E1 = 10
                                End If
                            Next l0030
                            gv14C2(m0070).M5997(0) = -1
                            gv14C2(m0070).M5997(1) = -1
                            gv14C2(m0070).M5470 = 0
                            gv14C2(m0070).M59BB = -1
                            For l0030 = 0 To mc0088 - 1
                                gv14C2(m0070).M5985(l0030) = 0
                                gv14C2(m0070).M592F(l0030) = 0
                            Next l0030
                            sub048C m0070
                            Put #l003A, (Seek(l003A) - 1), gv14C2(m0070)
                        End If
                        Get #l003A, , gv14C2(m0070)
                    Loop
                End If
                sub04A3
                If  fn034F(gv19E8 + gc1C74 + gc1C24) Then
                    Kill gv19E8 + gc1C74 + gc1C24
                End If
            End If
        Close #l003A
    End If
    gv14C2(m0070).M548B = " "
    Exit Sub

L64C2:
    MsgBox "Error '" + Error + "' occurred in MAINMOD:mdrBetaUpdate!", mc0066, "Error!"
    Resume L6532
L6532:
End Sub

Function fn04B9 (ByVal p0090 As String ' 47) As Integer ' 1
Dim l0092 As String ' 87
Dim l0094 As Integer ' 81
Dim l0096 As Integer ' 81
Dim l0098 ' 80
Dim l009C As T5810 ' 8A
Dim l009E As Integer ' 81
    On Error GoTo L678A
    l0096 = FreeFile
    fn04B9 = False
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l0096 Len = mc0064
    Get #l0096, 1, l0092$
    If  fn0326(l0092$) = True And l0092$ <> "" Then
        l0094% = MsgBox("The character file is stamped with Version '" + l0092$ + "'.  You will need to convert it before continuing.", 64, "Different Version")
        Close #l0096
        Exit Function
    End If
    Get #l0096, 2, gv1ACC.M5FF2
    If  gv1ACC.M5FF2 = 0 Then
        fn04B9 = False
        Close #l0096
        Exit Function
        Else
        l009E = 0
        For l0098 = 1 To gv1ACC.M5FF2
            Do
                Get #l0096, l0098 + 2 + l009E, l009C
                If  RTrim(l009C.M548B) <> "" Then
                    Exit Do
                End If
                l009E = l009E + 1
            Loop
            If  UCase$(RTrim(l009C.M548B)) = UCase$(p0090) Then
                fn04B9 = True
                Exit For
            End If
        Next l0098
    End If
    Close #l0096
    Exit Function

L678A:
    fn04B9 = False
    Resume L679E
L679E:
End Function

Function fn04CD (p00A4 As String ' 47, p00A6 As String ' 47, ByVal pv00A8 As Integer ' 81, p00AA As Integer ' 41) As Integer ' 1
Dim l00AC As String ' 87
Dim l00AE As Integer ' 81
Dim l00B0 As Integer ' 81
Dim l00B2 ' 80
Dim l00B6 As T5810 ' 8A
Dim l00B8 As Integer ' 81
Dim l00BA As Integer ' 81
' Const mc00CE =-2 ' &HFFFE%
    On Error GoTo L6B24
    l00B0 = FreeFile
    l00BA = UBound(gv14C2)
    If  pv00A8 > l00BA Then
        l00BA = pv00A8
    End If
    l00B6.M5962 = -1
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l00B0 Len = mc0064
    Get #l00B0, 1, l00AC$
    If  fn0326(l00AC$) = True And l00AC$ <> "" Then
        l00AE% = MsgBox("Old Char file!", 64, "ERROR!")
        Close #l00B0
        Exit Function
    End If
    Get #l00B0, 2, gv1ACC.M5FF2
    If  gv1ACC.M5FF2 = 0 Then
        fn04CD = False
        Close #l00B0
        Exit Function
    Else
        For l00B2 = 1 To gv1ACC.M5FF2
            Do
                Get #l00B0, l00B2 + 2 + l00B8, l00B6
                If  RTrim(l00B6.M548B) <> "" Then
                    Exit Do
                End If
                l00B8 = l00B8 + 1
            Loop
            If  UCase$(RTrim(l00B6.M548B)) = UCase$(p00A4) Then
                ReDim Preserve gv14C2(l00BA)  As T5810
                ReDim Preserve gv1AEC(l00BA)          As Integer
                ReDim Preserve gv1B1E(l00BA)          As Single
                ReDim Preserve gv1E7C(l00BA)           As Integer
                Get #l00B0, l00B2 + 2 + l00B8, gv14C2(pv00A8)
                gv14C2(pv00A8).M5962 = l00B2 + 2 + l00B8
                Exit For
            End If
        Next l00B2
    End If
    Close #l00B0
    gv1B1E(pv00A8) = False
    If  p00AA = False Then
        If  p00A6 <> RTrim(gv14C2(pv00A8).M594C) Then
            sub04DC pv00A8
            fn04CD = mc00CE
            Exit Function
        End If
    End If
    If  gv14C2(pv00A8).M5943 >= mc0086 Then
        gv14C2(pv00A8).M5943 = -1
    End If
    If  gv14C2(pv00A8).M5962 <> -1 Then
        fn04CD = True
        gv14C2(pv00A8).M5970 = fn1397(gv14C2(pv00A8))
    End If
    Exit Function

L6B24:
    fn04CD = False
    Resume L6B38
L6B38:
End Function

Function fn04ED (p00D6 As T5810 ' 4A) As Integer ' 1
Dim l00D8 As String ' 87
Dim l00DA As Integer ' 81
Dim l00DC As Integer ' 81
Dim l00DE ' 80
Dim l00E2 As T5810 ' 8A
Dim l00E4 As Integer ' 81
    On Error GoTo L6E98
    If  Trim(p00D6.M548B) = "" Then
        Exit Function
    End If
    l00DC = FreeFile
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l00DC Len = mc0064
    Get #l00DC, 1, l00D8$
    If  fn0326(l00D8$) = True And l00D8$ <> "" Then
        l00DA% = MsgBox("Old Char file!", 64, "ERROR!")
        Close #l00DC
        Exit Function
    End If
    l00D8$ = gc0186
    Put #l00DC, 1, l00D8$
    If  p00D6.M5962 = 0 Then
        Get #l00DC, 2, gv1ACC.M5FF2
        If  gv1ACC.M5FF2 = 0 Then
            Put #l00DC, 3, p00D6
            p00D6.M5962 = 3
            gv1ACC.M5FF2 = 1
            Put #l00DC, 2, gv1ACC.M5FF2
            Else
            l00E4 = 0
            For l00DE = 1 To gv1ACC.M5FF2
                Get #l00DC, l00DE + 2 + l00E4, l00E2
                If  Trim(l00E2.M548B) = "" Then
                    l00E2.M548B = p00D6.M548B
                    gv1ACC.M5FF2 = gv1ACC.M5FF2 + 1
                    Put #l00DC, 2, gv1ACC.M5FF2
                    p00D6.M5962 = l00DE + 2
                End If
                If  l00E2.M548B = p00D6.M548B Then
                    Put #l00DC, l00DE + 2 + l00E4, p00D6
                    Exit For
                End If
                If  l00DE = gv1ACC.M5FF2 Then
                    gv1ACC.M5FF2 = gv1ACC.M5FF2 + 1
                    Put #l00DC, 2, gv1ACC.M5FF2
                    Put #l00DC, l00DE + 2 + l00E4 + 1, p00D6
                    p00D6.M5962 = l00DE + 2 + l00E4 + 1
                End If
            Next l00DE
        End If
        Else
        Put #l00DC, p00D6.M5962, p00D6
    End If
    Close #l00DC
    fn04ED = True
    Exit Function

L6E98:
    fn04ED = False
    Resume L6EAC
L6EAC:
End Function

Sub sub04DC (p00E6 As Integer ' 41)
Dim l00E8 ' 80
    On Error GoTo L716C
    If  RTrim(gv14C2(p00E6).M548B) <> "" Then
        If  fn04ED(gv14C2(p00E6)) = False Then
            sub04FC "Error Saving Character in MAINMOD:mdrcharUnload!"
            Exit Sub
        End If
    End If
    gv14C2(p00E6).M548B = " "
    gv14C2(p00E6).M5962 = -1
    If  p00E6 <> UBound(gv14C2) Then
        For l00E8 = p00E6 To UBound(gv14C2) - 1
            gv14C2(l00E8) = gv14C2(l00E8 + 1)
            gv1E66(l00E8) = gv1E66(l00E8 + 1)
            gv1E7C(l00E8) = gv1E7C(l00E8 + 1)
        Next l00E8
    End If
    If  UBound(gv14C2) > False Then
        ReDim Preserve gv14C2(UBound(gv14C2) - 1) As T5810
    End If
    If  gv1A84 > UBound(gv14C2) Then
        If  fn03BD(frmParty) Then
            If  gv1A86 > UBound(gv14C2) Then
                frmParty!lblCall = CStr(UBound(gv14C2))
            Else
                frmParty!lblCall = CStr(gv1A86)
            End If
        Else
            gv1A84 = m0070
            gv1A86 = m0070
        End If
    End If
    If  gv1A86 > UBound(gv14C2) Then
        gv1A86 = UBound(gv14C2)
    End If
    If  gv1A84 > UBound(gv14C2) Then
        gv1A84 = UBound(gv14C2)
    End If
    If  fn03BD(frmInteract) Then
        frmInteract!lblCall = "UPDATE"
    End If
    Exit Sub

L716C:
    sub04FC "Error '" + Error + "' occurred in MAINMOD:mdrcharUnload!"
    Resume L71D6
L71D6:
End Sub

Sub sub050F ()
Dim l0100 As String ' 87
Static m0102 As Integer ' 61
    If  gv1B54 = True Then
        Exit Sub
    End If
    If  extfn01E6(m0102) <= 20 Then
        l0100 = "Your current system resources are at " + CStr(extfn01E6(m0102)) + "%."
        l0100 = l0100 + Chr(13) + "It's recommended that you close down any other applications that may be "
        l0100 = l0100 + "running to free up more resources."
        l0100 = l0100 + Chr(13) + Chr(13) + "If your resources drop below 5%, you may experience system failure."
        l0100 = l0100 + Chr(13) + Chr(13) + "You will not be notified of this error again."
        Beep
        MsgBox l0100, mc0066, "WARNING!"
        gv1B54 = True
    End If
End Sub

Sub sub0524 (p0108 As Form ' 49)
    If  p0108.Left > Screen.Width Then
        p0108.Left = False
    End If
    If  p0108.Top > Screen.Height Then
        p0108.Top = False
    End If
End Sub

Sub sub0536 ()
Dim l010E As Integer ' 81
Dim l0110 ' 80
Dim l0112 As String ' 87
Dim l0114 As Long ' 82
' Const mc0118 = 15 ' &HF%
' Const mc011A = 30 ' &H1E%
' Const mc011C = 30 ' &H1E%
    frmWelcome!lblLoading.Caption = "Creating AutoMap File..."
    On Error GoTo L758A
    l0112 = gc0186
    gv1B58 = FreeFile
    Open gv19E8 + gc1C74 + gc1C20 For Random As #gv1B58 Len = mc004E
    l0114 = False
    l010E = 1
    Put #gv1B58, 1, l0112
    Put #gv1B58, 2, l010E
    For l010E = 1 To mc0118
        For l0110 = 0 To (mc011A * mc011C)
            Put #gv1B58, , l0114
        Next l0110
    Next l010E
    Close #gv1B58
    gv1B58 = False
    Exit Sub

L758A:
    MsgBox "Error '" + Error + "' occurred creating AutoMap File!", mc0066, "Error!"
    End
End Sub

Sub sub054E ()
Dim l0126 As Integer ' 81
Dim l0128 As Integer ' 81
Dim l012C As String ' 87
    frmWelcome!lblLoading.Caption = "Creating Companion Store File..."
    On Error GoTo L7908
    ReDim gv162E(0) As T5755
    l0128 = FreeFile
    Open gv19E8 + gc1C74 + gc1C44 For Random As #l0128 Len = mc0056
    ReDim gv162E(gv1BF6 - 1)     As T5755
    l012C = gc0186
    Put #l0128, 1, l012C
    Put #l0128, 2, gv19E2
    l0126 = gv1BF6
    Put #l0128, 3, l0126
    For l0126 = 0 To gv1BF6 - 1
        Select Case l0126
            Case gv1DD2(0, 0), gv1DD2(0, 0) + 1, gv1DD2(7, 0), gv1DD2(7, 0) + 1, gv1DD2(8, 0), gv1DD2(8, 0) + 1, gv1DD2(14, 0), gv1DD2(14, 0) + 1, gv1DD2(1, 0), gv1DD2(9, 0)
                gv162E(l0126).M5766 = l0126
                gv162E(l0126).M5467 = gv14F6(l0126).M5467
                gv162E(l0126).M5557(0) = 0
                gv162E(l0126).M5557(1) = 0
                gv162E(l0126).M5557(2) = 0
                gv162E(l0126).M5557(3) = 0
                gv162E(l0126).M5557(gv14F6(l0126).M4EBF) = 2
            Case Else
                gv162E(l0126).M5766 = 0
                gv162E(l0126).M5467 = 0
                gv162E(l0126).M5557(0) = 0
        End Select
        Put #l0128, l0126 + 4, gv162E(l0126)
    Next l0126
    Close #l0128
    Exit Sub

L7908:
    Resume L7914
L7914:
End Sub

Sub sub0565 (p013E As Integer ' 41)
Dim l0140 As String ' 87
Dim l0142 As Integer ' 81
Dim l0144 ' 80
Dim l0146 As Long ' 82
    frmWelcome!lblLoading.Caption = "Creating GM File..."
    If  p013E = False Then
        ReDim gv16CA(gv1BEA - 1)   As T564C
    End If
    If  gv16CA(0).M548B = "" Then
        gv16CA(0).M548B = "Crashland"
        gv16CA(0).M4E82 = 64
        l0146 = fn0418(0, l0146, True)
    End If
    If  gv16CA(1).M548B = "" Then
        gv16CA(1).M548B = "Garth SliceMonger"
        gv16CA(1).M4E82 = 56
        l0146 = fn0418(1, l0146, True)
    End If
    If  gv16CA(2).M548B = "" Then
        gv16CA(2).M548B = "Eli"
        gv16CA(2).M4E82 = 62
        l0146 = fn0418(2, l0146, True)
    End If
    If  gv16CA(3).M548B = "" Then
        gv16CA(3).M548B = "Shogun"
        gv16CA(3).M4E82 = 48
        l0146 = fn0418(3, l0146, True)
    End If
    If  gv16CA(4).M548B = "" Then
        gv16CA(4).M548B = "Maxx"
        gv16CA(4).M4E82 = 67
        l0146 = fn0418(4, l0146, True)
    End If
    If  gv16CA(5).M548B = "" Then
        gv16CA(5).M548B = "Martin"
        gv16CA(5).M4E82 = 77
        l0146 = fn0418(5, l0146, True)
    End If
    If  gv16CA(6).M548B = "" Then
        gv16CA(6).M548B = "Nimblefingers"
        gv16CA(6).M4E82 = 56
        l0146 = fn0418(6, l0146, True)
    End If
    If  gv16CA(7).M548B = "" Then
        gv16CA(7).M548B = "Kane the Wise Axe"
        gv16CA(7).M4E82 = 54
        l0146 = fn0418(7, l0146, True)
    End If
    If  gv16CA(8).M548B = "" Then
        gv16CA(8).M548B = "Sparrowhawk"
        gv16CA(8).M4E82 = 52
        l0146 = fn0418(8, l0146, True)
    End If
    If  gv16CA(9).M548B = "" Then
        gv16CA(9).M548B = "Requnix"
        gv16CA(9).M4E82 = 61
        l0146 = fn0418(9, l0146, True)
    End If
    If  gv16CA(10).M548B = "" Then
        gv16CA(10).M548B = "Merlin"
        gv16CA(10).M4E82 = 48
        l0146 = fn0418(10, l0146, True)
    End If
    If  gv16CA(11).M548B = "" Then
        gv16CA(11).M548B = "Hands on Henry"
        gv16CA(11).M4E82 = 65
        l0146 = fn0418(11, l0146, True)
    End If
    l0142 = FreeFile
    Open fn0360(gv19E8) + gc1C74 + gc1C1C For Random As #l0142 Len = mc0048
    l0140 = gc0186
    Put #l0142, 1, l0140
    For l0144 = 0 To gv1BEA - 1
        If  fn0380(l0144, l0146) = True Then
            Put #l0142, , gv16CA(l0144)
            sub0578 l0144, Chr$(34) + RTrim(gv16CA(l0144).M548B) + Chr$(34) + " was appointed GuildMaster."
        End If
    Next l0144
    Close #l0142
End Sub

Sub sub0595 ()
Dim l0156 As String ' 87
Dim l015A As Integer ' 81
Dim l015E As T73E9 ' 8A
' Const mc0162 = 45 ' &H2D%
Static m0164 As Integer ' 61
' Const mc0166 = 1 ' &H1%
' Const mc0168 = 2 ' &H2%
' Const mc016A = 3 ' &H3%
' Const mc016C = 4 ' &H4%
' Const mc016E = 5 ' &H5%
' Const mc0170 = 6 ' &H6%
' Const mc0172 = 7 ' &H7%
' Const mc0174 = 8 ' &H8%
' Const mc0176 = 9 ' &H9%
' Const mc0178 = 10 ' &HA%
' Const mc017A = 11 ' &HB%
' Const mc017C = 12 ' &HC%
    frmWelcome!lblLoading.Caption = "Creating Hall File..."
    On Error GoTo L8424
    If  fn034F(gv19E8 + gc1C74 + gc1C40) Then
        Kill gv19E8 + gc1C74 + gc1C40
    End If
    l015A = FreeFile
    Open gv19E8 + gc1C74 + gc1C40 For Random As #l015A Len = mc0162
    l0156 = gc0186
    Put #l015A, 1, l0156
    l015E.M7406 = 0
    l015E.M73F5 = 14
    l015E.M73FE = "Crashland"
    Put #l015A, m0164 + 1, l015E
    l015E.M73F5 = 15
    l015E.M73FE = "Mager"
    Put #l015A, mc0166 + 1, l015E
    l015E.M73F5 = 18
    l015E.M73FE = "Theshal"
    Put #l015A, mc0168 + 1, l015E
    l015E.M73F5 = 14
    l015E.M73FE = "Orgal"
    Put #l015A, mc016A + 1, l015E
    l015E.M73F5 = 15
    l015E.M73FE = "Alaya"
    Put #l015A, mc016C + 1, l015E
    l015E.M73F5 = 17
    l015E.M73FE = "Nimblefingers"
    Put #l015A, mc016E + 1, l015E
    l015E.M73F5 = 1
    l015E.M73FE = "Crashland"
    Put #l015A, mc0170 + 1, l015E
    l015E.M73F5 = 1322451&
    l015E.M73FE = "Crashland"
    Put #l015A, mc0172 + 1, l015E
    l015E.M73F5 = 5466453&
    l015E.M73FE = "Nimblefingers"
    Put #l015A, mc0174 + 1, l015E
    l015E.M73F5 = 17
    l015E.M73FE = "Morgul"
    Put #l015A, mc0176 + 1, l015E
    l015E.M73F5 = 6
    l015E.M73FE = "Ge'nal"
    Put #l015A, mc0178 + 1, l015E
    l015E.M73F5 = 15
    l015E.M73FE = "Nimblefingers"
    Put #l015A, mc017A + 1, l015E
    l015E.M73F5 = 0
    l015E.M73FE = "Nothing"
    Put #l015A, mc017C + 1, l015E
    Close #l015A
    Exit Sub

L8424:
    Resume L8430
L8430:
End Sub

Sub sub05AA ()
Dim l017E ' 80
Dim l0180 As Integer ' 81
Dim l0182 As Integer ' 81
Dim l0184 As String ' 87
Dim l0186 As Integer ' 81
Dim l0188 As Integer ' 81
Dim l018C As T5BF1 ' 8A
' Const mc0190 = 100 ' &H64%
' Const mc0194 = 4 ' &H4%
    frmWelcome!lblLoading.Caption = "Creating Library File..."
    On Error GoTo L8936
    If  fn034F(gv19E8 + gc1C74 + gc1C3C) Then
        Kill gv19E8 + gc1C74 + gc1C3C
    End If
    l0182 = FreeFile
    Open gv19E8 + gc1C74 + gc1C3C For Random As #l0182 Len = mc0190
    l0184 = gc0186
    Put #l0182, 1, l0184
    l0180 = gv1BF6
    Put #l0182, , l0180
    l0180 = gv1BEC
    Put #l0182, , l0180
    l0180 = False
    Put #l0182, , l0180
    Put #l0182, , l0180
    For l017E = False To gv1BF6 - 1
        Select Case l017E
            Case gv1DD2(0, 0) + 5, gv1DD2(0, 0) + 1, gv1DD2(7, 0), gv1DD2(7, 0) + 1, gv1DD2(8, 0), gv1DD2(8, 0) + 1, gv1DD2(14, 0), gv1DD2(14, 0) + 1, gv1DD2(1, 0), gv1DD2(9, 0)
                l0186 = l0186 + 1
                l018C.M5467 = gv14F6(l017E).M5467
                l018C.M4EEE = mc0194
                l018C.M5C09 = ""
                l018C.M5C00 = Int(Rnd * 5) + 1
                l018C.M5C21 = CLng(Date) - (Int(Rnd * 5) + 2)
                l018C.M5C2F = "?"
                l018C.M5C3D = False
            Case Else
                l018C.M4EEE = False
                l018C.M5C09 = ""
                l018C.M5C00 = 0
                l018C.M5C21 = 0
                l018C.M5C2F = ""
                l018C.M5C3D = 0
        End Select
        Put #l0182, , l018C
    Next l017E
    For l017E = False To gv1BEC - 1
        If  gv1426(l017E).M5693 = 1 And gv1426(l017E).M5686 <= 200000& And gv1426(l017E).M572A = False Then
            l0188 = l0188 + 1
            l018C.M5467 = gv1426(l017E).M5467
            l018C.M4EEE = mc0194
            l018C.M5C09 = ""
            l018C.M5C21 = CLng(Date) - (Int(Rnd * 5) + 2)
            l018C.M5C2F = "1"
            l018C.M5C14 = -1
            l018C.M5C00 = 1
        Else
            l018C.M4EEE = False
            l018C.M5C00 = 0
            l018C.M5C09 = ""
            l018C.M5C14 = -1
            l018C.M5C21 = 0
            l018C.M5C2F = ""
            l018C.M5C3D = 0
        End If
        Put #l0182, , l018C
    Next l017E
    Put #l0182, 4, l0186
    Put #l0182, 5, l0188
    Close #l0182
    Exit Sub

L8936:
    MsgBox "Error '" + Error$ + "' Creating Library File.  Is Path in MORDOR.INI correct?" + Chr$(13) + "Aborting.", mc0066, "Error!"
    End
End Sub

Sub sub04A3 ()
Dim l01A0 As T4E8B ' 8A
Dim l01A4 As T4F0B ' 8A
Dim l01A6 As Integer ' 81
Dim l01AA ' 80
Dim l01AC ' 80
Dim l01AE As Integer ' 81
' Const mc01B2 = 28 ' &H1C%
' Const mc01B8 = 20 ' &H14%
' Const mc01C0 = 200 ' &HC8%
    frmWelcome!lblLoading.Caption = "Creating Maze Reference File..."
    On Error GoTo L8BE8
    If  fn034F(gv19E8 + gc1C74 + gc1C30) Then
        Kill gv19E8 + gc1C74 + gc1C30
    End If
    l01A6 = FreeFile
    Open gv19E8 + gc1C74 + gc1C30 For Random As #l01A6 Len = mc01B2
    l01AE = mc0118
    Put #l01A6, 1, l01AE
    If  gv1B56 = False Then
        gv1B56 = FreeFile
        Open gv19E8 + gc1C74 + gc1C34 For Random As #gv1B56 Len = mc01B8
    End If
    For l01AA = 1 To mc0118
        Get #gv1B56, l01AA + 1, gv1D6E
        Get #gv1B56, gv1D6E, gv1864
        Put #l01A6, , gv1864.M5CF4
    Next l01AA
    Close gv1B56
    gv1B56 = False
    For l01AA = 1 To mc0118
        For l01AC = 1 To mc01C0
            Put #l01A6, , l01A0
            Put #l01A6, , l01A0
            Put #l01A6, , l01A0
            Put #l01A6, , l01A0
            Put #l01A6, , l01A4
        Next l01AC
    Next l01AA
    Close #l01A6
    Exit Sub

L8BE8:
    MsgBox "Error '" + Error$ + "' Creating Maze Files.  Is Path in MORDOR.INI correct?" + Chr$(13) + "Aborting.", mc0066, "Error!"
    End
End Sub

Sub sub05C2 ()
Dim l01CA As Integer ' 81
Dim l01CC As Integer ' 81
Dim l01CE As String ' 87
    frmWelcome!lblLoading.Caption = "Creating Store File..."
    On Error GoTo L9114
    ReDim gv15FA(0) As T5755
    l01CC = FreeFile
    Open gv19E8 + gc1C74 + gc1C18 For Random As #l01CC Len = mc0052
    ReDim gv15FA(gv1BEC - 1)  As T5755
    l01CE = gc0186
    Put #l01CC, 1, l01CE
    Put #l01CC, 2, gv19E0
    l01CA = gv1BEC
    Put #l01CC, 3, l01CA
    For l01CA = 0 To gv1BEC - 1
        Select Case gv1426(l01CA).M5467
            Case 356 To 361
                gv15FA(l01CA).M5766 = l01CA
                gv15FA(l01CA).M5467 = gv1426(l01CA).M5467
                Select Case gv1426(l01CA).M5467
                    Case 358
                        gv15FA(l01CA).M5557(0) = 0
                        gv15FA(l01CA).M5557(1) = 1
                        gv15FA(l01CA).M5557(2) = 0
                        gv15FA(l01CA).M5557(3) = 0
                    Case 359
                        gv15FA(l01CA).M5557(0) = 0
                        gv15FA(l01CA).M5557(1) = 0
                        gv15FA(l01CA).M5557(2) = 0
                        gv15FA(l01CA).M5557(3) = 1
                    Case Else
                        gv15FA(l01CA).M5557(0) = 0
                        gv15FA(l01CA).M5557(1) = 0
                        gv15FA(l01CA).M5557(2) = 1
                        gv15FA(l01CA).M5557(3) = 0
                End Select
            Case Else
                If  gv1426(l01CA).M5693 > 1 Or gv1426(l01CA).M5686 > 200000& Or gv1426(l01CA).M5686 = 0 Or gv1426(l01CA).M572A <> False Then
                    gv15FA(l01CA).M5766 = 0
                    gv15FA(l01CA).M5467 = 0
                    gv15FA(l01CA).M5557(0) = 0
                Else
                    gv15FA(l01CA).M5766 = l01CA
                    gv15FA(l01CA).M5467 = gv1426(l01CA).M5467
                    If  gv1426(l01CA).M5557 > 1 Then
                        gv15FA(l01CA).M5557(0) = 0
                        gv15FA(l01CA).M5557(1) = 1
                        gv15FA(l01CA).M5557(2) = 1
                        gv15FA(l01CA).M5557(3) = 1
                    Else
                        If  gv1426(l01CA).M5693 = False Then
                            gv15FA(l01CA).M5557(0) = 99
                        Else
                            gv15FA(l01CA).M5557(0) = 5
                        End If
                    End If
                End If
        End Select
        Put #l01CC, l01CA + 4, gv15FA(l01CA)
    Next l01CA
    Close #l01CC
    Exit Sub

L9114:
    Resume L9120
L9120:
End Sub

Sub sub05D8 ()
    extsub05E7
    DoEvents
End Sub

Sub sub05F6 ()
Dim l01D4 As Integer ' 81
' Const mc01D6 = 11 ' &HB%
' Const mc01DC = 3 ' &H3%
' Const mc01E6 = 2 ' &H2%
    On Error GoTo L925C
    gv1D06 = True
    Screen.MousePointer = mc01D6
    sub0607
    sub0618
    sub062D
    frmMain!mciMusic.Command = "Stop"
    sub063F mc01DC
    sub064E gv219E
    l01D4 = fn19DC()
    l01D4 = extfn012C(frmMain.hWnd, App.HelpFile, mc01E6, 0)
    Do
        DoEvents
        If  Forms.Count = 1 Then Exit Do
        Unload Forms(1)
    Loop Until Forms.Count = 1

L9246:
    Close
    End
    Exit Sub
L925C:
    MsgBox "Error '" + Error + "' occurred in MAINMOD:mdrEndProgram!"
    Resume L9246
End Sub

Function fn0662 (p01F0 As Integer ' 41, p01F2 ' 40) As Integer ' 1
Dim l01F6 As Integer ' 81
Dim l01F8 As Integer ' 81
Dim l01FA As Long ' 82
Dim l01FC As String ' 87
Dim l01FE As String ' 87
' Const mc0200 = "MORDOR.TST"
' Const mc0208 = 32 ' &H20%
' Const mc020A = 4 ' &H4%
' Const mc020C = 7 ' &H7%
' Const mc0212 = 64 ' &H40%
    On Error GoTo L9E5A
    l01FC = UCase(fn0360(p01F2))
    If  l01FC = fn0360(gv19E8) Or l01FC = fn0360(fn0360(gv19E8) + gc1C74) Then
        MsgBox "You cannot backup or restore from the Base Mordor directory or the Mordor Data directory!"
        Exit Function
    End If
    Close
    l01F8 = FreeFile
    If  p01F0 Then
        l01FA = 0
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C10)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C18)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C1C)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C20)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C24)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C30)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C38)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C3C)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C40)
        l01FA = l01FA + fn0679(fn0360(gv19E8) + gc1C74 + gc1C44)
        ChDrive Left(l01FC, 2)
        If  l01FA > extfn00B0() Then
            MsgBox "There is not enough free space on " + Left(l01FC, 2) + " to backup the current data files." + Chr(13) + "Select another drive or make room for more files."
            Exit Function
        End If
        If  fn034F(l01FC + gc1C10) Then
            If  MsgBox("Backup files already exist in " + UCase(Left(l01FC, Len(l01FC) - 1)) + "." + Chr(13) + "Overwrite?", mc0208 & mc020A, "Overwrite Files?") = mc020C Then Exit Function
        Else
            If  MsgBox("Backup files to " + UCase(Left(l01FC, Len(l01FC) - 1)) + "?", mc0208 & mc020A, "Backup Files?") = mc020C Then Exit Function
        End If
        l01F6 = True
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C10, l01FC + gc1C10
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C18, l01FC + gc1C18
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C1C, l01FC + gc1C1C
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C20, l01FC + gc1C20
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C24, l01FC + gc1C24
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C30, l01FC + gc1C30
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C38, l01FC + gc1C38
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C3C, l01FC + gc1C3C
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C40, l01FC + gc1C40
        FileCopy fn0360(gv19E8) + gc1C74 + gc1C44, l01FC + gc1C44
        l01F6 = False
    Else
        If  fn034F(l01FC + gc1C10) = False Then
            MsgBox "Backup files not found in " + UCase(Left(l01FC, Len(l01FC) - 1)) + "!", mc0066, "Restore Files"
            Exit Function
        End If
        l01FE = "WARNING!" + Chr(13) + Chr(13) + "Restoring these backup files from '" + UCase(Left(l01FC, Len(l01FC) - 1)) + "' will overwrite your current game files.  Are you sure you wish to proceed?"
        If  MsgBox(l01FE, mc0208 & mc020A, "Overwrite Files?") = mc020C Then Exit Function
        l01F6 = True
        FileCopy l01FC + gc1C10, fn0360(gv19E8) + gc1C74 + gc1C10
        FileCopy l01FC + gc1C18, fn0360(gv19E8) + gc1C74 + gc1C18
        FileCopy l01FC + gc1C1C, fn0360(gv19E8) + gc1C74 + gc1C1C
        FileCopy l01FC + gc1C20, fn0360(gv19E8) + gc1C74 + gc1C20
        FileCopy l01FC + gc1C24, fn0360(gv19E8) + gc1C74 + gc1C24
        FileCopy l01FC + gc1C30, fn0360(gv19E8) + gc1C74 + gc1C30
        FileCopy l01FC + gc1C38, fn0360(gv19E8) + gc1C74 + gc1C38
        FileCopy l01FC + gc1C3C, fn0360(gv19E8) + gc1C74 + gc1C3C
        FileCopy l01FC + gc1C40, fn0360(gv19E8) + gc1C74 + gc1C40
        FileCopy l01FC + gc1C44, fn0360(gv19E8) + gc1C74 + gc1C44
        l01F6 = False
    End If
    If  p01F0 Then
        l01FE = "Backup"
    Else
        l01FE = "Restore"
    End If
    l01F6 = extfn0184("Loading Information", "LastBackup", Date, fn0360$(gv19E4) + "MORDOR.INI")
    MsgBox l01FE + " of Game files successful!", mc0212, l01FE + " Game Files"
    fn0662 = True

L9E4C:
    Exit Function

L9E5A:
    If  l01F6 Then
        Resume Next
    Else
        MsgBox "Error '" + Error + "' occurred while attempting to Backup/Restore Game Files.", mc0066, "Error!"
        Resume L9E4C
    End If
End Function

Function fn0679 (ByVal p0216 As String ' 47) As Long ' 2
Dim l0218 As Integer ' 81
    On Error Resume Next
    l0218 = FreeFile
    Open p0216 For Binary As #l0218
    fn0679 = LOF(l0218)
    Close #l0218
End Function

Sub sub068A (p021A As Single ' 43)
Dim l021C As Single ' 83
    l021C! = Timer
    Do: extsub05E7: Loop While Abs(Timer - l021C!) < p021A
End Sub

Sub sub0695 ()
Dim l021E As String ' 87
Dim l0220 ' 80
Dim l0222 As Integer ' 81
Dim l0224 As Integer ' 81
' Const mc0226 = 112 ' &H70%
' Const mc0228 = 121 ' &H79%
' Const mc022A = 38 ' &H26%
' Const mc022C = 37 ' &H25%
' Const mc022E = 39 ' &H27%
' Const mc0230 = 40 ' &H28%
' Const mc0232 = 13 ' &HD%
' Const mc0234 = 27 ' &H1B%
' Const mc0236 = 9 ' &H9%
' Const mc0238 = 190 ' &HBE%
' Const mc023A = 1 ' &H1%
' Const mc023C = 188 ' &HBC%
' Const mc023E = 2 ' &H2%
' Const mc0240 = 4 ' &H4%
    On Error GoTo LA4C6
    If  gv1CC6 < 1 Then
        gv1CC6 = False
        Exit Sub
    End If
    l0224 = gv1CCA(0).M6541
    l0222 = gv1CCA(0).M654C
    If  l0224 = False And l0222 = False Then Exit Sub
    gv1D02 = True
    Select Case gv1CCA(0).M6541
        Case mc0226 To mc0228
            l021E = "{F" + LTrim$(Str$(gv1CCA(0).M6541 - 111)) + "}"
        Case mc022A
            l021E = "{UP}"
        Case mc022C
            l021E = "{LEFT}"
        Case mc022E
            l021E = "{RIGHT}"
        Case mc0230
            l021E = "{DOWN}"
        Case mc0232
            l021E = "{ENTER}"
        Case mc0234
            l021E = "{ESC}"
        Case mc0236
            l021E = "{TAB}"
        Case mc002C, mc002E, mc002A
            l021E = ""
        Case mc0238
            If  l0222 = mc023A Then
                l021E = ">"
            End If
        Case mc023C
            If  l0222 = mc023A Then
                l021E = "<"
            Else
                l021E = ","
            End If
        Case Else
            Select Case l0224
                Case 65 To 90
                    If  l0222 = 1 Then
                        l021E = Chr$(gv1CCA(0).M6541)
                    Else
                        l021E = Chr$(gv1CCA(0).M6541 + 32)
                    End If
                Case Else
                    l021E = Chr$(gv1CCA(0).M6541)
            End Select
    End Select
    If  l021E <> "" Then
        Select Case l0222
            Case mc023A
                l021E = "+(" + l021E + ")"
            Case mc023E
                l021E = "^(" + l021E + ")"
            Case mc0240
                l021E = "%(" + l021E + ")"
            Case Else
        End Select
    End If
    If  l0224 = mc0236 And l0222 = mc0240 Then
        l021E = "%({TAB})"
    End If
    gv1CC6 = gv1CC6 - 1
    If  gv1CC6 > 0 Then
        For l0220 = 1 To gv1CC6
            gv1CCA(l0220 - 1).M6541 = gv1CCA(l0220).M6541
            gv1CCA(l0220 - 1).M654C = gv1CCA(l0220).M654C
        Next l0220
        ReDim Preserve gv1CCA(gv1CC6 - 1)      As T6536
    Else
        gv1CC6 = False
        ReDim Preserve gv1CCA(0)   As T6536
    End If
    If  l021E <> "" Then
        gv1CFE.M6541 = l0224
        gv1CFE.M654C = l0222
        SendKeys l021E
    End If
    gv1D02 = False
    Exit Sub

LA4C6:
    Resume LA4D2
LA4D2:
End Sub

Sub sub06A9 ()
    Unload frmMain
    End
End Sub

Sub sub06B4 ()
Dim l0242 As Integer ' 81
Dim l0246 As String ' 87
Dim l0252 As Integer ' 81
Dim l0254 As String ' 87
Dim l0256 ' 80
' Const mc0262 = 9 ' &H9%
' Const mc0266 = 8 ' &H8%
    On Error GoTo LB1B2
    If  fn034F(gv19E8 + gc1C74 + gc1C20) = False Then
        sub0536
    End If
    If  fn034F(gv19E8 + gc1C74 + gc1C30) = False Then
        sub04A3
    End If
    If  fn034F(gv19E8 + gc1C74 + gc1C40) = False Then
        sub0595
    End If
    If  fn03D0(gc1C04) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C04 + "!" + Chr$(13) + "Is BasePath in MORDOR.INI correct?", 64, "ERROR!")
        End
    End If
    If  fn034F(gv19E8 + gc1C74 + gc1C1C) = False Then
        sub0565 False
    End If
    If  fn03D0(gc1C0C) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C0C + "!" + Chr$(13) + "Is BasePath in MORDOR.INI correct?", 64, "ERROR!")
        End
    End If
    sub06C6
    If  fn034F(gv19E8 + gc1C74 + gc1C18) = False Then
        sub05C2
    End If
    If  fn03D0(gc1C14) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C14 + "!", 64, "ERROR!")
        End
    End If
    sub06D7
    If  fn034F(gv19E8 + gc1C74 + gc1C44) = False Then
        sub054E
    End If
    If  fn03D0(gc1C08) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C08 + "!", 64, "ERROR!")
        End
    End If
    If  fn034F(gv19E8 + gc1C74 + gc1C10) = False Then
        l0252 = FreeFile
        Open gv19E8 + gc1C74 + gc1C10 For Random As #l0252 Len = mc0064
        l0254$ = gc0186
        Put #l0252, 1, l0254$
        Put #l0252, 2, l0256
        Close #l0252
    End If
    sub046B
    If  fn03D0(gc1C18) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C18 + "!", 64, "ERROR!")
        End
    End If
    If  fn03D0(gc1C44) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C44 + "!", 64, "ERROR!")
        End
    End If
    If  fn03D0(gc1C1C) = False Then
        l0242 = MsgBox("Error reading " + gv19E8 + gc1C74 + gc1C1C + "!", 64, "ERROR!")
        End
    End If
    App.HelpFile = gv19E8 + gc1C50
    If  fn034F(gv19E8 + gc1C74 + gc1C34) = False Then
        l0242 = MsgBox("Maze File (MDATA11.MDR) not found.  Please re-install.", 48, "ERROR!")
        End
    End If
    If  fn034F(gv19E8 + gc1C74 + gc1C3C) = False Then
        sub05AA
    End If
    If  fn1C2E() = False Then
        MsgBox "Error opening Library File.", mc0066, "Error!"
    End If
    gv1ADC.M41D4 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Fonts", "Pro")
    gv1ADC.M41E5 = fn0403(fn0360(gv19E4) + "MORDOR.INI", "Fonts", "ProSize", mc0262)
    gv1ADC.M41DB = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Fonts", "NonPro")
    gv1ADC.M41F0 = fn0403(fn0360(gv19E4) + "MORDOR.INI", "Fonts", "NonProSize", mc0266)
    If  gv1ADC.M41D4 = "" Then
        l0242 = extfn0184("Fonts", "Pro", gc0562, fn0360$(gv19E4) + "MORDOR.INI")
        l0242 = extfn0184("Fonts", "ProSize", CStr(mc0262), fn0360$(gv19E4) + "MORDOR.INI")
        gv1ADC.M41D4 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Fonts", "Pro")
    End If
    If  gv1ADC.M41DB = "" Then
        l0242 = extfn0184("Fonts", "NonPro", gc0566, fn0360$(gv19E4) + "MORDOR.INI")
        l0242 = extfn0184("Fonts", "NonProSize", CStr(mc0266), fn0360$(gv19E4) + "MORDOR.INI")
        gv1ADC.M41DB = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Fonts", "NonPro")
    End If
    l0246 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "Character")
    If  l0246 <> "" Then
        If  fn04CD(l0246, "", m0070, True) = False Then
            gv14C2(m0070).M548B = " "
            gv14C2(m0070).M5962 = -1
        End If
    End If
    Exit Sub

LB1B2:
    MsgBox "Error '" + Error + "' occurred in MAINMOD:mdrReadAllData", mc0066, "Error!"
    Resume LB222
LB222:
End Sub

Sub sub06E8 (p026C As Integer ' 41)
Dim l026E As Integer ' 81
Dim l0270 ' 80
Dim l0272 ' 80
Dim l0274 As Integer ' 81
Dim l0276 As Single ' 83
Dim l0278 As Single ' 83
Dim l027A As Integer ' 81
Dim l027C As Integer ' 81
Dim l027E As Integer ' 81
Dim l0280 As Integer ' 81
Dim l0282 ' 80
Dim l0284 As Single ' 83
Dim l0286 As Integer ' 81
Dim l0288 As Integer ' 81
Dim l028A As Integer ' 81
Dim l028C As Integer ' 81
Dim l028E() As Integer ' 91
' Const mc0298 = 9 ' &H9%
Dim l029C As T4E8B ' 8A
' Const m029E = 0 ' &H0%
' Const mc02A0 = 3 ' &H3%
' Const mc02A2 = 4 ' &H4%
    ReDim l028E(gv1BF6)               As Integer
    On Error GoTo LBD14
    l026E = fn09F6()
    Get #gv1B58, 2, l0282
    If  l0282 >= mc0118 - 1 Then
        l0282 = mc0118 - 1
    End If
    Do
        l0284 = (p026C / 100) * 100
        If  l0284 > 50 Then l0284 = 50
        If  l0284 < 1 Then l0284 = 1
        If  (Rnd * 100) > l0284 Then
            Exit Do
        End If
        l028A = False
        If  (Rnd * 100) < 60 Then
            l0286 = True
        Else
            l0286 = False
        End If
        l0280 = False
        l0274 = Int(Rnd * 100) + 1
        For l0270 = 1 To l0282
            If  l0274 < 100 - ((l0270 / (l0282 + 1)) * 100) Then
                l0280 = l0270
            Else
                Exit For
            End If
        Next l0270
        If  l0280 < 1 Then l0280 = 1
        If  l0280 > l0282 Then l0280 = l0282
        If  l0286 Then
            Do
                l027E = (Rnd * gv1BF2)
                l028A = False
                l027A = False
                For l0270 = False To gv1BF6 - 1
                    If  gv14F6(l0270).M4ED4 = l027E And gv14F6(l0270).M5693 <= l0280 Then
                        l027A = l0270
                        Exit For
                    End If
                Next l0270
                If  l027A <> False Then
                    For l0270 = l027A To gv1BF6 - 1
                        If  gv14F6(l0270).M5693 > l0280 Or gv14F6(l0270).M4ED4 <> l027E Then
                            l027C = l0270 - 1
                            Exit For
                        End If
                    Next l0270
                    If  l027C < l027A Then
                        l027C = l027A
                    End If
                    l0284 = False
                    For l0270 = l027A To l027C
                        l0284 = l0284 + gv14F6(l0270).M56A0
                    Next l0270
                    For l0270 = l027A To l027C
                        If  gv14F6(l0270).M56A0 > 0 Then
                            l028E(l0270) = (gv14F6(l0270).M56A0 / l0284) * 100
                        Else
                            l028E(l0270) = 0
                        End If
                    Next l0270
                    l0276 = Rnd * 100
                    l0278 = False
                    For l0272 = l027A To l027C
                        l0278 = l0278 + l028E(l0272)
                        If  l0276 <= l0278 Then
                            l028A = l0272
                            Exit For
                        End If
                    Next l0272
                    If  l028A > False Then
                        If  gv14F6(l028A).M5693 > False Then
                            If  gv162E(l028A).M5557(l0288) < mc0298 Then
                                gv162E(l028A).M5557(gv14F6(l028A).M4EBF) = gv162E(l028A).M5557(gv14F6(l028A).M4EBF) + 1
                                gv162E(l028A).M5766 = l028A
                                gv162E(l028A).M5467 = gv14F6(l028A).M5467
                                l029C.M4ED4 = -l028A
                                l029C.M4F01 = l028A
                                l029C.M4EEE = m029E
                                sub06FE l029C, False, True, True, m0070
                            End If
                        Else
                            l028A = False
                        End If
                    End If
                End If
            Loop While l028A = False
        Else
            l028C = False
            Do
                l028C = l028C + 1
                l027E = (Rnd * gv1BF2)
                l028A = False
                l027A = False
                For l0270 = False To gv1BF6 - 1
                    If  gv14F6(l0270).M4ED4 = l027E And gv14F6(l0270).M5693 <= l0280 Then
                        l027A = l0270
                        Exit For
                    End If
                Next l0270
                If  l027A <> False Then
                    For l0270 = l027A To gv1BF6 - 1
                        If  gv14F6(l0270).M5693 > l0280 Or gv14F6(l0270).M4ED4 <> l027E Then
                            l027C = l0270 - 1
                            Exit For
                        End If
                    Next l0270
                    If  l027C < l027A Then
                        l027C = l027A
                    End If
                    l0284 = False
                    For l0270 = l027A To l027C
                        l0284 = l0284 + gv14F6(l0270).M56A0
                    Next l0270
                    For l0270 = l027A To l027C
                        If  gv14F6(l0270).M56A0 > 0 Then
                            l028E(l0270) = (gv14F6(l0270).M56A0 / l0284) * 100
                        Else
                            l028E(l0270) = 0
                        End If
                    Next l0270
                    l0276 = Rnd * 100
                    l0278 = False
                    For l0272 = l027A To l027C
                        l0278 = l0278 + l028E(l0272)
                        If  l0276 <= l0278 Then
                            l028A = l0272
                            Exit For
                        End If
                    Next l0272
                    If  l028A > False Then
                        If  gv14F6(l028A).M5693 > False Then
                            l0288 = False
                            l026E = False
                            For l0272 = False To mc02A0
                                If  gv162E(l028A).M5557(l0288) > False Then
                                    l026E = True
                                    Exit For
                                End If
                            Next l0272
                            If  l026E = True Then
                                Do
                                    l0288 = Int(Rnd * (mc02A0 + 1))
                                Loop While gv162E(l028A).M5557(l0288) = False
                                gv162E(l028A).M5557(l0288) = gv162E(l028A).M5557(l0288) - 1
                                l026E = False
                                For l0270 = 0 To mc02A2 - 1
                                    If  gv162E(l028A).M5557(l0270) > False Then
                                        l026E = True
                                        Exit For
                                    End If
                                Next l0270
                                If  l026E = False Then
                                    gv162E(l028A).M5766 = 0
                                    gv162E(l028A).M5467 = False
                                End If
                            Else
                                l028A = False
                            End If
                        Else
                            l028A = False
                        End If
                    End If
                End If
            Loop While l028C < 100 And l028A = False
        End If
    Loop
    If  fn0425(gc1C44) = False Then
        l026E = MsgBox("Error saving store file in MAINMOD:mdrReplenishCStore!" + Chr(13) + "Continuing...", mc0066, "ERROR!")
    End If
    Exit Sub

LBD14:
    sub04FC "Error '" + Error + "' occurred in MAINMOD:mdrReplenishCStore."
    Resume LBD82
LBD82:
End Sub

Sub sub071B (p02A6 As Integer ' 41)
Dim l02A8 As Integer ' 81
Dim l02AA ' 80
Dim l02AC ' 80
Dim l02AE As Integer ' 81
Dim l02B0 As Single ' 83
Dim l02B2 As Single ' 83
Dim l02B4 As Integer ' 81
Dim l02B6 As Integer ' 81
Dim l02B8 As Integer ' 81
Dim l02BA As Integer ' 81
Dim l02BC ' 80
Dim l02BE As Single ' 83
Dim l02C0 As Integer ' 81
Dim l02C2 As Integer ' 81
Dim l02C4 As Integer ' 81
Dim l02C6 As Integer ' 81
Dim l02C8() As Integer ' 91
    ReDim l02C8(gv1BEC)             As Integer
    On Error GoTo LC8CC
    l02A8 = fn09F6()
    Get #gv1B58, 2, l02BC
    If  l02BC >= mc0118 - 1 Then
        l02BC = mc0118 - 1
    End If
    Do
        l02BE = (p02A6 / 100) * 100
        If  l02BE > 50 Then l02BE = 50
        If  l02BE < 1 Then l02BE = 1
        If  (Rnd * 100) > l02BE Then
            Exit Do
        End If
        l02C4 = False
        If  (Rnd * 100) < 60 Then
            l02C0 = True
        Else
            l02C0 = False
        End If
        l02BA = False
        l02AE = Int(Rnd * 100) + 1
        For l02AA = 1 To l02BC
            If  l02AE < 100 - ((l02AA / (l02BC + 1)) * 100) Then
                l02BA = l02AA
            Else
                Exit For
            End If
        Next l02AA
        If  l02BA < 1 Then l02BA = 1
        If  l02BA > l02BC Then l02BA = l02BC
        If  l02C0 Then
            Do
                l02B8 = (Rnd * gv1BEE)
                l02C4 = False
                l02B4 = False
                For l02AA = False To gv1BEC - 1
                    If  gv1426(l02AA).M5709 = l02B8 And gv1426(l02AA).M5693 <= l02BA Then
                        l02B4 = l02AA
                        Exit For
                    End If
                Next l02AA
                If  l02B4 <> False Then
                    For l02AA = l02B4 To gv1BEC - 1
                        If  gv1426(l02AA).M5693 > l02BA Or gv1426(l02AA).M5709 <> l02B8 Then
                            l02B6 = l02AA - 1
                            Exit For
                        End If
                    Next l02AA
                    If  l02B6 < l02B4 Then
                        l02B6 = l02B4
                    End If
                    l02BE = False
                    For l02AA = l02B4 To l02B6
                        l02BE = l02BE + gv1426(l02AA).M56A0
                    Next l02AA
                    For l02AA = l02B4 To l02B6
                        If  gv1426(l02AA).M56A0 > 0 Then
                            l02C8(l02AA) = ((gv1426(l02AA).M56A0 / l02BE) * 100)
                        Else
                            l02C8(l02AA) = 0
                        End If
                    Next l02AA
                    l02B0 = Rnd * 100
                    l02B2 = False
                    For l02AC = l02B4 To l02B6
                        l02B2 = l02B2 + l02C8(l02AC)
                        If  l02B0 <= l02B2 Then
                            l02C4 = l02AC
                            Exit For
                        End If
                    Next l02AC
                    If  l02C4 > False Then
                        If  gv1426(l02C4).M572A = False And gv1426(l02C4).M5693 > False Then
                            l02C2 = False
                            If  gv1426(l02C4).M5557 > 1 Then
                                Do
                                    l02C2 = Int(Rnd * (mc02A0 + 1))
                                Loop While fn0380(l02C2, gv1426(l02C4).M5557) = False
                            End If
                            If  gv15FA(l02C4).M5557(l02C2) < mc0298 Then
                                gv15FA(l02C4).M5557(l02C2) = gv15FA(l02C4).M5557(l02C2) + 1
                                gv15FA(l02C4).M5766 = l02C4
                                gv15FA(l02C4).M5467 = gv1426(l02C4).M5467
                                sub0730 m0070, -l02C4, m029E, -2, True
                            End If
                        Else
                            l02C4 = False
                        End If
                    End If
                End If
            Loop While l02C4 = False
        Else
            l02C6 = False
            Do
                l02C6 = l02C6 + 1
                l02B8 = (Rnd * gv1BEE)
                l02C4 = False
                l02B4 = False
                For l02AA = False To gv1BEC - 1
                    If  gv1426(l02AA).M5709 = l02B8 And gv1426(l02AA).M5693 <= l02BA Then
                        l02B4 = l02AA
                        Exit For
                    End If
                Next l02AA
                If  l02B4 <> False Then
                    For l02AA = l02B4 To gv1BEC - 1
                        If  gv1426(l02AA).M5693 > l02BA Or gv1426(l02AA).M5709 <> l02B8 Then
                            l02B6 = l02AA - 1
                            Exit For
                        End If
                    Next l02AA
                    If  l02B6 < l02B4 Then
                        l02B6 = l02B4
                    End If
                    l02BE = False
                    For l02AA = l02B4 To l02B6
                        l02BE = l02BE + gv1426(l02AA).M56A0
                    Next l02AA
                    For l02AA = l02B4 To l02B6
                        If  gv1426(l02AA).M56A0 > 0 Then
                            l02C8(l02AA) = ((gv1426(l02AA).M56A0 / l02BE) * 100)
                        Else
                            l02C8(l02AA) = 0
                        End If
                    Next l02AA
                    l02B0 = Rnd * 100
                    l02B2 = False
                    For l02AC = l02B4 To l02B6
                        l02B2 = l02B2 + l02C8(l02AC)
                        If  l02B0 <= l02B2 Then
                            l02C4 = l02AC
                            Exit For
                        End If
                    Next l02AC
                    If  l02C4 > False Then
                        If  gv1426(l02C4).M572A = False And gv1426(l02C4).M5693 > False Then
                            l02C2 = False
                            l02A8 = False
                            For l02AC = False To mc02A0
                                If  gv15FA(l02C4).M5557(l02C2) > False Then
                                    l02A8 = True
                                    Exit For
                                End If
                            Next l02AC
                            If  l02A8 = True Then
                                Do
                                    l02C2 = Int(Rnd * (mc02A0 + 1))
                                Loop While gv15FA(l02C4).M5557(l02C2) = False
                                gv15FA(l02C4).M5557(l02C2) = gv15FA(l02C4).M5557(l02C2) - 1
                                l02A8 = False
                                For l02AA = 0 To mc02A2 - 1
                                    If  gv15FA(l02C4).M5557(l02AA) > False Then
                                        l02A8 = True
                                        Exit For
                                    End If
                                Next l02AA
                                If  l02A8 = False Then
                                    gv15FA(l02C4).M5766 = 0
                                    gv15FA(l02C4).M5467 = False
                                End If
                            Else
                                l02C4 = False
                            End If
                        Else
                            l02C4 = False
                        End If
                    End If
                End If
            Loop While l02C6 < 100 And l02C4 = False
        End If
    Loop
    If  fn0425(gc1C18) = False Then
        l02A8 = MsgBox("Error saving store file in MAINMOD:mdrReplenishStore!" + Chr(13) + "Continuing...", mc0066, "ERROR!")
    End If
    Exit Sub

LC8CC:
    sub04FC "Error '" + Error + "' occurred in MAINMOD:mdrReplenishStore."
    Resume LC93A
LC93A:
End Sub

Sub sub074E (p02D0 As String ' 47)
' called (ByVal p1$, p2%)
Dim l02D4 ' 80
Dim l02D6 ' 80
Dim l02D8 As Integer ' 81
Dim l02DA As Integer ' 81
Dim l02DC As Integer ' 81
Dim l02E0 As Form ' 89
' Const mc02E2 = 20 ' &H14%
' Const m02EC = 0 ' &H0%
Static m02EE As Integer ' 61
' Const mc02F2 = 10 ' &HA%
' Const mc02F4 = 13 ' &HD%
    On Error GoTo LCC62
    l02D8 = -1
    Screen.MousePointer = mc01D6
    l02DA = False
    For l02D4 = 0 To Forms.Count - 1
        If  Forms(l02D4).Caption = p02D0 Then
            Set l02E0 = Forms(l02D4)
            For l02D6 = 0 To mc02E2 - 1
                If  Forms(l02D4).hWnd = gv19C2(l02D6).M5E47 Then
                    l02D8 = l02D6
                    Exit For
                End If
            Next l02D6
            Exit For
        End If
    Next l02D4
    If  l02D8 = -1 Then
        Screen.MousePointer = m02EC
        Exit Sub
    End If
    If  l02E0.Width <> gv19C2(l02D8).M5E20 Or l02E0.Height <> gv19C2(l02D8).M5E2D Then
        l02DC = True
    End If
    If  l02DC Then
        If  l02E0.WindowState <> m02EE Then l02E0.WindowState = m02EE
        gv14C2(gv1A82).M5958(l02D8).M4216 = gv19C2(l02D8).M5E20
        gv14C2(gv1A82).M5958(l02D8).M420C = gv19C2(l02D8).M5E2D
        Select Case l02D8
            Case mc02F2, mc02F4
                l02E0.Tag = "RESIZE"
            Case Else
                gv19C2(l02D8).M4216 = gv19C2(l02D8).M5E20
                gv19C2(l02D8).M420C = gv19C2(l02D8).M5E2D
        End Select
        l02E0.Width = gv19C2(l02D8).M5E20
        Select Case l02D8
            Case mc02F2, mc02F4
                l02E0.Tag = ""
            Case Else
        End Select
        l02E0.Height = gv19C2(l02D8).M5E2D
    End If
    Set l02E0 = Nothing
    Screen.MousePointer = m02EC
    Exit Sub

LCC62:
    Screen.MousePointer = m02EC
    Resume LCC7E
LCC7E:
End Sub

Sub sub0760 (p02F8 As Form ' 49, p02FC As T5E14 ' 4A)
Dim l02FE As Variant ' 86
Dim l0302 As Integer ' 81
Dim l0304 As String ' 87
Dim l0306 As Integer ' 81
Dim l0308 As Integer ' 81
Dim l030A As Single ' 83
Dim l030C As Single ' 83
    On Error GoTo LD4CE
    If  p02FC.M4216 = False Or p02FC.M420C = False Or p02F8.WindowState = 1 Then
        Exit Sub
    End If
    If  p02FC.M5E20 = p02F8.Width And p02FC.M5E2D = p02F8.Height Then
    End If
    l030A = p02F8.Width / p02FC.M4216
    l030C = p02F8.Height / p02FC.M420C
    l0308 = p02F8.Visible
    If  p02F8.Controls.Count = False Then
        If  Left(CStr(p02F8.Tag), 1) <> ":" Then
            If  p02F8.FontName = gv1ADC.M41D4 Then
                p02F8.FontSize = gv1ADC.M41E5 * (p02F8.Width / p02FC.M5E20)
            Else
                p02F8.FontSize = gv1ADC.M41F0 * (p02F8.Width / p02FC.M5E20)
            End If
        Else
            If  Left$(CStr(p02F8.Tag), 1) = ":" Then
                p02F8.FontSize = CDbl(Right$(CStr(p02F8.Tag), Len(CStr(p02F8.Tag)) - 1)) * l030A
            End If
        End If
        Exit Sub
    End If
    For l02FE = 0 To p02F8.Controls.Count - 1
        l0302 = False
        If  l0308 = True Then
            l0302 = p02F8.Controls(l02FE).Visible
            p02F8.Controls(l02FE).Visible = False
        End If
        If  TypeOf p02F8.Controls(l02FE) Is Line Then
            p02F8.Controls(l02FE).X1 = p02F8.Controls(l02FE).X1 * l030A
            p02F8.Controls(l02FE).X2 = p02F8.Controls(l02FE).X2 * l030A
            p02F8.Controls(l02FE).Y1 = p02F8.Controls(l02FE).Y1 * l030C
            p02F8.Controls(l02FE).Y2 = p02F8.Controls(l02FE).Y2 * l030C
        Else
            p02F8.Controls(l02FE).Left = Int(p02F8.Controls(l02FE).Left * l030A)
            p02F8.Controls(l02FE).Width = Int(p02F8.Controls(l02FE).Width * l030A)
            p02F8.Controls(l02FE).Top = Int(p02F8.Controls(l02FE).Top * l030C)
            If  TypeOf p02F8.Controls(l02FE) Is ComboBox Then
            ElseIf TypeOf p02F8.Controls(l02FE) Is DriveListBox Then
            Else
                p02F8.Controls(l02FE).Height = Int(p02F8.Controls(l02FE).Height * l030C)
            End If
            If  TypeOf p02F8.Controls(l02FE) Is DriveListBox Then
            Else
                l0304 = p02F8.Controls(l02FE).FontName
                l0306 = p02F8.Controls(l02FE).FontSize
                If  Left(CStr(p02F8.Controls(l02FE).Tag), 1) <> ":" Then
                    If  l0304 = gv1ADC.M41D4 Then
                        p02F8.Controls(l02FE).FontSize = gv1ADC.M41E5 * (p02F8.Width / p02FC.M5E20)
                    Else
                        p02F8.Controls(l02FE).FontSize = gv1ADC.M41F0 * (p02F8.Width / p02FC.M5E20)
                    End If
                    p02F8.Controls(l02FE).FontName = l0304
                    If  l0304 = gv1ADC.M41D4 Then
                        p02F8.Controls(l02FE).FontSize = gv1ADC.M41E5 * (p02F8.Width / p02FC.M5E20)
                    Else
                        p02F8.Controls(l02FE).FontSize = gv1ADC.M41F0 * (p02F8.Width / p02FC.M5E20)
                    End If
                Else
                    If  Left(CStr(p02F8.Controls(l02FE).Tag), 1) = ":" Then
                        p02F8.Controls(l02FE).FontSize = CDbl(Right$(CStr(p02F8.Controls(l02FE).Tag), Len(CStr(p02F8.Controls(l02FE).Tag)) - 1)) * l030A
                        p02F8.Controls(l02FE).FontName = l0304
                        p02F8.Controls(l02FE).FontSize = CDbl(Right$(CStr(p02F8.Controls(l02FE).Tag), Len(CStr(p02F8.Controls(l02FE).Tag)) - 1)) * l030A
                    End If
                End If
            End If
        End If
        If  p02F8.Controls(l02FE).Tag = "INVIS" Then
            p02F8.Controls(l02FE).Visible = False
        Else
            If  extfn0137(p02F8.Controls(l02FE).hWnd) <> p02F8.hWnd Then
                If  p02F8 Is frmCharStat3 Or p02F8 Is frmCharStat1 Then
                    p02F8.Controls(l02FE).Visible = True
                Else
                    If  l0308 = True Then
                        p02F8.Controls(l02FE).Visible = l0302
                    End If
                End If
            Else
                If  l0308 = True Then
                    p02F8.Controls(l02FE).Visible = l0302
                End If
            End If
        End If
    Next l02FE
    p02FC.M420C = p02F8.Height
    p02FC.M4216 = p02F8.Width
    Exit Sub

LD4CE:
    Resume Next
End Sub

Sub sub0775 ()
    On Error GoTo LD50E
    gv1BFC.SetFocus
    Exit Sub

LD50E:
    Resume LD51A
LD51A:
End Sub

Sub sub0784 (p031E As Form ' 49)
Dim l0320 As String ' 87
Dim l0322 ' 80
    On Error Resume Next
    If  gv1ADC.M41D4 = gc0562 And gv1ADC.M41DB = gc0566 Then
        If  gv1ADC.M41E5 = mc0262 And gv1ADC.M41F0 = mc0266 Then
            Exit Sub
        End If
    End If
    l0320 = p031E.FontName
    If  l0320 = gc0562 Then
        l0320 = gv1ADC.M41D4
        p031E.FontSize = gv1ADC.M41E5
    End If
    If  l0320 = gc0566 Then
        l0320 = gv1ADC.M41DB
        p031E.FontSize = gv1ADC.M41F0
    End If
    p031E.FontName = l0320
    For l0322 = 0 To p031E.Controls.Count - 1
        If  TypeOf p031E.Controls(l0322) Is Line Then
        ElseIf TypeOf p031E.Controls(l0322) Is HScrollBar Then
        ElseIf TypeOf p031E.Controls(l0322) Is VScrollBar Then
        Else
            l0320 = p031E.Controls(l0322).FontName
            If  l0320 = gc0562 Then
                l0320 = gv1ADC.M41D4
                p031E.Controls(l0322).FontSize = gv1ADC.M41E5
            End If
            If  l0320 = gc0566 Then
                l0320 = gv1ADC.M41DB
                p031E.Controls(l0322).FontSize = gv1ADC.M41F0
            End If
            p031E.Controls(l0322).FontName = l0320
        End If
    Next l0322
End Sub

Sub sub0792 (p0326 As Form ' 49)
    On Error GoTo LD782
    Set gv1BFC = p0326
    Exit Sub
LD782:
    Resume LD78E
LD78E:
End Sub

Sub sub07A0 (p0328 As Integer ' 41)
    If  p0328 = True Then
        Screen.MousePointer = mc01D6
        Else
        Screen.MousePointer = m02EC
    End If
End Sub

Sub sub07B3 (p032C As Form ' 49, p0330 As ? ' 49)
' Const mc0332 = 32 ' &H20%
' Const mc0336 = 33 ' &H21%
' Const mc0338 = 4 ' &H4%
    p0330.P?C006 = p032C.Width - (((extfn01D2(mc0332) * 2) * Screen.TwipsPerPixelX))
    p0330.P?C007 = p032C.Height - (((extfn01D2(mc0336) * 2) + extfn01D2(mc0338)) * Screen.TwipsPerPixelY)
End Sub

Sub sub07C5 (p033C As Form ' 49, p0340 As T5E14 ' 4A)
Dim l0342 ' 80
Dim l0346 As String ' 87
Dim l0348 As Integer ' 81
Dim l034C As Single ' 83
Dim l034E As Single ' 83
    On Error GoTo LDD52
    If  p0340.M4216 = False Or p0340.M420C = False Or p033C.WindowState = 1 Then
        Exit Sub
    End If
    If  p0340.M5E20 = p033C.Width And p0340.M5E2D = p033C.Height Then
    End If
    l034C = p033C.Width / p0340.M4216
    l034E = p033C.Height / p0340.M420C
    If  p033C.Controls.Count = False Then
        If  Left(CStr(p033C.Tag), 1) <> ":" Then
            If  p033C.FontName = gv1ADC.M41D4 Then
                p033C.FontSize = gv1ADC.M41E5 * (p033C.Width / p0340.M5E20)
            Else
                p033C.FontSize = gv1ADC.M41F0 * (p033C.Width / p0340.M5E20)
            End If
        Else
            If  Left$(CStr(p033C.Tag), 1) = ":" Then
                p033C.FontSize = CDbl(Right$(CStr(p033C.Tag), Len(CStr(p033C.Tag)) - 1)) * l034C
            End If
        End If
        Exit Sub
    End If
    For l0342 = 0 To p033C.Controls.Count - 1
        l0346 = p033C.Controls(l0342).FontName
        l0348 = p033C.Controls(l0342).FontSize
        If  Left(CStr(p033C.Controls(l0342).Tag), 1) <> ":" Then
            If  l0346 = gv1ADC.M41D4 Then
                p033C.Controls(l0342).FontSize = gv1ADC.M41E5 * (p033C.Width / p0340.M5E20)
            Else
                p033C.Controls(l0342).FontSize = gv1ADC.M41F0 * (p033C.Width / p0340.M5E20)
            End If
            p033C.Controls(l0342).FontName = l0346
            If  l0346 = gv1ADC.M41D4 Then
                p033C.Controls(l0342).FontSize = gv1ADC.M41E5 * (p033C.Width / p0340.M5E20)
            Else
                p033C.Controls(l0342).FontSize = gv1ADC.M41F0 * (p033C.Width / p0340.M5E20)
            End If
        Else
            If  Left(CStr(p033C.Controls(l0342).Tag), 1) = ":" Then
                p033C.Controls(l0342).FontSize = CDbl(Right$(CStr(p033C.Controls(l0342).Tag), Len(CStr(p033C.Controls(l0342).Tag)) - 1)) * l034C
                p033C.Controls(l0342).FontName = l0346
                p033C.Controls(l0342).FontSize = CDbl(Right$(CStr(p033C.Controls(l0342).Tag), Len(CStr(p033C.Controls(l0342).Tag)) - 1)) * l034C
            End If
        End If
    Next l0342
    p0340.M420C = p033C.Height
    p0340.M4216 = p033C.Width
    Exit Sub

LDD52:
    Resume Next
End Sub

Sub sub07D4 (p0352 As Form ' 49, p0356 As ? ' 49)
    p0356.P?C004 = p0352.Width - (p0356.P?C002 + ((extfn01D2(mc0332) * 2) * Screen.TwipsPerPixelX))
    p0356.P?C005 = p0352.Height - p0356.P?C003 - (((extfn01D2(mc0336) * 2) + extfn01D2(mc0338)) * Screen.TwipsPerPixelY)
End Sub

Sub sub07E2 (p0358 As Single ' 43)
Dim l035C As Single ' 83
    If  gv1B50 = True Then
        sub05D8
        Exit Sub
    End If
    l035C! = Timer
    Do
        sub05D8
    Loop While Abs(Timer - l035C!) < p0358
End Sub

Sub sub07ED (p0360 As Form ' 49)
Dim l0362 As Single ' 83
Dim l0364 As Single ' 83
' Const mc0366 = 20 ' &H14%
' Const mc0368 = 800 ' &H320%
' Const mc036A = 600 ' &H258%
    gv19C2(mc0366).M4216 = p0360.Width
    gv19C2(mc0366).M420C = p0360.Height
    gv19C2(mc0366).M5E20 = p0360.Width
    gv19C2(mc0366).M5E2D = p0360.Height
    gv19C2(mc0366).M5E47 = p0360.hWnd
    l0362 = ((Screen.Width) / Screen.TwipsPerPixelX) / mc0368
    l0364 = ((Screen.Height) / Screen.TwipsPerPixelY) / mc036A
    If  l0362 < 1 Then
        l0362 = 1
    End If
    If  l0364 < 1 Then
        l0364 = 1
    End If
    p0360.Width = p0360.Width * l0362
    p0360.Height = p0360.Height * l0364
    sub02FE p0360
    sub0760 p0360, gv19C2(mc0366)
End Sub

Sub sub0802 (p036E As Form ' 49)
Dim l0370 As Single ' 83
Dim l0372 As Single ' 83
Dim l0374 ' 80
Dim l0376 As String ' 87
Dim l0378 As Single ' 83
    On Error Resume Next
    gv19C2(mc0366).M4216 = p036E.Width
    gv19C2(mc0366).M420C = p036E.Height
    gv19C2(mc0366).M5E20 = p036E.Width
    gv19C2(mc0366).M5E2D = p036E.Height
    gv19C2(mc0366).M5E47 = p036E.hWnd
    l0370 = ((Screen.Width) / Screen.TwipsPerPixelX) / mc0368
    l0372 = ((Screen.Height) / Screen.TwipsPerPixelY) / mc036A
    If  l0370 < 1 Then
        l0370 = 1
    End If
    If  l0372 < 1 Then
        l0372 = 1
    End If
    p036E.Width = p036E.Width * l0370
    p036E.Height = p036E.Height * l0372
    If  p036E.Controls.Count = False Then
        If  Left(CStr(p036E.Tag), 1) <> ":" Then
            If  p036E.FontName = gv1ADC.M41D4 Then
                p036E.FontSize = gv1ADC.M41E5 * (p036E.Width / gv19C2(mc0366).M5E20)
            Else
                p036E.FontSize = gv1ADC.M41F0 * (p036E.Width / gv19C2(mc0366).M5E20)
            End If
        Else
            If  Left$(CStr(p036E.Tag), 1) = ":" Then
                p036E.FontSize = CDbl(Right$(CStr(p036E.Tag), Len(CStr(p036E.Tag)) - 1)) * l0370
            End If
        End If
        Exit Sub
    End If
    For l0374 = 0 To p036E.Controls.Count - 1
        If  TypeOf p036E.Controls(l0374) Is DriveListBox Then
        Else
            l0376 = p036E.Controls(l0374).FontName
            l0378 = p036E.Controls(l0374).FontSize
            If  Left(CStr(p036E.Controls(l0374).Tag), 1) <> ":" Then
                If  l0376 = gv1ADC.M41D4 Then
                    p036E.Controls(l0374).FontSize = gv1ADC.M41E5 * (p036E.Width / gv19C2(mc0366).M5E20)
                Else
                    p036E.Controls(l0374).FontSize = gv1ADC.M41F0 * (p036E.Width / gv19C2(mc0366).M5E20)
                End If
                p036E.Controls(l0374).FontName = l0376
                If  l0376 = gv1ADC.M41D4 Then
                    p036E.Controls(l0374).FontSize = gv1ADC.M41E5 * (p036E.Width / gv19C2(mc0366).M5E20)
                Else
                    p036E.Controls(l0374).FontSize = gv1ADC.M41F0 * (p036E.Width / gv19C2(mc0366).M5E20)
                End If
            Else
                If  Left(CStr(p036E.Controls(l0374).Tag), 1) = ":" Then
                    p036E.Controls(l0374).FontSize = CDbl(Right$(CStr(p036E.Controls(l0374).Tag), Len(CStr(p036E.Controls(l0374).Tag)) - 1)) * l0370
                    p036E.Controls(l0374).FontName = l0376
                    p036E.Controls(l0374).FontSize = CDbl(Right$(CStr(p036E.Controls(l0374).Tag), Len(CStr(p036E.Controls(l0374).Tag)) - 1)) * l0370
                End If
            End If
        End If
    Next l0374
    sub02FE p036E
End Sub
