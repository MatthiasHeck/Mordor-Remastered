' FRMPINFO.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 3 ' &H3%
Const mc002A = 3 ' &H3%
Const mc002C = 5 ' &H5%
Const mc003E = 10 ' &HA%

Sub cmbBuffer_Click ()
    If  m001A = False Then
        optOption(mc001C).Value = True
        gv14C2(lstCharacters.ListIndex).M5914(mc002C) = cmbBuffer.ListIndex + mc002A
    End If
End Sub

Sub cmdCommand_Click ()
    Unload Me
End Sub

Sub Form_Load ()
Dim l003C ' 80
' Const mc003E = 10 ' &HA%
    sub02FE Me
    For l003C = 0 To UBound(gv14C2)
        lstCharacters.AddItem gv14C2(l003C).M548B
    Next l003C
    For l003C = 0 To mc003E - 1
        cmbBuffer.AddItem CStr(l003C + 1)
    Next l003C
    sub0784 Me
    lstCharacters.ListIndex = False
End Sub

Sub lstCharacters_Click ()
    If  gv14C2(lstCharacters.ListIndex).M5914(mc002C) < mc002A Then
        optOption(gv14C2(lstCharacters.ListIndex).M5914(mc002C)).Value = True
        cmbBuffer.Enabled = False
    Else
        m001A = True
            cmbBuffer.Enabled = True
            optOption(mc001C).Value = True
            cmbBuffer.ListIndex = gv14C2(lstCharacters.ListIndex).M5914(mc002C) - mc002A
        m001A = False
    End If
End Sub

Sub optOption_Click (Index%)
    If  m001A = False Then
        gv14C2(lstCharacters.ListIndex).M5914(mc002C) = Index
        If  Index = mc001C Then
            cmbBuffer.Enabled = True
            If  gv14C2(lstCharacters.ListIndex).M5914(mc002C) >= mc002A Then
                cmbBuffer.ListIndex = gv14C2(lstCharacters.ListIndex).M5914(mc002C) - mc002A
            Else
                cmbBuffer.ListIndex = False
            End If
        Else
            cmbBuffer.Enabled = False
        End If
    End If
End Sub
