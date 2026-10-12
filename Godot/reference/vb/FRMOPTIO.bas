' FRMOPTIO.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0020 = 3 ' &H3%
Const mc0022 = 4 ' &H4%
Const mc0024 = 5 ' &H5%
Const mc0026 = 6 ' &H6%
Const mc0028 = 7 ' &H7%
Const mc002A = 2 ' &H2%
Const mc002C = 3 ' &H3%
Dim m002E As Integer ' 61
Const mc0030 = 1 ' &H1%
Const mc0032 = 2 ' &H2%
Const mc0034 = 3 ' &H3%
Const mc0036 = 4 ' &H4%
Const mc0038 = 5 ' &H5%
Const mc003A = 6 ' &H6%
Const mc003C = 7 ' &H7%
Const mc003E = 8 ' &H8%
Const mc0040 = 9 ' &H9%
Const mc0042 = 10 ' &HA%
Const mc0044 = 11 ' &HB%
Dim m0050 As Integer ' 61
Const mc0052 = 1 ' &H1%
Dim m0054 As Integer ' 61
Dim m0056 As Integer ' 61
Dim m0058 As Integer ' 61
Dim m005A As Integer ' 61
Dim m005C As Integer ' 61
Dim m005E As Integer ' 61
Dim m0060 As Integer ' 61
Dim m0062 As Integer ' 61
Dim m0064 As Integer ' 61
Dim m0066 As Integer ' 61
Dim m0068 As Long ' 62
Dim m006C As Long ' 62
Dim m0070 As Integer ' 61
Dim m0072 As String ' 67
Const m0088 = 0 ' &H0%
Const mc0098 = 48 ' &H30%
Const mc009A = 7 ' &H7%
Const mc009E = 11 ' &HB%
Const mc00B6 = 5 ' &H5%
Const mc00CA = 9 ' &H9%
Const mc00CE = 8 ' &H8%
Const mc00D0 = 32 ' &H20%
Const mc00D2 = 4 ' &H4%
Const mc00D8 = 6 ' &H6%
Const mc00DA = 1 ' &H1%
Const mc00DE = 64 ' &H40%
Const mc00E6 = 1& ' &H1&
Const mc00EA = 4 ' &H4%
Const mc00FE = 526 ' &H20E%
Const mc010E = 2 ' &H2%

Sub chkCheck_Click (Index%, Value As Integer)
Dim l007A As Integer ' 81
' Const m0088 = 0 ' &H0%
' Const mc0098 = 48 ' &H30%
' Const mc009A = 7 ' &H7%
' Const mc009E = 11 ' &HB%
    If  m0070 = False Then
        Select Case Index
            Case mc0044
                gv1A66.M5F8E = -Abs(chkCheck(Index).Value)
                If  gv1D64 <> m0088 Then
                    frmAutoMap!lblCall = "UPDATE"
                End If
            Case mc0030
                gv1A66.M5EF1 = -Abs(chkCheck(Index).Value)
                If  chkCheck(Index).Value = True Then
                    hsbVolume(m0050).Enabled = False
                    l007A = fn19DC()
                Else
                    hsbVolume(m0050).Enabled = True
                    If  fn1A1B() = False Then
                        MsgBox "Error Initializing Music!" + Chr(13) + Chr(13) + "Do you have a MIDI compatible Sound Card installed?  Are the drivers current?", mc0098, "MIDI Music"
                        hsbVolume(m0050).Enabled = False
                    Else
                        sub063F mc009A
                    End If
                End If
            Case mc0032
                gv1A66.M5EFC = -Abs(chkCheck(Index).Value)
                If  chkCheck(Index).Value = True Then
                    hsbVolume(mc0052).Enabled = False
                    sub0618
                Else
                    hsbVolume(mc0052).Enabled = True
                    If  fn1A08() = False Then
                        MsgBox "Error initializing Sound FX!" + Chr(13) + Chr(13) + "Do you have a WAVE compatible Sound Card Installed?  Are the drivers current?", mc0098, "Sound FX"
                        hsbVolume(mc0052).Enabled = False
                    Else
                        sub09DE mc009E
                    End If
                End If
            Case mc0034
                If  fn03BD(frmDungeonMain) Then
                    frmDungeonMain!picMaze2.Cls
                End If
            Case mc003C
                gv1A66.M5F2C = -Abs(chkCheck(Index).Value)
            Case mc0036
                gv1A66.M5F39 = -Abs(chkCheck(Index).Value)
                frmMain!mciMusic.Command = "Stop"
                sub170B
                sub063F mc009A
            Case Else
        End Select
    End If
End Sub

Sub cmdCommand_Click (Index%)
Dim l00AC As Integer ' 81
Dim l00AE As String ' 87
' Const mc00B6 = 5 ' &H5%
' Const mc00CA = 9 ' &H9%
' Const mc00CE = 8 ' &H8%
' Const mc00D0 = 32 ' &H20%
' Const mc00D2 = 4 ' &H4%
' Const mc00D8 = 6 ' &H6%
' Const mc00DA = 1 ' &H1%
' Const mc00DE = 64 ' &H40%
' Const mc00E6 = 1& ' &H1&
' Const mc00EA = 4 ' &H4%
    On Error GoTo L77796
    Select Case Index
        Case mc0020
            If  fn034F(gv19E4 + "\" + gc1C48) Then
                l00AC = extfn00A5(gv19E4 + "\" + gc1C48 + " /c", mc00B6)
            End If
        Case mc0028
            gv1A66.M5EF1 = m0054
            gv1A66.M5EFC = m0056
            gv1A66.M5F11 = m005A
            gv1A66.M5F2C = m005E
            gv1A66.M5F1B = m0062
            gv1A66.M5F71 = m0064
            gv1A66.M5F80 = m005C
            gv1A66.M5F8E = m0066
            gv2196 = m0068
            gv219A = m006C
            gv1A66.M5F39 = m0058
            If  gv1D64 <> m0088 Then
                frmAutoMap!lblCall = "UPDATE"
            End If
            frmMain!mciMusic.Command = "Stop"
            sub170B
            Unload Me
        Case m001A
            If  chkCheck(m002E).Value = False Then
                l00AC = extfn0184("Loading Information", "No3d", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5EE9 = False
            Else
                l00AC = extfn0184("Loading Information", "No3d", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5EE9 = True
            End If
            If  chkCheck(mc0030).Value = False Then
                l00AC = extfn0184("Loading Information", "NoMusic", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5EF1 = False
            Else
                l00AC = extfn0184("Loading Information", "NoMusic", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5EF1 = True
            End If
            If  chkCheck(mc0032).Value = False Then
                l00AC = extfn0184("Loading Information", "NoFX", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5EFC = False
            Else
                l00AC = extfn0184("Loading Information", "NoFX", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5EFC = True
            End If
            If  chkCheck(mc003E).Value = False Then
                l00AC = extfn0184("Loading Information", "NoPartyFX", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F48 = False
            Else
                l00AC = extfn0184("Loading Information", "NoPartyFX", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F48 = True
            End If
            If  chkCheck(mc0034).Value = False Then
                l00AC = extfn0184("Loading Information", "NoStretch", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F04 = False
            Else
                l00AC = extfn0184("Loading Information", "NoStretch", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F04 = True
            End If
            If  chkCheck(mc0038).Value = False Then
                l00AC = extfn0184("Loading Information", "NoDing", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F11 = False
            Else
                l00AC = extfn0184("Loading Information", "NoDing", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F11 = True
            End If
            If  chkCheck(mc003A).Value = False Then
                l00AC = extfn0184("Loading Information", "NoLoadAutomap", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F1B = False
            Else
                l00AC = extfn0184("Loading Information", "NoLoadAutomap", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F1B = True
            End If
            If  chkCheck(mc0040).Value = False Then
                l00AC = extfn0184("Loading Information", "NoHelpSound", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F71 = False
            Else
                l00AC = extfn0184("Loading Information", "NoHelpSound", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F71 = True
            End If
            If  chkCheck(mc0042).Value = False Then
                l00AC = extfn0184("Loading Information", "NoAutoSave", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F80 = False
            Else
                l00AC = extfn0184("Loading Information", "NoAutoSave", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F80 = True
            End If
            If  chkCheck(mc003C).Value = False Then
                l00AC = extfn0184("Loading Information", "NoToolbar", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F2C = False
            Else
                l00AC = extfn0184("Loading Information", "NoToolBar", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F2C = True
            End If
            If  chkCheck(mc0044).Value = False Then
                l00AC = extfn0184("Loading Information", "NoBlinkCursor", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F8E = False
            Else
                l00AC = extfn0184("Loading Information", "NoBlinkCursor", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F8E = True
            End If
            If  chkCheck(mc0036).Value = False Then
                l00AC = extfn0184("Loading Information", "SoundCanvas", "False", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F39 = False
            Else
                l00AC = extfn0184("Loading Information", "SoundCanvas", "True", fn0360$(gv19E4) + "MORDOR.INI")
                gv1A66.M5F39 = True
            End If
            l00AC = extfn0184("Loading Information", "MusicVolume", Str(gv2196), fn0360$(gv19E4) + "MORDOR.INI")
            l00AC = extfn0184("Loading Information", "FXVolume", Str(gv219A), fn0360$(gv19E4) + "MORDOR.INI")
            l00AC = extfn0184("Loading Information", "Brightness", Str(gv2A22), fn0360$(gv19E4) + "MORDOR.INI")
            If  gv1ADC.M41D4 <> "" Then
                l00AC = extfn0184("Fonts", "Pro", gv1ADC.M41D4, fn0360$(gv19E4) + "MORDOR.INI")
                l00AC = extfn0184("Fonts", "ProSize", CStr(gv1ADC.M41E5), fn0360$(gv19E4) + "MORDOR.INI")
            End If
            If  gv1ADC.M41DB <> "" Then
                l00AC = extfn0184("Fonts", "NonPro", gv1ADC.M41DB, fn0360$(gv19E4) + "MORDOR.INI")
                l00AC = extfn0184("Fonts", "NonProSize", CStr(gv1ADC.M41F0), fn0360$(gv19E4) + "MORDOR.INI")
            End If
            Unload Me
        Case mc0026
            gv1ADC.M41D4 = gc0562
            gv1ADC.M41E5 = mc00CA
            gv1ADC.M41DB = gc0566
            gv1ADC.M41F0 = mc00CE
            sub2C63
        Case mc001C, mc001E
            If  MsgBox("You must restart Mordor after Backing up or Restoring.  Do you still wish to proceed?", mc00D0 & mc00D2, frmDirectory.Tag + " files") = mc00D8 Then
                Load frmDirectory
                If  Index = mc001C Then
                    frmDirectory.Tag = "Backup"
                Else
                    frmDirectory.Tag = "Restore"
                End If
                frmDirectory.Show mc00DA
                l00AE = frmDirectory.Tag
                Unload frmDirectory
                If  Len(l00AE) = 0 Then Exit Sub
                If  fn0662(Index - 2, l00AE) Then
                    If  Index = mc001C Then
                        l00AE = ""
                    Else
                        l00AE = "Restart Mordor to have restored data take affect!"
                    End If
                    MsgBox "Mordor will now be shut down.  " + l00AE, mc00DE, "Shutting Down..."
                    sub05F6
                    End
                End If
            End If
        Case mc0022
            dlgDialog.CancelError = True
            dlgDialog.Flags = mc00E6
            dlgDialog.DialogTitle = "Set Proportional Font"
            dlgDialog.FontName = gv1ADC.M41D4
            dlgDialog.FontSize = gv1ADC.M41E5
            dlgDialog.Action = mc00EA
            If  dlgDialog.FontName <> "" Then
                gv1ADC.M41D4 = dlgDialog.FontName
                gv1ADC.M41E5 = dlgDialog.FontSize
                sub2C63
            End If
        Case mc0024
            dlgDialog.CancelError = True
            dlgDialog.Flags = mc00E6
            dlgDialog.DialogTitle = "Set Non-Proportional Font"
            dlgDialog.FontName = gv1ADC.M41DB
            dlgDialog.FontSize = gv1ADC.M41F0
            dlgDialog.Action = mc00EA
            If  dlgDialog.FontName <> "" Then
                gv1ADC.M41DB = dlgDialog.FontName
                gv1ADC.M41F0 = dlgDialog.FontSize
                sub2C63
            End If
        Case Else
    End Select
    Exit Sub

L77796:
    Resume L777A2
L777A2:
End Sub

Sub Form_Load ()
    On Error Resume Next
    m0070 = True
    sub2C76
    chkCheck(m002E).Value = Abs(gv1A66.M5EE9)
    chkCheck(mc0030).Value = Abs(gv1A66.M5EF1)
    chkCheck(mc0032).Value = Abs(gv1A66.M5EFC)
    chkCheck(mc0034).Value = Abs(gv1A66.M5F04)
    chkCheck(mc0038).Value = Abs(gv1A66.M5F11)
    chkCheck(mc003A).Value = Abs(gv1A66.M5F1B)
    chkCheck(mc003C).Value = Abs(gv1A66.M5F2C)
    chkCheck(mc0036).Value = Abs(gv1A66.M5F39)
    chkCheck(mc003E).Value = Abs(gv1A66.M5F48)
    chkCheck(mc0040).Value = Abs(gv1A66.M5F71)
    chkCheck(mc0042).Value = Abs(gv1A66.M5F80)
    chkCheck(mc0044).Value = Abs(gv1A66.M5F8E)
    If  gv1B52 <> False Then
        chkCheck(m002E).Enabled = False
        cmdCommand(mc0022).Enabled = False
        cmdCommand(mc0024).Enabled = False
        cmdCommand(mc0026).Enabled = False
        cmdCommand(mc001C).Enabled = False
        cmdCommand(mc001E).Enabled = False
    End If
    m0054 = gv1A66.M5EF1
    m0056 = gv1A66.M5EFC
    m0058 = gv1A66.M5F39
    m005A = gv1A66.M5F11
    m0062 = gv1A66.M5F1B
    m005E = gv1A66.M5F2C
    m0060 = gv1A66.M5F48
    m0064 = gv1A66.M5F71
    m005C = gv1A66.M5F80
    m0066 = gv1A66.M5F8E
    m0068 = gv2196
    m006C = gv219A
    If  gv2196 <> False Then
        hsbVolume(m0050).Value = (gv2196 And &HFFFF&) / 2
    End If
    If  gv219A <> False Then
        hsbVolume(mc0052).Value = (gv219A And &HFFFF&) / 2
    End If
    sub2C63
    If  gv1A66.M5EF1 = True Then hsbVolume(m0050).Enabled = False
    If  gv1A66.M5EFC = True Then hsbVolume(mc0052).Enabled = False
    If  fn034F(gv19E4 + "\" + gc1C48) Then
        cmdCommand(mc0020).Visible = True
    End If
    sub0802 Me
    m0070 = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
    If  m0070 = False Then
        sub07B3 Me, elaElastic(0)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
Dim l00FC As Integer ' 81
' Const mc00FE = 526 ' &H20E%
    If  gv1A66.M5EF1 = True Then
        l00FC = fn19DC()
    Else
        l00FC = fn1A1B()
        If  frmMain!mciMusic.Mode <> mc00FE Then
            sub063F mc009A
        End If
    End If
End Sub

Sub hsbVolume_Change (Index%)
    hsbVolume_Scroll Index
End Sub

Sub hsbVolume_Scroll (Index%)
Dim l0104 As String ' 87
Dim l0108 As Integer ' 81
Dim l010A As Long ' 82
' Const mc010E = 2 ' &H2%
    If  m0070 = False Then
        l0104 = Hex(hsbVolume(Index).Value * 2)
        If  Len(l0104) < 4 Then
            l0104 = String(4 - Len(l0104), "0") + l0104
        End If
        l010A = CLng("&H" + l0104 + l0104)
        Select Case Index
            Case m0050
                gv2196 = l010A
                l0108 = extfn196A(-1, l010A)
            Case mc0052
                gv219A = l010A
                sub09DE mc010E
            Case Else
        End Select
    End If
End Sub

Sub sub2C76 ()
    m0072 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "LastBackup")
    If  m0072 = "" Then m0072 = "(none)"
    lblBackup = "Last Backup was on " + m0072
End Sub

Sub sub2C63 ()
    lblLabel(mc002A).FontName = gv1ADC.M41D4
    lblLabel(mc002A).FontSize = gv1ADC.M41E5
    lblLabel(mc002A).Caption = gv1ADC.M41D4 + " (" + CStr(gv1ADC.M41E5) + ")"
    lblLabel(mc002C).FontName = gv1ADC.M41DB
    lblLabel(mc002C).FontSize = gv1ADC.M41F0
    lblLabel(mc002C).Caption = gv1ADC.M41DB + " (" + CStr(gv1ADC.M41F0) + ")"
End Sub
