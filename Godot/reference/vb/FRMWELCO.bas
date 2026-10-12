' FRMWELCO.FRM
Option Explicit
Const mc0026 = 3 ' &H3%
Dim m0028 As Single ' 63

Sub Form_Load ()
Dim l002C As String ' 87
Static m002E As Integer ' 61
    m0028 = Timer
    If  m002E Then
        l002C = "Limited "
    End If
    l002C = l002C + "Version " + gc0186
    l002C = l002C + " (" + gc0196 + ")"
    lblVersion.Caption = l002C
    l002C = ""
    l002C = l002C + "© Copyright 1995, MakeItSo Software"
    lblInfo.Caption = l002C
    sub02FE Me
    Me.Refresh
End Sub

Sub Form_Unload (Cancel As Integer)
    Do
    Loop While Abs(m0028 - Timer) < mc0026
End Sub

Sub lblLoading_Change ()
    lblLoading.Refresh
End Sub
