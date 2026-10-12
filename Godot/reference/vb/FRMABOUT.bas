' FRMABOUT.FRM
Option Explicit
Const mc001E = 1 ' &H1%
Dim m0032 As Integer ' 61

Sub cmdCredits_Click ()
    frmCredits.Show mc001E
End Sub

Sub cmdInfo_Click ()
    frmOrderInfo.Show mc001E
End Sub

Sub cmdOK_Click ()
    Unload frmAbout
End Sub

Sub Form_Load ()
    lblVersion.Caption = "Version " + gc0186 + " (Last Edited " + gc0196 + ")"
    If  m0032 = True Then cmdInfo.Visible = True
    sub07ED Me
End Sub
