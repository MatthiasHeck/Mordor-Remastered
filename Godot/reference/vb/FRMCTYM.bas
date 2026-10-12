' FRMCTYM.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0020 = 3 ' &H3%
Const mc0022 = 4 ' &H4%
Const mc0024 = 5 ' &H5%
Const mc0026 = 6 ' &H6%
Const mc0028 = 7 ' &H7%
Const mc0030 = 4 ' &H4%
Const mc003E = 1 ' &H1%
Const m0040 = 0 ' &H0%
Const mc004C = 10 ' &HA%
Const mc0058 = 7 ' &H7%
Const mc005E = 1 ' &H1%
Const mc0060 = 2 ' &H2%
Const mc0066 = 4 ' &H4%
Const mc0086 = 1 ' &H1%
Const mc0090 = 11 ' &HB%
Const mc00B2 = 1 ' &H1%

Sub Form_Activate ()
    sub0792 Me
End Sub

Sub Form_GotFocus ()
    sub0792 Me
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
Dim l002E As Integer ' 81
' Const mc0030 = 4 ' &H4%
    On Error Resume Next
    On Error GoTo L62DB4
    If  Shift = mc0030 Then
        Select Case KeyCode
            Case 67
                imgPicture_Click mc0028
            Case 83
                imgPicture_Click m001A
            Case 66
                imgPicture_Click mc001C
            Case 77
                imgPicture_Click mc001E
            Case 82
                imgPicture_Click mc0020
            Case 71
                imgPicture_Click mc0022
            Case 88
                imgPicture_Click mc0026
            Case 68
                imgPicture_Click mc0024
            Case Else
                l002E = fn14CB(KeyCode, Shift)
        End Select
    Else
        l002E = fn14CB(KeyCode, Shift)
    End If
    Exit Sub
L62DB4:
    Resume L62DC0
L62DC0:
End Sub

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

Sub Form_Resize ()
    If  Me.Tag = "" Then
        sub0760 Me, gv19C2(mc004C)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    Screen.MousePointer = mc0090
    sub15BE -1, mc004C, Me, True
    gv19C2(mc004C).M5E47 = False
    Set frmCityMain = Nothing
    sub0792 Nothing
    Unload frmCityStore
    Unload frmCityCStore
    Unload frmCityBank
    Unload frmCityGuild
    Unload frmCityMorgue
    Unload frmCitySeer
End Sub

Sub imgPicture_Click (Index%)
Dim l00AC As String ' 87
Static m00B0 As Integer ' 61
' Const mc00B2 = 1 ' &H1%
    DoEvents
    If  gv14C2(m0040).M5470 > 0 Then
        Exit Sub
    End If
    Select Case Index
        Case m001A
            frmCityStore.Show m00B0
        Case mc0028
            frmCityCStore.Show m00B0
        Case mc001C
            frmCityBank.Show m00B0
        Case mc0022
            frmCityGuild.Show m00B0
        Case mc001E
            frmCityMorgue.Show m00B0
        Case mc0020
            frmCitySeer.Show m00B0
        Case mc0024
            If  UBound(gv14C2) > m0040 Then
                frmParty!lblCall = "0"
            End If
            gv14C2(m0040).M5470 = 1
            gv14C2(m0040).M583F = 9
            gv14C2(m0040).M5845 = 11
            gv14C2(m0040).M5899 = mc00B2
            Unload frmCityMain
            frmDungeonMain.Show
        Case mc0026
            l00AC = "Exit to Main Menu?"
            If  MsgBox(l00AC, 36, "EXIT") = 6 Then
                gv1ACC.M6023 = True
                gv1ACC.M6008 = True
                Exit Sub
            End If
    End Select
End Sub

Sub lblSelection_Click (Index%)
    imgPicture_Click Index
End Sub

Sub sub25A3 ()
End Sub
