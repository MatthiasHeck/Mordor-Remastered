' Module12
Option Explicit
Declare Function extfn1C97 Lib "GDI" Alias "CreateEllipticRgn" () As Integer ' 1
Declare Function extfn1C8A Lib "GDI" Alias "CreatePen" (ByVal p1%, ByVal p2%, ByVal p3&) As Integer ' 1
Declare Function extfn1C76 Lib "GDI" Alias "CreateSolidBrush" (ByVal p1&) As Integer ' 1
Declare Function extfn1CB9 Lib "User" Alias "FillRect" (ByVal p1%, p2 As type, ByVal p3%) As Integer ' 1
Declare Function extfn1CC5 Lib "GDI" Alias "FillRgn" () As Integer ' 1
Declare Function extfn1CEA Lib "User" Alias "GetWindow" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Sub extsub1CDB Lib "User" Alias "InflateRect" (p1 As type, ByVal p2%, ByVal p3%)
Declare Function extfn1D05 Lib "User" Alias "IsWindowVisible" () As Integer ' 1
Declare Function extfn1CAC Lib "GDI" Alias "Rectangle" (ByVal p1%, ByVal p2%, ByVal p3%, ByVal p4%, ByVal p5%) As Integer ' 1
Declare Function extfn1CF7 Lib "User" Alias "ShowWindow" () As Integer ' 1
Declare Function extfn1CD0 Lib "GDI" Alias "TextOut" () As Integer ' 1
Const mc0158 = 64 ' &H40%
Const mc017E = 48 ' &H30%

Sub sub1D18 (p0134 As Integer ' 41, p0136 As Long ' 42)
Dim l0138 As Integer ' 81
Dim l013A As Integer ' 81
Dim l013C As Integer ' 81
Dim l0140 As T6C52 ' 8A
Dim l0142 As Integer ' 81
Dim l0144 As Integer ' 81
Dim l0146 As Integer ' 81
Dim l0148 As Integer ' 81
Dim l014A As Integer ' 81
  l0138 = extfn1CEA(p0134, gc2B20)
  l013A = extfn180B(l0138)
  l0142 = extfn1C76(p0136)
  l0144 = extfn18FF(l013A, l0142)
  l0146 = extfn1C8A(gv2B02, 1, p0136)
  l0148 = extfn18FF(l013A, l0146)
  l014A = extfn1877(l0138, l0140)
  l013C = extfn1CAC(l013A, l0140.M425F, l0140.M4258, l0140.M6C5E, l0140.M6C67)
  l013C = extfn18FF(l013A, l0144)
  l013C = extfn18EF(l0142)
  l013C = extfn18FF(l013A, l0148)
  l013C = extfn18EF(l0146)
  l013C = extfn1814(l0138, l013A)
End Sub

Sub sub1D29 (p0156 As Integer ' 41)
' Const mc0158 = 64 ' &H40%
Dim l015A As Integer ' 81
Dim l015C As Integer ' 81
Dim l015E As Integer ' 81
Dim l0160 ' 80
Dim l0162 As Integer ' 81
Dim l0164 As Integer ' 81
Dim l0168 As T6C52 ' 8A
Dim l016A As Integer ' 81
Dim l016C As Integer ' 81
    l015A = extfn1CEA(p0156, gc2B20)
    l015C = extfn180B(l015A)
    l016C = extfn1877(l015A, l0168)
    l0162% = l0168.M6C5E / mc0158 \ 2
    l0164% = l0168.M6C67 / mc0158 \ 2
    For l0160 = mc0158 - 1 To 0 Step -1
      l016A = extfn1C76(RGB((l0160 + 1) * 4 - 1, 0, 0))
      l015E = extfn1CB9(l015C, l0168, l016A)
      l015E = extfn18EF(l016A)
      extsub1CDB l0168, -l0162, -l0164
    Next l0160
    l015E = extfn1814(l015A, l015C)
End Sub

Sub sub1725 ()
Dim l0170 As Integer ' 81
' Const mc017E = 48 ' &H30%
    On Error GoTo L59884
    frmWelcome!lblLoading.Caption = "Reading Graphics..."
    If  Not fn034F(gv19E8 + gc1C74 + gc1C4C) Then
        MsgBox "Error!  Cannot locate graphics file " + gv19E8 + gc1C74 + gc1C4C + "." + Chr(13) + "Halting Program...", mc017E, "Error!"
        End
    End If
    l0170 = extfn028E(gv19E8 + gc1C74 + gc1C4C)
    gv2BB2 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BB0 = extfn18D5(frmWelcome!picCopyPicture.hDC, 105, 105)
    gv2BC8 = extfn18FF(gv2BB2, gv2BB0)
    sub1D3C l0170, "MAZE", gv2BE0
    gv2BB6 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BCC = extfn18FF(gv2BB6, gv2BE0)
    sub1D3C l0170, "MONS", gv2BE2
    gv2BB8 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BCE = extfn18FF(gv2BB8, gv2BE2)
    sub1D3C l0170, "MISC", gv2BE6
    gv2BBC = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BD2 = extfn18FF(gv2BBC, gv2BE6)
    sub1D3C l0170, "DOOR", gv2BE4
    gv2BBA = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BD0 = extfn18FF(gv2BBA, gv2BE4)
    sub1D3C l0170, "WATR", gv2BEC
    gv2BC2 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BD8 = extfn18FF(gv2BC2, gv2BEC)
    sub1D3C l0170, "QSND", gv2BEE
    gv2BC4 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BDA = extfn18FF(gv2BC4, gv2BEE)
    sub1D3C l0170, "FOG", gv2BEA
    gv2BC0 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BD6 = extfn18FF(gv2BC0, gv2BEA)
    sub1D3C l0170, "BLNK", gv2BE8
    gv2BBE = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BD4 = extfn18FF(gv2BBE, gv2BE8)
    sub1D3C l0170, "PICS", gv2BF0
    gv2BC6 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BDC = extfn18FF(gv2BC6, gv2BF0)
    sub1D3C l0170, "ASMO", gv2BDE
    gv2BB4 = extfn17E6(frmWelcome!picCopyPicture.hDC)
    gv2BCA = extfn18FF(gv2BB4, gv2BDE)
    frmWelcome!lblLoading.Caption = "Graphic Read Successful..."
    frmWelcome!picCopyPicture.Picture = LoadPicture("")
    extsub02DD l0170
    Exit Sub

L59884:
    MsgBox "Error '" + Error + "' occurred in MAZEMOD:mdrmazConfigureDCs.", mc017E, "Error!"
    Resume L598F8
L598F8:
End Sub

Sub sub1D3C (p0186 As Integer ' 41, ByVal p0188 As String ' 47, p018A As Integer ' 41)
Dim l018C As Integer ' 81
Dim l018E As Integer ' 81
Dim l0190 As Integer ' 81
Dim l0192 As Long ' 82
Dim l0196 As Long ' 82
Static m01A0 As Integer ' 61
    On Error GoTo L59A10
    l018E = extfn029D(p0186, p0188, "MORDOR")
    l0190 = extfn02AD(p0186, l018E)
    l0192 = extfn02BD(l0190)
    l0196 = l0192 + 14 + 40 + (256 * 4)
    l018C = extfn0109(frmWelcome!picCopyPicture.hDC)
    p018A = extfn18C3(frmWelcome!picCopyPicture.hDC, l0192 + 14, gv2BAC, l0196, l0192 + 14, m01A0)
    Exit Sub

L59A10:
    MsgBox "Error '" + Error + "' occurred in MAZEMOD:mdrmazSetClipboard", mc017E, "Error!"
    Resume L59A84
L59A84:
End Sub

Sub sub0607 ()
Dim l01A4 As Integer ' 81
    On Error GoTo L59DA2
    l01A4 = extfn18FF(gv2BB2, gv2BC8)
    l01A4 = extfn18FF(gv2BB6, gv2BCC)
    l01A4 = extfn18FF(gv2BB8, gv2BCE)
    l01A4 = extfn18FF(gv2BBA, gv2BD0)
    l01A4 = extfn18FF(gv2BBC, gv2BD2)
    l01A4 = extfn18FF(gv2BBE, gv2BD4)
    l01A4 = extfn18FF(gv2BC2, gv2BD8)
    l01A4 = extfn18FF(gv2BC4, gv2BDA)
    l01A4 = extfn18FF(gv2BC0, gv2BD6)
    l01A4 = extfn18FF(gv2BB4, gv2BCA)
    l01A4 = extfn18FF(gv2BC6, gv2BDC)
    l01A4 = extfn18EF(gv2BB0)
    l01A4 = extfn18EF(gv2BE0)
    l01A4 = extfn18EF(gv2BE2)
    l01A4 = extfn18EF(gv2BE4)
    l01A4 = extfn18EF(gv2BE6)
    l01A4 = extfn18EF(gv2BE8)
    l01A4 = extfn18EF(gv2BEC)
    l01A4 = extfn18EF(gv2BEE)
    l01A4 = extfn18EF(gv2BEA)
    l01A4 = extfn18EF(gv2BDE)
    l01A4 = extfn18EF(gv2BF0)
    l01A4 = extfn1821(gv2BB2)
    l01A4 = extfn1821(gv2BB6)
    l01A4 = extfn1821(gv2BB8)
    l01A4 = extfn1821(gv2BBA)
    l01A4 = extfn1821(gv2BBC)
    l01A4 = extfn1821(gv2BBE)
    l01A4 = extfn1821(gv2BC2)
    l01A4 = extfn1821(gv2BC4)
    l01A4 = extfn1821(gv2BC0)
    l01A4 = extfn1821(gv2BB4)
    l01A4 = extfn1821(gv2BC6)
    Exit Sub

L59DA2:
    MsgBox "Error '" + Error + "' occurred in GRAPHICS:mdrReleaseDCs"
    Resume Next
End Sub

Sub sub1D52 (p01AA As PictureBox ' 49, p01AE As Form ' 49)
Dim l01B0 As Integer ' 81
Dim l01B2 As Integer ' 81
Dim l01B4 As Integer ' 81
Dim l01B6 As Integer ' 81
Dim l01B8 As Integer ' 81
Dim l01BA As Integer ' 81
Dim l01BC As Integer ' 81
Dim l01BE As Integer ' 81
Dim l01C0 As Integer ' 81
Dim l01C2 As Integer ' 81
Dim l01C4 As Integer ' 81
Dim l01C6 As Integer ' 81
Dim l01C8 As Integer ' 81
Dim l01CA ' 80
Dim l01CC ' 80
    l01B6 = p01AA.ScaleMode
    l01B8 = p01AE.ScaleMode
    p01AA.ScaleMode = 3
    p01AE.ScaleMode = 3
    l01B2 = p01AA.hDC
    l01B4 = p01AE.hDC
    l01C0 = p01AA.ScaleHeight
    l01BE = p01AA.ScaleWidth
    l01C6 = p01AE.ScaleWidth \ l01BE
    l01C8 = p01AE.ScaleHeight \ l01C0
    For l01CA = 0 To l01C6
      l01C2 = l01CA * l01BE
      For l01CC = 0 To l01C8
        l01C4 = l01CC * l01C0
        l01B0 = extfn182D(l01B4, l01C2, l01C4, l01BE, l01C0, l01B2, l01BA, l01BC, gv2B26)
      Next l01CC
    Next l01CA
    p01AA.ScaleMode = l01B6
    p01AE.ScaleMode = l01B8
End Sub

Sub sub1D61 (p01D0 As Integer ' 41, p01D2 As Integer ' 41, p01D4 As Integer ' 41)
Dim l01D6 As Integer ' 81
Dim l01D8 As Integer ' 81
Dim l01DA As Integer ' 81
Dim l01DC As Integer ' 81
Dim l01DE As Integer ' 81
Dim l01E0 As Integer ' 81
Dim l01E2 As Integer ' 81
Dim l01E4 ' 80
Dim l01E6 ' 80
Dim l01EA As T6C52 ' 8A
Dim l01EE As T6C52 ' 8A
Dim l01F0 As Integer ' 81
    l01DA = extfn1CEA(p01D4, gc2B20)
    l01D8 = extfn180B(l01DA)
    l01F0 = extfn1877(p01D0, l01EA)
    l01F0 = extfn1877(l01DA, l01EE)
    l01E0 = l01EE.M6C5E \ l01EA.M6C5E
    l01E2 = l01EE.M6C67 \ l01EA.M6C67
    For l01E4 = 0 To l01E0
      l01DC = l01E4 * l01EA.M6C5E
      For l01E6 = 0 To l01E2
        l01DE = l01E6 * l01EA.M6C67
        l01D6 = extfn182D(l01D8, l01DC, l01DE, l01EA.M6C5E, l01EA.M6C67, p01D2, 0, 0, gv2B26)
      Next l01E6
    Next l01E4
    l01D6 = extfn1814(l01DA, l01D8)
End Sub
