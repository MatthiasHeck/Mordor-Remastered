' Module8
Option Explicit
Declare Function extfn182D Lib "GDI" Alias "BitBlt" (ByVal p1%, ByVal p2%, ByVal p3%, ByVal p4%, ByVal p5%, ByVal p6%, ByVal p7%, ByVal p8%, ByVal p9 As Any) As Integer ' 1
Declare Function extfn190F Lib "User" Alias "ClientToScreen" (ByVal p1%, p2 As type) As Integer ' 1
Declare Function extfn18D5 Lib "GDI" Alias "CreateCompatibleBitmap" (ByVal p1%, ByVal p2%, ByVal p3%) As Integer ' 1
Declare Function extfn17E6 Lib "GDI" Alias "CreateCompatibleDC" (ByVal p1%) As Integer ' 1
Declare Function extfn18C3 Lib "GDI" Alias "CreateDIBitmap" (ByVal p1%, ByVal p2&, p3 As type, ByVal p4&, ByVal p5&, ByVal p6%) As Integer ' 1
Declare Function extfn1821 Lib "GDI" Alias "DeleteDC" (ByVal p1%) As Integer ' 1
Declare Function extfn18EF Lib "GDI" Alias "DeleteObject" (ByVal p1%) As Integer ' 1
Declare Function extfn1877 Lib "User" Alias "GetClientRect" (ByVal p1%, p2 As type) As Integer ' 1
Declare Function extfn180B Lib "User" Alias "GetDC" (ByVal p1%) As Integer ' 1
Declare Function extfn1855 Lib "GDI" Alias "GetDeviceCaps" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Function extfn1837 Lib "GDI" Alias "GetDIBits" (ByVal p1%, ByVal p2%, ByVal p3%, ByVal p4%, ByVal p5&, p6 As type, ByVal p7%) As Integer ' 1
Declare Function extfn17FC Lib "User" Alias "GetWindowDC" (ByVal p1%) As Integer ' 1
Declare Function extfn1866 Lib "User" Alias "GetWindowRect" (ByVal p1%, p2 As type) As Integer ' 1
Declare Function extfn1888 Lib "kernel" Alias "GlobalAlloc" (ByVal p1%, ByVal p2&) As Integer ' 1
Declare Function extfn18B5 Lib "kernel" Alias "GlobalFree" (ByVal p1%) As Integer ' 1
Declare Function extfn1897 Lib "kernel" Alias "GlobalLock" (ByVal p1%) As Long ' 2
Declare Function extfn18A5 Lib "kernel" Alias "GlobalUnlock" (ByVal p1%) As Integer ' 1
Declare Function extfn1921 Lib "GDI" Alias "LPToDP" () As Integer ' 1
Declare Function extfn1814 Lib "User" Alias "ReleaseDC" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Function extfn18FF Lib "GDI" Alias "SelectObject" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Function extfn1844 Lib "GDI" Alias "StretchDIBits" (ByVal p1%, ByVal p2%, ByVal p3%, ByVal p4%, ByVal p5%, ByVal p6%, ByVal p7%, ByVal p8%, ByVal p9%, ByVal p10&, p11 As type, ByVal p12%, p13 As Any) As Integer ' 1
Const mc00BE = 32 ' ? &H 0020 00CC

Function fn192B (ByVal pv004E As Variant ' 86, ByVal pv0052 As Variant ' 86, ByVal pv0056 As Variant ' 86, ByVal pv005A As Variant ' 86, ByVal pv0062 As Variant ' 86, ByVal pv0066 As Single ' 83, ByVal pv0068 As Single ' 83) As Variant ' 6
' called (ByVal p1 As Variant, ByVal p2 As Variant, ByVal p3 As Variant, ByVal p4 As Variant, ByVal p5 As Variant, ByVal p6 As Variant, ByVal p7!, ByVal p8!)
Dim l006C As T6C52 ' 8A
Dim l0070 As T6C52 ' 8A
Dim l0074 As T6C1E ' 8A
Dim l007C As T6C71 ' 8A
Dim l0082 As String ' 87
Dim l0084 As Integer ' 81
Dim l0086 As Integer ' 81
Dim l0088 As Integer ' 81
Dim l008A As Integer ' 81
Dim l008C As Integer ' 81
Dim l008E As Integer ' 81
Dim l0090 As Integer ' 81
Dim l0092 As Integer ' 81
Dim l0094 As Integer ' 81
Dim l0096 As Integer ' 81
Dim l0098 As Integer ' 81
Dim l009A As Integer ' 81
Dim l009C As Integer ' 81
Dim l009E As Integer ' 81
Dim l00A0 As Integer ' 81
Dim l00A2 As Integer ' 81
Dim l00A4 As Integer ' 81
Dim l00A6 As Integer ' 81
Dim l00A8 As Integer ' 81
Dim l00AA As Integer ' 81
Dim l00AC As Integer ' 81
Dim l00AE As Integer ' 81
Dim l00B0 As Single ' 83
Dim l00B2 As Single ' 83
Dim l00B4 As Integer ' 81
Dim l00B6 As Integer ' 81
Dim l00B8 As Long ' 82
Dim l00BA As Long ' 82
Dim l00BC As Integer ' 81
' Const mc00BE = 32 ' ? &H 0020 00CC
    l0082$ = Chr$(13)
    If  pv0066 = False Or pv0068 = False Then
        pv0066 = 1: pv0068 = 1
    End If
    l0084 = extfn17FC(pv0062)
    l0086 = extfn17E6(l0084)
    l008A = extfn1855(l0084, gc1FE6)
    l008C = extfn1855(l0084, gc1FE8)
    l008E = extfn1866(pv0062, l006C)
    l0096 = Abs(l006C.M6C5E - l006C.M425F)
    l0098 = Abs(l006C.M6C67 - l006C.M4258)
    l00A2 = extfn18D5(l0084, l0096, l0098)
    l00A6 = extfn18FF(l0086, l00A2)
    l0090 = extfn182D(l0086, 0, 0, l0096, l0098, l0084, 0, 0, mc00BE)
    l008E = extfn1877(pv0062, l0070)
    l009A = Abs(l0070.M6C5E - l0070.M425F)
    l009C = Abs(l0070.M6C67 - l0070.M4258)
    l007C.M4E78 = l0070.M425F
    l007C.M4E7D = l0070.M4258
    l008E = extfn190F(pv0062, l007C)
    l009E = Abs(l007C.M4E78 - l006C.M425F)
    l00A0 = Abs(l007C.M4E7D - l006C.M4258)
    l00A4 = extfn17E6(l0084)
    l00A8 = extfn18D5(l0084, l009A, l009C)
    l00AA = extfn18FF(l00A4, l00A8)
    l008E = extfn182D(l00A4, 0, 0, l009A, l009C, l0086, l009E, l00A0, mc00BE)
    l008E = extfn18FF(l0086, l00A6)
    l008E = extfn1821(l0084)
    l008E = extfn18EF(l00A2)
    l00AC = extfn1855(l00A4, gc1FEC)
    l00AE = extfn1855(l00A4, gc1FEE)
    l0074.M6C31.M6B7E = 40
    l0074.M6C31.M6B88 = l009A
    l0074.M6C31.M6B93 = l009C
    l0074.M6C31.M6B9F = 1
    l0074.M6C31.M6BAB = l00AC * l00AE
    l0074.M6C31.M6BB9 = gv1FF0
    l0074.M6C31.M6BCA = 0
    l0074.M6C31.M6BD9 = 0
    l0074.M6C31.M6BEC = 0
    l0074.M6C31.M6BFF = 0
    l0074.M6C31.M6C0C = 0
    l00B0! = l009A / l008A
    l00B2! = l009C / l009A
    l00B4 = l00B0! * pv005A
    l00B6 = l00B2! * l00B4
    l00B8& = CLng(l0096 + 1) * (l0098 + 1)
    l00BC = extfn1888(gc1FFA, l00B8&)
    If  l0084 <> 0 And l00A2 <> 0 And pv004E <> 0 And l00BC <> 0 Then
        l00BA& = extfn1897(l00BC)
        l0092 = extfn1837(l00A4, l00A8, 0, l009C, l00BA&, l0074, gv1FF8)
        l0094 = extfn1844(pv004E, pv0052, pv0056, pv0066, pv0068, 0, 0, l009A, l009C, l00BA&, l0074, gv1FF8, mc00BE)
    End If
    l008E = extfn18FF(l00A4, l00AA)
    l008E = extfn18A5(l00BC)
    l008E = extfn18B5(l00BC)
    l008E = extfn1821(l00A4)
    l008E = extfn18EF(l00A8)
    l008E = extfn1814(pv0062, l0088)
    If  l0092 <> 0 And l0094 <> 0 Then
        fn192B = True
    Else
        fn192B = False
    End If
End Function

Function fn193D (ByVal pv00C6 As Integer ' 81, ByVal pv00C8 As Integer ' 81, ByVal pv00CA As Integer ' 81, ByVal pv00CC As Integer ' 81, ByVal pv00D0 As Integer ' 81, ByVal pv00D2 As Integer ' 81, ByVal pv00D4 As Integer ' 81) As Variant ' 6
Dim l00D8 As T6C52 ' 8A
Dim l00DC As T6C1E ' 8A
Dim l00DE As String ' 87
Dim l00E0 As Integer ' 81
Dim l00E2 As Integer ' 81
Dim l00E4 As Integer ' 81
Dim l00E6 As Integer ' 81
Dim l00E8 As Integer ' 81
Dim l00EA As Integer ' 81
Dim l00EC As Integer ' 81
Dim l00EE As Integer ' 81
Dim l00F0 As Integer ' 81
Dim l00F2 As Integer ' 81
Dim l00F4 As Integer ' 81
Dim l00FE As Integer ' 81
Dim l0102 As Integer ' 81
Dim l0108 As Integer ' 81
Dim l010A As Integer ' 81
Dim l010C As Single ' 83
Dim l010E As Single ' 83
Dim l0110 As Integer ' 81
Dim l0112 As Integer ' 81
Dim l0114 As Long ' 82
Dim l0116 As Long ' 82
Dim l0118 As Integer ' 81
    If  pv00D2 = False Or pv00D4 = False Then
        pv00D2 = 1: pv00D4 = 1
    End If
    l00DE$ = Chr$(13)
    l00E0 = extfn17FC(pv00D0)
    l00E2 = extfn17E6(l00E0)
    l00E6 = extfn1855(l00E0, gc1FE6)
    l00E8 = extfn1855(l00E0, gc1FE8)
    l00EA = extfn1866(pv00D0, l00D8)
    l00F2 = Abs(l00D8.M6C5E - l00D8.M425F)
    l00F4 = Abs(l00D8.M6C67 - l00D8.M4258)
    l00FE = extfn18D5(l00E0, l00F2, l00F4)
    l0102 = extfn18FF(l00E2, l00FE)
    l00EC = extfn182D(l00E2, 0, 0, l00F2, l00F4, l00E0, 0, 0, mc00BE)
    l0108 = extfn1855(l00E2, gc1FEC)
    l010A = extfn1855(l00E2, gc1FEE)
    l00DC.M6C31.M6B7E = 40
    l00DC.M6C31.M6B88 = l00F2
    l00DC.M6C31.M6B93 = l00F4
    l00DC.M6C31.M6B9F = 1
    l00DC.M6C31.M6BAB = l0108 * l010A
    l00DC.M6C31.M6BB9 = gv1FF0
    l00DC.M6C31.M6BCA = 0
    l00DC.M6C31.M6BD9 = 0
    l00DC.M6C31.M6BEC = 0
    l00DC.M6C31.M6BFF = 0
    l00DC.M6C31.M6C0C = 0
    l010C! = l00F2 / l00E6
    l010E! = l00F4 / l00F2
    l0110 = l010C! * pv00CC
    l0112 = l010E! * l0110
    l0114& = CLng(l00F2 + 1) * (l00F4 + 1)
    l0118 = extfn1888(gc1FFA, l0114&)
    If  l00E0 <> 0 And l00FE <> 0 And pv00C6 <> 0 And l0118 <> 0 Then
        l0116& = extfn1897(l0118)
        l00EE = extfn1837(l00E2, l00FE, 0, l00F4, l0116&, l00DC, gv1FF8)
        l00F0 = extfn1844(pv00C6, pv00C8, pv00CA, l0110 * pv00D2, l0112 * pv00D4, 0, 0, l00F2, l00F4, l0116&, l00DC, gv1FF8, mc00BE)
    End If
    l00EA = extfn18FF(l00E2, l0102)
    l00EA = extfn18A5(l0118)
    l00EA = extfn18B5(l0118)
    l00EA = extfn1821(l00E0)
    l00EA = extfn18EF(l00FE)
    l00EA = extfn1814(pv00D0, l00E4)
    If  l00EE <> 0 And l00F0 <> 0 Then
        fn193D = True
    Else
        fn193D = False
    End If
End Function
