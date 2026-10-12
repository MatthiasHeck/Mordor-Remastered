' FRMCHARL.FRM
Option Explicit
Dim m001A() As String ' 77
Dim m004C As Integer ' 61
Const mc005E = 2900 ' &HB54%
Const mc0086 = 48 ' &H30%

Sub cmdExit_Click ()
    Unload frmCharList
End Sub

Sub Form_Deactivate ()
    Unload frmCharList
End Sub

Sub Form_Load ()
Dim l0052 As Integer ' 81
Dim l0054 ' 80
Dim l0056 As Integer ' 81
' Const mc005E = 2900 ' &HB54%
Dim l0060 As String ' 87
Dim l0074 As T5810 ' 8A
Dim l0076 As String ' 87
' Const mc0086 = 48 ' &H30%
    sub02FE Me
    On Error GoTo L755FA
    l0052 = FreeFile
    m004C = True
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l0052 Len = mc005E
    Get #l0052, 1, l0060$
    Get #l0052, 2, gv1ACC.M5FF2
    ReDim m001A(gv1ACC.M5FF2)
    If  gv1ACC.M5FF2 = 0 Then
        lblNumber.Caption = "0"
        lstCharacters.AddItem "<NONE>"
        Close #l0052
    Else
        For l0054 = 1 To gv1ACC.M5FF2
            Do
                Get #l0052, l0054 + 2 + l0056, l0074
                If  RTrim(l0074.M548B) <> "" Then
                    Exit Do
                End If
                l0056 = l0056 + 1
            Loop
            m001A(l0054 - 1) = RTrim(l0074.M548B)
            l0076 = RTrim(l0074.M548B) + " (Level " + LTrim$(Str$(l0074.M5584(l0074.M58BB).M4E82)) + " " + gv145A(l0074.M58BB).M548B + ")"
            If  l0074.M5483 <> False Then
                l0076 = l0076 + " [" + UCase$(gv0814$(l0074.M5483 - 1)) + "]"
            End If
            lstCharacters.AddItem l0076
        Next l0054
        lstCharacters.ListIndex = 0
        lblNumber.Caption = LTrim$(Str$(gv1ACC.M5FF2))
    End If
    Close #l0052
    sub0802 Me
    m004C = False
    Exit Sub

L755FA:
    MsgBox "Error '" + Error + "' occurred in FRMCHARL:Form_Load!", mc0086, "Error!"
    Resume L75666
L75666:
End Sub

Sub Form_LostFocus ()
    Unload frmCharList
End Sub

Sub Form_Resize ()
    If  m004C = False Then
        sub07B3 Me, elaElastic
    End If
End Sub
