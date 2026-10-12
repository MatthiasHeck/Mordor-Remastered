' FRMMENU.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 5 ' &H5%
Const mc0020 = 4 ' &H4%
Const mc0022 = 2 ' &H2%
Const mc0024 = 3 ' &H3%
Const mc0026 = 6 ' &H6%
Const mc0028 = 7 ' &H7%
Const mc002A = 8 ' &H8%
Const mc002C = 9 ' &H9%
Const mc002E = 10 ' &HA%
Const mc003C = 1 ' &H1%
Const mc004A = 48 ' &H30%
Const mc0052 = 64 ' &H40%
Const mc0058 = 1 ' &H1%
Const m005A = 0 ' &H0%
Const mc0070 = 3 ' &H3%
Const mc0090 = 7 ' &H7%
Const mc00C4 = 2900 ' &HB54%

Sub cmdCommand_Click (Index%)
Dim l0034 As String ' 87
Dim l0036 As Integer ' 81
' Const mc003C = 1 ' &H1%
' Const mc004A = 48 ' &H30%
Dim l004C As String ' 87
Dim l004E As String ' 87
' Const mc0052 = 64 ' &H40%
' Const mc0058 = 1 ' &H1%
' Const m005A = 0 ' &H0%
' Const mc0070 = 3 ' &H3%
    Select Case Index
        Case mc002E
            frmHall.Show mc003C
        Case mc001C
            l0034 = fn16A0("Change Password", "Enter Old Password", "", "PASSWORD")
            If  l0034 = "-1" Then
                Exit Sub
                ElseIf l0034 <> RTrim(gv14C2(gv1A86).M594C) Then
                    MsgBox "Incorrect Password!", mc004A, "Change Password"
                    Exit Sub
            End If
            Do
                l004C = fn16A0("ENTER NEW PASSWORD", "Please enter Password", "", "PASSWORD")
                If  l004C = "-1" Then
                    Exit Sub
                End If
                l004E = fn16A0("ENTER NEW PASSWORD", "Please re-enter Password", "", "PASSWORD")
                If  l004C = "-1" Then
                    Exit Sub
                End If
                If  l004C <> l004E Then
                    l0036 = MsgBox("Passwords don't match!", mc004A, "ERROR")
                End If
            Loop While l004C <> l004E
            If  l0034 = "" Then
                l0034 = " "
            End If
            gv14C2(gv1A86).M594C = l004C
            l0036 = fn04ED(gv14C2(gv1A86))
            MsgBox "Password has been Changed.", mc0052, "Change Password"
        Case mc0020
            Unload frmCreateChar
            sub2D04 mc0058
            If  UBound(gv14C2) = m005A Then
                Exit Sub
            End If
            If  gv14C2(m005A).M58AF < False Or gv14C2(mc0058).M58AF < False Then
                MsgBox "One or both characters still owe money to the Bank and cannot Exchange Items or Gold until it is paid!", mc004A, "Sorry!"
                sub04DC mc0058
                Exit Sub
            End If
            If  RTrim(gv14C2(mc0058).M548B) <> "" Then
                If  (gv14C2(m005A).M5470 <> gv14C2(mc0058).M5470) Or (gv14C2(m005A).M59BB <> gv14C2(mc0058).M59BB) Then
                    MsgBox "Characters are not at the same location!", mc004A, "Exchange Items"
                Else
                    frmExchange.Show mc003C
                End If
                sub04DC mc0058
                ReDim Preserve gv14C2(m005A)  As T5810
            End If
        Case mc002C
            frmCharList.Show mc003C
        Case mc0026
            frmOptions.Show mc003C
            Form_Load
        Case m001A
            If  Trim(RTrim(gv14C2(gv1A86).M548B)) = "" Then
                frmCreateChar.Show mc003C
                Me.SetFocus
            Else
                Unload Me
                DoEvents
                sub16CB
            End If
        Case mc001E
            sub2D18
        Case mc0024
            l0036 = extfn012C(frmMain.hWnd, App.HelpFile, mc0070, 0)
        Case mc0028
            If  Trim(gv14C2(gv1A86).M548B) = "" Then
                Unload frmCreateChar
                sub2D04 0
            Else
                sub04DC gv1A84
            End If
            cmdCommand(m001A).SetFocus
        Case mc0022
            Unload frmMain
        Case mc002A
            frmAbout.Show mc003C
        Case Else
    End Select
    If  fn03BD(frmMenu) Then
        sub2D2E
    End If
End Sub

Sub Form_Load ()
Dim l0086 As Integer ' 81
Dim l0088 As String ' 87
' Const mc0090 = 7 ' &H7%
Static m0096 As Integer ' 61
Static m00A8 As Integer ' 61
    ReDim gv1B1E(0)      As Single
    sub063F mc0090
    sub2D2E
    sub02FE Me
    gv1B1E(gv1A86) = False
    If  gv1A66.M5EE9 = True Then
        frmMain!Ctl3D1.P?C00C = True
    Else
        frmMain!Ctl3D1.P?C00C = False
    End If
    Me.Show
    cmdCommand(m001A).SetFocus
    Screen.MousePointer = m0096
    gv1B52 = False
    DoEvents
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NotFirstTime"), "T") = False Then
        l0088 = "Welcome to Mordor " + gc0186 + "!" + Chr(13)
        l0088 = l0088 + Chr(13)
        l0088 = l0088 + "We just wanted to remind you that Mordor is a very large game, and can sometimes be complex to the beginner.  "
        l0088 = l0088 + "It is for this reason that we have put a great deal of effort into the on-line Mordor HelpLesson." + Chr(13)
        l0088 = l0088 + Chr(13)
        l0088 = l0088 + "Even if you've read the manual, it's recommended that a player becomes familiar with the HelpLesson, which contains "
        l0088 = l0088 + "valuable game information, game statistics, hints & tips on playing, and more!" + Chr$(13)
        l0088 = l0088 + Chr(13)
        l0088 = l0088 + "If you ever have a question about game play, troubleshooting or even an individual spell, simply press "
        l0088 = l0088 + "F1 anytime in the game and do a search for whatever you're looking for!" + Chr(13)
        l0088 = l0088 + Chr(13)
        l0088 = l0088 + "Enjoy the Game & Happy Adventuring!"
        MsgBox l0088, mc0052, "Welcome!"
        l0086 = extfn0184("Loading Information", "NotFirstTime", "True", fn0360$(gv19E4) + "MORDOR.INI")
    End If
    If  m00A8 = True Then cmdCommand(mc002A).Caption = "Ordering/&About"
End Sub

Sub Form_Unload (Cancel As Integer)
    DoEvents
End Sub

Sub sub2D18 ()
Dim l00AE As Integer ' 81
Dim l00B0 ' 80
Dim l00B2 As Integer ' 81
' Const mc00C4 = 2900 ' &HB54%
    If  MsgBox("Delete " + RTrim(gv14C2(gv1A86).M548B) + "?", 36, "DELETE CHARACTER") <> 6 Then
        Exit Sub
    End If
    l00B2 = FreeFile
    For l00B0 = 0 To gv1BEA - 1
        If  gv14C2(gv1A86).M5584(l00B0).M4E82 > 0 Then
            If  gv16CA(l00B0).M548B = RTrim(gv14C2(gv1A86).M548B) Then
                gv16CA(l00B0).M548B = ""
            End If
        End If
    Next l00B0
    sub0565 True
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l00B2 Len = mc00C4
    Get #l00B2, 2, gv1ACC.M5FF2
    If  gv1ACC.M5FF2 = 0 Then
        Exit Sub
    Else
        gv14C2(gv1A86).M548B = " "
        Put #l00B2, gv14C2(gv1A86).M5962, gv14C2(gv1A86)
        gv1ACC.M5FF2 = gv1ACC.M5FF2 - 1
        Put #l00B2, 2, gv1ACC.M5FF2
        sub04DC gv1A84
    End If
    Close #l00B2
    sub096E
    l00AE = MsgBox("Character has been deleted!", 64, "CHARACTER DELETED")
    ReDim gv14C2(m005A)  As T5810
    gv14C2(m005A).M548B = " "
End Sub

Sub sub2D04 (p00CA As Integer ' 41)
Dim l00CC As Integer ' 81
Dim l00D0 As String ' 87
Dim l00D2 As Integer ' 81
Dim l00D4 As Integer ' 81
Dim l00D6 As Integer ' 81
Dim l00DA As T5810 ' 8A
' Const mc00E6 =-2 ' &HFFFE%
    If  p00CA = False Then
        l00D4 = Val(fn16A0("Load Character", "Load which character?", "", "LOADCHAR"))
    Else
        l00D4 = Val(fn16A0("Exchange Items", "Exchange Items with who?", "", "LOADCHAR"))
    End If
    If  l00D4 = -1 Then
        Exit Sub
    End If
    l00D6 = FreeFile
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l00D6 Len = mc00C4
    Get #l00D6, gv1732(l00D4).M5467, l00DA
    Close #l00D6
    l00D0 = ""
    If  Len(RTrim(l00DA.M594C)) Then
        l00D0 = fn16A0("Load Character", "Enter Password", "", "PASSWORD")
        If  l00D0 = "-1" Then
            Exit Sub
        End If
    End If
    l00D2 = fn04CD(RTrim(l00DA.M548B), l00D0, p00CA, False)
    Select Case l00D2
        Case True
        Case False
            Exit Sub
        Case mc00E6
            l00CC = MsgBox("Incorrect Password!", 64, "SORRY!")
            Exit Sub
        Case Else
            l00CC = MsgBox("Unknown error" + Str$(l00D2) + " reading character!", 64, "SORRY!")
            Exit Sub
    End Select
End Sub

Sub sub2D2E ()
' Const mc00E6 =-2 ' &HFFFE%
    If  RTrim(CStr(gv14C2(gv1A86).M548B)) <> "" Then
        cmdCommand(m001A).Caption = "&Run " + Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34)
        cmdCommand(mc001C).Visible = True
        cmdCommand(mc001E).Visible = True
        cmdCommand(mc0020).Visible = True
        cmdCommand(mc0028).Caption = "&Unload Character"
    Else
        cmdCommand(m001A).Caption = "&Create a Character"
        cmdCommand(mc001C).Visible = False
        cmdCommand(mc001E).Visible = False
        cmdCommand(mc0020).Visible = False
        cmdCommand(mc0028).Caption = "&Load Character"
    End If
End Sub
