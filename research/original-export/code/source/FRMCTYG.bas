' FRMCTYG.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Const mc001E = 299 ' &H12B%
Const m003A = 0 ' &H0%
Const mc0040 = 1 ' &H1%
Const mc004C = 2 ' &H2%
Const mc0058 = 64 ' &H40%
Const mc006A = 6 ' &H6%
Const mc0074 = 18 ' &H12%
Const mc0076 = 40 ' &H28%
Const mc0078 = 1 ' &H1%
Const mc007A = 48 ' &H30%
Const mc008C = 1 ' &H1%
Const mc00BC = 999 ' &H3E7%
Const mc00BE = 32 ' &H20%
Const mc00C0 = 4 ' &H4%
Const mc00C2 = 6 ' &H6%
Const mc00C4 = 4 ' &H4%
Const mc00D8 = 3 ' &H3%
Const mc00DA = 3 ' &H3%
Const mc00DC = 10 ' &HA%
Const mc00DE = 53 ' &H35%
Const mc0100 = 128 ' &H80%
Const mc0102 = 9 ' &H9%
Const mc0106 = 10 ' &HA%
Const mc0108 = 11 ' &HB%
Const mc013C = 12 ' &HC%
Const m013E = 0 ' &H0%
Const mc0142 = 6 ' &H6%
Const mc017A = 40 ' &H28%
Const mc01D6 = 38 ' &H26%

Sub cmdExit_Click ()
    Unload frmCityGuild
    sub0792 frmCityMain
    frmCityMain.SetFocus
End Sub

Sub cmdInfo_Click ()
Dim l0028 As String ' 87
Dim l002A As Integer ' 81
Dim l002C ' 80
' Const m003A = 0 ' &H0%
' Const mc0040 = 1 ' &H1%
' Const mc004C = 2 ' &H2%
' Const mc0058 = 64 ' &H40%
    l0028 = "We require you to have " + fn036D(CCur(fn124B(gv14C2(gv1A86))), m003A) + " experience to make the next level." + Chr(13)
    l0028 = l0028 + "You currently have " + fn036D(CCur(gv14C2(gv1A86).M579B), m003A) + " experience." + Chr(13)
    l0028 = l0028 + "We also require " + fn036D(CCur(fn125C(gv14C2(gv1A86))), m003A) + " gold." + Chr(13)
    l0028 = l0028 + "You currently have " + fn036D(CCur(gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF), m003A) + " gold." + Chr(13)
    If  gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M55CB > 0 Then
        l0028 = l0028 + Chr(13) + "You have also been assigned a Quest to complete." + Chr(13)
        Select Case gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M55CB
            Case mc0040
                For l002C = 0 To gv1BF6 - 1
                    If  gv14F6(l002C).M5467 = gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M57A9 Then
                        l002A = l002C
                        Exit For
                    End If
                Next l002C
                l0028 = l0028 + "You must kill one " + gv14F6(l002A).M548B + "." + Chr(13)
            Case mc004C
                For l002C = 0 To gv1BEC - 1
                    If  gv1426(l002C).M5467 = gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M57A9 Then
                        l002A = l002C
                        Exit For
                    End If
                Next l002C
                l0028 = l0028 + "You must return with one " + gv1426(l002A).M548B + " and present it when making level." + Chr(13)
        End Select
        If  gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M57B2 Then
            l0028 = l0028 + "Your quest has been completed."
        End If
    End If
    MsgBox l0028, mc0058, "Current Experience Information"
End Sub

Sub cmdJoin_Click ()
Dim l005A As Integer ' 81
Dim l005C As Integer ' 81
Dim l005E As Currency ' 85
Dim l0060 As String ' 87
Dim l0062 As Integer ' 81
Dim l0064 ' 80
' Const mc006A = 6 ' &H6%
' Const mc0074 = 18 ' &H12%
' Const mc0076 = 40 ' &H28%
' Const mc0078 = 1 ' &H1%
' Const mc007A = 48 ' &H30%
' Const mc008C = 1 ' &H1%
    l005C = gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82
    If  gv14C2(gv1A86).M5584(m001A%).M4E82 = 0 Then
        For l0064 = 0 To gv1BEA - 1
            If  l0064 <> gv14C2(gv1A86).M58BB Then
                If  gv14C2(gv1A86).M5584(l0064).M4E82 > 0 Then
                    l005A = l005A + 1
                    If  gv14C2(gv1A86).M5584(l0064).M4E82 > l005C Then
                        l005C = gv14C2(gv1A86).M5584(l0064).M4E82
                    End If
                End If
            End If
        Next l0064
        l0060 = ""
        If  fn131D(gv1A86) < 10 Then
            l0060 = "A WARNING!" + Chr$(13)
            l0060 = l0060 + "Your combined experience is below that which is recommended." + Chr$(13)
            l0060 = l0060 + "Our requirements for advancement may be too difficult for you at this point." + Chr$(13) + Chr$(13)
        End If
        If  l005A > False Then
            l005E = False
            For l0064 = 0 To mc006A - 1
                If  gv145A(m001A%).M55BE(l0064) > False Then
                    l005E = l005E + ((gv145A(m001A%).M55BE(l0064) + 1) * 1.25#)
                End If
            Next l0064
            For l0064 = 0 To mc0074 - 1
                If  gv145A(m001A%).M55F6(l0064, 1) > False Then
                    l005E = l005E + (gv145A(m001A%).M55F6(l0064, 1) / 3)
                End If
            Next l0064
            l005E = l005E * (l005E * 5356)
            l0060 = l0060 + "Cost to join the " + gv145A(m001A%).M548B + "'s guild" + Chr$(13) + "is " + fn036D(CCur(l005E), m003A) + "." + Chr$(13) + "Do you wish to join?"
        Else
            l0060 = l0060 + "Join the " + gv145A(m001A%).M548B + "'s guild?"
        End If
        If  MsgBox(l0060, 36, "JOIN GUILD") <> 6 Then
            Exit Sub
        End If
    End If
    For l0064 = 0 To mc0076 - 1
        If  gv14C2(gv1A86).M5857(l0064).M572A <> False And gv14C2(gv1A86).M5857(l0064).M577E = mc0078 Then
            l0062 = MsgBox("Your Aura is Tainted with one or more cursed items!", mc007A, "Join Guild")
            Exit Sub
        End If
    Next l0064
    If  l005A > 0 And gv14C2(gv1A86).M5584(m001A%).M4E82 = 0 Then
        If  fn114E(CLng(l005E)) = False Then
            l0062 = MsgBox("Not enough gold!", mc007A, "Join Guild")
            Exit Sub
        End If
    End If
    gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M579B = gv14C2(gv1A86).M579B
    gv14C2(gv1A86).M58BB = m001A%
    gv14C2(gv1A86).M579B = gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M579B
    If  gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82 = False Then
        sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " joined our guild."
        gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82 = 1
    End If
    gv14C2(gv1A86).M5970 = fn1397(gv14C2(gv1A86))
    If  gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82 >= gv145A(gv14C2(gv1A86).M58BB).M559A Then
        gv14C2(gv1A86).M59A1 = fn137E(gv14C2(gv1A86).M58BB, gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82)
    End If
    If  fn1139(gv1A86, False) = True Then
        sub085B "GUILD: One or more items were unequipped when you joined..."
    End If
    sub08A9 False, 50
    frmCharStat3!cmbClass.Clear
    sub1602
    sub294F
    sub2962
    sub2974
End Sub

Sub cmdLibrary_Click ()
    frmLibrary.Show mc008C
End Sub

Sub cmdLog_Click ()
    frmGuildLog.Tag = CStr(m001A%)
    frmGuildLog.Show mc008C
End Sub

Sub cmdMake_Click ()
Dim l0092 As Integer ' 81
Dim l0094 As Integer ' 81
Dim l0096 As Integer ' 81
Dim l0098 As Integer ' 81
Dim l009A As Integer ' 81
Dim l009E As Integer ' 81
Dim l00A0 As String ' 87
Dim l00A2 As Integer ' 81
Dim l00A4 As Integer ' 81
Dim l00A6 ' 80
Dim l00A8 ' 80
Dim l00AA As String ' 87
Dim l00AC As Integer ' 81
Dim l00AE As Integer ' 81
Dim l00B0 As Integer ' 81
Dim l00B2 As Single ' 83
Dim l00B6() As Integer ' 91
' Const mc00BC = 999 ' &H3E7%
' Const mc00BE = 32 ' &H20%
' Const mc00C0 = 4 ' &H4%
' Const mc00C2 = 6 ' &H6%
' Const mc00C4 = 4 ' &H4%
' Const mc00D8 = 3 ' &H3%
' Const mc00DA = 3 ' &H3%
' Const mc00DC = 10 ' &HA%
' Const mc00DE = 53 ' &H35%
Dim l00F8 As Integer ' 81
' Const mc0100 = 128 ' &H80%
' Const mc0102 = 9 ' &H9%
' Const mc0106 = 10 ' &HA%
' Const mc0108 = 11 ' &HB%
Dim l010E As Integer ' 81
Dim l0110 As Integer ' 81
Dim l0112 As Integer ' 81
Dim l0114 As Integer ' 81
Dim l0116 As Integer ' 81
Dim l0118 As Integer ' 81
Dim l0122 As Integer ' 81
Dim l0124 As Integer ' 81
Dim l0126 As Integer ' 81
Dim l0128 As Integer ' 81
    ReDim l00B6(gv1BF8 - 1)        As Integer
    On Error GoTo L6C5CC
    l0094 = gv14C2(gv1A86).M58BB
    If  gv14C2(gv1A86).M5584(l0094).M4E82 >= mc00BC Then
        sub085B "You cannot learn any more from this Guild."
        Exit Sub
    End If
    If  gv14C2(gv1A86).M579B < fn124B(gv14C2(gv1A86)) Then
        MsgBox "You do not currently have enough experience to make a level.", mc0058, "Make Level"
        cmdInfo_Click
        Exit Sub
    End If
    If  gv14C2(gv1A86).M5584(l0094).M55CB = mc0040 Then
        If  gv14C2(gv1A86).M5584(l0094).M57B2 = False Then
            l00A0 = "Quest has not been completed!"
            For l00A6 = 0 To gv1BF6 - 1
                If  gv14F6(l00A6).M5467 = gv14C2(gv1A86).M5584(l0094).M57A9 Then
                    l00A0 = l00A0 + Chr$(13) + "You must have defeated one " + gv14F6(l00A6).M548B + "."
                    Exit For
                End If
            Next l00A6
            If  gv14C2(gv1A86).M579B >= gv14C2(gv1A86).M5970 Then
                l00A0 = l00A0 + Chr(13) + Chr(13) + "Since you are pinned and have not yet completed your quest, "
                l00A0 = l00A0 + "you are given the opportunity of filing for forfeit.  Do you wish to do so?"
                If  MsgBox(l00A0, mc00BE & mc00C0, "Make Level") = mc00C2 Then
                    l00AC = True
                Else
                    Exit Sub
                End If
            Else
                l00A4 = MsgBox(l00A0, mc007A, "MAKE LEVEL")
                Exit Sub
            End If
        End If
    End If
    l00A2 = False
    If  gv14C2(gv1A86).M5584(l0094).M55CB = mc004C Then
        For l00A6 = 0 To mc0076 - 1
            If  gv1426(gv14C2(gv1A86).M5857(l00A6).M4ED4).M5467 = gv14C2(gv1A86).M5584(l0094).M57A9 Then
                l00A2 = l00A6
                Exit For
            End If
        Next l00A6
        If  l00A2 > 0 Then
            gv14C2(gv1A86).M5906(mc00C4) = gv14C2(gv1A86).M5906(mc00C4) + 1
            sub0EDA gv1A86, l00A2
        Else
            For l00A6 = False To gv1BEC - 1
                If  gv1426(l00A6).M5467 = gv14C2(gv1A86).M5584(l0094).M57A9 Then
                    l00A0 = "Quest has not been completed!"
                    l00A0 = l00A0 + Chr$(13) + "You must return with one " + gv1426(l00A6).M548B + "."
                    Exit For
                End If
            Next l00A6
            If  gv14C2(gv1A86).M579B >= gv14C2(gv1A86).M5970 Then
                l00A0 = l00A0 + Chr(13) + "Since you are pinned and have not yet completed your quest,"
                l00A0 = l00A0 + " you are given the opportunity of filing for forfeit.  Do you wish to do so?"
                If  MsgBox(l00A0, mc00BE & mc00C0, "Make Level") = mc00C2 Then
                    l00AC = True
                Else
                    Exit Sub
                End If
            Else
                l00A4 = MsgBox(l00A0, mc007A, "MAKE LEVEL")
                Exit Sub
            End If
        End If
    End If
    If  l00AC = True Then
        l00AE = Int(Log(gv14C2(gv1A86).M5584(l0094).M4E82 + 1))
        l00A0 = "If you forfeit this quest, you will be reduced to level " + CStr(gv14C2(gv1A86).M5584(l0094).M4E82 - l00AE) + ".  This means that "
        l00A0 = l00A0 + "you will lose any attack, defense, abilities and other guild bonuses given to you within "
        l00A0 = l00A0 + "the levels you have made since you were level " + CStr(gv14C2(gv1A86).M5584(l0094).M4E82 - l00AE) + "." + Chr(13) + Chr(13)
        l00A0 = l00A0 + "Once you forfeit, it is done." + Chr(13) + Chr(13)
        l00A0 = l00A0 + "Do you wish to forfeit your quest?"
        If  MsgBox(l00A0, mc00BE & mc00C0, "forfeit Quest") = mc00C2 Then
            sub29BD l0094, l00AE
        End If
        Exit Sub
    End If
    If  fn114E(fn125C(gv14C2(gv1A86))) = False Then
        MsgBox "You currently do not have enough gold to make a level.", mc0058, "Make Level"
        cmdInfo_Click
        Exit Sub
    End If
    l00AA = fn126E(gv1A86)
    l00B0 = Int((gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M4E82 / 2) + .5#)
    l00B2 = 0
    For l00A8 = 0 To gv1BF8 - 1
        For l00A6 = 0 To gv1BEA - 1
            If  gv14C2(gv1A86).M5584(l00A6).M4E82 > False Then
                If  gv145A(l00A6).M55F6(gv152A(l00A8).M5709, 0) > 0 Then
                    If  gv152A(l00A8).M4E82 <= gv145A(l00A6).M55F6(gv152A(l00A8).M5709, 1) Then
                        l00B2 = gv145A(l00A6).M55F6(gv152A(l00A8).M5709, 0)
                        If  (gv152A(l00A8).M4E82 * l00B2) <= ((gv14C2(gv1A86).M5584(l00A6).M4E82 / 2) + .5#) Then
                            l00B6(l00A8) = True
                        End If
                    End If
                End If
            End If
        Next l00A6
    Next l00A8
    gv14C2(gv1A86).M5584(l0094).M4E82 = gv14C2(gv1A86).M5584(l0094).M4E82 + 1
    l0092 = gv14C2(gv1A86).M5584(l0094).M4E82
    If  fn126E(gv1A86) <> l00AA Then
        sub085B UCase(gv145A(l0094).M548B) + "'S GUILD: " + fn136C(gv1A86) + " appointed the title of " + Chr(34) + fn126E(gv1A86) + Chr(34) + " for reaching Level " + CStr(l0092) + "."
        sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " was appointed the title of " + Chr(34) + fn126E(gv1A86) + Chr(34) + " for reaching Level " + CStr(l0092) + "."
    End If
    l00A4 = False
    l00B2 = 0
    For l00A8 = 0 To gv1BF8 - 1
        For l00A6 = 0 To gv1BEA - 1
            If  gv14C2(gv1A86).M5584(l00A6).M4E82 > False Then
                If  gv145A(l00A6).M55F6(gv152A(l00A8).M5709, 0) > 0 Then
                    If  gv152A(l00A8).M4E82 <= gv145A(l00A6).M55F6(gv152A(l00A8).M5709, 1) Then
                        l00B2 = gv145A(l00A6).M55F6(gv152A(l00A8).M5709, 0)
                        If  (gv152A(l00A8).M4E82 * l00B2) <= ((gv14C2(gv1A86).M5584(l00A6).M4E82 / 2) + .5#) Then
                            If  l00B6(l00A8) = False Then
                                If  l00A4 = False Then
                                    l00A4 = True
                                    sub085B "Your spell knowledge has increased!"
                                End If
                                sub085B "Of the " + gv07B0(gv152A(l00A8).M5709) + " class, you learned " + Chr(34) + gv152A(l00A8).M548B + Chr(34)
                            End If
                        End If
                    End If
                End If
            End If
        Next l00A6
    Next l00A8
    l0096 = True
    For l00A6 = 0 To gv1BEA - 1
        If  l00A6 <> gv14C2(gv1A86).M58BB Then
            If  gv14C2(gv1A86).M5584(l00A6).M4E82 >= l0092 Then
                l0096 = False
            End If
        End If
    Next l00A6
    If  l0092 > gv145A(l0094).M559A Or l0096 = False Then
        If  l0096 = True Then
            gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 + gv145A(l0094).M55A4
        End If
        Else
        l0098 = gv145A(l0094).M5591
        l009A = Int(Rnd * 3) + 1
        Select Case l009A
            Case 1
                gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 + Int(Rnd * gv145A(l0094).M5591 / 5) + 1
            Case 2
                gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 + Int(Rnd * gv145A(l0094).M5591 / 5) + 1
        End Select
        gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 + l0098
        If  gv14C2(gv1A86).M55B5(mc00D8) > 16 And l0092 < gv145A(l0094).M559A Then
            gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 + Int(Rnd * (gv14C2(gv1A86).M55B5(mc00D8) - 16)) + 1
        End If
    End If
    If  gv14C2(gv1A86).M4EB4 > 999 Then
        gv14C2(gv1A86).M4EB4 = 999
    End If
    gv14C2(gv1A86).M4EAC = gv14C2(gv1A86).M4EB4
    If  gv14C2(gv1A86).M5584(l0094).M4E82 <= gv145A(l0094).M561A Then
        If  gv14C2(gv1A86).M5584(l0094).M4E82 <= gv145A(l0094).M559A Then
            l009E = gv14C2(gv1A86).M5584(l0094).M4E82 Mod Int(gv145A(l0094).M5626)
        Else
            If  gv14C2(gv1A86).M59A1 < gv14C2(gv1A86).M5584(l0094).M4E82 Then
                gv14C2(gv1A86).M59A1 = fn137E(l0094, gv14C2(gv1A86).M5584(l0094).M4E82)
            End If
            l009E = gv14C2(gv1A86).M5584(l0094).M4E82 Mod gv14C2(gv1A86).M59A1
        End If
        If  l009E = False Then
            sub29D0 gv14C2(gv1A86).M58BB, False
            If  gv14C2(gv1A86).M5584(l0094).M4E82 >= gv145A(l0094).M559A Then
                gv14C2(gv1A86).M59A1 = fn137E(l0094, gv14C2(gv1A86).M5584(l0094).M4E82)
            End If
        End If
        gv14C2(gv1A86).M59A1 = fn137E(l0094, gv14C2(gv1A86).M5584(l0094).M4E82)
    End If
    If  gv145A(l0094).M55BE(mc00DA) > False Then
        l00A4 = Log((10 - gv145A(l0094).M55BE(mc00DA)) + 1) * 50
        l009E = False
        For l00A6 = 1 To gv14C2(gv1A86).M5584(l0094).M4E82
            If  l00A6 > l00A4 Then
                l009E = l009E + 1
                l00A4 = Log((10 - gv145A(l0094).M55BE(mc00DA)) + 1) * (l00A4 * 2)
            End If
        Next l00A6
        If  l009E > gv14C2(gv1A86).M56AF Then
            gv14C2(gv1A86).M56AF = l009E
        End If
    End If
    sub08A9 False, 50
    For l00A6 = 0 To mc00DC - 1
        sub0F4C l00A6
    Next l00A6
    sub0BF1
    sub086D mc00DE
    l00A4 = MsgBox("Congratulations!" + Chr$(13) + "You are now Level" + Str$(l0092) + "!", 64, "MAKE LEVEL")
    If  gv14C2(gv1A86).M579B < fn124B(gv14C2(gv1A86)) Then
        cmdMake.Enabled = False
    End If
    If  gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF < fn125C(gv14C2(gv1A86)) Then
        cmdMake.Enabled = False
    End If
    If  cmdMake.Enabled = False Then
        cmdExit.SetFocus
    End If
    For l00A6 = 0 To mc0076 - 1
        If  gv14C2(gv1A86).M5857(l00A6).M4ED4 > False Then
            If  fn129A(gv1A86, gv14C2(gv1A86).M5857(l00A6).M4ED4) < gv14C2(gv1A86).M5857(l00A6).M4EEE Then
                gv14C2(gv1A86).M5857(l00A6).M4EEE = fn129A(gv1A86, gv14C2(gv1A86).M5857(l00A6).M4ED4)
                l00AA = fn12EF(gv14C2(gv1A86).M5857(l00A6).M4ED4, gv14C2(gv1A86).M5857(l00A6).M4EEE, gv14C2(gv1A86).M5857(l00A6).M4EBF, gv14C2(gv1A86).M5857(l00A6).M56DB)
                sub085B "With your increased Perception, you have identified Item #" + CStr(l00A6 + 1) + " as: " + l00AA
                sub0F61 gv1A86, False, l00A6
                sub0730 gv1A86, gv14C2(gv1A86).M5857(l00A6).M4ED4, gv14C2(gv1A86).M5857(l00A6).M4EEE, -1, False
            End If
        End If
    Next l00A6
    gv14C2(gv1A86).M5970 = fn1397(gv14C2(gv1A86))
    If  gv16CA(l0094).M4E82 < gv14C2(gv1A86).M5584(l0094).M4E82 Or gv16CA(l0094).M548B = "" Then
        If  gv16CA(l0094).M548B <> RTrim(gv14C2(gv1A86).M548B) Then
            Beep
            l00A4 = MsgBox("Congratulations!" + Chr$(13) + "You are now the new Guildmaster!", mc007A, "GuildMaster")
            sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " became the new GuildMaster."
        End If
        sub29DF gv1A86, l0094
        gv16CA(l0094).M548B = RTrim(gv14C2(gv1A86).M548B)
        gv16CA(l0094).M4E82 = gv14C2(gv1A86).M5584(l0094).M4E82
        sub294F
        l00F8 = FreeFile
        Open gv19E8 + gc1C74 + gc1C1C For Random As #l00F8 Len = mc0100
        Put #l00F8, l0094 + 2, gv16CA(l0094)
        Close #l00F8
    End If
    sub1043 mc0102, gv1A86, fn1BF0(mc0102, gv1A86, False)
    sub1043 mc0106, gv1A86, fn1BF0(mc0106, gv1A86, False)
    sub1043 mc0108, gv1A86, fn1BF0(mc0108, gv1A86, False)
    sub2974
    sub1602
    frmCharStat1!picTabPicture.Refresh
    l010E = Rnd * 100
    If  gv14C2(gv1A86).M5584(l0094).M4E82 < 5 Then
        l010E = 100
    End If
    gv14C2(gv1A86).M5584(l0094).M55CB = 0
    gv14C2(gv1A86).M5584(l0094).M57A9 = False
    gv14C2(gv1A86).M5584(l0094).M57B2 = False
    If  l010E > gv145A(l0094).M55E6 Then
        Exit Sub
    End If
    sub085B "Questmaster is going through his books..."
    l0110 = CInt((gv14C2(gv1A86).M5584(l0094).M4E82 / 25))
    If  l0110 < 1 Then
        l0110 = 1
    ElseIf l0110 > 10 Then
        l0110 = 10
    End If
    l010E = Rnd * 100
    If  l010E <= 5 Then
        sub085B "Questmaster lets you off the hook."
        Exit Sub
    End If
    l010E = Rnd * 100
    If  l010E < 25 And gv14C2(gv1A86).M5584(l0094).M4E82 > 15 Then
        gv14C2(gv1A86).M5584(l0094).M55CB = mc004C
    Else
        gv14C2(gv1A86).M5584(l0094).M55CB = mc0040
    End If
    Select Case gv14C2(gv1A86).M5584(l0094).M55CB
        Case mc0040
            Do
                l0116 = Int(Rnd * gv1BF2)
                If  Int(Rnd * 100) < 40 Then
                    l0112 = gv1DD2(l0116, 0)
                Else
                    l0112 = -1
                End If
                l0114 = -1
                For l00A6 = gv1DD2(l0116, 0) To gv1DD2(l0116, 1)
                    If  gv1DD2(l0116, 0) = -1 Then
                        Exit For
                    End If
                    If  l0112 = -1 Then
                        If  gv14F6(l00A6).M5693 >= l0110 Then
                            l0112 = l00A6
                        End If
                    End If
                    If  gv14F6(l00A6).M5693 > l0110 Or l00A6 = gv1DD2(l0116, 1) Then
                        l0114 = l00A6 - 1
                        Exit For
                    End If
                Next l00A6
                If  l0112 = -1 Then
                    l0112 = gv1DD2(l0116, 0)
                End If
                l0118 = CInt(Rnd * (l0114 - l0112))
                l0118 = l0118 + l0112
                If  gv14F6(l0118).M56A0 < 10 And ((Rnd * 100) > 25) Then
                    l0118 = -1
                End If
            Loop While l0114 = -1 Or gv14F6(l0114).M5693 > l0110 Or l0118 = -1
            gv14C2(gv1A86).M5584(l0094).M57A9 = gv14F6(l0118).M5467
            sub085B "You must defeat one " + gv14F6(l0118).M548B + "."
        Case mc004C
            l0110 = Int(l0110 / 1.5#) + 1
            Do
                Do
                    Do
                        l0122 = -1
                        l0126 = Int(Rnd * gv1BEE)
                        For l00A6 = 0 To gv1BEC - 1
                            If  gv1426(l00A6).M5709 = l0126 Then
                                l0122 = l00A6
                                Exit For
                            End If
                        Next l00A6
                    Loop While l0122 = -1
                Loop While gv1426(l0122).M5693 > l0110
                Do
                    l0124 = -1
                    For l00A6 = l0122 To gv1BEC - 1
                        If  gv1426(l00A6).M5693 > l0110 Or l00A6 = gv1BEC - 1 Or gv1426(l00A6).M5709 <> l0126 Then
                            l0124 = l00A6 - 1
                            Exit For
                        End If
                    Next l00A6
                Loop While l0124 = -1
                If  l0124 < l0122 Then
                    l0124 = l0122
                End If
                l0128 = Int(Rnd * (l0124 - l0122) + 1)
                l0128 = l0128 + l0122
                If  gv1426(l0128).M5686 < 100 Then
                    l0128 = -1
                    ElseIf gv1426(l0128).M572A <> False Then
                    l0128 = -1
                    ElseIf gv1426(l0128).M5693 < 1 Then
                    l0128 = -1
                    ElseIf gv1426(l0128).M56A0 < 5 And (Rnd * 100) > 25 Then
                    l0128 = -1
                End If
            Loop While l0128 = -1
            gv14C2(gv1A86).M5584(l0094).M57A9 = gv1426(l0128).M5467
            sub085B "You must return one " + gv1426(l0128).M548B + "."
    End Select
    Select Case gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M55CB
        Case mc004C
            sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " was assigned a quest to return with " + gv1426(l0128).M548B + "."
        Case mc0040
            sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " was assigned a quest to kill one " + gv14F6(l0118).M548B + "."
        Case Else
    End Select
    Exit Sub

L6C5CC:
    sub04FC "Error '" + Error + "' occurred in FRMCTYG:cmdMake_Click."
    Resume L6C636
L6C636:
End Sub

Sub cmdVisit_Click ()
    If  lstGuilds.ListIndex <> -1 Then
        m001A% = lstGuilds.ItemData(lstGuilds.ListIndex)
        sub294F
        sub2962
    End If
    If  gv14C2(gv1A86).M579B < fn124B(gv14C2(gv1A86)) Then
        cmdMake.Enabled = False
    End If
    If  gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF < fn125C(gv14C2(gv1A86)) Then
        cmdMake.Enabled = False
    End If
End Sub

Sub Form_Activate ()
    sub0792 Me
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l0136 As Integer ' 81
' Const mc013C = 12 ' &HC%
    On Error Resume Next
    If  TypeOf Me.ActiveControl Is ComboBox Then
        If  fn1589(KeyCode, Shift) Then
            KeyCode = 0
            Shift = 0
        End If
    ElseIf TypeOf Me.ActiveControl Is TextBox Then
        If  fn1589(KeyCode, Shift) Then
            KeyCode = 0
            Shift = 0
        End If
    Else
        l0136 = fn14CB(KeyCode, Shift)
    End If
End Sub

Sub Form_Load ()
' Const m013E = 0 ' &H0%
Dim l0140 ' 80
' Const mc0142 = 6 ' &H6%
    Me.Tag = "NEW"
    If  gv14C2(m013E).M5958(mc013C).M425F = 0 And gv14C2(m013E).M5958(mc013C).M4258 = 0 Then
        sub02FE Me
    Else
        Me.Left = gv14C2(m013E).M5958(mc013C).M425F
        Me.Top = gv14C2(m013E).M5958(mc013C).M4258
    End If
    Me.Width = gv14C2(m013E).M5958(mc013C).M4216
    Me.Height = gv14C2(m013E).M5958(mc013C).M420C
    m001A% = gv14C2(gv1A86).M58BB
    For l0140 = 0 To mc0142 - 1
        If  l0140 > 0 Then
            Load lblStatName(l0140)
            Load lblStat(l0140)
            lblStatName(l0140).Caption = Left$(gv05EE$(l0140), 3)
            lblStatName(l0140).Visible = True
            lblStatName(l0140).Left = lblStatName(l0140 - 1).Left + lblStatName(l0140 - 1).Width
            lblStat(l0140).Left = lblStat(l0140 - 1).Left + lblStat(l0140 - 1).Width
        End If
    Next l0140
    Me.Tag = ""
    gv19C2(mc013C).M4216 = gv19C2(mc013C).M5E20
    gv19C2(mc013C).M420C = gv19C2(mc013C).M5E2D
    gv19C2(mc013C).M5E47 = Me.hWnd
    sub294F
    sub2974
    sub2962
    If  gv14C2(gv1A86).M579B < fn124B(gv14C2(gv1A86)) Then
        cmdMake.Enabled = False
    End If
    If  gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF < fn125C(gv14C2(gv1A86)) Then
        cmdMake.Enabled = False
    End If
    sub0784 Me
    sub0524 Me
End Sub

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub07B3 Me, elaElastic(0)
        sub07C5 Me, gv19C2(mc013C)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc013C, Me, True
    gv19C2(mc013C).M5E47 = False
    Set frmCityGuild = Nothing
End Sub

Sub lblCall_Change ()
    If  m001C = False Then
        m001A% = gv14C2(gv1A86).M58BB
        sub294F
        sub2974
        sub2962
        If  gv14C2(gv1A86).M579B < fn124B(gv14C2(gv1A86)) Then
            cmdMake.Enabled = False
        End If
        If  gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF < fn125C(gv14C2(gv1A86)) Then
            cmdMake.Enabled = False
        End If
        lblCall = ""
        m001C = False
    End If
End Sub

Sub sub29DF (ByVal pv016C As Integer ' 81, p016E As Integer ' 41)
Dim l0170 ' 80
Dim l0172 As Integer ' 81
Dim l0174 As Integer ' 81
Dim l0176 As Integer ' 81
Dim l0178 ' 80
' Const mc017A = 40 ' &H28%
Static m017C As Integer ' 61
    On Error GoTo L6D374
    l0172 = mc001E + p016E
    For l0170 = 1 To mc0076 - 1
        If  gv1426(gv14C2(pv016C).M5857(l0170).M4ED4).M5467 = l0172 Then
            l0176 = True
        End If
    Next l0170
    For l0170 = False To mc017A - 1
        If  gv14C2(pv016C).M5860(l0170).M4ED4 > 0 Then
            If  gv14C2(pv016C).M5860(l0170).M5467 <> gv1426(gv14C2(pv016C).M5860(l0170).M4ED4).M5467 Then
                sub085B "BANK ITEM SORTER: Remapping Item #" + CStr(l0170 + 1)
                If  gv14C2(pv016C).M5860(l0170).M5467 = -1 Then
                    gv14C2(pv016C).M5860(l0170).M5467 = gv14C2(pv016C).M5860(l0170).M4ED4
                Else
                    For l0178 = 0 To gv1BEC - 1
                        If  gv1426(l0178).M5467 = gv14C2(pv016C).M5860(l0170).M5467 Then
                            gv14C2(pv016C).M5860(l0170).M4ED4 = l0178
                            Exit For
                        End If
                    Next l0178
                End If
            End If
            If  gv1426(gv14C2(pv016C).M5860(l0170).M4ED4).M5467 = l0172 Then l0176 = True
        End If
    Next l0170
    If  l0176 = True Then Exit Sub
    l0178 = -1
    For l0170 = 0 To gv1BEC - 1
        If  gv1426(l0170).M5467 = l0172 Then
            l0178 = l0170
            Exit For
        End If
    Next l0170
    If  l0178 = -1 Then Exit Sub
    sub0578 gv14C2(pv016C).M58BB, Chr$(34) + RTrim(gv14C2(pv016C).M548B) + Chr$(34) + " was awarded the '" + gv1426(l0178).M548B + "' for achieving the rank of new Guildmaster."
    l0174 = -1
    For l0170 = 1 To mc0076 - 1
        If  gv14C2(pv016C).M5857(l0170).M4ED4 <= 0 Then
            l0174 = l0170
            Exit For
        End If
    Next l0170
    If  l0174 = -1 Then
        MsgBox "You were awarded the '" + gv1426(l0178).M548B + "', but you had no room on your character for it!", mc007A, "Sorry!"
        Exit Sub
    End If
    gv14C2(pv016C).M5857(l0174).M4E97 = gv1426(l0178).M4E97
    gv14C2(pv016C).M5857(l0174).M4EA1 = gv1426(l0178).M4EA1
    gv14C2(pv016C).M5857(l0174).M4ED4 = l0178
    gv14C2(pv016C).M5857(l0174).M4EBF = 0
    gv14C2(pv016C).M5857(l0174).M56DB = gv1426(l0178).M56DB
    gv14C2(pv016C).M5857(l0174).M4EEE = m017C
    gv14C2(pv016C).M5857(l0174).M5467 = gv1426(l0178).M5467
    gv14C2(pv016C).M5857(l0174).M572A = gv1426(l0178).M572A
    MsgBox "Congratulations!  For achieving the title of Guildmaster, you have been awarded the '" + gv1426(l0178).M548B + "'!" + Chr(13) + Chr(13) + "May the Crest help you with survival, exploration and bring you luck.", mc007A, "Congratulations!"
    sub0F61 pv016C, m013E, l0174
    Exit Sub

L6D374:
    sub04FC "Error '" + Error + "' occurred in FRMCTYG:modAwardCrest"
    Resume L6D3DC
L6D3DC:
End Sub

Sub sub2974 ()
Dim l017E As String ' 87
Dim l0180 ' 80
    lstGuilds.Clear
    For l0180 = 0 To gv1BEA - 1
        If  gv14C2(gv1A86).M5584(l0180).M4E82 Then
            l017E = " (" + LTrim$(Str$(gv14C2(gv1A86).M5584(l0180).M4E82)) + ")"
        Else
            l017E = ""
        End If
        If  fn115C(l0180, gv14C2(gv1A86)) = True Then
            lstGuilds.AddItem gv145A(l0180).M548B + l017E
            lstGuilds.ItemData(lstGuilds.ListCount - 1) = l0180
        End If
    Next l0180
End Sub

Sub sub2962 ()
Dim l0186 As Integer ' 81
Dim l0188 As String ' 87
Dim l018A ' 80
    If  gv14C2(gv1A86).M5584(m001A%).M4E82 > 0 Then
        If  gv14C2(gv1A86).M5829 Then
            l0188$ = Chr$(13) + "Welcome, Sister."
            Else
            l0188$ = Chr$(13) + "Welcome, Brother."
        End If
        cmdJoin.Caption = "Re-Acquaint"
    Else
        If  fn0380(gv14C2(gv1A86).M5821, gv145A(m001A%).M5604) = 0 Then
            l0188$ = "We don't accept " + gv148E(gv14C2(gv1A86).M5821).M548B + "s!" + Chr$(13)
            l0186% = True
        End If
        If  fn0380(gv14C2(gv1A86).M4EBF, gv145A(m001A%).M5557) = 0 Then
            l0188$ = l0188$ + "You're " + gv074C$(gv14C2(gv1A86).M4EBF) + "!  Go away!" + Chr$(13)
            l0186% = True
        End If
        For l018A = 0 To mc0142 - 1
            If  gv14C2(gv1A86).M55B5(l018A) < gv145A(m001A%).M55B5(l018A) Then
                l0188$ = l0188$ + "Your natural stats are too low to join!"
                l0186% = True
                Exit For
            End If
        Next l018A
    End If
    If  gv14C2(gv1A86).M5584(m001A%).M4E82 < 1 And l0186 = False Then
        l0188$ = "Welcome, Visitor."
        cmdJoin.Caption = "Join"
    End If
    If  m001A% <> gv14C2(gv1A86).M58BB And l0186% = False Then
        cmdJoin.Enabled = True
    Else
        cmdJoin.Enabled = False
    End If
    If  m001A% <> gv14C2(gv1A86).M58BB Then
        cmdMake.Enabled = False
        cmdInfo.Enabled = False
    Else
        If  fn14A0(gv14C2(gv1A86)) Then
            cmdMake.Enabled = True
        Else
            cmdMake.Enabled = False
        End If
        cmdMake.Enabled = True
        cmdInfo.Enabled = True
    End If
    lblWelcomeInfo.Caption = l0188$
End Sub

Sub sub294F ()
Dim l01B0 ' 80
    lblWelcome.Caption = "Welcome to the " + gv145A(m001A%).M548B + "'s guild!"
    For l01B0 = 0 To mc0142 - 1
        lblStat(l01B0).Caption = gv145A(m001A%).M55B5(l01B0)
        lblStat(l01B0).Visible = True
    Next l01B0
    If  gv16CA(m001A%).M548B = RTrim(gv14C2(gv1A86).M548B) Then
        lblGuildMaster = " You are the GuildMaster"
    Else
        If  gv16CA(m001A%).M548B = "" Then
            lblGuildMaster = " There is no GuildMaster"
        Else
            lblGuildMaster = " " + gv16CA(m001A%).M548B + " (Level" + Str$(gv16CA(m001A%).M4E82) + ")"
        End If
    End If
End Sub

Sub sub29BD (p01BE As Integer ' 41, p01C0 As Integer ' 41)
Dim l01C2 As String ' 87
Dim l01C4 ' 80
Dim l01C6 As Integer ' 81
Dim l01C8 As Integer ' 81
Dim l01CC As Integer ' 81
Dim l01CE As Integer ' 81
Dim l01D0 As Integer ' 81
Dim l01D2 As Integer ' 81
Dim l01D4 As Integer ' 81
' Const mc01D6 = 38 ' &H26%
    For l01C4 = 0 To mc0076 - 1
        If  gv14C2(gv1A86).M5857(l01C4).M572A <> False And gv14C2(gv1A86).M5857(l01C4).M577E = mc0078 Then
            l01D2 = MsgBox("Your Aura is Tainted!" + Chr(13) + "Cnanot forfeit quest until cursed items are removed.", mc007A, "forfeit Quest")
            Exit Sub
        End If
    Next l01C4
    l01C2 = fn126E(gv1A86)
    l01D4 = gv14C2(gv1A86).M5584(p01BE).M4E82
    l01C8 = gv14C2(gv1A86).M5584(p01BE).M4E82
    l01C6 = True
    For l01C8 = l01D4 To (l01D4 - p01C0) + 1 Step -1
        For l01C4 = 0 To gv1BEA - 1
            If  l01C4 <> gv14C2(gv1A86).M58BB Then
                If  gv14C2(gv1A86).M5584(l01C4).M4E82 >= l01C8 Then
                    l01C6 = False
                End If
            End If
        Next l01C4
        If  l01C8 > gv145A(p01BE).M559A Or l01C6 = False Then
            If  l01C6 = True Then
                gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 - gv145A(p01BE).M55A4
            End If
        Else
            l01CC = gv145A(p01BE).M5591
            l01CE = Int(Rnd * 3) + 1
            Select Case l01CE
                Case 1
                    gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 - Int(Rnd * gv145A(p01BE).M5591 / 5) + 1
                Case 2
                    gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 - Int(Rnd * gv145A(p01BE).M5591 / 5) + 1
            End Select
            gv14C2(gv1A86).M4EB4 = gv14C2(gv1A86).M4EB4 - l01CC
        End If
        If  gv14C2(gv1A86).M4EB4 < 15 Then
            gv14C2(gv1A86).M4EB4 = 15
        End If
        gv14C2(gv1A86).M4EAC = gv14C2(gv1A86).M4EB4
        For l01C4 = (l01C8 - 1) To False Step -1
            If  fn137E(p01BE, l01C4) <= l01C8 Then
                gv14C2(gv1A86).M59A1 = fn137E(p01BE, l01C4)
                Exit For
            End If
        Next l01C4
        l01D0 = True
        If  l01C8 <= gv145A(p01BE).M561A Then
            If  l01C8 <= gv145A(p01BE).M559A Then
                l01D0 = (l01C8) Mod Int(gv145A(p01BE).M5626)
            Else
                If  gv14C2(gv1A86).M59A1 <> False Then
                    l01D0 = (l01C8) Mod gv14C2(gv1A86).M59A1
                End If
            End If
            If  l01D0 = False Then
                sub29D0 gv14C2(gv1A86).M58BB, True
            End If
        End If
        If  gv145A(p01BE).M55BE(mc00DA) > False Then
            l01D2 = Log((10 - gv145A(p01BE).M55BE(mc00DA)) + 1) * 50
            l01D0 = False
            For l01C4 = 1 To gv14C2(gv1A86).M5584(p01BE).M4E82
                If  l01C4 > l01D2 Then
                    l01D0 = l01D0 + 1
                    l01D2 = Log((10 - gv145A(p01BE).M55BE(mc00DA)) + 1) * (l01D2 * 2)
                End If
            Next l01C4
            gv14C2(gv1A86).M56AF = l01D0
        End If
    Next l01C8
    For l01C4 = 0 To mc00DC - 1
        sub0F4C l01C4
    Next l01C4
    sub0BF1
    sub086D mc01D6
    gv14C2(gv1A86).M5584(p01BE).M4E82 = (l01D4 - p01C0)
    gv14C2(gv1A86).M59A1 = fn137E(p01BE, gv14C2(gv1A86).M5584(p01BE).M4E82)
    gv14C2(gv1A86).M5970 = fn1397(gv14C2(gv1A86))
    l01C2 = ""
    For l01C4 = 1 To mc0076
        If  gv14C2(gv1A86).M5857(l01C4 - 1).M577E = mc0078 Then
            If  fn110D(gv1A86, gv14C2(gv1A86).M5857(l01C4 - 1).M4ED4, 0, 1) = False Then
                l01D2 = True
                sub0F74 gv1A84, (l01C4 - 1)
            End If
        End If
    Next l01C4
    If  l01D2 = True Then
        l01C2 = Chr(13) + Chr(13) + "One or more items were unequipped when you were demoted..."
    End If
    gv14C2(gv1A86).M5584(p01BE).M4E82 = gv14C2(gv1A86).M5584(p01BE).M4E82 - 1
    gv14C2(gv1A86).M579B = fn124B(gv14C2(gv1A86))
    gv14C2(gv1A86).M5584(p01BE).M4E82 = gv14C2(gv1A86).M5584(p01BE).M4E82 + 1
    gv14C2(gv1A86).M5584(p01BE).M55CB = False
    sub2974
    sub1602
    frmCharStat1!picTabPicture.Refresh
    gv14C2(gv1A86).M5584(p01BE).M55CB = 0
    gv14C2(gv1A86).M5584(p01BE).M57A9 = False
    gv14C2(gv1A86).M5584(p01BE).M57B2 = False
    sub2962
    sub08A9 False, 50
    If  gv14C2(gv1A86).M5829 = False Then
        sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " was demoted by " + CStr(p01C0) + " levels for not completing his quest."
    Else
        sub0578 gv14C2(gv1A86).M58BB, Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " was demoted by " + CStr(p01C0) + " levels for not completing her quest."
    End If
    MsgBox "You have been demoted to level " + CStr(l01D4 - p01C0) + "." + l01C2, mc0058, "Demotion Complete"
End Sub

Sub sub29D0 (p01DC As Integer ' 41, p01DE As Integer ' 41)
Dim l01E0 ' 80
Dim l01E2 As Single ' 83
Dim l01E4 As Single ' 83
Dim l01E6 As Single ' 83
Dim l01E8 As Single ' 83
Dim l01EA As Single ' 83
Dim l01EC As Single ' 83
Dim l01EE As Single ' 83
    l01E6 = 0
    l01E8 = 0
    For l01E0 = 0 To gv1BEA - 1
        l01E2 = gv14C2(gv1A86).M5584(l01E0).M4E97
        l01E4 = gv14C2(gv1A86).M5584(l01E0).M4EA1
        If  l01E2 > l01E6 Then
            If  p01DE = True Then
                If  p01DC <> l01E0 Then
                    l01E6 = l01E2
                End If
            Else
                l01E6 = l01E2
            End If
        End If
        If  l01E4 > l01E8 Then
            If  p01DE = True Then
                If  p01DC <> l01E0 Then
                    l01E8 = l01E4
                End If
            Else
                l01E8 = l01E4
            End If
        End If
    Next l01E0
    If  p01DE Then
        If  gv14C2(gv1A86).M5584(p01DC).M4E97 > l01E6 Then
            l01EE = gv14C2(gv1A86).M5584(p01DC).M4E97 - l01E6
            If  l01EE > gv145A(p01DC).M4E97 Then
                gv14C2(gv1A86).M4E97 = gv14C2(gv1A86).M4E97 - gv145A(p01DC).M4E97
            Else
                gv14C2(gv1A86).M4E97 = gv14C2(gv1A86).M4E97 - l01EE
            End If
        End If
        gv14C2(gv1A86).M5584(p01DC).M4E97 = gv14C2(gv1A86).M5584(p01DC).M4E97 - gv145A(p01DC).M4E97
        If  gv14C2(gv1A86).M5584(p01DC).M4EA1 > l01E8 Then
            l01EE = gv14C2(gv1A86).M5584(p01DC).M4EA1 - l01E8
            If  l01EE > gv145A(p01DC).M4EA1 Then
                gv14C2(gv1A86).M4EA1 = gv14C2(gv1A86).M4EA1 - gv145A(p01DC).M4EA1
            Else
                gv14C2(gv1A86).M4EA1 = gv14C2(gv1A86).M4EA1 - l01EE
            End If
        End If
        gv14C2(gv1A86).M5584(p01DC).M4EA1 = gv14C2(gv1A86).M5584(p01DC).M4EA1 - gv145A(p01DC).M4EA1
    Else
        gv14C2(gv1A86).M5584(p01DC).M4E97 = gv14C2(gv1A86).M5584(p01DC).M4E97 + gv145A(p01DC).M4E97
        gv14C2(gv1A86).M5584(p01DC).M4EA1 = gv14C2(gv1A86).M5584(p01DC).M4EA1 + gv145A(p01DC).M4EA1
        l01EA = gv14C2(gv1A86).M4E97
        l01EC = gv14C2(gv1A86).M4EA1
        If  gv14C2(gv1A86).M5584(p01DC).M4E97 > l01E6 Then
            gv14C2(gv1A86).M4E97 = gv14C2(gv1A86).M4E97 + (gv14C2(gv1A86).M5584(p01DC).M4E97 - l01E6)
        End If
        If  gv14C2(gv1A86).M5584(p01DC).M4EA1 > l01E8 Then
            gv14C2(gv1A86).M4EA1 = gv14C2(gv1A86).M4EA1 + (gv14C2(gv1A86).M5584(p01DC).M4EA1 - l01E8)
        End If
        If  gv14C2(gv1A86).M4E97 < l01EA Or gv14C2(gv1A86).M4EA1 < l01EC Then
            sub04FC "Error 'Invalid A/D Raise!' occurred in FRMCTYG:modSetNewAD!"
            sub085B "Please note the following and Report ASAP!"
            sub085B "Old A/D - " + CStr(l01EA) + "/" + CStr(l01EC) + ", New A/D - " + CStr(gv14C2(gv1A86).M4E97) + "/" + CStr(gv14C2(gv1A86).M4EA1)
            sub085B "Main A/D - " + CStr(l01E6) + "/" + CStr(l01E8) + ", Guild A/D - " + CStr(gv14C2(gv1A86).M5584(p01DC).M4E97) + "/" + CStr(gv14C2(gv1A86).M5584(p01DC).M4EA1)
        End If
    End If
End Sub
