' FRMSEEK.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0020 = 3 ' &H3%
Const mc0050 = 64 ' &H40%
Const mc0056 = 32 ' &H20%
Const mc0058 = 4 ' &H4%
Const mc005A = 6 ' &H6%
Const mc005E = 48 ' &H30%
Const mc0060 = 11 ' &HB%
Const mc00C2 = 10 ' &HA%
Const mc00CA = 2900 ' &HB54%
Const mc00DC = 19 ' &H13%

Sub cmdCommand_Click (Index%)
Dim l0024 As Integer ' 81
Dim l0028 As T5810 ' 8A
Dim l002A As Long ' 82
Dim l002C As Integer ' 81
Dim l002E As String ' 87
Dim l0030 As String ' 87
Dim l0032 As Integer ' 81
Dim l0034 As Integer ' 81
Dim l0036 ' 80
Dim l0038 As Integer ' 81
Dim l003A As Integer ' 81
Dim l0040 As T4E8B ' 8A
' Const mc0050 = 64 ' &H40%
Static m0052 As Integer ' 61
' Const mc0056 = 32 ' &H20%
' Const mc0058 = 4 ' &H4%
' Const mc005A = 6 ' &H6%
' Const mc005E = 48 ' &H30%
' Const mc0060 = 11 ' &HB%
Dim l0068 As T5D38 ' 8A
Dim l006C ' 80
Dim l006E ' 80
Dim l0070 As Integer ' 81
Dim l0072 As Integer ' 81
Dim l0074 As Integer ' 81
Dim l0076 As Integer ' 81
Dim l0078 As Integer ' 81
Dim l007A As Integer ' 81
Dim l007E() As T4E6B ' 9A
Dim l0084() As Integer ' 91
Static m00A4 As Integer ' 61
Dim l00B8() As T4E6B ' 9A
Dim l00BE As Integer ' 81
Dim l00C0 As Integer ' 81
' Const mc00C2 = 10 ' &HA%
' Const mc00CA = 2900 ' &HB54%
    On Error GoTo L84180
    Select Case Index
        Case mc001E
            l002E = fn16A0("LOCATE MONSTER", "Name of the Monster?", "", "INQUERY")
            If  l002E = "" Then
                Exit Sub
            End If
            l0032 = False
            For l0036 = 1 To gv1BF6 - 1
                If  UCase(l002E) = Left(UCase(gv14F6(l0036).M548B), Len(l002E)) Then
                    l0038 = l0036
                    l0032 = l0032 + 1
                    If  UCase(l002E) = UCase(gv14F6(l0036).M548B) Then
                        l0032 = 1
                        Exit For
                    End If
                Else
                    l0040.M4ED4 = l0036
                    l0040.M4F01 = l0036
                    If  UCase(l002E) = Left(UCase(fn0E23(gv1A86, 2, l0040)), Len(l002E)) Then
                        l0038 = l0036
                        l0032 = l0032 + 1
                        If  UCase(l002E) = UCase(fn0E23(gv1A86, 2, l0040)) Then
                            l0032 = 1
                            Exit For
                        End If
                    End If
                End If
            Next l0036
            If  l0032 = False Then
                MsgBox "I am unable to locate a creature called '" + l002E + "'.", mc0050, "Sorry!"
                Exit Sub
            ElseIf l0032 > 1 Then
                MsgBox "The name you provided is shared by more than one creature.", mc0050, "Sorry!"
                Exit Sub
            End If
            If  gv14F6(l0038).M5693 > 12 Then
                MsgBox "Unfortunately, this creature dwells beyond the reach of my powers.", mc0050, "Sorry!"
                Exit Sub
            End If
            l002A = 132567.52# * Log(gv14F6(l0038).M5693 + 1) * gv14F6(l0038).M5693
            l002A = (l002A + (Rnd * l002A / 4)) / 2
            l002E = "I can sense the general presense of a creature known as '" + gv14F6(l0038).M548B + "' somewhere in the depths below.  A small fee of " + fn036D(CCur(l002A), m0052)
            l002E = l002E + " will be required to do the search." + Chr(13) + "Do you accept?"
            If  MsgBox(l002E, mc0056 + mc0058, "Locate Monster") = mc005A Then
                If  fn114E(l002A) = False Then
                    MsgBox "Not enough gold!", mc005E, "Locate Monster"
                    Exit Sub
                Else
                    l002C = (gv14F6(l0038).M5693 * 5)
                    l0032 = Int(Rnd * 100) + 1
                    If  l0032 < l002C Then
                        If  (Rnd * 100) >= gv14F6(l0038).M5693 * 5 Then
                            l002E = "I can detect the presense of this creature starting somewhere on level " + CStr(gv14F6(l0038).M5693) + ", but that is all." + Chr(13)
                            l002E = l002E + "Another try may reveal more information."
                        Else
                            l002E = "I cannot locate a general place for this creature.  Another try may work, though."
                        End If
                        MsgBox l002E, mc0050, "Locate Monster"
                        Exit Sub
                    Else
                        Screen.MousePointer = mc0060
                        ReDim l007E(0)    As T4E6B
                        ReDim l0084(0)       As Integer
                        l0074 = -1
                        gv14C2(gv1A86).M5470 = gv14F6(l0038).M5693
                        l0032 = fn0A0B(gv1A86)
                        l0076 = gv14F6(l0038).M5693
                        For l006C = 1 To gv1864.M4216
                            For l006E = 1 To gv1864.M420C
                                l0074 = fn0992(fn0B01(l006C, l006E))
                                If  l0074 <> l0072 Then
                                    l0072 = l0074
                                    Get #gv1B56, gv1D6E + 2 + (gv1864.M4216 * gv1864.M420C) + l0074, l0068
                                    If  l0068.M5D55 > False And l0068.M5D55 = gv14F6(l0038).M5467 Then
                                        If  Rnd * 100 < 75 Then
                                            l0078 = l006C
                                            l007A = l006E
                                            l0070 = -1
                                            Exit For
                                        End If
                                    End If
                                    l003A = False
                                    If  fn0380(gv14F6(l0038).M4ED4, l0068.M5D45) = True Then
                                        For l0036 = False To UBound(l007E)
                                            If  l007E(l0036).M4E82 = l0074 Then
                                                l003A = True
                                                Exit For
                                            End If
                                        Next l0036
                                        If  l003A = False Then
                                            l0070 = l0070 + 1
                                            ReDim Preserve l007E(UBound(l007E) + 1)       As T4E6B
                                            ReDim Preserve l0084(UBound(l007E) + 1)          As Integer
                                            l007E(UBound(l007E)).M4E82 = l0074
                                            l007E(UBound(l007E)).M4E78 = l006C
                                            l007E(UBound(l007E)).M4E7D = l006E
                                            For l0036 = False To gv1BF2 - 1
                                                If  fn0380(l0036, l0068.M5D45) Then
                                                    l0084(UBound(l007E)) = l0084(UBound(l007E)) + 1
                                                End If
                                            Next l0036
                                        End If
                                    End If
                                End If
                            Next l006E
                            If  l0070 = -1 Then Exit For
                        Next l006C
                        gv14C2(gv1A86).M5470 = False
                        Screen.MousePointer = m00A4
                        If  l0070 = False Then
                            l002E = "I am unable to detect the creature in the depths below. "
                        Else
                            If  l0070 <> -1 Then
                                l0070 = Int(Rnd * UBound(l007E)) + 1
                                l0078 = l007E(l0070).M4E78
                                l007A = l007E(l0070).M4E7D
                            End If
                            sub321C l0078, l007A, 5
                            l002E = "I detect the possible presense of the creature known as '" + gv14F6(l0038).M548B + "' in the area of " + CStr(l0078) + "," + CStr(l007A) + "," + CStr(l0076) + "."
                            If  l0070 <> -1 Then
                                Select Case l0084(l0070)
                                    Case Is <= 2
                                        l0030 = "very common"
                                    Case Is <= 4
                                        l0030 = "fairly common"
                                    Case Is <= 7
                                        l0030 = "uncommon"
                                    Case Is <= 11
                                        l0030 = "rare"
                                    Case Else
                                        l0030 = "almost unheard of"
                                End Select
                            Else
                                l0030 = "almost always seen"
                            End If
                            l002E = l002E + Chr(13) + "I also sense that creatures of this general type are " + l0030 + " in this area."
                            If  Rnd * 100 < 75 Then
                                Select Case gv14F6(l0038).M56A0
                                    Case Is <= 2
                                        l0030 = "almost never"
                                    Case Is <= 8
                                        l0030 = "very rarely"
                                    Case Is <= 15
                                        l0030 = "rarely"
                                    Case Is <= 35
                                        l0030 = "uncommonly"
                                    Case Is <= 50
                                        l0030 = "commonly"
                                    Case Else
                                        l0030 = "very commonly"
                                End Select
                                l002E = l002E + Chr(13) + "I can also detect that this creature is " + l0030 + " seen among its type."
                            End If
                        End If
                    End If
                End If
                MsgBox l002E, mc0050, "Locate Monster"
            End If
            cmdCommand(mc001E).SetFocus
        Case mc0020
            l002E = fn16A0("LOCATE ITEM", "Name of the Item?", "", "INQUERY")
            If  l002E = "" Then
                Exit Sub
            End If
            l0032 = False
            For l0036 = False To gv1BEC - 1
                If  UCase(l002E) = Left(UCase(gv1426(l0036).M548B), Len(l002E)) Then
                    l0038 = l0036
                    l0032 = l0032 + 1
                    If  UCase(l002E) = UCase(gv1426(l0036).M548B) Then
                        l0032 = 1
                        Exit For
                    End If
                End If
            Next l0036
            If  l0032 = False Then
                MsgBox "I am unable to locate an item by the name of '" + l002E + "'.", mc0050, "Sorry!"
                Exit Sub
            ElseIf l0032 > 1 Then
                MsgBox "The name you provided is shared by more than one item.", mc0050, "Sorry!"
                Exit Sub
            End If
            If  gv1426(l0038).M5693 > 12 Then
                MsgBox "Unfortunately, this item is found on a level beyond the reach of my powers.", mc0050, "Sorry!"
                Exit Sub
            End If
            l002A = 132567.52# * Log(gv1426(l0038).M5693 + 1) * gv1426(l0038).M5693
            l002A = (l002A + (Rnd * l002A / 4)) / 2
            l002E = "I can sense the general presense of a creature who may carry the item known as '" + gv1426(l0038).M548B + "' somewhere in the depths below.  A small fee of " + fn036D(CCur(l002A), m0052)
            l002E = l002E + " will be required to do the search." + Chr(13) + "Do you accept?"
            If  MsgBox(l002E, mc0056 + mc0058, "Locate Item") = mc005A Then
                If  fn114E(l002A) = False Then
                    MsgBox "Not enough gold!", mc005E, "Locate Item"
                    Exit Sub
                Else
                    l002C = (gv1426(l0038).M5693 * 5)
                    l0032 = Int(Rnd * 100) + 1
                    If  l0032 < l002C Then
                        If  (Rnd * 100) >= gv1426(l0038).M5693 * 5 Then
                            l002E = "I can detect this item starting to be found somewhere on level " + CStr(gv1426(l0038).M5693) + ", but that is all." + Chr(13)
                            l002E = l002E + "Another try may reveal more information."
                        Else
                            l002E = "I cannot locate a creature who may have this item.  Another try may work, though."
                        End If
                        MsgBox l002E, mc0050, "Locate Item"
                        Exit Sub
                    Else
                        ReDim l00B8(0)      As T4E6B
                        Screen.MousePointer = mc0060
                        l0070 = False
                        l00C0 = Int(Rnd * 3)
                        For l0036 = 1 To gv1BF6 - 1
                            For l003A = False To mc00C2 - 1
                                l00BE = False
                                If  gv14F6(l0036).M5AC3(l003A) = gv1426(l0038).M5709 Then
                                    If  gv14F6(l0036).M560D >= gv1426(l0038).M5693 And gv14F6(l0036).M560D <= gv1426(l0038).M5693 + l00C0 Then
                                        l00BE = True
                                    End If
                                End If
                                If  gv14F6(l0036).M5AC3(l003A) < -1 Then
                                    If  Abs(gv14F6(l0036).M5AC3(l003A)) - 2 = gv1426(l0038).M5467 Then
                                        l00BE = True
                                    End If
                                End If
                                If  l00BE = True Then
                                        ReDim Preserve l00B8(UBound(l00B8) + 1)           As T4E6B
                                    l00B8(UBound(l00B8)).M4E78 = l0036
                                    If  gv14F6(l0036).M5AC3(l003A) < -1 Then
                                        If  Abs(gv14F6(l0036).M5AC3(l003A)) - 2 = gv1426(l0038).M5467 Then
                                            l00B8(UBound(l00B8)).M4E82 = True
                                        End If
                                    End If
                                End If
                            Next l003A
                        Next l0036
                        If  UBound(l00B8) = False Then
                            l002E = "I was unable to sense the presense of a creature who specifically carries such an item."
                        Else
                            l0070 = UBound(l00B8)
                            l0070 = l0070 - (Rnd * l0070)
                            If  l0070 > 3 Then l0070 = 3
                            If  l0070 > UBound(l00B8) Then
                                l0070 = UBound(l00B8)
                            End If
                            If  l0070 < 1 Then l0070 = 1
                            l002E = "The creature(s) known as "
                            For l0036 = False To l0070 - 1
                                l003A = Int(Rnd * UBound(l00B8) + 1)
                                If  l00B8(l003A).M4E7D = False Then
                                    l00B8(l003A).M4E7D = True
                                    If  l00B8(l003A).M4E82 Then
                                        l002E = l002E + gv14F6(l00B8(l003A).M4E78).M548B + " (very strong) and "
                                    Else
                                        l002E = l002E + gv14F6(l00B8(l003A).M4E78).M548B + " and "
                                    End If
                                End If
                            Next l0036
                            l002E = Left(l002E, Len(l002E) - 5)
                            l002E = l002E + " come to me as possible carriers for the item you seek."
                        End If
                        MsgBox l002E, mc0050, "Locate Item"
                        Screen.MousePointer = m00A4
                    End If
                End If
            End If
            cmdCommand(mc0020).SetFocus
        Case m001A
            l0024 = Val(fn16A0("LOCATE CHARACTER", "Character's Name?", "", "LOCATE"))
            If  l0024 = -1 Then
                Exit Sub
            End If
            l0034 = FreeFile
            Open gv19E8 + gc1C74 + gc1C10 For Random As #l0034 Len = mc00CA
            Get #l0034, gv1732(l0024).M5467, l0028
            Close #l0034
            If  l0028.M5470 = 0 Then
                MsgBox "Do you mock my abilities?!" + Chr(13) + "They are here in the city!", mc005E, "Seer"
                Exit Sub
            End If
            l002A = 132567.52# * Log(l0028.M5470 + 1) * l0028.M5470
            If  MsgBox("I can feel their presense.  I will need " + fn036D(CCur(l002A), m0052) + " to attempt to locate " + RTrim(l0028.M548B) + "." + Chr$(13) + "Is this acceptable?", mc0056 + mc0058, "Try to Locate") = mc005A Then
                If  fn114E(l002A) = False Then
                    MsgBox "Not enough gold!", mc005E, "Locate Character"
                    Exit Sub
                Else
                    l002C = (l0028.M5470 * 3)
                    l0032 = Int(Rnd * 100) + 1
                    If  l0032 < l002C Then
                        If  (l0032 + 10) >= l002C Then
                            l002E = "I can detect them somewhere on level " + CStr(l0028.M5470) + ", but I've lost connection."
                        Else
                            l002E = "I cannot locate " + Chr(34) + RTrim(l0028.M548B) + Chr(34) + ".  Another try may work, though."
                        End If
                    Else
                        l002E = "I have detected " + Chr(34) + RTrim(l0028.M548B) + Chr(34) + " at: " + CStr(l0028.M583F) + "," + CStr(l0028.M5845) + "," + CStr(l0028.M5470) + "."
                        If  l0028.M5483 <> False Then
                            l002E = l002E + Chr$(13) + "I also feel that they are among the dead."
                        End If
                    End If
                End If
                MsgBox l002E, mc0050, "Seer"
            End If
            cmdCommand(m001A).SetFocus
        Case mc001C
            Unload Me
        Case Else
    End Select
    Exit Sub

L84180:
    MsgBox "Error '" + Error + "' Occurred in FRMSEEK:CMDCOMMAND_CLICK.  Please report.", mc005E, "Error"
    Resume L84200
L84200:
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l00D8 As Integer ' 81
' Const mc00DC = 19 ' &H13%
    On Error Resume Next
    l00D8 = fn14CB(KeyCode, Shift)
End Sub

Sub Form_Load ()
Static m00DE As Integer ' 61
    Me.Tag = "NEW"
    If  gv14C2(m00DE).M5958(mc00DC).M425F = 0 And gv14C2(m00DE).M5958(mc00DC).M4258 = 0 Then
        sub02FE Me
    Else
        Me.Left = gv14C2(m00DE).M5958(mc00DC).M425F
        Me.Top = gv14C2(m00DE).M5958(mc00DC).M4258
    End If
    Me.Width = gv14C2(m00DE).M5958(mc00DC).M4216
    Me.Height = gv14C2(m00DE).M5958(mc00DC).M420C
    gv19C2(mc00DC).M4216 = gv19C2(mc00DC).M5E20
    gv19C2(mc00DC).M420C = gv19C2(mc00DC).M5E2D
    gv19C2(mc00DC).M5E47 = Me.hWnd
    Me.Tag = ""
    sub0784 Me
    sub0524 Me
End Sub

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub07B3 Me, elaElastic(0)
        sub07C5 Me, gv19C2(mc00DC)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc00DC, Me, True
    gv19C2(mc00DC).M5E47 = False
    Set frmCitySeer = Nothing
End Sub

Sub sub321C (p00F4 As Integer ' 41, p00F6 As Integer ' 41, p00F8 As Integer ' 41)
    If  Int(Rnd * 2) Then
        p00F4 = p00F4 - Int(Rnd * p00F8)
    Else
        p00F4 = p00F4 + Int(Rnd * p00F8)
    End If
    If  Int(Rnd * 2) Then
        p00F6 = p00F6 - Int(Rnd * p00F8)
    Else
        p00F6 = p00F6 + Int(Rnd * p00F8)
    End If
    If  p00F4 < 1 Then p00F4 = 1
    If  p00F4 > gv1864.M4216 Then p00F4 = gv1864.M4216
    If  p00F6 < 1 Then p00F6 = 1
    If  p00F6 > gv1864.M420C Then p00F6 = gv1864.M420C
End Sub
