' FRMGLDL.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Dim m001E As Integer ' 61
Const mc0020 = 50 ' &H32%
Const mc0022 = 32 ' &H20%
Const mc0024 = 4 ' &H4%
Const mc0026 = 6 ' &H6%
Const mc0066 = 11 ' &HB%
Const m0086 = 0 ' &H0%
Const mc0088 = 48 ' &H30%

Sub cmdClean_Click ()
    If  MsgBox("Cleaning the Guild Log will remove all but " + CStr(mc0020) + " entries from the entire guild log with the option of writing old entries to a text file.  Do you wish to Proceed?", mc0022 + mc0024, "Clean Log File") = mc0026 Then
        sub316B
    End If
End Sub

Sub cmdDone_Click ()
    Unload Me
End Sub

Sub Form_Load ()
    m001C = True
    sub0802 Me
    m001C = False
End Sub

Sub Form_Resize ()
    If  m001C = False Then
        sub07B3 Me, elaElastic
    End If
    If  m001A = False And Me.Visible = True Then
        m001A = True
        Me.Caption = "Log of the " + gv145A(Val(Me.Tag)).M548B
        sub318B
        m001A = False
    End If
    If  m001E > (mc0020 * gv1BEA) Then cmdClean.Visible = True
End Sub

Sub Form_Unload (Cancel As Integer)
    Set frmGuildLog = Nothing
End Sub

Sub sub316B ()
Dim l0046 As Integer ' 81
Dim l0048 As Integer ' 81
Dim l004A As Integer ' 81
Dim l004C ' 80
Dim l004E ' 80
Dim l0050 As String ' 87
Dim l0054 As Long ' 82
Dim l0058 As Integer ' 81
Dim l005A ' 80
Dim l005C As Integer ' 81
Dim l0060() As Integer ' 91
' Const mc0066 = 11 ' &HB%
' Const m0086 = 0 ' &H0%
' Const mc0088 = 48 ' &H30%
    ReDim l0060(gv1BEA - 1)     As Integer
    On Error GoTo L80984
    Screen.MousePointer = mc0066
    If  MsgBox("Do you want the erased log entries to be written to " + gc1C2C + "?", mc0022 + mc0024, "Clean Guild Log") = mc0026 Then l005C = True
    l0046 = FreeFile
    FileCopy gv19E8 + gc1C74 + gc1C24, gv19E8 + gc1C74 + gc1C28
    Kill gv19E8 + gc1C74 + gc1C24
    l0046 = FreeFile
    Open gv19E8 + gc1C74 + gc1C28 For Binary As #l0046
    l0048 = FreeFile
    Open gv19E8 + gc1C74 + gc1C24 For Binary As #l0048
    l004A = FreeFile
    If  l005C Then
        Open gv19E8 + gc1C74 + gc1C2C For Append As #l004A
        Print #l004A, " "
        Print #l004A, "BEGIN GUILD LOG CLEAN (" + Date + ")"
        Print #l004A, "Done By: " + Chr(34) + RTrim(gv14C2(gv1A86).M548B) + Chr(34)
        Print #l004A, " "
    End If
    l0058 = mc0020
    Get #l0046, 1, l005A
    Put #l0048, 1, l0058
    l0058 = 0
    If  LOF(l0046) <> False Then
        Do
            l0058 = l0058 + 1
            Get #l0046, , l004C
            Get #l0046, , l0054
            Get #l0046, , l004E
            l0050 = Space(l004E)
            Get #l0046, , l0050
            If  l005A - l0058 < mc0020 Then
                l0060(l004C) = l0060(l004C) + 1
                Put #l0048, , l004C
                Put #l0048, , l0054
                Put #l0048, , l004E
                Put #l0048, , l0050
            Else
                If  l005C Then
                    Print #l004A, "GUILD: " + gv145A(l004C).M548B
                    Print #l004A, " DATE: " + CVDate(l0054)
                    Print #l004A, "  LOG: " + l0050
                End If
            End If
        Loop While Seek(l0046) < LOF(l0046)
    End If
    Close #l0046
    Close #l0048
    Close #l004A
    cmdClean.Visible = False
    lstLog.Clear
    sub318B
    Screen.MousePointer = m0086
    Exit Sub
L80984:
    Screen.MousePointer = m0086
    cmdClean.Visible = False
    Close #l0046
    Close #l0048
    Close #l004A
    MsgBox "Error " + Error + " cleaning Log File!", mc0088, "Error!"
    Resume L80A24
L80A24:
End Sub

Sub sub318B ()
Dim l008A As Integer ' 81
Dim l008C As Integer ' 81
Dim l008E ' 80
Dim l0090 ' 80
Dim l0092 As String ' 87
Dim l0094 As String ' 87
Dim l0096 As Long ' 82
Dim l0098 As Integer ' 81
Dim l009A ' 80
    On Error GoTo L80CC2
    Screen.MousePointer = mc0066
    l008A = Val(Me.Tag)
    l008C = FreeFile
    Open gv19E8 + gc1C74 + gc1C24 For Binary As #l008C
    Get #l008C, 1, l009A
    If  LOF(l008C) <> False Then
        Do
            Get #l008C, , l008E
            Get #l008C, , l0096
            Get #l008C, , l0090
            m001E = m001E + 1
            If  l008E = l008A Then
                l0098 = l0098 + 1
                l0092 = Space(l0090)
                Get #l008C, , l0092
                If  CLng(Date) = l0096 Then
                    l0094 = "TODAY: "
                Else
                    If  Abs(l0096 - CLng(Date)) > 1 Then
                        l0094 = CStr(Abs(l0096 - CLng(Date))) + " DAYS AGO: "
                    Else
                        l0094 = CStr(Abs(l0096 - CLng(Date))) + " DAY AGO: "
                    End If
                End If
                lstLog.AddItem l0094 + l0092, 0
            Else
                Seek #l008C, Seek(l008C) + l0090
            End If
        Loop While Seek(l008C) < LOF(l008C)
    End If
    If  l0098 = False Then
        lstLog.AddItem "No Entries"
    End If
    lblEntries.Caption = CStr(l0098) + " Entries"
    Close #l008C
    Screen.MousePointer = m0086
    Exit Sub
L80CC2:
    Screen.MousePointer = m0086
    Close #l008C
    MsgBox "Error " + Error + " reading Log File!", mc0088, "Error!"
    lstLog.Clear
    lstLog.AddItem "Error!"
    Resume L80D8C
L80D8C:
End Sub
