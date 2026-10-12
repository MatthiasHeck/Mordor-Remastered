Sub sub2621 ()
Dim l0210 As String ' 87
Dim l0212 As Integer ' 81
Dim l0214() As Integer ' 91
Dim l021A As Integer ' 81
Dim l021C As Integer ' 81
Dim l0220 As Integer ' 81
Dim l0222 As Integer ' 81
Dim l0224 As Integer ' 81
    l0210 = lblCombine.Caption
    If  l0210 = "" Then
        Exit Sub
    End If
    l0212 = 0
    l021C = 1
    l021A = 0
    Do
        l0212 = l0212 + 1
        If  Mid$(l0210, l0212, 1) = "," Or l0212 = Len(l0210) Then
            l021A = l021A + 1
            If  l0212 = Len(l0210) Then
                l0212 = l0212 + 1
            End If
            ReDim Preserve l0214(l021A - 1)     As Integer
            l0214(l021A - 1) = Val(Mid$(l0210, l021C, l0212 - l021C)) - 1
            l021C = l0212 + 1
        End If
        If  l0212 >= Len(l0210) Then
            Exit Do
        End If
    Loop
    For l0212 = False To UBound(l0214)
        If  gv14C2(gv1A86).M5857(l0214(l0212)).M4EEE <> m0148 Then
            l0212 = MsgBox("Item #" + CStr(l0214(l0212) + 1) + " Not Completely Identified!", 48, "SORRY!")
            lblCombine.Caption = ""
            Exit Sub
        End If
    Next l0212
    If  UBound(l0214) = 0 Then
        lblCombine.Caption = ""
        Exit Sub
    End If
    l021A = 0
    l0224 = gv14C2(gv1A86).M5857(l0214(0)).M4ED4
    l0220 = gv1426(gv14C2(gv1A86).M5857(l0214(0)).M4ED4).M5709
    l0222 = gv14C2(gv1A86).M5857(l0214(0)).M4EBF
    Select Case l0220
        Case 23, 24, 25, 26, 27, 28, 30, 31
        Case Else
            l0212 = MsgBox("Item Class cannot be Combined!", 48, "SORRY!")
            lblCombine.Caption = ""
            Exit Sub
    End Select
    For l0212 = 1 To UBound(l0214)
        If  l0214(l0212) <> l0214(0) Then
            If  gv14C2(gv1A86).M5857(l0214(l0212)).M4EEE = m0148 Then
                If  gv1426(gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4).M5709 = l0220 Then
                    If  gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4 = l0224 Then
                        If  gv14C2(gv1A86).M5857(l0214(l0212)).M4EBF = l0222 Then
                            If  gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4 = l0224 Then
                                sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " combined to Item #" + LTrim$(Str$(l0214(0) + 1)) + "."
                                gv14C2(gv1A86).M5857(l0214(0)).M56DB = gv14C2(gv1A86).M5857(l0214(0)).M56DB + gv14C2(gv1A86).M5857(l0214(l0212)).M56DB
                                gv14C2(gv1A86).M5857(l0214(l0212)).M4ED4 = 0
                                sub0F61 gv1A84, m00C4, l0214(l0212)
                            End If
                            Else
                            sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not compatible Alignment."
                        End If
                        Else
                        sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not of the same type."
                    End If
                    Else
                    sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not compatible class."
                End If
                Else
                sub085B "STORE: Item #" + LTrim$(Str$(l0214(l0212) + 1)) + " is not completely identified."
            End If
        End If
    Next l0212
    sub0F61 gv1A84, m00C4, l0214(0)
    lblCombine.Caption = ""
End Sub
