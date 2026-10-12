Sub Form_Load ()
Dim l0034 As Integer ' 81
Static m0036 As Integer ' 61
' Const mc003E = 1 ' &H1%
' Const m0040 = 0 ' &H0%
Static m004A As Integer ' 61
' Const mc004C = 10 ' &HA%
' Const mc0058 = 7 ' &H7%
Static m005C As Integer ' 61
' Const mc005E = 1 ' &H1%
' Const mc0060 = 2 ' &H2%
Dim l0062 As Variant ' 86
' Const mc0066 = 4 ' &H4%
Static m007E As Integer ' 61
' Const mc0086 = 1 ' &H1%
Static m0088 As Integer ' 61
' Const mc0090 = 11 ' &HB%
    sub063F m0036
    Set frmCityMain = Me
    sub0792 Me
    gv1CC6 = False
    gv14C2(m0040).M59F4(mc003E) = False
    gv14C2(m0040).M59F4(m004A) = False
    sub25A3
    Me.Tag = "NEW"
    Me.Left = gv14C2(m0040).M5958(mc004C).M425F
    Me.Top = gv14C2(m0040).M5958(mc004C).M4258
    Me.Width = gv14C2(m0040).M5958(mc004C).M4216
    Me.Height = gv14C2(m0040).M5958(mc004C).M420C
    If  Me.Width = False Then
        Me.Width = gv19C2(mc004C).M5E20
    End If
    If  Me.Height = False Then
        Me.Height = gv19C2(mc004C).M5E20
    End If
    sub0956
    l0034 = gv1A84
    For gv1A84 = m0040 To UBound(gv14C2)
        sub1043 mc0058, gv1A84, False
        sub0EAE True, gv1A84, 0, True
        gv14C2(gv1A84).M5830 = fn1338(gv1A84)
        gv14C2(gv1A84).M591F = 0
        gv14C2(gv1A84).M59BB = -1
        gv14C2(gv1A84).M56B9(m005C) = False
        gv14C2(gv1A84).M56B9(mc005E) = False
        gv14C2(gv1A84).M56B9(mc0060) = False
        For l0062 = 0 To mc0066 - 1
            If  gv14C2(gv1A84).M58CB(l0062).M4EAC > 0 Then
                gv14C2(gv1A84).M58CB(l0062).M4EAC = gv14C2(gv1A84).M58CB(l0062).M4EB4
            End If
        Next l0062
        If  gv14C2(gv1A84).M5943 >= mc0066 Then
            sub0A7C gv14C2(gv1A84).M5943 - mc0066, 0, 0
            If  UBound(gv14C2) > m0040 Then
                sub085B Chr$(34) + RTrim(gv14C2(gv1A84).M548B) + Chr$(34) + " is no longer carrying " + Chr$(34) + gv1732(gv14C2(gv1A84).M5943 - mc0066).M548B + Chr$(34) + "."
            Else
                sub085B "You are no longer carrying " + Chr$(34) + gv1732(gv14C2(gv1A84).M5943 - mc0066).M548B + Chr$(34) + "."
            End If
            gv14C2(gv1A84).M5943 = -1
        End If
        sub048C gv1A84
        If  fn04ED(gv14C2(gv1A84)) = False Then sub04FC "Error saving character in FRMCTYM:Form_Load!"
        gv14C2(gv1A84).M59BB = -1
        sub15A1 gv1A84
    Next gv1A84
    gv1A84 = l0034
    frmCharStat1!picTabPicture.Refresh
    frmParty!lblCall = "STATS"
    sub14E0 gv1A86
    sub0B82 gv1A86
    sub0F38
    sub096E
    sub08A9 True, 50
    gv19C2(mc004C).M4216 = gv19C2(mc004C).M5E20
    gv19C2(mc004C).M420C = gv19C2(mc004C).M5E2D
    gv19C2(mc004C).M5E47 = Me.hWnd
    Me.Tag = ""
    sub0784 Me
    sub0524 Me
    If  gv1D64 <> m007E Then
        frmAutoMap!lblCall = "UPDATE"
    End If
    gv14C2(gv1A86).M59F4(m004A) = False
    gv14C2(gv1A86).M59F4(mc003E) = False
    If  fn03BD(frmAutoMap) Then
        frmAutoMap.WindowState = mc0086
    End If
    sub08B9 True
    sub0941 "STATS"
    Screen.MousePointer = m0088
    Form_Activate
End Sub
