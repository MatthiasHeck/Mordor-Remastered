' FRMDIREC.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc0034 = 48 ' &H30%
Const mc0040 = 1 ' &H1%

Sub cmdCommand_Click (Index%)
' Const mc0034 = 48 ' &H30%
' Const mc0040 = 1 ' &H1%
' Const mc0048 = 4 ' &H4%
    Select Case Index
        Case m001A
            Me.Tag = dirDirectory.Path
        Case mc001C
            Me.Tag = ""
        Case Else
    End Select
    Me.Hide
End Sub

Sub dirDirectory_Change ()
' Const mc0048 = 4 ' &H4%
    lblDirectory.Caption = UCase(dirDirectory.Path)
    sub34AE
End Sub

Sub drvDrive_Change ()
' Const mc0048 = 4 ' &H4%
    On Error GoTo L8B3D2
    dirDirectory.Path = drvDrive.Drive

L8B3C4:
    Exit Sub

L8B3D2:
    MsgBox "Error reading Drive " + drvDrive.Drive + ".  Resetting to default.", mc0034, "Error!"
    drvDrive.Drive = gv19E8
    Resume L8B3C4
End Sub

Sub Form_Load ()
' Const mc0048 = 4 ' &H4%
    drvDrive.Drive = gv19E8
    dirDirectory.Path = gv19E8 + gc1C7C
    lblDirectory.Caption = UCase(gv19E8 + gc1C7C)
    sub34AE
    sub07ED Me
End Sub

Sub Form_Resize ()
' Const mc0048 = 4 ' &H4%
    Me.Caption = "Select " + Me.Tag + " Directory"
    Me.Tag = ""
End Sub

Sub sub34AE ()
' Const mc0048 = 4 ' &H4%
    If  fn034F(fn0360(CStr(dirDirectory.Path)) + gc1C10) Then
        lblInfo.ForeColor = QBColor(mc0040)
        lblInfo.Caption = "BACKUP FILES FOUND IN THIS DIRECTORY"
    Else
        lblInfo.ForeColor = QBColor(mc0048)
        lblInfo.Caption = "BACKUP FILES NOT FOUND IN THIS DIRECTORY"
    End If
End Sub
