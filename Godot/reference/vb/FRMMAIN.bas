' FRMMAIN.FRM
Option Explicit
Dim m001C As Integer ' 61
Const mc001E = 1 ' &H1%
Const mc0020 = 2 ' &H2%
Const mc0022 = 3 ' &H3%
Const mc0024 = 4 ' &H4%
Const mc0026 = 5 ' &H5%
Const mc0028 = 6 ' &H6%
Const mc002A = 7 ' &H7%
Const mc002C = 8 ' &H8%
Dim m002E As Integer ' 61
Const mc0030 = 1 ' &H1%
Const mc003A = 1 ' &H1%
Const mc0044 = 3 ' &H3%
Const mc004C = 113 ' &H71%
Const mc0058 = 115 ' &H73%
Const mc005A = 116 ' &H74%
Const mc0060 = 117 ' &H75%
Const mc0066 = 118 ' &H76%
Const mc0068 = 71 ' &H47%
Const mc006A = 80 ' &H50%
Const mc006C = 76 ' &H4C%
Const mc006E = 121 ' &H79%
Const mc0070 = 119 ' &H77%
Const mc0072 = 65 ' &H41%
Const mc007E = 27 ' &H1B%
Const mc0094 = 1024 ' &H400%
Const mc0098 =-4000 ' &HF060%
Const m009C = 0 ' &H0%
Const mc00A8 = 6 ' &H6%
Const mc00AA =-1 ' &HFFFF%
Const mc00AC = 274 ' &H112%
Const mc00AE = 16 ' &H10%
Const mc00B0 = 5 ' &H5%
Const mc00B4 = 15 ' &HF%
Const mc00B6 = 20 ' &H14%
Const mc00C0 = 64 ' &H40%
Const mc00D0 = 6 ' &H6%
Const mc00D6 = 1 ' &H1%
Const mc00E4 = 2 ' &H2%
Const mc0116 =-3776 ' &HF140%

Sub cmdTool_Click (Index%)
Dim l0034 As Integer ' 81
Static m0038 As Integer ' 61
' Const mc003A = 1 ' &H1%
' Const mc0044 = 3 ' &H3%
Dim l0048 As Variant ' 86
' Const mc004C = 113 ' &H71%
Dim l0054 As Variant ' 86
' Const mc0058 = 115 ' &H73%
' Const mc005A = 116 ' &H74%
Dim l005C As Variant ' 86
' Const mc0060 = 117 ' &H75%
Dim l0062 As Variant ' 86
' Const mc0066 = 118 ' &H76%
' Const mc0068 = 71 ' &H47%
' Const mc006A = 80 ' &H50%
' Const mc006C = 76 ' &H4C%
' Const mc006E = 121 ' &H79%
' Const mc0070 = 119 ' &H77%
' Const mc0072 = 65 ' &H41%
    Select Case Index
        Case mc002C
            If  gv19D8 = m0038 Then
                sub152F mc003A
            Else
                sub152F m0038
            End If
        Case m001C
            l0034 = extfn012C(frmMain.hWnd, App.HelpFile, mc0044, 0)
        Case l0048
            l0034 = fn14CB(mc004C, False)
            frmCharStat1!picTabPicture.Refresh
        Case l0054
            l0034 = fn14CB(mc0058, False)
            frmCharStat1!picTabPicture.Refresh
        Case mc001E
            l0034 = fn14CB(mc005A, False)
        Case l005C
            l0034 = fn14CB(mc0060, False)
            frmCharStat1!picTabPicture.Refresh
        Case l0062
            l0034 = fn14CB(mc0066, False)
            frmCharStat1!picTabPicture.Refresh
        Case mc0024
            l0034 = fn14CB(mc0068, False)
        Case mc0026
            l0034 = fn14CB(mc006A, False)
        Case mc0028
            l0034 = fn14CB(mc006C, False)
        Case mc002A
            l0034 = fn14CB(mc006E, False)
        Case mc0020
            l0034 = fn14CB(mc0070, False)
        Case mc0022
            l0034 = fn14CB(mc0072, False)
        Case Else
    End Select
    If  Not gv1BFC Is Nothing Then
        gv1BFC.SetFocus
    End If
End Sub

Sub cmdTool_KeyDown (Index%, KeyCode As Integer, Shift As Integer)
' Const mc007E = 27 ' &H1B%
    If  KeyCode = mc007E And gv1B52 Then
        gv1BFC.SetFocus
        KeyCode = 0
    End If
End Sub

Sub cmdTool_KeyPress (Index%, KeyAscii As Integer)
    If  KeyAscii = mc007E Then KeyAscii = 0
End Sub

Sub mciMusic_Done (NotifyCode As Integer)
    mciMusic.Tag = "-1"
End Sub

Sub MDIForm_Activate ()
    sub050F
End Sub

Sub MDIForm_Load ()
Dim l008E As Integer ' 81
Dim l0090 As Integer ' 81
' Const mc0094 = 1024 ' &H400%
' Const mc0098 =-4000 ' &HF060%
Static m009A As Integer ' 61
' Const m009C = 0 ' &H0%
' Const mc00A8 = 6 ' &H6%
' Const mc00AA =-1 ' &HFFFF%
' Const mc00AC = 274 ' &H112%
' Const mc00AE = 16 ' &H10%
' Const mc00B0 = 5 ' &H5%
' Const mc00B4 = 15 ' &HF%
' Const mc00B6 = 20 ' &H14%
Static m00B8 As Integer ' 61
    l0090 = extfn0086(Me.hWnd, False)
    l008E = extfn0097(l0090, 5, mc0094)
    l008E = extfn0097(l0090, mc0098, m009A)
    If  m009C = True Then
        Me.Caption = gc0192 + " " + gc0186 + " (Limited Version)"
    Else
        Me.Caption = gc0192 + " " + gc0186
    End If
    msgBlast(mc0030).X2 = Me.hWnd
    msgBlast(mc0030).Y1(0) = mc00A8
    msgBlast(mc0030).Y2(0) = mc00AA
    msgBlast(mc0030).Y1(1) = mc00AC
    msgBlast(mc0030).Y2(1) = mc00AA
    msgBlast(mc0030).Y1(2) = mc00AE
    msgBlast(mc0030).Y2(2) = mc00AA
    msgBlast(m002E).X2 = (extfn1CEA(Me.hWnd, mc00B0))
    msgBlast(m002E).Y1(0) = mc00B4
    msgBlast(m002E).Y2(0) = mc00AA
    msgBlast(m002E).Y1(1) = mc00B6
    msgBlast(m002E).Y2(1) = m00B8
End Sub

Sub MDIForm_QueryUnload (Cancel As Integer, UnloadMode As Integer)
' Const mc00C0 = 64 ' &H40%
' Const mc00D0 = 6 ' &H6%
    On Error GoTo L5CA08
    If  UnloadMode = False Then
        MsgBox "Please use the Mordor EXIT buttons to leave the game.", mc00C0, "Exit Mordor"
        Cancel = True
        Exit Sub
    End If
    If  gv1D06 = True Then Exit Sub
    If  fn0EEF() = False Or gv14C2(gv1A86).M5483 > 0 Or gv14C2(gv1A86).M5470 = 0 Then
        If  MsgBox("Exit Mordor?", 36, "EXIT") = mc00D0 Then
            If  gv1B52 Then
                sub165F
            End If
        Else
            Cancel = True
            Exit Sub
        End If
    Else
        Beep
        sub085B "Cannot exit while monsters are in the area!"
        Cancel = True
        Exit Sub
    End If
    sub05F6

L5C9FA:
    Exit Sub

L5CA08:
    MsgBox "Error '" + Error + "' occurred in FRMMAIN:MDIForm_QueryUnload"
    Resume L5C9FA
End Sub

Sub MDIForm_Resize ()
Dim l00D4 As Integer ' 81
' Const mc00D6 = 1 ' &H1%
' Const mc00E4 = 2 ' &H2%
    If  Me.WindowState = mc00D6 Then
        frmMain!mciMusic.Command = "Stop"
        frmMain!mciMusic.Command = "Close"
        frmMain!mciMusic.Tag = ""
        If  gv1A66.M5EFC = False Then
            l00D4 = extfn1DCC(gv20C8, False)
        End If
        gv1ACC.M602F = True
    ElseIf Me.WindowState = mc00E4 Then
        sub1B76
        If  gv1B52 = False Then
            If  fn03BD(frmMenu) = False Then
                frmMenu.Show
            End If
        End If
        sub1A50
        If  gv1A66.M5EFC = False Then
            l00D4 = extfn1DCC(gv20C8, True)
        End If
        gv1ACC.M602F = False
        sub2074
    End If
    If  Me.WindowState = mc00E4 Then
        gv1ACC.M6039 = Me.Height
        gv1ACC.M6049 = Me.Width
    Else
        gv1ACC.M6039 = Screen.Height
        gv1ACC.M6049 = Screen.Width
    End If
End Sub

Sub MDIForm_Unload (Cancel As Integer)
Dim l00F2 As String ' 87
    DoEvents
    If  m009C = False Then
        l00F2 = "THANK YOU FOR PLAYING MORDOR!" + Chr(13) + Chr(13)
        l00F2 = l00F2 + "If you know someone who would enjoy playing Mordor, please feel free to give them a copy of "
        l00F2 = l00F2 + "the shareware release of Mordor, which is included on the Mordor CD-ROM." + Chr(13)
        l00F2 = l00F2 + "You can also find the shareware version of Mordor on many FTP sites, Compuserve, the Microsoft Network, and many other locations (see MORDOR.WRI for more information on distributing the Shareware version)." + Chr(13) + Chr(13)
        l00F2 = l00F2 + "Happy Adventuring!" + Chr(13) + Chr(13)
        l00F2 = l00F2 + "Please report any illegal distribution of the commercial version to the SPA at (800) 388-PIR8 or TDA at (800) 624-2101."
        MsgBox l00F2, mc00C0, gc0192 + " " + gc0186
    End If
End Sub

Sub sub2074 ()
    If  Me.WindowState = mc00D6 Then
        Exit Sub
    End If
    picToolbar.Height = (cmdTool(0).Top * 4) + cmdTool(0).Height
    lblGold.Left = Me.Width - (lblGold.Width) - (Screen.TwipsPerPixelX * 15)
    lblExperience.Left = lblGold.Left
End Sub

Sub msgBlast_event0000 (p010C As Integer ' 41, p010E As Integer ' 41, p0110 As Integer ' 41)
' Const mc0116 =-3776 ' &HF140%
' Const mc011E = 526 ' &H20E%
    Select Case p010C
        Case mc0030
            Select Case p010E
                Case mc00A8
                    If  p0110 = 2 Then sub1B76
                Case mc00AC
                    Select Case p0110
                        Case mc0116
                            Me.WindowState = mc00D6
                        Case Else
                    End Select
                Case Else
            End Select
        Case m002E
            Select Case p010E
                Case mc00B4
                    sub1D61 (picPalette.hWnd), (picPalette.hDC), (frmMain.hWnd)
                Case mc00B6
                Case Else
            End Select
        Case Else
    End Select
End Sub

Sub picToolbar_Paint ()
' Const mc011E = 526 ' &H20E%
    sub08B9 True
End Sub

Sub timMusic_Timer ()
' Const mc011E = 526 ' &H20E%
    sub168B
    If  gv1A66.M5EF1 = False Then
        If  gv1ACC.M602F = False Then
            Select Case Me!mciMusic.Mode
                Case mc011E
                Case Else
                    sub1A50
            End Select
        End If
    End If
End Sub
