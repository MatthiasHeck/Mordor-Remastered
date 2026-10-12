' Module7
Option Explicit
Dim m000C As Integer ' 61
Const m0022 = 0 ' &H0%
Const mc0024 = 1 ' &H1%
Const mc0036 = 4 ' &H4%
Const mc005C = 1 ' &H1%
Const mc005E = 5 ' &H5%
Const m0060 = 0 ' &H0%
Const mc0062 = 3 ' &H3%
Const mc0064 = 40 ' &H28%
Const mc0068 = 1 ' &H1%
Const mc006A = 48 ' &H30%
Const mc0084 = 35 ' &H23%
Const mc0086 = 4 ' &H4%
Const mc00A6 = 4 ' &H4%
Const m00A8 = 0 ' &H0%
Const mc00AA = 1 ' &H1%
Const mc00AC = 5 ' &H5%
Const mc00B6 = 2 ' &H2%
Const mc00D6 = 1 ' &H1%
Const mc00D8 = 2 ' &H2%
Const mc00DE = 2 ' &H2%
Const mc00F2 = 4 ' &H4%
Const mc00F6 = 1 ' &H1%
Const mc00F8 = 2 ' &H2%
Const mc0100 = 10 ' &HA%
Const mc0116 = 2 ' &H2%
Const mc0126 = 1 ' &H1%
Const mc0128 = 2 ' &H2%
Const mc012E = 5 ' &H5%
Const mc0130 = 6 ' &H6%
Const mc0132 = 4 ' &H4%
Const mc0150 = 32 ' &H20%
Const mc0152 = 4 ' &H4%

Sub sub0908 ()
Dim l000E As Integer ' 81
Dim l0010 As Integer ' 81
Dim l0012 As Integer ' 81
Dim l0014 As Integer ' 81
Dim l0016 As Integer ' 81
' Const m0022 = 0 ' &H0%
' Const mc0024 = 1 ' &H1%
    On Error GoTo L4F430
    l0014 = gv1A86
    If  UBound(gv14C2) > m0022 Then
        l000E = 1
        Do While l000E <= UBound(gv14C2)
            If  gv14C2(l000E).M583F <> gv14C2(m0022).M583F Or gv14C2(l000E).M5845 <> gv14C2(m0022).M5845 Or gv14C2(l000E).M5470 <> gv14C2(m0022).M5470 Then
                sub085B Chr$(34) + RTrim(gv14C2(l000E).M548B) + Chr$(34) + " has disappeared from view!"
                If  gv14C2(l000E).M4EAC <= False Then
                    gv14C2(l000E).M4EAC = False
                    If  gv14C2(l000E).M5483 = False Then
                        sub091E l000E, mc0024
                    End If
                End If
                l0012 = True
                If  l000E = gv1A82 Or l000E = gv1A86 Then
                    l0010 = True
                End If
                sub04DC l000E
                l000E = l000E - 1
            End If
            l000E = l000E + 1
        Loop
        If  UBound(gv14C2) > False Then
            gv1A84 = l0014
        Else
            gv1A84 = m0022
            l0014 = m0022
        End If
        If  l0010 = True Then
            sub14E0 m0022
            gv1A84 = m0022
            gv1A82 = m0022
            gv1A86 = m0022
            l0014 = gv1A84
        End If
        If  l0014 > UBound(gv14C2) Then
            l0014 = UBound(gv14C2)
        End If
        If  l0012 = True Then
            gv1A84 = m0022
            l0016 = fn0A0B(m0022)
            gv1A84 = l0014
            gv1A86 = l0014
            frmParty!lblCall = "UPDATE"
            sub1776
            sub14E0 gv1A84
        End If
    End If
    If  gv1A84 > UBound(gv14C2) Then
        gv1A84 = UBound(gv14C2)
    End If
    If  l0012 = True Then
        sub096E
    End If
    Exit Sub

L4F430:
    sub04FC "Error '" + Error + "' in MULTIMOD:mdrmulBreakUpParty"
    Resume L4F496
L4F496:
End Sub

Function fn17AE () As Integer ' 1
Dim l0032 As Integer ' 81
Dim l0034 ' 80
' Const mc0036 = 4 ' &H4%
    On Error GoTo L4F51A
    For l0034 = 0 To UBound(gv14C2)
        If  gv14C2(l0034).M56B9(mc0036) = False Then
            l0032 = True
        End If
    Next l0034
    If  l0032 = False Then fn17AE = True

L4F50C:
    Exit Function

L4F51A:
    sub04FC "Error '" + Error + "' occurred in MULTIMOD:mdrmulIsPartyInvisible"
    Resume L4F50C
End Function

Sub sub0BDE (p0038 As Integer ' 41)
Dim l003A ' 80
Dim l003E As Integer ' 81
Dim l0040 As Integer ' 81
Dim l0042 As Integer ' 81
' Const mc005C = 1 ' &H1%
' Const mc005E = 5 ' &H5%
' Const m0060 = 0 ' &H0%
' Const mc0062 = 3 ' &H3%
' Const mc0064 = 40 ' &H28%
' Const mc0068 = 1 ' &H1%
' Const mc006A = 48 ' &H30%
    On Error GoTo L4F926
    If  gv1EE6 = True Then
        Exit Sub
    End If
    If  fn0EEF() = False Then Exit Sub
    gv1EE6 = True
    If  p0038 = -1 Then
        l0040 = m0022
        l0042 = UBound(gv14C2)
    Else
        l0040 = p0038
        l0042 = p0038
    End If
    l003E = gv1A84
    For l003A = l0040 To l0042
        If  gv1E66(l003A).M547A < False Then
            gv1E66(l003A).M547A = False
        End If
        If  gv1E38(gv1E66(l003A).M547A).M4EDC = False Then
            gv1E66(l003A).M547A = False
        End If
        If  gv1E66(l003A).M4E97 = False And gv1E66(l003A).M56C4 = -1 Then
            gv1E7C(l003A) = False
            If  fn0EEF() > False And gv1E38(0).M4ECC = mc005C And (gv1E66(l003A).M56C4 = -1 And gv1E66(l003A).M4E97 = False) Then
                If  gv14C2(l003A).M5914(mc005E) > m0060 Then
                    gv1E38(0).M4ECC = mc005C
                    gv1E66(l003A).M4E97 = gv14C2(l003A).M5914(mc005E)
                End If
                If  gv14C2(l003A).M5914(mc005E) >= mc0062 Then
                    gv1E66(l003A).M4E97 = False
                    If  gv14C2(l003A).M59B0(gv14C2(l003A).M5914(mc005E) - mc0062) < mc0064 Then
                        sub1577 l003A, gv14C2(l003A).M59B0(gv14C2(l003A).M5914(mc005E) - mc0062)
                    Else
                        If  fn0EEF() > False Then
                            gv1A84 = l003A
                            gv1E66(l003A).M56C4 = gv14C2(l003A).M59B0(gv14C2(l003A).M5914(mc005E) - mc0062) - mc0064
                            If  fn10E5(l003A, gv1E66(l003A).M56C4, False, False) = False Then
                                sub102F l003A, mc0068
                            End If
                            gv1A84 = l003E
                        End If
                    End If
                End If
            End If
        End If
    Next l003A
    gv1A84 = l003E
    gv1EE6 = False
    Exit Sub

L4F926:
    MsgBox "Error " + Error + " occured in MULTIMOD:mdrmulLoadFight", mc006A, "Error!"
    gv1EE6 = False
    Resume L4F99E
L4F99E:
End Sub

Sub sub16D8 ()
Dim l006C As Integer ' 81
Dim l006E ' 80
Dim l0070 ' 80
Dim l0072 ' 80
Dim l0074 As Integer ' 81
Dim l0076 As Integer ' 81
Dim l0078 As String ' 87
Dim l007A As Integer ' 81
Dim l007C As Integer ' 81
' Const mc0084 = 35 ' &H23%
' Const mc0086 = 4 ' &H4%
    On Error GoTo L4FFB2
    l006C = FreeFile
    l0074 = 2
    l0076 = False
    l007A = False
    Open gv19E8 + gc1C74 + gc1C38 For Random As #l006C Len = mc0084
    If  LOF(l006C) = False Or gv14C2(m0022).M5483 <> False Then
        Close #l006C
        Exit Sub
    End If
    Get #l006C, 1, l0072
    l0074 = 2
    l0076 = False
    If  l0072 > False Then
        For l006E = False To l0072 - 1
            Get #l006C, l0074, l0078
            If  l0078 = RTrim(gv14C2(m0022).M548B) Then
                l0076 = True
                Exit For
            Else
                l0074 = l0074 + mc0086
            End If
        Next l006E
    End If
    If  l0076 = False Then
        Close #l006C
        Exit Sub
    End If
    Seek #l006C, l0074 + 1
    For l006E = m0022 + 1 To (mc0086 - 1)
        Get #l006C, , l0078
        If  l0078 <> "" Then
            l0076 = False
            l007C = fn04CD(l0078, "", UBound(gv14C2) + 1, True)
            If  l007C = True Then
                If  gv14C2(UBound(gv14C2)).M59BB <> gv14C2(m0022).M59BB Or gv14C2(UBound(gv14C2)).M5470 <> gv14C2(m0022).M5470 Then
                    sub085B "AUTOLOAD PARTY: " + Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is not here anymore!"
                    l0076 = True
                End If
                If  gv14C2(UBound(gv14C2)).M5483 <> False And l0076 = False Then
                    sub085B "AUTOLOAD PARTY: " + Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is dead!  Can't join!"
                    l0076 = True
                End If
                For l0070 = 0 To UBound(gv14C2) - 1
                    If  Abs(gv14C2(l0070).M4EBF - gv14C2(UBound(gv14C2)).M4EBF) > 1 And l0076 = False Then
                        sub085B "AUTOLOAD PARTY: " + Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is oppositely aligned to one or more members of the party!"
                        l0076 = True
                    End If
                Next l0070
                If  l0076 = True Then
                    sub04DC UBound(gv14C2)
                Else
                    sub085B "AUTOLOAD PARTY: " + Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is now a member of your party."
                    sub14F4
                End If
            Else
                sub085B "An error occurred auto-loading " + Chr$(34) + RTrim(l0078) + Chr$(34) + ".  Has the character been deleted?"
            End If
        End If
    Next l006E
    Close #l006C
    Exit Sub

L4FFB2:
    Close #l006C
    MsgBox "Error '" + Error + "' occurred in MULTIMOD:mdrmulLoadParty", mc006A, "Error!"
    Resume L50030
L50030:
End Sub

Sub sub0A64 (p008A As Integer ' 41)
Dim l008C ' 80
Dim l008E As Integer ' 81
Dim l0090 As Integer ' 81
Dim l0092 As Integer ' 81
Dim l0094 As Integer ' 81
Dim l0096 As Single ' 83
Dim l0098 As Integer ' 81
Dim l009A As Integer ' 81
Dim l009C As Integer ' 81
Dim l009E As Integer ' 81
Dim l00A0 As Integer ' 81
' Const mc00A6 = 4 ' &H4%
' Const m00A8 = 0 ' &H0%
' Const mc00AA = 1 ' &H1%
' Const mc00AC = 5 ' &H5%
' Const mc00B6 = 2 ' &H2%
    On Error GoTo L505D0
    frmDungeonMain!lblMonsterHit.Caption = ""
    l0092 = 100
    l0096 = False
    l00A0 = gv14C2(m0022).M59BB
    For l008C = 0 To UBound(gv14C2)
        l0096 = l0096 + l0092
        l0092 = l0092 / 2
    Next l008C
    l008E = m0022
    For l008C = 0 To mc00A6 - 1
        If  gv1E38(l008C).M4EDC > False Then
            l0094 = False
            l0090 = 100
            l008E = m0022
            l0092 = Int(Rnd * 100) + 1
            l0098 = 100
            Select Case p008A
                Case m00A8
                    Do While (l0090 / l0096) * 100 < l0092
                        l008E = l008E + 1
                        If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                        l0098 = l0098 / 2
                        l0090 = l0090 + l0098
                    Loop
                    If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                    If  l00A0 = gv14C2(m0022).M59BB Then l0094 = True
                Case mc00AA
                    Do While (l0090 / l0096) * 100 < l0092
                        l008E = l008E + 1
                        If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                        l0098 = l0098 / 2
                        l0090 = l0090 + l0098
                    Loop
                    If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                    l009A = (gv14C2(l008E).M55B5(mc00AC) + gv14C2(l008E).M584B(mc00AC))
                    l009C = (gv14F6(gv1E38(l008C).M4ED4).M55B5(mc00AC))
                    l009E = 50 + ((l009C - l009A) * 5)
                    If  l009E < 5 Then l009E = 5
                    If  (Int(Rnd * 100) + 1) < l009E Then
                        l0094 = True
                        If  UBound(gv14C2) > m0022 Then
                        End If
                    End If
                Case mc00B6
                    Do While (l0090 / l0096) * 100 < l0092
                        l008E = l008E + 1
                        If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                        l0098 = l0098 / 2
                        l0090 = l0090 + l0098
                    Loop
                    If  l008E > UBound(gv14C2) Then l008E = UBound(gv14C2)
                    l0092 = Int(Rnd * 100) + 1
                    l009A = (gv14C2(l008E).M55B5(mc00AC) + gv14C2(l008E).M584B(mc00AC))
                    l009C = (gv14F6(gv1E38(l008C).M4ED4).M55B5(mc00AC))
                    l009E = 50 + ((l009C - l009A) * 5)
                    If  l009E > 98 Then l009E = 98
                    If  l009E < 5 Then l009E = 5
                    If  l0092 < l009E Then l0094 = True
                Case Else
            End Select
            If  l0094 = True Then sub0E85 l008E, l008C, l00A0
            If  gv14C2(l008E).M4EAC <= False Then
                sub0930 l008E
                If  UBound(gv14C2) = False Then Exit For
            Else
                If  UBound(gv14C2) > m0022 Then frmParty!lblCall = "STATS"
            End If
        End If
    Next l008C
    Exit Sub

L505D0:
    sub04FC "Error '" + Error + "' in MULTIMOD:mdrmulMonsterAttack"
    Resume L50636
L50636:
End Sub

Sub sub14F4 ()
    If  fn03BD(frmCityBank) Then frmCityBank!lblCall.Caption = "UPDATE:"
    sub0CCC UBound(gv14C2)
    frmParty.Show
    frmParty!lblCall = "UPDATE"
    sub08A9 False, 13
    sub0775
End Sub

Function fn179B (p00C0 As Integer ' 41) As Integer ' 1
Dim l00C2 As Integer ' 81
Dim l00C4 ' 80
Dim l00C6 ' 80
Dim l00C8 As Integer ' 81
Dim l00CA As Integer ' 81
Dim l00CC As String ' 87
Dim l00CE As Integer ' 81
    On Error GoTo L5094A
    l00C2 = FreeFile
    l00C8 = 2
    l00CA = False
    l00CE = False
    Open gv19E8 + gc1C74 + gc1C38 For Random As #l00C2 Len = mc0084
    If  LOF(l00C2) > False Then
        Get #l00C2, 1, l00C6
        If  l00C6 > False Then
            For l00C4 = False To l00C6 - 1
                Get #l00C2, l00C8, l00CC
                If  l00CC = "" Then
                    l00CE = l00C8
                End If
                If  l00CC = RTrim(gv14C2(m0022).M548B) Then
                    l00CA = True
                    l00C6 = l00C6 - 1
                    Exit For
                Else
                    l00C8 = l00C8 + mc0086
                End If
            Next l00C4
        End If
    End If
    l00C6 = l00C6 + 1
    If  (p00C0 = False And (l00CA <> False)) Or p00C0 = True Then
        If  l00CA = False And l00CE <> False Then
            l00C8 = l00CE
        End If
        Put #l00C2, 1, l00C6
        Seek #l00C2, l00C8
        For l00C4 = m0022 To (mc0086 - 1)
            If  l00C4 <= UBound(gv14C2) And p00C0 = True Then
                l00CC = RTrim(gv14C2(l00C4).M548B)
            Else
                l00CC = ""
            End If
            Put #l00C2, , l00CC
        Next l00C4
    End If
    Close #l00C2
    fn179B = True
    Exit Function

L5094A:
    sub04FC "Error '" + Error + "' in MULTIMOD:mdrmulSaveParty"
    Close #l00C2
    Resume L509B8
L509B8:
End Function

Sub sub0848 (p00D0 As Integer ' 41)
Dim l00D2 ' 80
Static m00D4 As Integer ' 61
' Const mc00D6 = 1 ' &H1%
' Const mc00D8 = 2 ' &H2%
    If  UBound(gv14C2) = m0022 Then
        Exit Sub
    End If
    If  p00D0 Then
        gv14C2(UBound(gv14C2)).M59F4(m00D4) = gv14C2(m0022).M59F4(m00D4)
        gv14C2(UBound(gv14C2)).M59F4(mc00D6) = gv14C2(m0022).M59F4(mc00D6)
        gv14C2(UBound(gv14C2)).M59F4(mc00D8) = gv14C2(m0022).M59F4(mc00D8)
        Exit Sub
    End If
    For l00D2 = 1 To UBound(gv14C2)
        gv14C2(l00D2).M59F4(m00D4) = gv14C2(m0022).M59F4(m00D4)
        gv14C2(l00D2).M59F4(mc00D6) = gv14C2(m0022).M59F4(mc00D6)
        gv14C2(l00D2).M59F4(mc00D8) = gv14C2(m0022).M59F4(mc00D8)
    Next l00D2
End Sub

Sub sub102F (p00DA As Integer ' 41, p00DC As Integer ' 41)
' Const mc00DE = 2 ' &H2%
    If  p00DC = -1 Then
        If  (gv1E66(p00DA).M4E97 = m0060 Or gv1E66(p00DA).M4E97 = mc0068) And gv1E66(p00DA).M56C4 = -1 Then
            gv1E66(p00DA).M56C4 = -1
            gv1E66(p00DA).M5766 = -1
            gv1E66(p00DA).M4E97 = mc00DE
            Exit Sub
        Else
            gv1E66(p00DA).M56C4 = -1
            gv1E66(p00DA).M5766 = -1
            gv1E66(p00DA).M4E97 = mc0068
        End If
    Else
        gv1E66(p00DA).M56C4 = -1
        gv1E66(p00DA).M5766 = -1
        gv1E66(p00DA).M4E97 = p00DC
    End If
End Sub

Sub sub0C15 ()
Dim l00E0 ' 80
    For l00E0 = False To UBound(gv14C2)
        gv1E66(l00E0).M56C4 = -1
        gv1E66(l00E0).M5766 = -1
        gv1E66(l00E0).M4E97 = False
        gv1E66(l00E0).M68C8 = False
    Next l00E0
End Sub

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

Sub sub0BF1 ()
    frmParty!lblCall = "STATS"
End Sub

Sub sub178B (p00FA As Integer ' 41)
Dim l00FC ' 80
Static m00FE As Integer ' 61
' Const mc0100 = 10 ' &HA%
' Const mc0116 = 2 ' &H2%
    On Error GoTo L516E0
    If  gv1E7C(gv1A86) > 0 Then frmDungeonMain!lblCharacterHit.Caption = ""
    For l00FC = m0022 To UBound(gv14C2)
        frmParty!lblName(l00FC).ForeColor = QBColor(m00FE)
        frmParty!lblHits(l00FC).ForeColor = QBColor(m00FE)
        frmParty!lblName(l00FC).FontBold = False
    Next l00FC
    gv1A84 = p00FA
    gv1A86 = p00FA
    For l00FC = 0 To mc0100 - 1
        sub0F4C l00FC
    Next l00FC
    If  gv14C2(m0022).M5470 > False Or gv14C2(m0022).M5483 <> False Then
        frmDungeonMain.Caption = "Dungeon (" + RTrim(gv14C2(p00FA).M548B) + ")"
        sub0BCD
        If  gv1E50.M4F35 > -1 Then
            sub0BAA gv14C2(m0022).M59BB
        End If
        If  fn0EEF() > 0 Then
            sub0BBA gv14C2(m0022).M59BB
        End If
    Else
        sub0792 frmCityMain
        If  fn03BD(frmCityStore) Then frmCityStore!lblCall = "UPDATE"
        If  fn03BD(frmCityCStore) Then frmCityCStore!lblCall = "UPDATE"
        If  fn03BD(frmCityMorgue) Then frmCityMorgue!lblCall = "UPDATE"
        If  fn03BD(frmCityGuild) Then frmCityGuild!lblCall = "UPDATE"
        If  fn03BD(frmCityBank) Then frmCityBank!lblCall = "UPDATE"
        sub14E0 p00FA
    End If
    frmParty!lblName(p00FA).ForeColor = QBColor(mc0116)
    frmParty!lblHits(p00FA).ForeColor = QBColor(mc0116)
    frmParty!lblName(p00FA).FontBold = True
    sub1617 gv1A84, 9
    sub1617 gv1A84, 10
    sub08B9 True
    Exit Sub

L516E0:
    sub04FC "Error '" + Error + "' occurred in MULTIMOD:mdrmulSwitch"
    Resume L51748
L51748:
End Sub

Sub sub14E0 (p0118 As Integer ' 41)
Dim l011A ' 80
Static m011C As Integer ' 61
' Const mc0126 = 1 ' &H1%
' Const mc0128 = 2 ' &H2%
' Const mc012E = 5 ' &H5%
' Const mc0130 = 6 ' &H6%
' Const mc0132 = 4 ' &H4%
    On Error GoTo L519AE
    gv1A82 = p0118
    gv1A84 = p0118
    gv1A86 = p0118
    sub08A9 False, 1
    sub08A9 False, 50
    gv19C2(m011C).M5E4F = p0118
    sub0B82 p0118
    gv19C2(mc0126).M5E4F = p0118
    For l011A = 0 To mc0064 - 1
        sub0F61 gv1A84, m0022, l011A
    Next l011A
    gv19C2(mc0128).M5E4F = p0118
    frmCharStat3!cmbClass.Clear
    frmCharStat3!txtSpell.Text = ""
    sub1602
    gv19C2(mc012E).M5E4F = p0118
    For l011A = 0 To mc0100 - 1
        sub0F4C l011A
    Next l011A
    gv19C2(mc0130).M5E4F = p0118
    gv19C2(mc0132).M5E4F = p0118
    frmCharStat1!picTabPicture.Refresh
    If  fn03BD(frmDungeonMain) Then
        If  UBound(gv14C2) > m0022 Then
            frmDungeonMain.Caption = "Dungeon (" + RTrim(gv14C2(gv1A86).M548B) + ")"
        Else
            frmDungeonMain.Caption = "Dungeon"
        End If
    End If
    frmParty!lblCall = CStr(gv1A86)
    sub08B9 True
    Exit Sub
L519AE:
    sub04FC "Error '" + Error + "' occurred in mdrmulSwitchChar."
    Resume L51A12
L51A12:
End Sub

Sub sub1776 ()
    frmParty!lblCall = "UPDATE"
    sub08A9 False, 13
End Sub

Sub sub0941 (ByVal p0138 As String ' 47)
    frmParty!lblCall.Caption = p0138
End Sub

Sub sub0956 ()
Dim l013A ' 80
Dim l013C ' 80
Dim l013E As Integer ' 81
Dim l0140 As Integer ' 81
    If  UBound(gv14C2) > m0022 Then
        For l013A = m0022 To UBound(gv14C2)
            gv14C2(l013A).M583F = gv14C2(m0022).M583F
            gv14C2(l013A).M5845 = gv14C2(m0022).M5845
            l013E = gv14C2(l013A).M5470
            l0140 = gv14C2(l013A).M59BB
            gv14C2(l013A).M5470 = gv14C2(m0022).M5470
            gv14C2(l013A).M59BB = fn0992(fn0AE8(gv14C2(m0022)))
            gv14C2(l013A).M5899 = gv14C2(m0022).M5899
            If  l013E <> gv14C2(l013A).M5470 Or l0140 <> gv14C2(l013A).M59BB Then
            End If
            For l013C = 0 To UBound(gv1732)
                If  gv1732(l013C).M548B = RTrim(gv14C2(l013A).M548B) Then
                    gv1732(l013C).M4EAC = gv14C2(l013A).M4EAC
                    gv1732(l013C).M5483 = gv14C2(l013A).M5483
                    gv1732(l013C).M547A = gv14C2(m0022).M59BB
                    gv1732(l013C).M5470 = gv14C2(m0022).M5470
                    Exit For
                End If
            Next l013C
        Next l013A
    End If
End Sub

Sub sub1547 (ByVal pv014E As Integer ' 81)
' Const mc0150 = 32 ' &H20%
' Const mc0152 = 4 ' &H4%
' Const mc0154 = 6 ' &H6%
    If  gv14C2(m0022).M5470 > False Then
        If  fn0EEF() <> False Then
            sub085B Chr$(34) + RTrim(gv14C2(pv014E).M548B) + Chr$(34) + " cannot leave while monsters are in the area!"
            Exit Sub
        End If
    End If
    If  gv1A84 = m0022 Then
        sub085B "Leader cannot leave Party!"
        Exit Sub
    End If
    If  MsgBox("Ask " + Chr$(34) + RTrim(gv14C2(pv014E).M548B) + Chr$(34) + " to Leave?", mc0150 & mc0152, "Leave") = mc0154 Then
        sub04DC pv014E
        sub1776
        sub178B gv1A86
        sub14E0 gv1A86
        If  fn03BD(frmCityBank) Then frmCityBank!lblCall.Caption = "UPDATE"
    End If
End Sub
