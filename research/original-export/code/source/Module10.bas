' Module10
Option Explicit
Declare Sub extsub1AAB Lib "GDI" Alias "AnimatePalette" ()
Declare Function extfn1ABD Lib "GDI" Alias "CreatePalette" (p1 As type) As Integer ' 1
Declare Function extfn1A81 Lib "GDI" Alias "GetPaletteEntries" (ByVal p1%, ByVal p2%, ByVal p3%, p4 As type) As Integer ' 1
Declare Function extfn1ACE Lib "GDI" Alias "GetSystemPaletteEntries" (ByVal p1%, ByVal p2%, ByVal p3%, p4 As type) As Integer ' 1
Declare Function extfn1B00 Lib "GDI" Alias "ResizePalette" () As Integer ' 1
Declare Function extfn1A96 Lib "GDI" Alias "SetPaletteEntries" () As Integer ' 1
Declare Function extfn1AE9 Lib "GDI" Alias "SetSystemPaletteUse" () As Integer ' 1

Sub sub1B11 (p003C As Integer ' 41, p003E As Integer ' 41, p0042 As T72D7 ' 4A, p0046 As T72D7 ' 4A)
Dim l004A As Integer ' 81
Dim l004C As Integer ' 81
    l004C = Asc(p0042.M7304(p003C).M72AE) + Asc(p0042.M7304(p003C).M72B7) + Asc(p0042.M7304(p003C).M72C2)
    l004A = Asc(p0046.M7304(p003C).M72AE)
    l004A = l004A + (((p003E / 10) - 5) * l004A)
    If  l004A < 0 Then l004A = 0
    If  l004A > 255 Then l004A = 255
    p0042.M7304(p003C).M72AE = Chr(l004A)
    l004A = Asc(p0046.M7304(p003C).M72B7)
    l004A = l004A + (((p003E / 10) - 5) * l004A)
    If  l004A < 0 Then l004A = 0
    If  l004A > 255 Then l004A = 255
    p0042.M7304(p003C).M72B7 = Chr(l004A)
    l004A = Asc(p0046.M7304(p003C).M72C2)
    l004A = l004A + (((p003E / 10) - 5) * l004A)
    If  l004A < 0 Then l004A = 0
    If  l004A > 255 Then l004A = 255
    p0042.M7304(p003C).M72C2 = Chr(l004A)
End Sub

Sub sub1B2B ()
Dim l0050 As T72D7 ' 8A
Dim l0052 As Integer ' 81
Dim l0054 As Integer ' 81
Dim l0056 As Integer ' 81
Dim l0058 As Integer ' 81
Dim l005A ' 80
Dim l005C As Integer ' 81
    l0056 = extfn1855(l0054, gc2206)
    l0058 = extfn1855(l0054, gc2210)
    l0050.M72E5 = &H300
    l0050.M72F3 = l0056
    For l005A = False To l0056 - 1
        l0050.M7304(l005A).M72AE = Chr(0)
        l0050.M7304(l005A).M72B7 = Chr(0)
        l0050.M7304(l005A).M72C2 = Chr(0)
        l0050.M7304(l005A).M72CC = Chr(gc220E)
    Next l005A
    l0054 = extfn180B(0&)
    l0052 = extfn1ABD(l0050)
    If  l0052 Then
        l0052 = extfn011B(l0054, l0052, False)
        l005C = extfn0109(l0054)
        l0052 = extfn011B(l0054, l0052, False)
        l005C = extfn18EF(l0052)
    End If
    l005C = extfn1814(0&, l0054)
End Sub

Sub sub173B ()
Dim l0066 As Integer ' 81
Dim l0068 As Integer ' 81
Dim l006A As Integer ' 81
Dim l0070 As Integer ' 81
Dim l0072 ' 80
                                Exit Sub
    If  gv2A20 = False Then
        gv2214.M72E5 = &H300
        gv2214.M72F3 = 256
        gv2A1E = extfn1ABD(gv2214)
        gv2A20 = extfn011B(frmMain!picPalette.hDC, gv2A1E, False)
        l0070 = extfn011B(frmMain!picPalette.hDC, gv2A20, False)
        l0070 = extfn1A81(gv2A20, 0, 256, gv261A.M7304(0))
        l0070 = extfn18EF(gv2A1E)
    End If
    l006A = extfn17E6(0&)
    l0066 = extfn1855(l006A, gc2206)
    l0068 = extfn1855(l006A, gc2210)
    gv2214.M72E5 = &H300
    gv2214.M72F3 = 256
    l0070 = extfn1ACE(l006A, 0, 10, gv2214.M7304(0))
    l0070 = extfn1ACE(l006A, 246, 10, gv2214.M7304(246))
    l0070 = extfn1821(l006A)
    For l0072 = False To (l0066 - l0068) - 1
        gv2214.M7304(l0072 + (l0068 / 2)).M72AE = gv261A.M7304(l0072).M72AE
        gv2214.M7304(l0072 + (l0068 / 2)).M72B7 = gv261A.M7304(l0072).M72B7
        gv2214.M7304(l0072 + (l0068 / 2)).M72C2 = gv261A.M7304(l0072).M72C2
        gv2214.M7304(l0072 + (l0068 / 2)).M72CC = Chr(gc220C)
    Next l0072
    gv2A1E = extfn1ABD(gv2214)
End Sub

Sub sub1B47 ()
Dim l007C As Integer ' 81
Dim l007E ' 80
Dim l0082 As T72D7 ' 8A
    gv2214 = l0082
    If  gv2A20 = False Then
        gv2214.M72E5 = &H300
        gv2214.M72F3 = 256
        gv2A1E = extfn1ABD(gv2214)
        gv2A20 = extfn011B(frmMain!picPalette.hDC, gv2A1E, False)
        l007C = extfn011B(frmMain!picPalette.hDC, gv2A20, False)
        l007C = extfn1A81(gv2A20, 0, 256, gv261A.M7304(0))
        l007C = extfn18EF(gv2A1E)
    End If
    gv2214 = gv261A
    gv2214.M72E5 = &H300
    gv2214.M72F3 = 256
    For l007E = 0 To 255
        sub1B11 l007E, gv2A22, gv2214, gv261A
    Next l007E
    For l007E = 0 To 255
        gv2214.M7304(l007E).M72CC = Chr(gc220E)
    Next l007E
    If  gv2A1E <> False Then
        l007C = extfn18EF(gv2A1E)
    End If
    gv2A1E = extfn1ABD(gv2214)
End Sub

Function fn1B61 (p0086 As String ' 47, p008A As T72D7 ' 4A) As Integer ' 1
Dim l008C As Integer ' 81
Dim l008E As Integer ' 81
Dim l0090 As String ' 87
Dim l0092 As String ' 87
Dim l0094 ' 80
Dim l0096 As Integer ' 81
Dim l0098 As Integer ' 81
    On Error GoTo L54F82
    l008C = FreeFile
    Open p0086 For Input As #l008C
        Line Input #l008C, l0090
        Line Input #l008C, l0090
        Line Input #l008C, l0090
        l008E = CInt(l0090)
        p008A.M72E5 = &H300
        p008A.M72F3 = l008E
        For l0094 = False To l008E - 1
            Line Input #l008C, l0090
            l0096 = False
            l0098 = 1
            l0092 = ""
            Do
                If  Mid(l0090, l0098, 1) <> " " Then
                    l0092 = l0092 + Mid(l0090, l0098, 1)
                End If
                If  Mid(l0090, l0098, 1) = " " Or l0098 = Len(l0090) Then
                    Select Case l0096
                        Case 0
                            p008A.M7304(l0094).M72AE = Chr(CInt(l0092))
                        Case 1
                            p008A.M7304(l0094).M72B7 = Chr(CInt(l0092))
                        Case 2
                            p008A.M7304(l0094).M72C2 = Chr(CInt(l0092))
                    End Select
                    l0096 = l0096 + 1
                    l0092 = ""
                End If
                l0098 = l0098 + 1
            Loop While l0096 < 3
        Next l0094
    Close #l008C
    fn1B61 = True
    Exit Function

L54F82:
    Resume L54F8E
L54F8E:
End Function

Sub sub1B76 ()
Dim l009A As Integer ' 81
    l009A = extfn0109(frmMain!picPalette.hDC)
End Sub

Function fn1B8E (p009E As String ' 47, p00A2 As T72D7 ' 4A) As Integer ' 1
Dim l00A4 As Integer ' 81
Dim l00AC ' 80
    On Error GoTo L5510C
    l00A4 = FreeFile
    If  fn034F(p009E) Then
        Kill p009E
    End If
    Open p009E For Output As #l00A4
        Print #l00A4, "JASC-PAL"
        Print #l00A4, "0100"
        Print #l00A4, CStr(p00A2.M72F3)
        For l00AC = False To p00A2.M72F3 - 1
            Print #l00A4, CStr(Asc(p00A2.M7304(l00AC).M72AE)) + " " + CStr(Asc(p00A2.M7304(l00AC).M72B7)) + " " + CStr(Asc(p00A2.M7304(l00AC).M72C2))
        Next l00AC
    Close #l00A4
    fn1B8E = True
    Exit Function

L5510C:
    Resume L55118
L55118:
End Function
