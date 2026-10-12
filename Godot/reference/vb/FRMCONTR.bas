' FRMCONTR.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001C = 1 ' &H1%
Const mc001E = 2 ' &H2%
Const mc0022 = 4 ' &H4%
Const mc0024 = 5 ' &H5%
Const mc0026 = 6 ' &H6%
Dim m0028 As Integer ' 61
Const mc002A = 1 ' &H1%
Const mc002C = 2 ' &H2%
Const mc002E = 3 ' &H3%
Dim m003A As Integer ' 61
Const mc005A = 1 ' &H1%
Const mc0064 = 32 ' &H20%
Const mc0066 = 3 ' &H3%
Const mc0068 = 2 ' &H2%
Const mc006A = 6 ' &H6%
Const mc006C = 11 ' &HB%
Const mc0078 = 20 ' &H14%
Const mc0086 = 14 ' &HE%
Const mc0088 = 18 ' &H12%
Const m008C = 0 ' &H0%
Const mc0096 = 10 ' &HA%
Const mc0098 = 13 ' &HD%
Const m00BA = 0 ' &H0%
Const mc00BE = 2 ' &H2%
Const mc00C0 = 3 ' &H3%
Const mc00C2 = 4 ' &H4%
Const mc00C6 = 11 ' &HB%
Const mc00C8 = 16 ' &H10%
Const mc00CA = 12 ' &HC%
Const mc00CC = 19 ' &H13%
Const mc00CE = 15 ' &HF%

Sub cmdCommand_Click (Index%)
Dim l003E ' 80
Dim l0040 ' 80
Dim l0042 As String ' 87
Dim l0044 As Single ' 83
Dim l0046 As Single ' 83
Dim l004A As Form ' 89
Dim l004C As Single ' 83
Dim l004E As Integer ' 81
Dim l0052 As Integer ' 81
Dim l0054 As Integer ' 81
' Const mc005A = 1 ' &H1%
' Const mc0064 = 32 ' &H20%
' Const mc0066 = 3 ' &H3%
' Const mc0068 = 2 ' &H2%
' Const mc006A = 6 ' &H6%
' Const mc006C = 11 ' &HB%
' Const mc0078 = 20 ' &H14%
' Const mc0086 = 14 ' &HE%
' Const mc0088 = 18 ' &H12%
Static m008A As Integer ' 61
' Const m008C = 0 ' &H0%
' Const mc0096 = 10 ' &HA%
' Const mc0098 = 13 ' &HD%
Static m00B2 As Integer ' 61
' Const m00BA = 0 ' &H0%
' Const mc00BE = 2 ' &H2%
' Const mc00C0 = 3 ' &H3%
' Const mc00C2 = 4 ' &H4%
    On Error GoTo L7DFC2
    Select Case Index
        Case mc0024
            frmOptions.Show mc005A
            If  gv1A66.M5F2C Then
                frmMain!picToolbar.Visible = False
            Else
                frmMain!picToolbar.Visible = True
            End If
        Case mc0022
            l004C = 1
            l004E = MsgBox("Are you using Large Fonts?", mc0064 & mc0066, "Adjust Windows to Display")
            If  l004E = mc0068 Then
                Exit Sub
            End If
            If  l004E = mc006A Then
                l004C = 1.25#
            End If
            Screen.MousePointer = mc006C
            l0044 = ((Screen.Width / Screen.TwipsPerPixelX) / 800) / l004C
            l0046 = ((Screen.Height / Screen.TwipsPerPixelY) / 600) / l004C
            l0052 = -1
            l0054 = -1
            If  lstWindows.ListIndex = False Then
                l0052 = False
                l0054 = mc0078 - 1
            Else
                For l003E = False To mc0078 - 1
                    If  lstWindows.ItemData(lstWindows.ListIndex) = gv19C2(l003E).M5E47 Then
                        l0052 = l003E
                        l0054 = l003E
                        Exit For
                    End If
                Next l003E
            End If
            If  l0044 > False And l0052 > -1 And l0054 > -1 Then
                For l003E = l0052 To l0054
                    For l0040 = False To Forms.Count - 1
                        If  Forms(l0040).hWnd = gv19C2(l003E).M5E47 Then
                            Select Case Forms(l0040).hWnd
                                Case gv19C2(mc0086).M5E47, Me.hWnd, gv19C2(mc0088).M5E47
                                Case Else
                                    Set l004A = Forms(l0040)
                                    If  l004A.WindowState <> m008A Then
                                        l004A.WindowState = m008A
                                    End If
                                    gv14C2(m008C).M5958(l003E).M4216 = gv19C2(l003E).M5E20 * l0044
                                    gv14C2(m008C).M5958(l003E).M420C = gv19C2(l003E).M5E2D * l0046
                                    Select Case l003E
                                        Case mc0096, mc0098
                                            l004A.Tag = "RESIZE"
                                        Case Else
                                            gv19C2(l003E).M4216 = gv19C2(l003E).M5E20 * l0044
                                            gv19C2(l003E).M420C = gv19C2(l003E).M5E2D * l0046
                                    End Select
                                    l004A.Width = gv19C2(l003E).M5E20 * l0044
                                    Select Case l003E
                                        Case mc0096, mc0098
                                            l004A.Tag = ""
                                        Case Else
                                    End Select
                                    l004A.Height = gv19C2(l003E).M5E2D * l0046
                                    DoEvents
                                    Set l004A = Nothing
                            End Select
                            Exit For
                        End If
                    Next l0040
                Next l003E
                If  lstWindows.ListIndex = False Then
                    Unload frmCityStore
                    Unload frmCityCStore
                    Unload frmCityBank
                    Unload frmCityMorgue
                    Unload frmCityGuild
                    Unload frmCitySeer
                    For l003E = False To UBound(gv19C2)
                        Select Case l003E
                            Case mc0088
                            Case Else
                                gv14C2(m008C).M5958(l003E).M4216 = gv19C2(l003E).M5E20 * l0044
                                gv14C2(m008C).M5958(l003E).M420C = gv19C2(l003E).M5E2D * l0046
                        End Select
                    Next l003E
                End If
            End If
            Screen.MousePointer = m00B2
        Case m001A
            gv14C2(gv1A86).M5914(m00BA) = -Abs(chkCheck(mc002E).Value)
            gv14C2(gv1A86).M5914(mc00BE) = -Abs(chkCheck(m0028).Value)
            gv14C2(gv1A86).M5914(mc00C0) = -Abs(chkCheck(mc002A).Value)
            gv14C2(gv1A86).M5914(mc00C2) = -Abs(chkCheck(mc002C).Value)
            Unload Me
            sub0775
        Case mc001C
            Unload Me
        Case mc0026
            l0042 = lstWindows.List(lstWindows.ListIndex)
            For l003E = False To Forms.Count - 1
                If  Forms(l003E).Caption = l0042 Then
                    Forms(l003E).ZOrder False
                    Me.ZOrder False
                    Exit For
                End If
            Next l003E
        Case mc001E
            If  lstWindows.ListIndex > False Then
                sub074E CStr(lstWindows.List(lstWindows.ListIndex)), True
            Else
                Unload frmCityStore
                Unload frmCityCStore
                Unload frmCityBank
                Unload frmCityMorgue
                Unload frmCityGuild
                Unload frmCitySeer
                For l003E = False To UBound(gv19C2)
                    gv14C2(m008C).M5958(l003E).M4216 = gv19C2(l003E).M5E20
                    gv14C2(m008C).M5958(l003E).M420C = gv19C2(l003E).M5E2D
                Next l003E
                For l003E = 0 To lstWindows.ListCount - 1
                    sub074E CStr(lstWindows.List(l003E)), True
                Next l003E
            End If
            Screen.MousePointer = m00B2
        Case Else
    End Select

L7DFB4:
    Exit Sub

L7DFC2:
    sub04FC "Error '" + Error + "' occurred in FRMCONTR:cmdCommand_Click."
    Resume L7DFB4
End Sub

Sub Form_Load ()
Dim l00C4 ' 80
' Const mc00C6 = 11 ' &HB%
' Const mc00C8 = 16 ' &H10%
' Const mc00CA = 12 ' &HC%
' Const mc00CC = 19 ' &H13%
' Const mc00CE = 15 ' &HF%
    m003A = True
    chkCheck(mc002E).Value = Abs(gv14C2(gv1A86).M5914(m00BA))
    chkCheck(m0028).Value = Abs(gv14C2(gv1A86).M5914(mc00BE))
    chkCheck(mc002A).Value = Abs(gv14C2(gv1A86).M5914(mc00C0))
    chkCheck(mc002C).Value = Abs(gv14C2(gv1A86).M5914(mc00C2))
    lstWindows.AddItem "<ALL>"
    For l00C4 = 0 To Forms.Count - 1
        If  TypeOf Forms(l00C4) Is MDIForm Then
        Else
            If  Forms(l00C4).Visible = True And Forms(l00C4).MDIChild = True Then
                Select Case Forms(l00C4).hWnd
                    Case Me.hWnd, gv19C2(mc0086).M5E47, gv19C2(mc0088).M5E47
                    Case gv19C2(mc00C6).M5E47, gv19C2(mc00C8).M5E47, gv19C2(mc00CA).M5E47
                    Case gv19C2(mc00CC).M5E47, gv19C2(mc00CE).M5E47
                    Case Else
                        lstWindows.AddItem Forms(l00C4).Caption
                        lstWindows.ItemData(lstWindows.ListCount - 1) = Forms(l00C4).hWnd
                End Select
            End If
        End If
    Next l00C4
    lstWindows.ListIndex = False
    sub0802 Me
    m003A = False
End Sub

Sub Form_Paint ()
End Sub

Sub Form_Resize ()
    If  m003A = False Then
        sub07B3 Me, elaElastic(0)
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    If  gv14C2(m008C).M5483 Then sub0930 m008C
End Sub
