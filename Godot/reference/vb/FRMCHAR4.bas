' FRMCHAR4.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc0032 = 3 ' &H3%
Const mc004A = 32 ' &H20%
Const mc004E = 33 ' &H21%
Const mc0050 = 4 ' &H4%
Const mc0054 = 32 ' &H20%
Const mc0056 = 4 ' &H4%
Const mc0058 = 6 ' &H6%
Const mc0062 = 274 ' &H112%

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l0024 As Variant ' 86
' Const mc0032 = 3 ' &H3%
    On Error Resume Next
    If  KeyCode = gv1CFE.M6541 And Shift = gv1CFE.M654C Or gv14C2(l0024).M5470 = 0 Then
        gv1CFE.M6541 = False
        gv1CFE.M654C = False
        If  fn14CB(KeyCode, Shift) Then
            KeyCode = False
            Shift = False
        End If
    Else
        sub0456 KeyCode, Shift
        KeyCode = False
        Shift = False
    End If
End Sub

Sub Form_Load ()
Static m0034 As Integer ' 61
' Const mc004A = 32 ' &H20%
' Const mc004E = 33 ' &H21%
' Const mc0050 = 4 ' &H4%
' Const mc0054 = 32 ' &H20%
' Const mc0056 = 4 ' &H4%
' Const mc0058 = 6 ' &H6%
    m001A = True
    Me.Tag = "NEW"
    Me.Left = gv14C2(m0034).M5958(mc0032).M425F
    Me.Top = gv14C2(m0034).M5958(mc0032).M4258
    Me.Width = gv14C2(m0034).M5958(mc0032).M4216
    Me.Height = gv14C2(m0034).M5958(mc0032).M420C
    Me.Tag = ""
    gv19C2(mc0032).M4216 = gv19C2(mc0032).M5E20
    gv19C2(mc0032).M420C = gv19C2(mc0032).M5E2D
    gv19C2(mc0032).M5E47 = Me.hWnd
    sub0784 Me
    sub0524 Me
    Me.WindowState = gv14C2(m0034).M5958(mc0032).M5801
    m001A = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
    If  Me.WindowState <> 1 Then
        If  Me.Width < gv19C2(mc0032).M5E20 / 2 Then
            Me.Width = gv19C2(mc0032).M5E20 / 2
        End If
        If  Me.Height < gv19C2(mc0032).M5E2D / 2 Then
            Me.Height = gv19C2(mc0032).M5E2D / 2
        End If
    End If
    If  Me.Tag = "" Then
        If  Me.WindowState = False Then
            lstMessages.Visible = False
            lstMessages.Top = Screen.TwipsPerPixelY * 5
            lstMessages.Left = Screen.TwipsPerPixelX * 5
            lstMessages.Width = Me.Width - ((extfn01D2(mc004A) * 2) * Screen.TwipsPerPixelX) - ((Screen.TwipsPerPixelX * 5) * 2)
            lstMessages.Height = Me.Height - ((Screen.TwipsPerPixelY * 5) * 2) - ((extfn01D2(mc004E) + extfn01D2(mc0050)) * Screen.TwipsPerPixelY)
            lstMessages.Visible = True
        End If
    End If
    Me.Refresh
End Sub

Sub Form_Unload (Cancel As Integer)
    sub15BE -1, mc0032, Me, True
End Sub

Sub lstMessages_DblClick ()
    If  MsgBox("Clear Message Window?", mc0054 Or mc0056, "Clear Window") = mc0058 Then
        lstMessages.Clear
        lstMessages.ListIndex = -1
    End If
End Sub

Sub msgBlast_event0000 (p005A As Integer ' 41, p005C As Integer ' 41)
' Const mc0062 = 274 ' &H112%
' Const mc0064 =-4064 ' &HF020%
    If  m001A = False Then
        Select Case p005A
            Case mc0062
                If  p005C = mc0064 Then
                    sub15BE -1, mc0032, Me, False
                End If
            Case Else
        End Select
    End If
End Sub
