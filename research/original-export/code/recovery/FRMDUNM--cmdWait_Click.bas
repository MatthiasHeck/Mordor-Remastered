Sub cmdWait_Click ()
Dim l007A As Single ' 83
Dim l007C As Integer ' 81
Dim l007E As Integer ' 81
Dim l0080 As Integer ' 81
Dim l0082 As Long ' 82
' Const mc0086 = 23 ' &H17%
' Const mc0090 = 11 ' &HB%
' Const mc0096 = 18 ' &H12%
' Const mc0098 = 48 ' &H30%
' Const m009A = 0 ' &H0%
    If  gv14C2(gv1A86).M5483 > False Then
        If  gv14C2(gv1A86).M5470 > False Then
            l0080 = False
            l0082 = fn0A34(gv14C2(gv1A86).M583F, gv14C2(gv1A86).M5845)
            If  fn0380(mc0086, l0082) <> False Then
                l0080 = True
            End If
            cmdWait.Enabled = False
            Screen.MousePointer = mc0090
            Do
                If  l007E < (Log(gv14C2(gv1A86).M5470) * Log(gv14C2(gv1A86).M5470) * 100) + 21 Then
                    l007C = 10000
                Else
                    l007C = 1000
                End If
                If  gv14C2(gv1A86).M5470 = 1 And gv14C2(gv1A86).M59BB <= mc0096 Then
                    l007C = 100
                End If
                l007E = l007E + 1
                l007A = 16 - (gv14C2(gv1A86).M5470)
                If  l007A < .1# Then
                    l007A = .1#
                End If
                If  l0080 = True Then
                    l007A = l007A + 16 - (gv14C2(gv1A86).M5470)
                End If
                If  Rnd * l007C <= l007A Then
                    Beep
                    MsgBox "You have been found after " + CStr(l007E) + " day(s)!", mc0098, "Wait for Rescue"
                    Exit Do
                End If
            Loop
            gv14C2(gv1A86).M5470 = 0
            gv14C2(gv1A86).M59BB = -1
            sub0EAE False, gv1A86, l007E, True
            sub08A9 True, 50
            Screen.MousePointer = m009A
            cmdWait.Enabled = True
        End If
        sub0930 gv1A86
    End If
End Sub
