' Module11
Option Explicit
Const mc0042 = 48 ' &H30%
Const m0052 = 0 ' &H0%
Const mc0054 = 1 ' &H1%
Const mc007A = 1 ' &H1%
Const mc0086 = 2 ' &H2%
Const mc0090 = 4 ' &H4%
Const mc0092 = 3 ' &H3%
Const mc009A = 6 ' &H6%
Const mc00A2 = 6 ' &H6%
Const mc00AC = 14 ' &HE%
Const mc00B4 = 18 ' &H12%
Const mc00BC = 11 ' &HB%
Const mc00E4 = 6 ' &H6%
Const mc013C = 5 ' &H5%
Const mc013E = 4 ' &H4%
Const mc0142 = 2 ' &H2%
Const mc0144 = 1 ' &H1%
Const mc0146 = 3 ' &H3%
Const mc0156 = 45 ' &H2D%
Const mc0168 = 100 ' &H64%
Const mc016A = 64 ' &H40%

Sub sub0578 (p0030 ' 40, ByVal p0032 As String ' 47)
Dim l0034 As Integer ' 81
Dim l0036 As Long ' 82
Dim l0038 As Integer ' 81
Dim l003A ' 80
' Const mc0042 = 48 ' &H30%
    On Error GoTo L552FC
    l0034 = FreeFile
    l0036 = CLng(Date)
    l0038 = Len(p0032)
    Open gv19E8 + gc1C74 + gc1C24 For Binary As #l0034
    Get #l0034, 1, l003A
    l003A = l003A + 1
    Put #l0034, 1, l003A
    If  LOF(l0034) > False Then
        Seek #l0034, LOF(l0034) + 1
    End If
    Put #l0034, , p0030
    Put #l0034, , l0036
    Put #l0034, , l0038
    Put #l0034, , p0032
    Close #l0034
    Exit Sub

L552FC:
    MsgBox "Error " + Error + " writing a guild log entry!", mc0042, "Error!"
    Resume L55362
L55362:
End Sub

Sub sub0F9A (p0044 As Integer ' 41, p0046 As Integer ' 41, p004A ' 40)
Dim l0050 ' 80
' Const m0052 = 0 ' &H0%
' Const mc0054 = 1 ' &H1%
    On Error GoTo L55424
    If  gv1408 = False Then
        Exit Sub
    End If
    Get #gv1408, 2, l0050
    Select Case p0046
        Case m0052
            Get #gv1408, p0044 + 6, p004A
        Case mc0054
            Get #gv1408, p0044 + 6 + l0050, p004A
        Case Else
    End Select
    Exit Sub

L55424:
    Resume L55430
L55430:
End Sub

Function fn1BBE (ByVal p0058 As String ' 47, p005A As Integer ' 41) As String ' 7
Dim l005C As String ' 87
Dim l005E ' 80
Dim l0060 As Integer ' 81
Dim l0064 As T5BF1 ' 8A
Dim l0068 As T4E8B ' 8A
Dim l006A As Integer ' 81
Dim l006C As String ' 87
' Const mc007A = 1 ' &H1%
' Const mc0086 = 2 ' &H2%
' Const mc0090 = 4 ' &H4%
' Const mc0092 = 3 ' &H3%
' Const mc009A = 6 ' &H6%
' Const mc00A2 = 6 ' &H6%
' Const mc00AC = 14 ' &HE%
' Const mc00B4 = 18 ' &H12%
' Const mc00BC = 11 ' &HB%
' Const mc00E4 = 6 ' &H6%
    l0060 = -1
    Select Case p005A
        Case m0052
            For l005E = False To gv1BF6 - 1
                If  gv14F6(l005E).M548B = p0058 Then
                    l0060 = l005E
                    Exit For
                End If
            Next l005E
            If  l0060 = -1 Then
                fn1BBE = "ERROR looking up " + p0058 + "!"
                Exit Function
            End If
            gv2A66 = l0060
            l0068.M4ED4 = l0060
            l0068.M4F01 = l0060
            sub0F9A l0060, m0052, l0064
            l005C = "MONSTER: " + gv14F6(l0060).M548B + Chr(13) + Chr(10)
            l005C = l005C + Chr(13) + Chr(10)
            Select Case l0064.M4EEE
                Case mc007A
                    l005C = l005C + "All that is known about " + fn0E23(gv1A86, 2, l0068) + " is that they are " + gv05BC$(gv14F6(l0060).M5565) + " in Size."
                Case mc0086
                    l005C = l005C + "All that is known about " + fn0E23(gv1A86, 2, l0068) + " is that they are " + gv05BC$(gv14F6(l0060).M5565) + " sized " + gv1662(gv14F6(l0060).M4ED4).M548B + "s."
                Case mc0090, mc0092
                    l005C = l005C + fn0E23(gv1A86, 2, l0068) + " are " + gv05BC(gv14F6(l0060).M5565) + " sized " + gv1662(gv14F6(l0060).M4ED4).M548B + "s who are generally " + gv074C$(gv14F6(l0060).M4EBF) + " in nature." + Chr(13) + Chr(10)
                    l005C = l005C + "With an average A/D of " + CStr(gv14F6(l0060).M4E97) + "/" + CStr(gv14F6(l0060).M4EA1) + ", and average hits of " + CStr(gv14F6(l0060).M4EAC) + " and a "
                    For l005E = False To mc009A - 1
                        If  gv14F6(l0060).M55B5(l005E) > False Then
                            l005C = l005C + CStr(gv14F6(l0060).M55B5(l005E)) + " " + gv05EE$(l005E) + ", "
                        End If
                    Next l005E
                Case Else
            End Select
            Select Case l0064.M4EEE
                Case mc0092
                    l005C = l005C + "it is not yet known if or what special abilities this creature has."
                Case mc0090
                    l005C = l005C + "it is also known that these creatures"
                    l006C = ""
                    For l005E = False To mc00A2 - 1
                        If  fn0380(l005E, gv14F6(l0060).M55BE) Then
                            l006C = l006C + gv08DC$(l005E) + ", "
                        End If
                    Next l005E
                    l006A = False
                    For l005E = False To mc00AC - 1
                        If  fn0380(l005E, gv14F6(l0060).M5A35) Then
                            l006A = l006A + 1
                            l006C = l006C + gv090E$(l005E) + ", "
                        End If
                    Next l005E
                    For l005E = False To mc00B4 - 1
                        If  fn0380(l005E, gv14F6(l0060).M5A40) = True Then
                            l006C = l006C + Chr$(34) + gv07B0$(l005E) + Chr$(34) + " Spells, "
                        End If
                    Next l005E
                    If  l006C = "" Then
                        l005C = l005C + " have no special attacks or abilities."
                    Else
                        If  l006A = False Then
                            l005C = l005C + " abilities include: " + Left(l006C, Len(l006C) - 2) + "."
                        Else
                            l005C = l005C + " abilities and attacks include: " + Left(l006C, Len(l006C) - 2) + "."
                        End If
                    End If
                    l005C = l005C + Chr(13) + Chr(10)
                    l005C = l005C + fn0E23(gv1A86, 2, l0068) + " are "
                    l006A = False
                    For l005E = False To mc00BC - 1
                        If  gv14F6(l0060).M5548(l005E) > False Then
                            l006A = l006A + 1
                            l005C = l005C + CStr(gv14F6(l0060).M5548(l005E)) + "% " + gv0620$(l005E) + ", "
                        End If
                    Next l005E
                    If  l006A = False Then
                        l005C = l005C + "not resistant to anything."
                    Else
                        l005C = Left(l005C, Len(l005C) - 2)
                        l005C = l005C + " resistant."
                    End If
                Case Else
            End Select
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + Chr(13) + Chr(10)
            Select Case l0064.M4EEE
                Case mc0090
                    l005C = l005C + "It is estimated that all is known about this creature."
                Case mc0092
                    l005C = l005C + "It is estimated that almost everything is known about this creature."
                Case mc0086
                    l005C = l005C + "It is estimated that there is a good amount more to learn about this creature."
                Case mc007A
                    l005C = l005C + "It is estimated that very little is known about this creature."
            End Select
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + Chr(13) + Chr(10)
            If  l0064.M5C3D = False Then
                l005C = l005C + "There are no known deaths associated with this monster."
            Else
                l005C = l005C + "Records have it that Explorers have been killed by this creature " + CStr(l0064.M5C3D)
                If  l0064.M5C3D = 1 Then
                    l005C = l005C + " time."
                Else
                    l005C = l005C + " times."
                End If
            End If
            l005C = l005C + Chr(13) + Chr(10)
            If  l0064.M5C00 > False Then
                l005C = l005C + "A total of " + CStr(l0064.M5C00) + " of these creatures have been seen."
                l005C = l005C + Chr(13) + Chr(10)
            End If
            If  RTrim(l0064.M5C09) = "" Then
                l005C = l005C + "It is not known who first recorded this Creature."
            Else
                l005C = l005C + Chr(34) + RTrim(l0064.M5C09) + Chr(34) + " was the first to record this Creature."
            End If
            l005C = l005C + Chr(13) + Chr(10)
            If  RTrim(l0064.M5C2F) = "" Then
                l005C = l005C + "This creature was last seen by a lost character, "
            Else
                l005C = l005C + "This creature was last seen at " + RTrim(l0064.M5C2F) + ", "
            End If
            If  CLng(Date) = 0 Then
                l005C = l005C + "it is not known how many days ago."
            Else
                If  CLng(Date) = l0064.M5C21 Then
                    l005C = l005C + "just Today."
                Else
                    If  Abs(l0064.M5C21 - CLng(Date)) > 1 Then
                        l005C = l005C + CStr(Abs(l0064.M5C21 - CLng(Date))) + " days ago."
                    Else
                        l005C = l005C + "just 1 day ago."
                    End If
                End If
            End If
        Case mc0054
            For l005E = False To gv1BEC - 1
                If  gv1426(l005E).M548B = p0058 Then
                    l0060 = l005E
                    Exit For
                End If
            Next l005E
            If  l0060 = -1 Then
                fn1BBE = "ERROR looking up " + p0058 + "!"
                Exit Function
            End If
            sub0F9A l0060, mc0054, l0064
            l005C = "ITEM: " + gv1426(l0060).M548B + Chr(13) + Chr(10)
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + "This item is a member of the " + gv1592(gv1426(l0060).M5709).M548B + " class."
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + "Offering an A/D of " + CStr(gv1426(l0060).M4E97) + "/" + CStr(gv1426(l0060).M4EA1)
            If  l0064.M4EEE = mc0090 Then
                If  gv1426(l0060).M56F7 <> False And gv1592(gv1426(l0060).M5709).M54D5 = False Then
                    l005C = l005C + " and a damage modifier of " + CStr(gv1426(l0060).M56F7)
                End If
            End If
            l005C = l005C + " to a properly aligned character, this item "
            If  l0064.M4EEE = mc0090 Then
                If  gv1426(l0060).M572A Then
                    l005C = l005C + "is CURSED, "
                End If
            End If
            If  gv1426(l0060).M5700 > 0 Then
                If  gv1426(l0060).M56AF = 1 Then
                    l005C = l005C + "offers 1 swing and "
                ElseIf gv1426(l0060).M56AF > 1 Then
                    l005C = l005C + "offers " + CStr(gv1426(l0060).M56AF) + " swings and "
                End If
                l005C = l005C + "is a " + gv0846$(gv1426(l0060).M5700) + "-handed Item"
            Else
                l005C = l005C + "requires no hands"
            End If
            If  l0064.M4EEE = mc0090 Then
                If  gv1426(l0060).M56C4 Then
                    l005C = l005C + " and Casts " + Chr$(34) + gv152A(gv1426(l0060).M56C4 - 1).M548B + Chr$(34)
                    l005C = l005C + " up to " + CStr(gv1426(l0060).M56DB) + " times."
                Else
                    l005C = l005C + "."
                End If
            Else
                l005C = l005C + "."
            End If
            l005C = l005C + Chr(13) + Chr(10)
            l006C = ""
            If  l0064.M4EEE = mc0090 Then
                l005C = l005C + "This item "
                For l005E = False To mc00E4 - 1
                    If  fn0380(l005E, gv1426(l0060).M55BE) Then
                        l006C = l006C + gv0684$(l005E) + " Ability, "
                    End If
                Next l005E
                For l005E = False To mc00BC - 1
                    If  fn0380(l005E, gv1426(l0060).M5548) Then
                        l006C = l006C + gv0620$(l005E) + " Resistance, "
                    End If
                Next l005E
                If  l006C <> "" Then
                    l006C = Left(l006C, Len(l006C) - 2)
                    l005C = l005C + "also offers the following when equipped: " + l006C + "."
                Else
                    l005C = l005C + "offers no special abilities or resistances."
                End If
            End If
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + "Requiring "
            l006C = ""
            For l005E = False To mc009A - 1
                If  gv1426(l0060).M5712(l005E) <> False Then
                    l006C = l006C + CStr(gv1426(l0060).M5712(l005E)) + " " + gv05EE$(l005E) + ", "
                End If
            Next l005E
            If  Len(l006C) Then
                l006C = Left(l006C, Len(l006C) - 2)
                l005C = l005C + l006C + " to equip or use,"
            Else
                l005C = l005C + "no stats to equip or use,"
            End If
            l006C = ""
            For l005E = False To mc009A - 1
                If  gv1426(l0060).M571E(l005E) <> False Then
                    l006C = l006C + CStr(gv1426(l0060).M571E(l005E)) + " " + gv05EE$(l005E) + ", "
                End If
            Next l005E
            If  l0064.M4EEE = mc0090 Then
                If  Len(l006C) Then
                    l006C = Left(l006C, Len(l006C) - 2)
                End If
                Select Case gv1426(l0060).M56B9
                    Case 1 To 10
                        If  Len(l006C) Then
                            l005C = l005C + " and adding " + l006C + " permanently when used,"
                        End If
                    Case 11
                        l005C = l005C + " and adding 50 Spell Points when used,"
                    Case 12
                        l005C = l005C + " and adding 200 Spell Points when used,"
                    Case 13
                        l005C = l005C + " and subtracting 1 year of age when used,"
                    Case 14
                        l005C = l005C + " and subtracting 10 years of age when used,"
                    Case Else
                        If  Len(l006C) Then
                            l005C = l005C + " and modifying " + l006C + " when equipped,"
                        End If
                End Select
            End If
            If  l0064.M4EEE = mc0090 Then
                If  gv1426(l0060).M5742 = True Then
                    l005C = l005C + " this is a Class Restricted Item "
                Else
                    l005C = l005C + " this is a non-Class Restricted Item "
                End If
                l005C = l005C + "that is usable by the following Guilds: "
            Else
                l005C = l005C + " this item is usable by the following Guilds: "
            End If
            For l005E = False To gv1BEA - 1
                If  fn0380(l005E, gv1426(l0060).M56E6) Then
                    l005C = l005C + gv145A(l005E).M548B
                    If  l0064.M4EEE = mc0090 Then
                        l005C = l005C + " (" + CStr(fn030F(l0060, l005E)) + "), "
                    Else
                        l005C = l005C + ", "
                    End If
                End If
            Next l005E
            l005C = Left(l005C, Len(l005C) - 2) + "."
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + Chr(13) + Chr(10)
            Select Case l0064.M4EEE
                Case mc0090
                    l005C = l005C + "It is estimated that all is known about this Item."
                Case Else
                    l005C = l005C + "It is estimated that almost everything is known about this Item."
            End Select
            l005C = l005C + Chr(13) + Chr(10)
            l005C = l005C + Chr(13) + Chr(10)
            If  l0064.M5C00 > 0 Then
                l005C = l005C + "Reports have it that " + CStr(l0064.M5C00) + " of these items have been found, the last one from a "
                If  l0064.M5C14 >= False Then
                    l005C = l005C + gv14F6(fn0E0D(l0064.M5C14)).M548B + " on level " + RTrim(l0064.M5C2F)
                Else
                    l005C = l005C + "unknown monster on level " + RTrim(l0064.M5C2F)
                End If
                If  CLng(Date) = 0 Then
                    l005C = l005C + "it is not known how many days ago."
                Else
                    If  CLng(Date) = l0064.M5C21 Then
                        l005C = l005C + " just Today."
                    Else
                        If  Abs(l0064.M5C21 - CLng(Date)) > 1 Then
                            l005C = l005C + ", " + CStr(Abs(l0064.M5C21 - CLng(Date))) + " days ago."
                        Else
                            l005C = l005C + ", just 1 day ago."
                        End If
                    End If
                End If
                l005C = l005C + Chr(13) + Chr(10)
            End If
            If  RTrim(l0064.M5C09) = "" Then
                l005C = l005C + "It is not known who first recorded this Item."
            Else
                l005C = l005C + Chr(34) + RTrim(l0064.M5C09) + Chr(34) + " was the first to record this Item."
            End If
        Case Else
    End Select
    fn1BBE = l005C
End Function

Function fn1BD5 (p00FC As Integer ' 41) As Integer ' 1
Dim l00FE ' 80
    On Error GoTo L57898
    If  gv1408 = False Then
        Exit Function
    End If
    Select Case p00FC
        Case m0052
            Get #gv1408, 4, l00FE
        Case mc0054
            Get #gv1408, 5, l00FE
        Case Else
    End Select
    fn1BD5 = l00FE
    Exit Function

L57898:
    Resume L578A4
L578A4:
End Function

Sub sub1043 (p0100 ' 40, p0102 ' 40, ByVal pv0104 As Currency ' 85)
Dim l0108 As T73E9 ' 8A
Dim l010A As Integer ' 81
Dim l010C As String ' 87
Dim l010E As Integer ' 81
Dim l0110 As Integer ' 81
Dim l0112 As Currency ' 85
Dim l0114 ' 80
Static m0120 As Integer ' 61
Static m0122 As Integer ' 61
    On Error GoTo L57F8C
    l010A = fn1C07(p0100, l0108)
    Select Case p0100
        Case gc2A56
            l010E = fn1BF0(gc2A56, p0102, CInt(pv0104))
            If  l010E <= fn1BF0(gc2A56, p0102, CInt(l0108.M73F5)) Then
                Exit Sub
            Else
                l0108.M73F5 = -1
            End If
        Case gc2A58
            For l0114 = False To gv1BEA - 1
                If  gv14C2(p0102).M5584(l0114).M4E82 > False Then
                    If  l0114 <> gv14C2(p0102).M58BB Then
                        l0112 = l0112 + gv14C2(p0102).M5584(l0114).M579B
                    Else
                        l0112 = l0112 + gv14C2(p0102).M579B
                    End If
                End If
            Next l0114
            If  l0112 > l0108.M73F5 Then
                pv0104 = l0112
            Else
                Exit Sub
            End If
        Case Else
    End Select
    If  pv0104 > l0108.M73F5 Then
        l0108.M73F5 = pv0104
        If  RTrim(l0108.M73FE) = RTrim(gv14C2(p0102).M548B) Then
            l0110 = True
        End If
        l0108.M73FE = RTrim(gv14C2(p0102).M548B)
        l0108.M7406 = CLng(Date)
        l010A = fn1C1A(p0100, l0108)
        Select Case p0100
            Case gv2A4A
                l010C = "Strongest Character"
            Case gc2A4C
                l010C = "most Intelligent Character"
            Case gc2A4E
                l010C = "Wisest Character"
            Case gc2A50
                l010C = "Healthiest Character"
            Case gc2A52
                l010C = "most Attractive Character"
            Case gc2A54
                l010C = "Quickest Character"
            Case gc2A56
                l010C = "most powerful creature defeated"
                l0110 = True
            Case gc2A58
                l010C = "most experience"
            Case gc2A5A
                l010C = "wealthiest character"
            Case gc2A5C
                l010C = "highest fighting ability"
            Case gc2A5E
                l010C = "highest spell knowledge & power level"
            Case gc2A60
                l010C = "highest thieving ability"
            Case Else
        End Select
        If  l0110 = True Then
            Exit Sub
        End If
        If  gv1B52 = True Then
            If  UBound(gv14C2) = m0120 Then
                sub085B "You have just set the record for " + l010C + "!"
            Else
                sub085B Chr(34) + RTrim(gv14C2(p0102).M548B) + Chr(34) + " just set the record for " + l010C + "!"
            End If
        End If
        sub0578 gv14C2(p0102).M58BB, Chr(34) + RTrim(gv14C2(p0102).M548B) + Chr(34) + " set the record for " + l010C + " with a value of " + fn036D(CCur(l0108.M73F5), m0122) + "."
    End If
    Exit Sub

L57F8C:
    sub04FC "Error '" + Error + "' occurred in HALL:mdrhalCheckRecord."
    Resume L57FF6
L57FF6:
End Sub

Function fn1BF0 (p0128 As Integer ' 41, p012A As Integer ' 41, p012C As Integer ' 41) As Integer ' 1
Dim l012E As Integer ' 81
Dim l0130 As Long ' 82
Dim l0132 ' 80
Dim l0134 ' 80
Dim l0136 As Integer ' 81
Dim l0138 As Single ' 83
Static m013A As Integer ' 61
' Const mc013C = 5 ' &H5%
' Const mc013E = 4 ' &H4%
' Const mc0142 = 2 ' &H2%
' Const mc0144 = 1 ' &H1%
' Const mc0146 = 3 ' &H3%
Static m014A As Integer ' 61
    l0136 = -1
    On Error GoTo L585EE
    Select Case p0128
        Case gc2A56
            For l0132 = False To gv1BF6 - 1
                If  gv14F6(l0132).M5467 = p012C Then
                    l0136 = l0132
                    Exit For
                End If
            Next l0132
            If  l0136 > -1 Then
                l012E = (gv14F6(l0136).M4E97 * 2) + (gv14F6(l0136).M55B5(m013A) * 10) + (gv14F6(l0136).M4EAC / 10)
                l012E = l012E + (gv14F6(l0136).M55B5(mc013C) * 2) + gv14F6(l0136).M5A7C
                For l0132 = False To mc00AC - 1
                    If  fn0380(l0132, gv14F6(l0136).M5A35) Then
                        l012E = l012E + 75
                    End If
                Next l0132
                For l0132 = False To mc00B4 - 1
                    If  fn0380(l0132, gv14F6(l0136).M5A40) Then
                        l012E = l012E + 100
                    End If
                Next l0132
                fn1BF0 = l012E
            End If
        Case gc2A5C
            l0130 = 100 + (100 * .2#) + (100 * .2#) + (100 * .2#)
            l012E = fn11E9(p012A, mc013E)
            l012E = l012E + (fn11E9(p012A, mc0142) * .2#)
            l012E = l012E + (fn11E9(p012A, mc0144) * .2#)
            l012E = l012E + (fn11E9(p012A, mc0146) * .2#)
            fn1BF0 = (l012E / l0130) * 100
        Case gc2A5E
            l012E = False
            l0130 = False
            For l0132 = False To gv1BF8 - 1
                l0130 = l0130 + (gv152A(l0132).M4E82 * 10)
            Next l0132
            l0130 = l0130 + (255 * gv1BF8)
            For l0134 = False To gv1BF8 - 1
                For l0132 = False To gv1BEA - 1
                    If  gv14C2(p012A).M5584(l0132).M4E82 > False Then
                        If  gv145A(l0132).M55F6(gv152A(l0134).M5709, 0) > False Then
                            l0138 = gv145A(l0132).M55F6(gv152A(l0134).M5709, 0)
                            If  (gv152A(l0134).M4E82 * l0138) <= ((gv14C2(p012A).M5584(l0132).M4E82 / 2) + .5#) Then
                                l012E = l012E + (gv152A(l0134).M4E82 * 10)
                                l012E = l012E + ((gv14C2(p012A).M5584(l0132).M4E82 / 2) + .5#)
                                Exit For
                            End If
                        End If
                    End If
                Next l0132
            Next l0134
            fn1BF0 = (l012E / l0130) * 100
        Case gc2A60
            l0130 = 100 * 35
            l012E = fn11E9(p012A, m014A) * (gv14C2(p012A).M55B5(mc013C) + gv14C2(p012A).M584B(mc013C))
            If  l012E < 1 Then l012E = 1
            fn1BF0 = (l012E / l0130) * 100
        Case Else
    End Select
    Exit Function

L585EE:
    sub04FC "Error '" + Error + "' occurred in HALL:mdrhalGetIndexValue."
    Resume L5865A
L5865A:
End Function

Function fn1C07 (p014E As Integer ' 41, p0152 ' 40) As Integer ' 1
' Const mc0156 = 45 ' &H2D%
    On Error GoTo L586D2
    If  gv2A64 = False Then
        gv2A64 = FreeFile
        Open gv19E8 + gc1C74 + gc1C40 For Random As #gv2A64 Len = mc0156
    End If
    Get #gv2A64, p014E + 1, p0152
    fn1C07 = True
    Exit Function

L586D2:
    Resume L586DE
L586DE:
End Function

Function fn1C1A (p015A As Integer ' 41, p015E ' 40) As Integer ' 1
    On Error GoTo L58756
    If  gv2A64 = False Then
        gv2A64 = FreeFile
        Open gv19E8 + gc1C74 + gc1C40 For Random As #gv2A64 Len = mc0156
    End If
    Put #gv2A64, p015A + 1, p015E
    fn1C1A = True
    Exit Function

L58756:
    Resume L58762
L58762:
End Function

Function fn1C2E () As Integer ' 1
Dim l0162 ' 80
Dim l0164 As Integer ' 81
' Const mc0168 = 100 ' &H64%
' Const mc016A = 64 ' &H40%
    On Error GoTo L58838
    If  gv1408 = False Then
        gv1408 = FreeFile
        Open gv19E8 + gc1C74 + gc1C3C For Random As #gv1408 Len = mc0168
    End If
    Get #gv1408, 2, l0162
    If  l0162 <> gv1BF6 Then
        l0164 = True
    End If
    Get #gv1408, 3, l0162
    If  l0162 <> gv1BEC Then
        l0164 = True
    End If
    If  l0164 Then
        sub1C40
    End If
    fn1C2E = True
    Exit Function

L58838:
    Select Case Err
        Case 70
            MsgBox "A '" + Error + "' error was returned trying to open the Library file.  This probably means that another user is currently playing Mordor.  Only one person can play this version of Mordor at a time." + Chr(13) + Chr(13) + "Shutting Down...", mc016A, "Possible Sharing Violation"
            End
        Case Else
    End Select
    Resume L589A8
L589A8:
End Function

Sub sub0FCB (p016C As Integer ' 41, p016E As Integer ' 41, p0172 ' 40)
Dim l0176 ' 80
    On Error GoTo L58A6A
    If  gv1408 = False Then
        Exit Sub
    End If
    Get #gv1408, 2, l0176
    Select Case p016E
        Case m0052
            Put #gv1408, p016C + 6, p0172
        Case mc0054
            Put #gv1408, p016C + 6 + l0176, p0172
        Case Else
    End Select
    Exit Sub

L58A6A:
    Resume L58A76
L58A76:
End Sub

Sub sub0FB0 (p0178 As Integer ' 41, p017A ' 40)
    On Error GoTo L58B12
    If  gv1408 = False Then
        Exit Sub
    End If
    Select Case p0178
        Case m0052
            Put #gv1408, 4, p017A
        Case mc0054
            Put #gv1408, 5, p017A
        Case Else
    End Select
    Exit Sub

L58B12:
    Resume L58B1E
L58B1E:
End Sub

Sub sub1C40 ()
Dim l017E ' 80
Dim l0180 ' 80
Dim l0182 ' 80
Dim l0184 ' 80
Dim l0186 ' 80
Dim l0188 ' 80
Dim l018A As Integer ' 81
Dim l018E As T5BF1 ' 8A
Dim l0192 As String ' 87
Dim l019A() As T5BF1 ' 9A
Dim l01A2() As T5BF1 ' 9A
    On Error GoTo L58F6A
    frmWelcome!lblLoading.Caption = "Updating/Re-indexing Library File..."
    Get #gv1408, 2, l017E
    Get #gv1408, 3, l0180
    Get #gv1408, 4, l0182
    Get #gv1408, 5, l0184
    ReDim l019A(l017E - 1)        As T5BF1
    For l0186 = 0 To l017E - 1
        Get #gv1408, 6 + l0186, l019A(l0186)
    Next l0186
    ReDim l01A2(l0180 - 1)         As T5BF1
    For l0186 = 0 To l0180 - 1
        Get #gv1408, 6 + l0186 + l017E, l01A2(l0186)
    Next l0186
    Close #gv1408
    If  fn034F(gv19E8 + gc1C74 + gc1C3C) Then Kill gv19E8 + gc1C74 + gc1C3C
    gv1408 = FreeFile
    Open gv19E8 + gc1C74 + gc1C3C For Random As #gv1408 Len = mc0168
    l0192 = gc0186
    Put #gv1408, 1, l0192
    l018A = gv1BF6
    Put #gv1408, , l018A
    l018A = gv1BEC
    Put #gv1408, , l018A
    Put #gv1408, , l0182
    Put #gv1408, , l0184
    For l0186 = False To gv1BF6 - 1
        l018E.M4EEE = False
        l018E.M5C09 = ""
        l018E.M5C00 = 0
        l018E.M5C21 = 0
        l018E.M5C2F = ""
        l018E.M5C3D = 0
        For l0188 = 0 To l017E - 1
            If  gv14F6(l0186).M5467 = l019A(l0188).M5467 Then
                l018E = l019A(l0188)
                Exit For
            End If
        Next l0188
        Put #gv1408, , l018E
    Next l0186
    For l0186 = False To gv1BEC - 1
        l018E.M4EEE = False
        l018E.M5C00 = 0
        l018E.M5C09 = ""
        l018E.M5C21 = 0
        l018E.M5C2F = ""
        l018E.M5C3D = 0
        For l0188 = 0 To l0180 - 1
            If  gv1426(l0186).M5467 = l01A2(l0188).M5467 Then
                l018E = l01A2(l0188)
                Exit For
            End If
        Next l0188
        Put #gv1408, , l018E
    Next l0186
    Put #gv1408, 4, l0182
    Put #gv1408, 5, l0184
    Exit Sub

L58F6A:
    MsgBox "Error '" + Error + "' occurred in MAINMOD:mdrUpdateLibraryFile!", mc0042, "Error!"
    Resume L58FE0
L58FE0:
End Sub
