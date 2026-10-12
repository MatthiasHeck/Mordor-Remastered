Sub cmdCommand_Click (Index%)
Dim l002C As Integer ' 81
Dim l002E As Integer ' 81
Dim l0030 As String ' 87
' Const mc0034 = 4 ' &H4%
' Const mc0048 = 8 ' &H8%
' Const mc004A = 48 ' &H30%
' Const m0050 = 0 ' &H0%
Dim l0056 As Variant ' 86
' Const mc005A = 23 ' &H17%
Dim l005C As Variant ' 86
' Const mc0060 = 3 ' &H3%
' Const mc006A = 38 ' &H26%
' Const mc006C = 11 ' &HB%
Dim l0074 As Integer ' 81
Dim l0076() As Integer ' 91
Dim l007C As Integer ' 81
Dim l007E As Integer ' 81
Dim l0080 As Long ' 82
Dim l0084 As T5810 ' 8A
Dim l0086 As Integer ' 81
Dim l008A As Variant ' 86
' Const mc008E = 15 ' &HF%
' Const mc0096 = 2900 ' &HB54%
' Const mc0098 = 32 ' &H20%
' Const mc009A = 4 ' &H4%
' Const mc009C = 6 ' &H6%
    On Error GoTo L74D14
    Select Case Index
        Case mc001C
            l002C = Val(fn16A0("Pickup Character", "Character's Name?", "", "PICKUP"))
            If  l002C = -1 Then
                Exit Sub
            End If
            gv14C2(gv1A86).M5943 = l002C + mc0034
            sub0F38
        Case m001A
            l002C = Val(fn16A0("RAISE CHARACTER", "Character's Name?", "", "PICKUP"))
            If  l002C = -1 Then
                Exit Sub
            End If
            If  gv1732(l002C).M5483 = mc0048 Then
                MsgBox "We are unable to help a rocked character.  You'll need to find somebody who can cast 'resurrect'.  Sorry!", mc004A, "Sorry!"
                Exit Sub
            End If
            If  fn13D7(l002C, -1) = 0 Then
                Exit Sub
            End If
            If  fn13C0(l002C) = -1 Then
                l002E = MsgBox("Raise already cast on Character!", 64, "SORRY!")
                Exit Sub
            End If
            If  MsgBox("Cost to raise " + gv1732(l002C).M548B + " is " + fn036D(CCur(fn13C0(l002C)), m0050) + "." + Chr$(13) + "Do you wish to pay?", 36, "RAISE CHARACTER") = 6 Then
                If  fn114E(fn13C0(l002C)) = False Then
                    l002E = MsgBox("Not enough gold!", l0056, "SORRY!")
                    Exit Sub
                End If
                sub0A7C l002C, fn13D7(l002C, -1), mc005A
                l002E = MsgBox("Character taken care of!", l0056, "DONE!")
            End If
        Case mc001E
            If  fn114E(m0022) = False Then
                l005C = MsgBox("Not enough gold!", l0056, "RAISE COMPANION")
            Else
                l005C = 75 + gv14F6(gv14C2(gv1A86).M58CB(m0026).M4ED4).M55B5(mc0060)
                If  l005C > 98 Then l005C = 98
                If  Int(Rnd * 100) > l005C Then
                    sub086D mc006A
                    sub085B "Raise Failed!"
                    gv14C2(gv1A86).M58CB(m0026).M4ED4 = -1
                Else
                    sub086D mc006C
                    sub085B "Raise Was Successful!"
                    gv14C2(gv1A86).M58CB(m0026).M4EAC = gv14C2(gv1A86).M58CB(m0026).M4EB4
                End If
                gv14C2(gv1A86).M5943 = -1
                sub0B82 gv1A86
                sub0F38
                cmdCommand(Index).Visible = False
            End If
        Case mc0020
            l002C = Val(fn16A0("FIND CHARACTER", "Character's Name?", "", "LOCATE"))
            If  l002C = -1 Then
                Exit Sub
            End If
            l0030 = fn16A0("Location?", "Last known coords?" + Chr$(13) + "(I.E. " + Chr$(34) + "15,5,3" + Chr$(34) + " for 15,5 Level 3)", "", "TELEPORT")
            If  l0030 = "0" Or l0030 = "" Or l0030 = "-1" Then
                Exit Sub
            End If
            l0074 = 0
            l007E = 1
            l007C = 0
            Do
                l0074 = l0074 + 1
                If  Mid$(l0030, l0074, 1) = gc01A2 Or l0074 = Len(l0030) Then
                    l007C = l007C + 1
                    If  l0074 = Len(l0030) Then
                        l0074 = l0074 + 1
                    End If
                    ReDim Preserve l0076(l007C - 1)     As Integer
                    l0076(l007C - 1) = Val(Mid$(l0030, l007E, l0074 - l007E))
                    l007E = l0074 + 1
                End If
                If  l0074 >= Len(l0030) Then
                    Exit Do
                End If
            Loop
            If  UBound(l0076) <= 1 Or UBound(l0076) > 2 Then
                MsgBox "We require proper coordinates (X,Y,Level) before we can dispatch rescuers!", l008A, "Bad coordinates"
                Exit Sub
            End If
            If  l0076(0) < 1 Or l0076(1) < 1 Or l0076(2) < 1 Or l0076(2) > mc008E Then
                MsgBox "Invalid Coordinates!", mc004A, "Sorry!"
                Exit Sub
            End If
            l0086 = FreeFile
            Open gv19E8 + gc1C74 + gc1C10 For Random As #l0086 Len = mc0096
            Get #l0086, gv1732(l002C).M5467, l0084
            l0080 = 372567.52# * Log(l0076(2) + 1) * l0076(2)
            If  MsgBox("Cost will be " + fn036D(CCur(l0080), m0050) + " to search for " + RTrim(l0084.M548B) + "." + Chr$(13) + "Do you accept?", mc0098 + mc009A, "Start Search?") = mc009C Then
                If  fn114E(l0080) = False Then
                    l002E = MsgBox("Not enough gold!", mc004A, "HIRE RESCUERS")
                Else
                    If  Rnd * 100 > (l0076(2) * 4) Then
                        If  Abs(l0076(0) - l0084.M583F) < 8 And Abs(l0076(1) - l0084.M5845) < 8 And l0076(2) = l0084.M5470 Then
                            Select Case l0084.M5483
                                Case False
                                    If  l0084.M4EAC <= (l0084.M4EB4 * .2#) Then
                                        sub085B RTrim(l0084.M548B) + " was found alive, and in pretty bad shape, so we healed them and brought them back!"
                                        l0084.M5470 = 0
                                        gv1732(l002C).M5470 = 0
                                        gv1732(l002C).M547A = -1
                                        Put #l0086, gv1732(l002C).M5467, l0084
                                    Else
                                        sub085B RTrim(l0084.M548B) + " was found, but was alive and well!"
                                    End If
                                Case mc0048
                                    sub085B "The only thing they saw were feet sticking out of rock."
                                Case Else
                                    sub085B RTrim(l0084.M548B) + " was found at" + Str$(l0084.M583F) + "," + LTrim$(Str$(l0084.M5845)) + "," + LTrim$(Str$(l0084.M5470)) + " and brought to the morgue!"
                                    l0084.M5470 = 0
                                    gv1732(l002C).M5470 = 0
                                    gv1732(l002C).M547A = -1
                                    Put #l0086, gv1732(l002C).M5467, l0084
                            End Select
                        Else
                            sub085B RTrim(l0084.M548B) + " was not found at or around the specified location."
                        End If
                    Else
                        sub085B "Rescuers never returned...  Don't you feel guilty now?"
                    End If
                End If
            End If
            Close #l0086
    End Select
    Exit Sub

L74D14:
    MsgBox "Error '" + Error + "' Occurred in FRMMORG:cmdCommand.", mc004A, "Error!"
    Resume L74D80
L74D80:
End Sub
