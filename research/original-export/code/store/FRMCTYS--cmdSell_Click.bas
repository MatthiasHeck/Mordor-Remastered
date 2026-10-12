Sub cmdSell_Click ()
Dim l011E As Integer ' 81
Dim l0120 As String ' 87
Dim l0122 As Integer ' 81
Dim l0124 As Integer ' 81
Dim l0126 As Integer ' 81
Dim l0128 As Integer ' 81
    txtID_KeyPress mc00E2
    If  cmdSell.Enabled = False Then Exit Sub
    l0120 = txtID.Text
    l011E = fn12C4(l0120)
    If  l011E > -1 Then
        If  gv14C2(gv1A86).M5857(l011E).M577E = mc0118 And gv14C2(gv1A86).M5857(l011E).M572A <> False Then
            l0128% = MsgBox("Item is Equipped and Cursed!", 64, "SELL ITEM")
            Exit Sub
        End If
        If  gv14C2(gv1A86).M5857(l011E).M577E = mc0118 Then
            sub0F74 gv1A84, l011E
        End If
        gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + fn273B(l011E)
        If  gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB > 0 Then
            Select Case gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M5709
                Case 23, 24, 25, 26, 27, 28, 30, 31
                    If  gv14C2(gv1A86).M5857(l011E).M56DB >= gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB Then
                        l0122 = True
                        If  gv14C2(gv1A86).M5857(l011E).M56DB > gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB Then
                            gv14C2(gv1A86).M5857(l011E).M56DB = gv14C2(gv1A86).M5857(l011E).M56DB - gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M56DB
                            l0124 = True
                        Else
                            l0126 = True
                        End If
                    Else
                        l0126 = True
                        l0122 = False
                    End If
                Case Else
                    l0122 = True
                    l0126 = True
            End Select
        Else
            l0122 = True
            l0126 = True
        End If
        If  gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M5693 = False And gv14C2(gv1A86).M5857(l011E).M4EBF = 0 Then
            l0122 = False
        End If
        If  l0122 = True And gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M572A = False And gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5557(gv14C2(gv1A86).M5857(l011E).M4EBF) < mc00B6 Then
            gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5557(gv14C2(gv1A86).M5857(l011E).M4EBF) = gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5557(gv14C2(gv1A86).M5857(l011E).M4EBF) + 1
            gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5766 = gv14C2(gv1A86).M5857(l011E).M4ED4
            gv15FA(gv14C2(gv1A86).M5857(l011E).M4ED4).M5467 = gv1426(gv14C2(gv1A86).M5857(l011E).M4ED4).M5467
        End If
        If  l0126 = True Then
            sub0EDA gv1A86, l011E
        End If
        sub0F61 gv1A86, m00C4, l011E
        sub08A9 False, 10
        If  l0124 = False Then
            sub268D
        Else
            txtID.Text = LTrim$(Str$(l011E + 1))
        End If
        txtID_KeyPress 13
    End If
    m0026% = True
    sub260A 1
End Sub
