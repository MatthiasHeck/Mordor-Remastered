Sub cmdBuy_Click ()
Dim l006C As Integer ' 81
Dim l006E ' 80
Dim l0070 As Integer ' 81
Dim l0072 As Integer ' 81
Dim l0074 As Integer ' 81
Dim l0076 As String ' 87
' Const mc0078 = 40 ' &H28%
' Const mc009C = 4 ' &H4%
' Const mc00B6 = 9 ' &H9%
' Const m00BE = 0 ' &H0%
' Const m00C4 = 0 ' &H0%
    l0070 = 0
    For l006E = 1 To mc0078 - 1
        If  gv14C2(gv1A86).M5857(l006E).M4ED4 = 0 Then
            l0070 = l006E
            Exit For
        End If
    Next l006E
    If  l0070 = 0 Then
        l006C% = MsgBox("No free slots!", 64, "BUY ITEM")
        Exit Sub
    End If
    If  fn114E(fn272C(m0028%, Val(elaSelectedItem.P?C00C))) = False Then
        l006C% = MsgBox("Not enough gold!", 64, "BUY ITEM")
        Exit Sub
    End If
    m0026% = True
    l0072 = Val(elaSelectedItem.P?C00C)
    gv14C2(gv1A86).M5857(l0070).M4ED4 = l0072
    gv14C2(gv1A86).M5857(l0070).M4E97 = gv1426(l0072).M4E97
    gv14C2(gv1A86).M5857(l0070).M4EA1 = gv1426(l0072).M4EA1
    gv14C2(gv1A86).M5857(l0070).M4EBF = m0028%
    gv14C2(gv1A86).M5857(l0070).M56DB = gv1426(l0072).M56DB
    gv14C2(gv1A86).M5857(l0070).M4EEE = 0
    gv14C2(gv1A86).M5857(l0070).M5467 = gv1426(l0072).M5467
    If  gv1426(l0072).M5693 > False Or m0028% > 0 Then
        gv15FA(l0072).M5557(m0028%) = gv15FA(l0072).M5557(m0028%) - 1
    End If
    l006C% = False
    For l006E = 0 To mc009C - 1
        If  gv15FA(l0072).M5557(l006E) > 0 Then
            l006C% = True
            Exit For
        End If
    Next l006E
    If  l006C% = False Then
        gv15FA(l0072).M5766 = 0
        gv15FA(l0072).M5467 = False
    End If
    sub260A 1
    If  gv15FA(l0072).M5557(m0028%) < 1 Then
        elaSelectedItem.P?C024 = ""
        elaSelectedItem.P?C00C = ""
        lblCost.Caption = "Cost"
        elaSelectedItemCost.P?C024 = ""
        cmdBuy.Enabled = False
        cmdInfo.Enabled = False
    Else
        l0074% = gv15FA(m0024%).M5557(m0028%)
        If  l0074% > mc00B6 Then
            l0074% = mc00B6
        End If
        l0076$ = LTrim$(Str$(l0074%)) + gv077E$(m0028%)
        lblCost.Caption = l0076$ + " Cost"
        elaSelectedItemCost.P?C024 = " " + fn036D(CCur(fn272C(m0028%, l0072)), m00BE)
    End If
    sub0F61 gv1A84, m00C4, (l0070)
    sub085B "Slot #" + LTrim$(Str$(l0070 + 1)) + " now contains your " + gv1426(gv14C2(gv1A86).M5857(l0070).M4ED4).M548B + "."
End Sub
