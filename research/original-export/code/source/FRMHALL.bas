' FRMHALL.FRM
Option Explicit
Dim m001A As Integer ' 61
Const mc001E = 6 ' &H6%
Dim m0020 As Integer ' 61
Const mc0022 = 1 ' &H1%
Const mc0024 = 2 ' &H2%
Const mc0026 = 3 ' &H3%
Const mc0028 = 4 ' &H4%
Const mc002A = 5 ' &H5%
Dim m002C As Integer ' 61
Const mc0052 = 1 ' &H1%
Const mc0054 = 2 ' &H2%
Const mc0068 = 6 ' &H6%
Const mc0082 = 1 ' &H1%
Const mc0084 = 1 ' &H1%
Const mc0086 = 2 ' &H2%
Const mc0088 = 2 ' &H2%
Const mc008A = 3 ' &H3%
Const mc008C = 3 ' &H3%
Const mc008E = 4 ' &H4%
Const mc0090 = 4 ' &H4%
Const mc0092 = 5 ' &H5%
Const mc0094 = 5 ' &H5%
Const mc00A2 = 6 ' &H6%
Const mc00AE = 7 ' &H7%
Const mc00B4 = 8 ' &H8%
Const mc00B6 = 9 ' &H9%
Const mc00B8 = 10 ' &HA%

Sub cmdCommand_Click (Index%)
    Select Case Index
        Case m001A
            Unload Me
            Set frmHall = Nothing
        Case Else
    End Select
End Sub

Sub Form_Load ()
    m002C = True
    sub32F6
    sub1EBA
    sub0802 Me
    m002C = False
End Sub

Sub Form_Resize ()
    If  m002C = False Then
        sub07B3 Me, elaElastic(0)
    End If
End Sub

Sub sub3308 (p003A As Integer ' 41, p003C As Integer ' 41, p003E As Integer ' 41, p0040 As Variant ' 46, p0044 As Integer ' 41)
Dim l0046 As Variant ' 86
Dim l004C As T3751 ' 8A
Static m0050 As Integer ' 61
' Const mc0052 = 1 ' &H1%
' Const mc0054 = 2 ' &H2%
    p003C = p003C - 1
    frmHall.FontBold = False
    frmHall.FontItalic = False
    frmHall.ForeColor = QBColor(p003A)
    l0046 = extfn00D1(frmHall.hDC, l004C)
    Select Case p0044
        Case m0050
            frmHall.FontBold = False
            frmHall.FontItalic = False
        Case mc0052
            frmHall.FontBold = True
            frmHall.FontItalic = False
        Case mc0054
            frmHall.FontBold = False
            frmHall.FontItalic = True
    End Select
    If  l0046 And p003C <> -1 And p003E <> -1 Then
        frmHall.CurrentX = (l004C.M37C0 * Screen.TwipsPerPixelX) * p003E
        frmHall.CurrentY = (l004C.M375F * Screen.TwipsPerPixelY) * p003C
        frmHall.Print p0040
    End If
End Sub

Sub sub32F6 ()
Dim l005A As Integer ' 81
Dim l005C ' 80
Dim l005E ' 80
Dim l0062 As T73E9 ' 8A
Dim l0064 As String ' 87
Dim l0066 As String ' 87
' Const mc0068 = 6 ' &H6%
Static m0076 As Integer ' 61
Static m0078 As Integer ' 61
' Const mc0082 = 1 ' &H1%
' Const mc0084 = 1 ' &H1%
' Const mc0086 = 2 ' &H2%
' Const mc0088 = 2 ' &H2%
' Const mc008A = 3 ' &H3%
' Const mc008C = 3 ' &H3%
' Const mc008E = 4 ' &H4%
' Const mc0090 = 4 ' &H4%
' Const mc0092 = 5 ' &H5%
' Const mc0094 = 5 ' &H5%
' Const mc00A2 = 6 ' &H6%
' Const mc00AE = 7 ' &H7%
Static m00B0 As Integer ' 61
' Const mc00B4 = 8 ' &H8%
' Const mc00B6 = 9 ' &H9%
' Const mc00B8 = 10 ' &HA%
' Const mc00BA = 11 ' &HB%
    For l005C = False To mc0068 - 1
        If  l005C > False Then
            Load lblRecordStat(l005C)
            Load lblRecordChar(l005C)
            lblRecordStat(l005C).Top = lblRecordChar(l005C - 1).Top + lblRecordChar(l005C - 1).Height
            lblRecordChar(l005C).Top = lblRecordStat(l005C).Top + lblRecordStat(l005C).Height
        End If
        Select Case l005C
            Case m0076
                lblRecordStat(l005C).Caption = "Strongest"
                l005A = fn1C07(m0078, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "With a " + CStr(l0062.M73F5) + " " + gv05EE$(m0076)
                lblRecordChar(m0076).Caption = l0064
            Case mc0082
                lblRecordStat(l005C).Caption = "Smartest"
                l005A = fn1C07(mc0084, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "With a " + CStr(l0062.M73F5) + " " + gv05EE$(mc0082)
                lblRecordChar(mc0082).Caption = l0064
            Case mc0086
                lblRecordStat(l005C).Caption = "Wisest"
                l005A = fn1C07(mc0088, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "With a " + CStr(l0062.M73F5) + " " + gv05EE$(mc0086)
                lblRecordChar(mc0086).Caption = l0064
            Case mc008A
                lblRecordStat(l005C).Caption = "Healthiest"
                l005A = fn1C07(mc008C, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "With a " + CStr(l0062.M73F5) + " " + gv05EE$(mc008A)
                lblRecordChar(mc008A).Caption = l0064
            Case mc008E
                lblRecordStat(l005C).Caption = "Most Attractive"
                l005A = fn1C07(mc0090, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "With a " + CStr(l0062.M73F5) + " " + gv05EE$(mc008E)
                lblRecordChar(mc008E).Caption = l0064
            Case mc0092
                lblRecordStat(l005C).Caption = "Quickest"
                l005A = fn1C07(mc0094, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "With a " + CStr(l0062.M73F5) + " " + gv05EE$(mc0092)
                lblRecordChar(mc0092).Caption = l0064
        End Select
        lblRecordStat(l005C).Visible = True
        lblRecordChar(l005C).Visible = True
    Next l005C
    For l005C = False To mc001E - 1
        If  l005C > False Then
            Load lblHistoryStat(l005C)
            Load lblHistoryChar(l005C)
            lblHistoryStat(l005C).Top = lblHistoryChar(l005C - 1).Top + lblHistoryChar(l005C - 1).Height
            lblHistoryChar(l005C).Top = lblHistoryStat(l005C).Top + lblHistoryStat(l005C).Height
        End If
        Select Case l005C
            Case m0020
                lblHistoryStat(l005C).Caption = "Deadliest Creature Defeated"
                l005A = fn1C07(mc00A2, l0062)
                l0066 = "(Unknown)"
                For l005E = False To gv1BF6 - 1
                    If  gv14F6(l005E).M5467 = l0062.M73F5 Then
                        l0066 = gv14F6(l005E).M548B
                        Exit For
                    End If
                Next l005E
                l005A = fn1C07(mc00A2, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "Defeated a " + Chr(34) + l0066 + Chr(34)
                lblHistoryChar(l005C).Caption = l0064
            Case mc0022
                lblHistoryStat(l005C).Caption = "Most Experienced Explorer"
                l005A = fn1C07(mc00AE, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "Having " + fn036D(CCur(l0062.M73F5), m00B0) + " total experience"
                lblHistoryChar(l005C).Caption = l0064
            Case mc0024
                lblHistoryStat(l005C).Caption = "Wealthiest Explorer"
                l005A = fn1C07(mc00B4, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "Having a total of " + fn036D(CCur(l0062.M73F5), m00B0) + " gold in the Bank"
                lblHistoryChar(l005C).Caption = l0064
            Case mc0026
                lblHistoryStat(l005C).Caption = "Master of Fighting"
                l005A = fn1C07(mc00B6, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "Having a combined fighting skill of " + CStr(l0062.M73F5)
                lblHistoryChar(l005C).Caption = l0064
            Case mc0028
                lblHistoryStat(l005C).Caption = "Master of Magic"
                l005A = fn1C07(mc00B8, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "Having a spell knowledge && power of " + CStr(l0062.M73F5)
                lblHistoryChar(l005C).Caption = l0064
            Case mc002A
                lblHistoryStat(l005C).Caption = "Master of Thieving"
                l005A = fn1C07(mc00BA, l0062)
                If  l0062.M7406 Then
                    l0064 = "Set on " + CVDate(l0062.M7406) + " by "
                Else
                    l0064 = "Set by Original RecordHolder "
                End If
                l0064 = l0064 + Chr(34) + RTrim(l0062.M73FE) + Chr(34) + Chr(13)
                l0064 = l0064 + "Having a total thieving skill of " + CStr(l0062.M73F5)
                lblHistoryChar(l005C).Caption = l0064
            Case Else
        End Select
        lblHistoryStat(l005C).Visible = True
        lblHistoryChar(l005C).Visible = True
    Next l005C
End Sub

Sub sub1EBA ()
' Const mc00BA = 11 ' &HB%
End Sub
