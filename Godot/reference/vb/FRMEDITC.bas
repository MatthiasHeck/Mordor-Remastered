' FRMEDITC.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0020 = 3 ' &H3%
Const mc0022 = 4 ' &H4%
Const mc0024 = 5 ' &H5%
Const mc0026 = 6 ' &H6%
Const mc0028 = 7 ' &H7%
Const mc002A = 8 ' &H8%
Const mc002C = 9 ' &H9%
Dim m002E As Integer ' 61
Const mc0030 = 1 ' &H1%
Dim m0032 As Integer ' 61
Const mc0034 = 1 ' &H1%
Const mc0052 = 32 ' &H20%
Const mc0054 = 4 ' &H4%
Const mc0056 = 6 ' &H6%
Const m0058 = 0 ' &H0%
Const mc0066 = 1 ' &H1%
Const mc0078 = 6 ' &H6%
Const mc0082 = 1 ' &H1%
Const mc008A = 40 ' &H28%
Const mc008C = 48 ' &H30%
Const mc009E = 4 ' &H4%
Const mc00AA = 11 ' &HB%

Sub cmbCombo_KeyDown (Index%, KeyCode As Integer, Shift As Integer)
    Select Case Index
        Case m0032
            If  KeyCode = 13 Then
                cmdCommand_Click mc0024
                KeyCode = False
            End If
        Case mc0034
            If  KeyCode = 13 Then
                cmdCommand_Click mc0026
                KeyCode = False
            End If
        Case Else
    End Select
End Sub

Sub cmbCombo_KeyPress (Index%, KeyAscii As Integer)
    Select Case Index
        Case m0032
            If  KeyAscii = 13 Then
                KeyAscii = False
            End If
        Case Else
    End Select
End Sub

Sub cmdCommand_Click (Index%)
Dim l0042 ' 80
Dim l0044 As Integer ' 81
Dim l0046 As Integer ' 81
Dim l0048 ' 80
Dim l004A As Integer ' 81
Dim l004E As String ' 87
Dim l0050 As Integer ' 81
' Const mc0052 = 32 ' &H20%
' Const mc0054 = 4 ' &H4%
' Const mc0056 = 6 ' &H6%
' Const m0058 = 0 ' &H0%
' Const mc0066 = 1 ' &H1%
Static m0076 As Integer ' 61
' Const mc0078 = 6 ' &H6%
' Const mc0082 = 1 ' &H1%
' Const mc008A = 40 ' &H28%
' Const mc008C = 48 ' &H30%
' Const mc009E = 4 ' &H4%
    On Error GoTo L8180E
    Select Case Index
        Case mc002C
            If  MsgBox("This option will automatically select and add the best items for your character." + Chr(13) + "Proceed?", mc0052 & mc0054, "Outfit Character") = mc0056 Then
                sub31E0
            End If
        Case mc002A
            If  gv14C2(m0058).M5470 > False Then
                l004E = fn16A0("Teleport", "Enter coords as follows:" + Chr$(13) + "X, Y, Lev (ie 2,3,7)", "", "TELEPORT")
                If  l004E = "-1" Then
                    Exit Sub
                End If
                If  fn164C("EDITTELEPORT", l004E) = mc0066 Then
                    Beep
                End If
                cmdCommand_Click m001A
            End If
        Case mc0028
            If  gv14C2(gv1A86).M5483 <> False Then
                gv14C2(gv1A86).M5483 = False
                gv14C2(gv1A86).M4EAC = gv14C2(m0058).M4EB4
                gv1D6C = gv14C2(gv1A86).M5470
                gv1D6A = gv14C2(gv1A86).M59BB
                gv14C2(gv1A86).M5470 = 1
                gv14C2(gv1A86).M583F = 9
                gv14C2(gv1A86).M5845 = 11
                l0050 = fn0A0B(m0058)
                frmDungeonMain!picMonsters.Visible = True
                frmDungeonMain!lblRoom.Visible = True
                frmDungeonMain!timCombat.Enabled = True
                frmDungeonMain!timAilment.Enabled = True
                frmDungeonMain!lblDead.Visible = False
                frmDungeonMain!cmdWait.Visible = False
                frmDungeonMain!lblSquareInfo.FontBold = True
                sub0835 gv1D6C
                sub0980
            End If
        Case mc001C
            gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M55CB = False
        Case mc001E
            sub047C gv1A84, m0076
            For l0042 = False To mc0078 - 1
                gv14C2(gv1A86).M55B5(l0042) = gv148E(gv14C2(gv1A86).M5821).M553C(l0042) + 5
            Next l0042
            sub047C gv1A84, mc0082
        Case mc0020
            gv14C2(gv1A86).M579B = gv14C2(gv1A86).M579B + CLng(txtText(m002E).Text)
        Case mc0022
            gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + CLng(txtText(mc0030).Text)
        Case mc0024
            l0044 = False
            For l0042 = 1 To mc008A - 1
                If  gv14C2(gv1A86).M5857(l0042).M4ED4 = 0 Then
                    l0044 = l0042
                    Exit For
                End If
            Next l0042
            If  l0044 = 0 Then
                MsgBox "You have no room for another item.", mc008C, "Sorry!"
                Exit Sub
            End If
            If  cmbCombo(m0032).ListIndex = -1 Then
                For l0050 = False To gv1BEC - 1
                    If  UCase(gv1426(l0050).M548B) = UCase(cmbCombo(m0032).Text) Then
                        For l0042 = False To cmbCombo(m0032).ListCount - 1
                            If  cmbCombo(m0032).List(l0042) = gv1426(l0050).M548B Then
                                cmbCombo(m0032).ListIndex = l0042
                                Exit For
                            End If
                        Next l0042
                    End If
                    If  cmbCombo(m0032).ListIndex <> -1 Then
                        Exit For
                    End If
                Next l0050
            End If
            l0046 = cmbCombo(m0032).ItemData(cmbCombo(m0032).ListIndex)
            sub31F1 l0046, l0044
        Case mc0026
            l004A = cmbCombo(mc0034).ItemData(cmbCombo(mc0034).ListIndex)
            For l0048 = 0 To mc009E - 1
                If  gv14C2(gv1A86).M58CB(l0048).M4ED4 = -1 Then
                    gv14C2(gv1A86).M58CB(l0048).M4ED4 = l004A
                    gv14C2(gv1A86).M58CB(l0048).M57D4 = gv14F6(l004A).M5467
                    gv14C2(gv1A86).M58CB(l0048).M4EAC = gv14F6(l004A).M4EAC
                    gv14C2(gv1A86).M58CB(l0048).M4EB4 = gv14F6(l004A).M4EAC
                    gv14C2(gv1A86).M58CB(l0048).M4EBF = gv14F6(l004A).M4EBF
                    gv14C2(gv1A86).M58CB(l0048).M4E97 = gv14F6(l004A).M4E97
                    gv14C2(gv1A86).M58CB(l0048).M4EA1 = gv14F6(l004A).M4EA1
                    gv14C2(gv1A86).M58CB(l0048).M57E1 = -10
                    Exit For
                End If
            Next l0048
            sub0B82 gv1A86
        Case m001A
            Unload Me
        Case Else
    End Select
    sub08A9 False, 50
    Exit Sub

L8180E:
    MsgBox "Error '" + Error + "' carrying out selection!", mc008C, "Error!"
    Resume L81872
L81872:
End Sub

Sub Form_Load ()
Dim l00A8 ' 80
' Const mc00AA = 11 ' &HB%
Static m00B8 As Integer ' 61
    sub02FE Me
    Screen.MousePointer = mc00AA
    For l00A8 = 1 To gv1BEC - 1
        cmbCombo(m0032).AddItem gv1426(l00A8).M548B
        cmbCombo(m0032).ItemData(cmbCombo(m0032).ListCount - 1) = l00A8
    Next l00A8
    cmbCombo(m0032).ListIndex = False
    For l00A8 = 1 To gv1BF6 - 1
        cmbCombo(mc0034).AddItem gv14F6(l00A8).M548B
        cmbCombo(mc0034).ItemData(cmbCombo(mc0034).ListCount - 1) = l00A8
    Next l00A8
    cmbCombo(mc0034).ListIndex = False
    If  gv14C2(gv1A86).M5483 <> False Then
        cmdCommand(mc0028).Enabled = True
    End If
    Screen.MousePointer = m00B8
End Sub

Sub Form_Unload (Cancel As Integer)
    Set frmEditChar = Nothing
End Sub

Sub sub31F1 (p00C0 As Integer ' 41, p00C2 As Integer ' 41)
Static m00C4 As Integer ' 61
    gv14C2(gv1A86).M5857(p00C2).M4E97 = gv1426(p00C0).M4E97
    gv14C2(gv1A86).M5857(p00C2).M4EA1 = gv1426(p00C0).M4EA1
    gv14C2(gv1A86).M5857(p00C2).M4ED4 = p00C0
    If  gv1426(p00C0).M5557 > 1 Then
        gv14C2(gv1A86).M5857(p00C2).M4EBF = gv14C2(gv1A86).M4EBF + 1
    Else
        gv14C2(gv1A86).M5857(p00C2).M4EBF = False
    End If
    If  gv1426(p00C0).M56DB > 0 Then
        gv14C2(gv1A86).M5857(p00C2).M56DB = gv1426(p00C0).M56DB
    Else
        gv14C2(gv1A86).M5857(p00C2).M56DB = 0
    End If
    gv14C2(gv1A86).M5857(p00C2).M4EEE = m00C4
    gv14C2(gv1A86).M5857(p00C2).M5467 = gv1426(p00C0).M5467
    gv14C2(gv1A86).M5857(p00C2).M572A = gv1426(p00C0).M572A
    sub0F61 gv1A84, m0058, p00C2
End Sub

Sub sub31E0 ()
Dim l00C6 ' 80
Dim l00C8 ' 80
Dim l00CA ' 80
Dim l00CC As Integer ' 81
    For l00C8 = False To gv1BEE - 1
        Select Case l00C8
            Case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 29, 32
                For l00C6 = 1 To mc008A - 1
                    If  gv14C2(gv1A86).M5857(l00C6).M4ED4 <= False Then
                        l00CC = False
                        For l00CA = 1 To gv1BEC - 1
                            If  gv1426(l00CA).M5709 = l00C8 Then
                                If  fn110D(gv1A86, l00CA, False, 1) <> False And gv1426(l00CA).M572A = False Then
                                    l00CC = l00CA
                                End If
                            End If
                        Next l00CA
                        If  l00CC > False Then
                            sub31F1 l00CC, l00C6
                        End If
                        Exit For
                    End If
                Next l00C6
            Case Else
        End Select
    Next l00C8
End Sub
