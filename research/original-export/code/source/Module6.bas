' Module6
Option Explicit
Const mc0060 = 11 ' &HB%
Dim m0062(11) As Integer ' 71
Dim m0078 As Integer ' 61
Dim m007A As Integer ' 61
Dim m007C As Integer ' 61
Const mc0080 = .6
Dim m0088 As Integer ' 61
Const mc008A = 5 ' &H5%
Const mc008C = 15 ' &HF%
Const mc00A4 = 48 ' &H30%
Dim m00AC As Integer ' 61
Const mc00AE = 12 ' &HC%
Dim m00B6 As Integer ' 61
Const mc00BC = 4 ' &H4%
Const mc00BE = 6 ' &H6%
Const mc00DA = 7 ' &H7%
Const m00DC = 0 ' &H0%
Const mc0122 = 1 ' &H1%
Const mc0138 = 200 ' &HC8%
Const mc013A = 9 ' &H9%
Const mc013C = 150 ' &H96%
Const mc013E = 100 ' &H64%
Const mc0148 = 8 ' &H8%
Const mc014A = 40 ' &H28%
Const mc014C = 6 ' &H6%
Const mc014E = 19 ' &H13%
Const mc0150 = 10 ' &HA%
Const mc0152 = 2 ' &H2%
Const m0154 = 0 ' &H0%
Const mc0156 = 18 ' &H12%
Const m0162 = 0 ' &H0%
Const mc0164 = 1 ' &H1%
Const mc0166 = 1 ' &H1%
Const mc0168 = 2 ' &H2%
Const mc016A = 3 ' &H3%
Const mc016C = 3 ' &H3%
Const mc0170 = 4 ' &H4%
Const mc0172 = 4 ' &H4%
Const mc0174 = 5 ' &H5%
Const mc0176 = 5 ' &H5%
Const mc0178 = 6 ' &H6%
Const mc017A = 6 ' &H6%
Const mc017C = 30 ' &H1E%
Const mc017E = 32 ' &H20%
Const m0184 = 0 ' &H0%
Const mc0186 =-1 ' &HFFFF%
Const mc0188 = 20 ' &H14%
Const mc018A = 4 ' &H4%
Const mc018E = 3 ' &H3%
Const mc0198 = 22 ' &H16%
Const mc019A = 50 ' &H32%
Const mc019C = 1 ' &H1%
Const mc019E = 8 ' &H8%
Const mc01A0 = 7 ' &H7%
Const mc01A6 = 1 ' &H1%
Const m01AA = 0 ' &H0%
Const mc01B0 = 11 ' &HB%
Const mc01B6 = 1 ' &H1%
Const mc01B8 = 2 ' &H2%
Const mc01BA = 3 ' &H3%
Const mc01BC = 4 ' &H4%
Const mc01C4 = 19 ' &H13%
Const mc01C8 = 8 ' &H8%
Const mc01D0 = 1 ' &H1%
Const m01D2 = 0 ' &H0%
Const mc01D4 = 23 ' &H17%
Const mc01D6 = 12 ' &HC%
Const mc01DA = 13 ' &HD%
Const mc01E2 = 2 ' &H2%
Const mc01E4 = 14 ' &HE%
Const mc01EC = 2900 ' &HB54%
Const mc01F6 = 15 ' &HF%
Const mc01F8 = 15 ' &HF%
Const mc01FA = 16 ' &H10%
Const mc01FC = 17 ' &H11%
Const mc0202 = 52 ' &H34%
Const mc0204 = 365 ' &H16D%
Const mc0220 = 1 ' &H1%
Const mc022A = 7 ' &H7%
Const mc022C = 5 ' &H5%
Const mc0232 = 4 ' &H4%
Const mc0236 = 100 ' &H64%
Const m023C = 0 ' &H0%
Const mc0244 = 1 ' &H1%
Const mc0246 = 6 ' &H6%
Const mc0250 = 9 ' &H9%
Const mc0286 = 6 ' &H6%
Const mc028E = 18 ' &H12%
Const mc0290 = 10 ' &HA%
Const mc0292 = 7 ' &H7%
Const m0294 = 0 ' &H0%
Const mc02D6 = 40 ' &H28%
Const mc02D8 = 1 ' &H1%
Const mc02DE = 1 ' &H1%
Const mc02E0 = 3 ' &H3%
Const mc02F2 = 38 ' &H26%
Const mc02F4 = 2 ' &H2%
Const m02F6 = 0 ' &H0%
Const mc02F8 = 1 ' &H1%
Const mc02FA = 5475 ' &H1563%
Const mc02FC = 64 ' &H40%
Const mc02FE = 54 ' &H36%
Const m031C = 0 ' &H0%
Const mc031E = 2 ' &H2%
Const mc0320 = 1 ' &H1%
Const mc0322 = 2 ' &H2%
Const mc032C = 6 ' &H6%
Const mc032E = 90 ' &H5A%
Const m0350 = 0 ' &H0%
Const mc0352 = 2 ' &H2%
Const mc0354 = 5 ' &H5%
Const mc0356 = 3 ' &H3%
Const mc0358 = 1 ' &H1%
Const mc035A = 2 ' &H2%
Const mc035C = 4 ' &H4%
Const mc035E = 5 ' &H5%
Const m0386 = 0 ' &H0%
Const mc0388 = 3 ' &H3%
Const mc038A = 2 ' &H2%
Const mc038C = 1 ' &H1%
Const mc03E2 = 1 ' &H1%
Const mc0418 = 999 ' &H3E7%
Const mc0472 = 2 ' &H2%
Const mc0474 = 21 ' &H15%
Const mc04A6 = 255 ' &HFF%
Const mc04AE = 9 ' &H9%
Const m04C0 = 0 ' &H0%
Const mc04DC = 1 ' &H1%
Const mc04E6 = 11 ' &HB%
Const mc04E8 = 84 ' &H54%
Const mc04F2 = 11 ' &HB%
Const m0500 = 0 ' &H0%
Const mc050E = 20 ' &H14%
Const mc0510 = 66 ' &H42%
Const m0516 = 0 ' &H0%
Const mc0518 = 10 ' &HA%
Const mc051A = 13 ' &HD%
Const mc051C = 2 ' &H2%
Const mc051E = 17 ' &H11%
Const mc0520 = 4 ' &H4%
Const mc0524 = 33 ' &H21%
Const mc052A = 3 ' &H3%
Const mc052C = 18 ' &H12%
Const m0544 = 0 ' &H0%
Const mc0546 = 1 ' &H1%
Const mc0548 = 2 ' &H2%
Const mc056C = 27 ' &H1B%
Const mc0572 = 188 ' &HBC%
Const mc0574 = 1 ' &H1%
Const mc0576 = 1 ' &H1%
Const mc0578 = 190 ' &HBE%
Const mc057A = 112 ' &H70%
Const mc057C = 1 ' &H1%
Const mc0580 = 83 ' &H53%
Const mc0582 = 4 ' &H4%
Const mc0588 = 10 ' &HA%
Const mc058A = 65 ' &H41%
Const mc058C = 4 ' &H4%
Const mc0590 =-2 ' &HFFFE%
Const mc0592 = 192 ' &HC0%
Const mc0594 = 191 ' &HBF%
Const mc0596 = 77 ' &H4D%
Const mc0598 = 113 ' &H71%
Const mc059A = 4 ' &H4%
Const mc059C = 114 ' &H72%
Const m059E = 0 ' &H0%
Const mc05A0 = 115 ' &H73%
Const mc05A2 = 3 ' &H3%
Const mc05A4 = 116 ' &H74%
Const mc05A6 = 2 ' &H2%
Const mc05A8 = 117 ' &H75%
Const mc05AA = 6 ' &H6%
Const mc05AC = 118 ' &H76%
Const mc05AE = 7 ' &H7%
Const mc05B0 = 119 ' &H77%
Const mc05B2 = 120 ' &H78%
Const mc05B4 = 5 ' &H5%
Const mc05B6 = 121 ' &H79%
Const mc05BC = 1 ' &H1%
Const mc05BE = 90 ' &H5A%
Const m05C2 = 0 ' &H0%
Const mc05C4 = 1 ' &H1%
Const mc05C6 = 67 ' &H43%
Const mc05C8 = 1 ' &H1%
Const m05CA = 0 ' &H0%
Const mc05CC = 69 ' &H45%
Const mc05D0 = 68 ' &H44%
Const mc05D8 = 2 ' &H2%
Const mc05DA = 2 ' &H2%
Const mc05DC = 73 ' &H49%
Const mc05DE = 3 ' &H3%
Const mc05E0 = 85 ' &H55%
Const mc05E2 = 1 ' &H1%
Const mc05E4 = 81 ' &H51%
Const mc05E6 = 80 ' &H50%
Const mc05EA = 2 ' &H2%
Const mc05EC = 76 ' &H4C%
Const mc05EE = 71 ' &H47%
Const mc05F4 = 78 ' &H4E%
Const mc05F6 = 82 ' &H52%
Const mc05FE = 38 ' &H26%
Const mc0600 = 39 ' &H27%
Const mc0602 = 37 ' &H25%
Const mc0604 = 40 ' &H28%
Const mc060C = 1 ' &H1%
Const mc060E = 2 ' &H2%
Const mc0610 = 5 ' &H5%
Const mc0612 = 3 ' &H3%
Const mc0614 = 1 ' &H1%
Const mc0618 = 35 ' &H23%
Const mc0620 = 4 ' &H4%
Const mc0622 = 2 ' &H2%
Const mc0628 = 20 ' &H14%
Const mc062A = 84 ' &H54%
Const mc062C = 12 ' &HC%
Const mc0630 = 13 ' &HD%
Const mc0632 = 21 ' &H15%
Const mc0634 = 15 ' &HF%
Const mc0636 = 70 ' &H46%
Const mc0638 = 32 ' &H20%
Const mc063C = 79 ' &H4F%
Const mc0642 = 1 ' &H1%
Const mc0644 = 74 ' &H4A%
Const mc0650 = 2 ' &H2%
Const mc0652 = 4 ' &H4%
Const mc0654 = 66 ' &H42%
Const mc0656 = 83 ' &H53%
Const mc0658 = 3 ' &H3%
Const mc065C = 1 ' &H1%
Const mc065E = 2 ' &H2%
Const mc0660 = 9 ' &H9%
Const mc067E = 1 ' &H1%
Const mc0680 = 4 ' &H4%
Const mc0682 = 3 ' &H3%
Const mc06A2 = 1 ' &H1%
Const mc06A4 = 1 ' &H1%
Const mc06B4 = 1 ' &H1%
Const mc06CA = 1 ' &H1%
Const mc06CC = 9 ' &H9%
Const mc071A = 75 ' &H4B%
Const mc071C = 31 ' &H1F%
Const mc0736 = 60 ' &H3C%
Const mc073A = 32 ' ? &H 0020 00CC
Const mc0758 = 6 ' &H6%
Const mc0760 = 14 ' &HE%
Const mc0768 = 18 ' &H12%
Const mc077E = 2 ' &H2%
Const mc0782 = 5 ' &H5%
Const mc078C = 40 ' &H28%
Const mc078E = 4 ' &H4%
Const mc0790 = 10 ' &HA%
Const mc0792 = 10 ' &HA%
Const mc0794 = 5 ' &H5%
Const mc0796 = 6 ' &H6%
Const mc079E = 9 ' &H9%
Const mc07A2 = 10 ' &HA%
Const mc07A4 = 11 ' &HB%
Const mc07B4 = 1 ' &H1%
Const mc07B6 = 2 ' &H2%
Const mc07B8 = 1 ' &H1%
Const mc07E0 = 7 ' &H7%
Const mc07FA = 9 ' &H9%
Const mc081E = 29 ' &H1D%
Const mc082C = 124 ' &H7C%
Const mc082E = 23 ' &H17%
Const mc0830 = 20 ' &H14%
Const mc0836 = 32 ' &H20%
Const mc083A = 3 ' &H3%
Const mc0882 = 4 ' &H4%
Const mc0884 = 28 ' &H1C%

Sub Main ()
    On Error GoTo L2DF76
    If  InStr(Command, "/DEBUG") Then
        gv1A66.M5F55 = True
    End If
    gv1A66.M5F63 = True
    gv219E = -1
    Randomize
    If  App.PrevInstance Then
        MsgBox "Sorry, only one instance of Mordor can be run at a time.", mc00A4, "Mordor " + gc0186
        End
    End If
    frmWelcome.Show m00AC
    frmWelcome.Refresh
    If  extfn1855(frmWelcome.hDC, mc00AE) < 8 Then
        MsgBox "Mordor is a 256 color application and has detected that you are running in a mode that does not support 256 colors." + Chr(13) + "It's recommended that you switch to a mode that supports at least 256 colors before playing.", mc00A4, "256 Color Notice"
    End If
    sub038D
    sub03E3 False
    sub06B4
    sub170B
    If  Not gv1A66.M5EF1 Then
        If  fn1A1B() = False Then
            MsgBox "Error Initializing Music!"
        End If
    End If
    If  Not gv1A66.M5EFC Then
        If  fn1A08() = False Then
            MsgBox "Error Initializing FX!"
        End If
    End If
    extsub05E7
    sub096E
    sub1725
    sub173B
    Unload frmWelcome
    If  m00B6 Then sub16EB
    frmMain.Show
    Exit Sub

L2DF76:
    If  MsgBox("Error '" + Error + "' occurred.  Continue anyway?", mc00A4 + mc00BC, "Error") = mc00BE Then
        Resume Next
    Else
        sub05F6
    End If
End Sub

Sub sub0EAE (p00C0 As Integer ' 41, p00C2 As Integer ' 41, ByVal pv00C4 As Integer ' 81, p00C6 As Integer ' 41)
Dim l00C8 As String ' 87
Dim l00CA As Integer ' 81
Dim l00CC As Integer ' 81
Dim l00CE As Integer ' 81
Dim l00D0 As Integer ' 81
' Const mc00DA = 7 ' &H7%
' Const m00DC = 0 ' &H0%
    On Error GoTo L2E46E
    If  p00C6 = True And pv00C4 = False Then
        If  gv14C2(p00C2).M4EAC < gv14C2(p00C2).M4EB4 Then
            l00CA = ((100 - (gv14C2(p00C2).M4EAC / gv14C2(p00C2).M4EB4 * 100)) / 3.25#)
            gv14C2(p00C2).M4EAC = gv14C2(p00C2).M4EB4
        End If
        gv14C2(p00C2).M5577 = gv14C2(p00C2).M5577 + l00CA
        l00D0 = l00CA
    Else
        gv14C2(p00C2).M5577 = gv14C2(p00C2).M5577 + pv00C4
        l00CA = pv00C4
    End If
    If  l00CA > mc00DA Then
        l00CC = Int(l00CA / mc00DA)
    End If
    l00CE = l00CA - (l00CC * mc00DA)
    If  l00CE > 0 Then
        l00CA = l00CE
    Else
        l00CA = 0
    End If
    If  l00CC = 0 And l00CA = 0 Then
        Exit Sub
    End If
    If  l00CC > 0 Then
        If  l00CA > 0 Then
            l00C8 = LTrim$(Str$(l00CC)) + " week(s) and " + LTrim$(Str$(l00CA)) + " day(s)"
        Else
            l00C8 = LTrim$(Str$(l00CC)) + " week(s)"
        End If
    Else
        l00C8 = LTrim$(Str$(l00CA)) + " day(s)"
    End If
    If  p00C6 = True Then
        If  p00C2 = m00DC Then
            sub071B l00D0
            sub06E8 l00D0
        End If
    End If
    If  p00C0 Then
        If  p00C6 = True Then
            If  UBound(gv14C2) > False Then
                sub085B Chr$(34) + RTrim(gv14C2(p00C2).M548B) + Chr$(34) + " rested for " + l00C8 + "."
            Else
                sub085B "You rested for " + l00C8 + "."
            End If
        Else
            If  UBound(gv14C2) > False Then
                sub085B Chr$(34) + RTrim(gv14C2(p00C2).M548B) + Chr$(34) + " is now " + l00C8 + " older."
            Else
                sub085B "You are now " + l00C8 + " older."
            End If
        End If
    End If
    sub08A9 False, 4
    Exit Sub

L2E46E:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharAddAge"
    Resume L2E4D8
L2E4D8:
End Sub

Function fn114E (p00E0 As Long ' 42) As Integer ' 1
    If  p00E0 > gv14C2(gv1A86).M4F2D Then
        If  p00E0 > gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF Then
            fn114E = False
            Exit Function
        Else
            p00E0 = p00E0 - gv14C2(gv1A86).M4F2D
            gv14C2(gv1A86).M4F2D = 0
            gv14C2(gv1A86).M58AF = gv14C2(gv1A86).M58AF - p00E0
            fn114E = True
        End If
    Else
        gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D - p00E0
        fn114E = True
    End If
    sub08A9 False, 10
End Function

Function fn115C (p00E6 As Integer ' 41, p00EA As T5810 ' 4A) As Integer ' 1
Dim l00EC As Integer ' 81
    If  fn0380(p00EA.M5821, gv145A(p00E6).M5604) = False Then
        l00EC = True
    End If
    If  fn0380(p00EA.M4EBF, gv145A(p00E6).M5557) = False Then
        l00EC = True
    End If
    If  l00EC = False Then
        fn115C = True
    End If
End Function

Function fn1173 (ByVal pv00FA As Integer ' 81, ByVal pv00FC As Integer ' 81, p00FE ' 40, p0100 As Integer ' 41) As Integer ' 1
Dim l0104 As T5810 ' 8A
Dim l010A As Integer ' 81
Dim l010C As Integer ' 81
Dim l010E As Integer ' 81
Dim l0110 As String ' 87
Dim l0112 As String ' 87
Dim l0114 As Integer ' 81
Dim l0116 As String ' 87
Dim l0118 As Integer ' 81
Dim l011A As Integer ' 81
Dim l011C As Integer ' 81
Dim l011E As Integer ' 81
Dim l0120 As Long ' 82
' Const mc0122 = 1 ' &H1%
Dim l0124 As Integer ' 81
' Const mc0138 = 200 ' &HC8%
' Const mc013A = 9 ' &H9%
' Const mc013C = 150 ' &H96%
' Const mc013E = 100 ' &H64%
' Const mc0148 = 8 ' &H8%
' Const mc014A = 40 ' &H28%
' Const mc014C = 6 ' &H6%
' Const mc014E = 19 ' &H13%
' Const mc0150 = 10 ' &HA%
' Const mc0152 = 2 ' &H2%
' Const m0154 = 0 ' &H0%
' Const mc0156 = 18 ' &H12%
Dim l0158 As Single ' 83
Dim l015A As Single ' 83
Dim l015C As Integer ' 81
Dim l015E As Single ' 83
Dim l0160 As Integer ' 81
' Const m0162 = 0 ' &H0%
' Const mc0164 = 1 ' &H1%
' Const mc0166 = 1 ' &H1%
' Const mc0168 = 2 ' &H2%
' Const mc016A = 3 ' &H3%
' Const mc016C = 3 ' &H3%
' Const mc0170 = 4 ' &H4%
' Const mc0172 = 4 ' &H4%
' Const mc0174 = 5 ' &H5%
' Const mc0176 = 5 ' &H5%
' Const mc0178 = 6 ' &H6%
' Const mc017A = 6 ' &H6%
' Const mc017C = 30 ' &H1E%
' Const mc017E = 32 ' &H20%
' Const m0184 = 0 ' &H0%
' Const mc0186 =-1 ' &HFFFF%
' Const mc0188 = 20 ' &H14%
' Const mc018A = 4 ' &H4%
Dim l018C As Integer ' 81
' Const mc018E = 3 ' &H3%
' Const mc0198 = 22 ' &H16%
' Const mc019A = 50 ' &H32%
' Const mc019C = 1 ' &H1%
' Const mc019E = 8 ' &H8%
' Const mc01A0 = 7 ' &H7%
Dim l01A2 As String ' 87
Dim l01A4 As Integer ' 81
' Const mc01A6 = 1 ' &H1%
' Const m01AA = 0 ' &H0%
' Const mc01B0 = 11 ' &HB%
Dim l01B2 As Integer ' 81
Dim l01B4 As Integer ' 81
' Const mc01B6 = 1 ' &H1%
' Const mc01B8 = 2 ' &H2%
' Const mc01BA = 3 ' &H3%
' Const mc01BC = 4 ' &H4%
' Const mc01C4 = 19 ' &H13%
' Const mc01C8 = 8 ' &H8%
' Const mc01D0 = 1 ' &H1%
' Const m01D2 = 0 ' &H0%
' Const mc01D4 = 23 ' &H17%
' Const mc01D6 = 12 ' &HC%
' Const mc01DA = 13 ' &HD%
' Const mc01E2 = 2 ' &H2%
' Const mc01E4 = 14 ' &HE%
' Const mc01EC = 2900 ' &HB54%
' Const mc01F6 = 15 ' &HF%
' Const mc01F8 = 15 ' &HF%
' Const mc01FA = 16 ' &H10%
' Const mc01FC = 17 ' &H11%
' Const mc0202 = 52 ' &H34%
' Const mc0204 = 365 ' &H16D%
Dim l0206 As Integer ' 81
Dim l0208 As Integer ' 81
Dim l020A As Integer ' 81
Dim l020C ' 80
Dim l020E As Integer ' 81
Dim l0210 As Integer ' 81
Dim l0212 As Integer ' 81
Dim l0214 As Integer ' 81
Dim l0216 As Integer ' 81
Dim l0218 As Integer ' 81
Dim l021A As Integer ' 81
Dim l021C As Integer ' 81
' Const mc0220 = 1 ' &H1%
' Const mc022A = 7 ' &H7%
' Const mc022C = 5 ' &H5%
' Const mc0232 = 4 ' &H4%
' Const mc0236 = 100 ' &H64%
' Global Const gc1D70 = .25
' Const m023C = 0 ' &H0%
' Const mc0244 = 1 ' &H1%
' Const mc0246 = 6 ' &H6%
' Const mc0250 = 9 ' &H9%
    On Error GoTo L32FC2
    If  gv14C2(pv00FA).M5470 = 0 Or m0078 = True Or pv00FC = -1 Then
        Exit Function
    End If
    l0114 = gv14C2(pv00FA).M59BB
    If  p0100 = -1 Then
        If  fn10E5(pv00FA, pv00FC, p00FE, False) = False Then
            sub102F pv00FA, mc0122
            m0078 = False
            Exit Function
        End If
    End If
    If  pv00FC >= 1000 Then
        pv00FC = pv00FC - 1000
    End If
    l0124 = Int(Rnd * 100)
    If  gv1E66(pv00FA).M5766 > -1 Then
        If  gv14C2(pv00FA).M5857(gv1E66(pv00FA).M5766).M56DB > 0 Then
            sub1187 pv00FA, gv1E66(pv00FA).M5766, 1
        Else
            If  pv00FA = gv1A86 Then
                sub085B "Your item has run out of charges!"
            Else
                sub085B "The item " + Chr(34) + RTrim(gv14C2(pv00FA).M548B) + Chr(34) + " was using ran out of charges!"
            End If
            sub102F pv00FA, -1
            Exit Function
        End If
    End If
    m0078 = True
    l011A = gv152A(pv00FC).M56B9
    If  (fn1448(pv00FC) = gc1EE2 Or (fn1448(pv00FC) = gc1EE4 And fn0EEF() = False)) And p0100 = -1 Then
        If  l011A >= mc0138 Then
            l0118 = True
            l011A = l011A - mc0138
            l011C = m00DC
            l011E = UBound(gv14C2)
        End If
        Select Case l011A
            Case mc013A
                extsub05E7
                sub1005 pv00FC
            Case Else
        End Select
        Select Case l011A
            Case mc013C
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Which Companion?", "", "COMP"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l011C = Abs(l010A) - 10
                gv14C2(pv00FA).M58CB(l011C).M57E1 = mc013E
                sub085B fn1235(pv00FA, l011C) + " is now bound to you for life!"
                If  gv1EBC.M57D4 >= 0 Then
                    If  Len(frmCharStat1!lblCall.Tag) Then
                        If  CInt(Left(frmCharStat1!lblCall.Tag, 1)) = mc0148 Then
                            frmCharStat1!picTabPicture.Refresh
                        End If
                    End If
                End If
                l010E = True
            Case mc014A To mc014A + 2
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Which Companion?", "", "COMP"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l011C = Abs(l010A) - 10
                l011E = CInt(gv152A(pv00FC).M4E82 + Log((10 + fn1417(pv00FA, pv00FC)) / 5))
                If  gv14C2(pv00FA).M58CB(l011C).M57E1 >= l011E Then
                    sub085B Chr(34) + gv152A(pv00FC).M548B + Chr(34) + " had no effect!"
                Else
                    gv14C2(pv00FA).M58CB(l011C).M57E1 = l011E
                    sub085B Chr(34) + gv152A(pv00FC).M548B + Chr(34) + " raised the Bind Level of companion #" + CStr(l011C + 1) + " to " + CStr(l011E) + "."
                    If  frmCharStat1!tabStatTab.P?C01E = mc014C Then
                        If  Left(frmCharStat1!lblCall.Tag, 1) = CStr(mc0148) Then
                            If  gv1EBC.M57D4 = l011C Then
                                gv1EBC.M57E1 = l011E
                                frmCharStat1!picTabPicture.Refresh
                            End If
                        End If
                    End If
                    If  gv1EBC.M57D4 >= 0 Then
                        If  Val(Left(frmCharStat1!lblCall.Tag, 1)) = mc0148 Then
                            frmCharStat1!picTabPicture.Refresh
                        End If
                    End If
                End If
                l010E = True
            Case mc014E
                sub0F29 pv00FA
            Case mc0150
                gv1E66(pv00FA).M56C4 = -1
                sub0BCD
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELLHEAL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                If  gv14C2(pv00FA).M56B9(mc0152) > False Then
                    l011C = pv00FA
                    sub0D1D pv00FA, 1, 0
                    sub08A9 False, 12
                End If
            Case m0154, mc0156
                If  gv152A(pv00FC).M5B33 > 0 Then
                    If  l0118 = False Then
                        l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELLHEAL"))
                        If  l010A = -1 Then
                            m0078 = False
                            Exit Function
                        Else
                            If  l010A < -1 Then
                                If  gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC < 1 Then
                                    sub085B "Companion is Dead!"
                                    m0078 = False
                                    Exit Function
                                End If
                            End If
                            l011C = l010A
                            l011E = l010A
                        End If
                    Else
                        l010A = m00DC
                    End If
                    For l010A = l011C To l011E
                        If  p00FE <= False Then
                            l0160 = Int((gv14C2(pv00FA).M5584(gv14C2(pv00FA).M58BB).M4E82 / 2) + .5#)
                        Else
                            l0160 = p00FE
                        End If
                        If  l0160 < 1 Then l0160 = 1
                        l0158 = Log(l0160) / Log(10)
                        l015E = gv152A(pv00FC).M5B33 + (gv152A(pv00FC).M5B33 * l0158)
                        l015E = l015E + Int((l0160 / 10) * gv152A(pv00FC).M5B41)
                        l015A = Int(Rnd * (l015E - ((l0160 - 1) / l0160 ^ 2)) / 2) + 1
                        l015C = Int(l015E - l015A)
                        If  l010A < -1 Then
                            gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC + l015C
                            If  gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC > gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EB4 Then
                                gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EB4
                            End If
                            sub0B82 pv00FA
                        Else
                            gv14C2(l010A).M4EAC = gv14C2(l010A).M4EAC + l015C
                            If  gv14C2(l010A).M4EAC > gv14C2(l010A).M4EB4 Then
                                gv14C2(l010A).M4EAC = gv14C2(l010A).M4EB4
                            End If
                            If  l011A = mc0156 Then
                                gv14C2(l010A).M56B9(m0162) = False
                                gv14C2(l010A).M56B9(mc0164) = False
                            End If
                        End If
                    Next l010A
                    l010A = l010A - 1
                    sub08A9 True, 7
                End If
            Case mc0166
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                gv14C2(l010A).M56B9(m0162) = False
            Case mc0168
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                gv14C2(l010A).M56B9(mc0164) = False
            Case mc016A
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    gv14C2(l010A).M56B9(mc016C) = 1
                    gv14C2(l010A).M591F = fn0418(mc016C, gv14C2(l010A).M591F, True)
                Next l010A
                l010A = l010A - 1
            Case mc0170
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    gv14C2(l010A).M56B9(mc0172) = 1
                    gv14C2(l010A).M591F = fn0418(mc0172, gv14C2(l010A).M591F, True)
                Next l010A
                l010A = l010A - 1
            Case mc0174
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                gv14C2(l010A).M56B9(mc0176) = True
                gv14C2(l010A).M591F = fn0418(mc0176, gv14C2(l010A).M591F, True)
            Case mc0178
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    gv14C2(l010A).M56B9(mc017A) = Int(fn1417(pv00FA, pv00FC) / 2) + 1
                    gv14C2(l010A).M591F = fn0418(mc017A, gv14C2(l010A).M591F, True)
                Next l010A
                l010A = l010A - 1
            Case mc017C To mc017E
                If  gv1E50.M4F3D <= m0184 Then
                    sub085B "There is no locked chest here!"
                    m0078 = False
                    Exit Function
                End If
                If  gv1E50.M4F3D <= l011A - (mc017C - 1) Then
                    gv1E50.M4F3D = mc0186
                    sub0BAA gv14C2(pv00FA).M59BB
                End If
                l010A = -1
            Case mc0188 To mc0188 + 5
                If  gv14C2(pv00FA).M5943 > mc018A - 1 Then
                    sub085B Chr$(34) + RTrim(gv14C2(pv00FA).M548B) + Chr$(34) + ", drop who you're carrying to raise the dead."
                    m0078 = False
                    Exit Function
                End If
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELLRAISE"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                If  l010A < -1 Then
                    l018C = 85 + gv14F6(gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4ED4).M55B5(mc018E)
                    If  l018C > 98 Then l018C = 98
                    If  Int(Rnd * 100) > l018C Then
                        sub085B "Raise Failed!"
                        gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4ED4 = -1
                    Else
                        sub085B "Raise Was Successful!"
                        If  l011A = mc0198 Then
                            gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EB4
                        Else
                            gv14C2(pv00FA).M58CB(Abs(l010A + 10)).M4EAC = 1
                        End If
                    End If
                    gv14C2(pv00FA).M5943 = -1
                    sub0B82 pv00FA
                    sub0F38
                Else
                    If  fn13D7(l010A, l011A) > 0 Then
                        sub0A7C l010A, fn13D7(l010A, l011A), l011A
                    Else
                        l010E = True
                    End If
                End If
            Case mc019A To mc019A + mc0060 - 1
                If  l0118 = False Then
                    l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Cast on Who?", "", "SPELL"))
                    If  l010A = -1 Then
                        m0078 = False
                        Exit Function
                    End If
                    l011C = l010A
                    l011E = l010A
                End If
                For l010A = l011C To l011E
                    If  gv14C2(l010A).M592F(l011A - 50) < 95 Then
                        gv14C2(l010A).M592F(l011A - 50) = 95
                        sub0894 l010A
                    End If
                Next l010A
                If  frmCharStat1!tabStatTab.P?C01E = mc019C Then
                    frmCharStat1!tabStatTab.P?C01E = mc019C
                End If
                sub08B9 False
                l010A = l010A - 1
            Case mc019E, mc01A0
                Select Case l011A
                    Case mc019E
                        l01A2 = fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Enter coords as follows (using +/-):" + Chr$(13) + "Right, Forwards (ie +3,-2)", "", "DISPLACEMENT")
                        If  l01A2 = "-1" Then
                            m0078 = False
                            Exit Function
                        End If
                        l01A4 = fn164C("DISPLACEMENT", l01A2)
                        If  l01A4 = False Or l01A4 = mc01A6 Then
                            m0078 = False
                            Exit Function
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            sub1005 pv00FC
                            l010E = True
                        End If
                    Case mc01A0
                        l01A2 = fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Enter coords as follows (using +/-):" + Chr$(13) + "Right,Fwds,Down(max 3)(ie -3,+2,-1)", "", "TELEPORT")
                        If  l01A2 = "-1" Then
                            m0078 = False
                            Exit Function
                        End If
                        l01A4 = fn164C("TELEPORT", l01A2)
                        If  l01A4 = False Or l01A4 = mc01A6 Then
                            m0078 = False
                            Exit Function
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            sub1005 pv00FC
                            l010E = True
                        End If
                End Select
            Case mc013A, mc01B0
                Select Case gv14C2(m00DC).M5899
                    Case mc01B6
                        l01B2 = 30
                    Case mc01B8
                        l01B2 = 1
                    Case mc01BA
                        l01B2 = -30
                    Case mc01BC
                        l01B2 = -1
                End Select
                l01B4 = fn0AE8(gv14C2(m00DC)) + l01B2
                Select Case l011A
                    Case mc013A
                        Select Case gv14C2(m00DC).M5899
                            Case mc01B6
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + 1
                            Case mc01B8
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + 1
                            Case mc01BA
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - 1
                            Case mc01BC
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - 1
                        End Select
                        If  gv14C2(m00DC).M583F > gv1864.M4216 Then gv14C2(m00DC).M583F = 1
                        If  gv14C2(m00DC).M583F < 1 Then gv14C2(m00DC).M583F = gv1864.M4216
                        If  gv14C2(m00DC).M5845 > gv1864.M420C Then gv14C2(m00DC).M5845 = 1
                        If  gv14C2(m00DC).M5845 < 1 Then gv14C2(m00DC).M5845 = gv1864.M420C
                        If  fn0380(mc01C4, fn0AD3(fn0AE8(gv14C2(m00DC)))) = True Then
                            gv14C2(m00DC).M59BB = False
                            sub0956
                            Do
                                sub091E pv00FA, mc01C8
                                sub0930 pv00FA
                            Loop While UBound(gv14C2) > m00DC
                            sub091E m00DC, mc01C8
                            sub0930 m00DC
                            sub085B "You walked into solid rock!"
                            l011C = gv14C2(m00DC).M583F
                            l011E = gv14C2(m00DC).M5845
                            If  l011C > False And l011C <= gv1864.M4216 And l011E > False And l011E <= gv1864.M420C Then
                                l0120 = fn0A34(l011C, l011E)
                                l0120 = fn0418(mc01C4, l0120, True)
                                If  fn0ABD(l011C, l011E, l0120) = False Then
                                    MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                                End If
                            End If
                            If  gv1D64 <> m01AA Then frmAutoMap!lblCall = "DRAW"
                            l010E = True
                            m0078 = False
                            Exit Function
                        Else
                            l010A = -1
                            sub0835 gv14C2(m00DC).M5470
                            sub0980
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    Case mc01B0
                        Select Case gv14C2(pv00FA).M5899
                            Case mc01B6
                                l011C = gv14C2(pv00FA).M583F
                                l011E = gv14C2(pv00FA).M5845 + 1
                            Case mc01B8
                                l011C = gv14C2(pv00FA).M583F + 1
                                l011E = gv14C2(pv00FA).M5845
                            Case mc01BA
                                l011C = gv14C2(pv00FA).M583F
                                l011E = gv14C2(pv00FA).M5845 - 1
                            Case mc01BC
                                l011C = gv14C2(pv00FA).M583F - 1
                                l011E = gv14C2(pv00FA).M5845
                            Case Else
                        End Select
                        If  l011C > gv1864.M4216 Then l011C = 1
                        If  l011C < 1 Then l011C = gv1864.M4216
                        If  l011E > gv1864.M420C Then l011E = 1
                        If  l011E < 1 Then l011E = gv1864.M420C
                        If  fn0380(mc01C4, fn0AD3(fn0B01(l011C, l011E))) = True Then
                            sub085B "The square ahead is Rock."
                            If  gv14C2(pv00FA).M59F4(mc01D0) = False And gv14C2(pv00FA).M59F4(m01D2) = False Then
                                l0120 = fn0A34(l011C, l011E)
                                l0120 = fn0418(mc01C4, l0120, True)
                                If  fn0ABD(l011C, l011E, l0120) = False Then
                                    MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                                End If
                                If  gv1D64 <> m01AA Then
                                    frmAutoMap!lblCall = CStr(l011C) + "," + CStr(l011E)
                                End If
                            End If
                        Else
                            l0120 = fn0A34(l011C, l011E)
                            l0120 = fn0418(mc01D4, l0120, True)
                            If  fn0ABD(l011C, l011E, l0120) = False Then
                                MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                            End If
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = CStr(l011C) + "," + CStr(l011E)
                            End If
                            sub085B "The ahead square is not Rock."
                        End If
                        l010E = True
                End Select
            Case mc01D6
                sub085B "You are on level" + Str$(gv14C2(pv00FA).M5470) + "."
                gv14C2(m00DC).M59F4(m01D2) = False
                sub0848 False
                l01A4 = fn09A4(False, False)
                l010E = True
                If  gv1D64 <> m01AA Then
                    frmAutoMap!lblCall = "UPDATE"
                End If
            Case mc01DA
                sub085B "You are facing " + gv06E8$(gv14C2(pv00FA).M5899 - 1) + "."
                gv14C2(m00DC).M59F4(mc01E2) = False
                sub0848 False
                l01A4 = fn09A4(False, False)
                l010E = True
                If  gv1D64 <> m01AA Then
                    frmAutoMap!lblCall = "UPDATE"
                End If
            Case mc01E4
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Locate Who?", "", "LOCATE"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l010C = FreeFile
                Open gv19E8 + gc1C74 + gc1C10 For Random As #l010C Len = mc01EC
                    Get #l010C, gv1732(l010A).M5467, l0104
                    If  Abs(l0104.M5470 - gv14C2(pv00FA).M5470) > 3 Then
                        sub085B Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is too far away to locate."
                    Else
                        If  l0104.M5470 = 0 Then
                            sub085B Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is in the city."
                        Else
                            Select Case gv14C2(pv00FA).M5899
                                Case mc01B6
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(l0104.M583F - gv14C2(gv1A86).M583F)) + ", forward " + LTrim$(Str$(l0104.M5845 - gv14C2(gv1A86).M5845)) + ",  and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case mc01B8
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(gv14C2(gv1A86).M5845 - l0104.M5845)) + ", forward " + LTrim$(Str$(l0104.M583F - gv14C2(gv1A86).M583F)) + ", and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case mc01BA
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(gv14C2(gv1A86).M583F - l0104.M583F)) + ", forward " + LTrim$(Str$(gv14C2(gv1A86).M5845 - l0104.M5845)) + ", and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case mc01BC
                                    l0116 = Chr(34) + RTrim(l0104.M548B) + Chr(34) + " is right " + LTrim$(Str$(l0104.M5845 - gv14C2(gv1A86).M5845)) + ", forward " + LTrim$(Str$(gv14C2(gv1A86).M583F - l0104.M583F)) + ", and down " + LTrim$(Str$(l0104.M5470 - gv14C2(gv1A86).M5470)) + "."
                                Case Else
                                    l0116 = ""
                            End Select
                            sub085B l0116
                        End If
                    End If
                Close #l010C
                l010E = True
            Case mc01F6
                l010A = Val(fn16A0("Cast " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34), "Fetch Who?", "", "FETCH"))
                If  l010A = -1 Then
                    m0078 = False
                    Exit Function
                End If
                l010C = FreeFile
                Open gv19E8 + gc1C74 + gc1C10 For Random As #l010C Len = mc01EC
                    Get #l010C, gv1732(l010A).M5467, l0104
                    If  l0104.M5470 = gv14C2(m00DC).M5470 Or l0104.M5470 > mc01F8 Then
                        l0104.M583F = gv14C2(m00DC).M583F
                        l0104.M5845 = gv14C2(m00DC).M5845
                        l0104.M59BB = gv14C2(m00DC).M59BB
                        Put #l010C, gv1732(l010A).M5467, l0104
                        gv1732(l010A).M547A = gv14C2(m00DC).M59BB
                        sub085B "Fetch of " + Chr$(34) + gv1732(l010A).M548B + Chr$(34) + " was successful!"
                    Else
                        sub085B Chr$(34) + gv1732(l010A).M548B + Chr$(34) + " is not within reach from here!"
                    End If
                Close #l010C
                l01A4 = fn09A4(False, False)
                l010E = True
            Case mc01FA
                gv14C2(pv00FA).M59E7.M4E78 = gv14C2(pv00FA).M583F
                gv14C2(pv00FA).M59E7.M4E7D = gv14C2(pv00FA).M5845
                gv14C2(pv00FA).M59E7.M4E82 = gv14C2(pv00FA).M5470
                l010A = -1
            Case mc01FC
                If  gv14C2(pv00FA).M59E7.M4E78 = 0 Or gv14C2(pv00FA).M59E7.M4E7D = 0 Then
                    sub085B Chr$(34) + "Set Sanctuary" + Chr$(34) + " has not been cast!"
                    m0078 = False
                    Exit Function
                End If
                gv14C2(m00DC).M583F = gv14C2(pv00FA).M59E7.M4E78
                gv14C2(m00DC).M5845 = gv14C2(pv00FA).M59E7.M4E7D
                gv14C2(m00DC).M5470 = gv14C2(pv00FA).M59E7.M4E82
                l01A4 = fn0A0B(m00DC)
                sub0835 gv1D6C
                sub0980
                sub086D mc0202
                If  gv1D64 <> m01AA Then frmAutoMap!lblCall = "UPDATE"
                sub0EAE True, pv00FA, mc0204, False
                l010A = -1
        End Select
        If  p00FE = False And pv00FA <= UBound(gv14C2) Then
            gv14C2(pv00FA).M5830 = gv14C2(pv00FA).M5830 - fn142F(pv00FA, pv00FC)
        End If
        sub08A9 True, 50
        sub0941 "STATS"
        If  l010E = False Then
            If  pv00FA > UBound(gv14C2) Then
                sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " was thrown..."
                pv00FA = m00DC
            Else
                If  l0118 = True Then
                    sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on the party."
                Else
                    If  l010A = -1 Then
                        sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown."
                    Else
                        If  l010A < -1 Then
                            sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on " + fn1235(gv1A86, (Abs(l010A + 10))) + "."
                        Else
                            If  l011A >= mc0188 And l011A <= mc0188 + 5 Then
                                sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on " + Chr$(34) + gv1732(l010A).M548B + Chr$(34) + "."
                            Else
                                If  UBound(gv14C2) = False Then
                                    sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " thrown on yourself."
                                Else
                                    If  l010A = gv1A86 Then
                                        If  gv14C2(l010A).M5829 = False Then
                                            sub085B Chr$(34) + RTrim(gv14C2(l010A).M548B) + Chr$(34) + " threw " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " on himself."
                                        Else
                                            sub085B Chr$(34) + RTrim(gv14C2(l010A).M548B) + Chr$(34) + " threw " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " on herself."
                                        End If
                                    Else
                                        sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " threw " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " on " + Chr$(34) + RTrim(gv14C2(l010A).M548B) + Chr$(34) + "."
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
        If  pv00FA = gv1A86 And p0100 = -1 Then
            Select Case l011A
                Case mc013A, mc019E, mc01A0
                Case Else
                    extsub05E7
                    sub1005 pv00FC
            End Select
        End If
    Else
        l0206 = gv152A(pv00FC).M5B28
        l0208 = gv1E66(pv00FA).M547A
        l021A = gv1E66(pv00FA).M547A
        gv1E38(0).M4ECC = mc0220
        sub0BBA 0
        If  gv152A(pv00FC).M5709 = mc022A Then
            If  fn10D1(pv00FA) = 0 Then
                sub085B Chr$(34) + gv152A(pv00FC).M548B + Chr$(34) + " - No room for more Companions!"
                m0078 = False
                Exit Function
            End If
        End If
        l0210 = False
        If  pv00FA = gv1A86 Then
            If  p0100 = -1 Then
                l0112 = "You "
            Else
                l0112 = "Comp. #" + LTrim$(Str$(p0100 + 1)) + " "
                frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc022C)
            End If
        End If
        Do
            If  l0208 > mc0232 - 1 Then
                l0208 = False
            End If
            If  l0208 = -1 Then
                m0078 = False
                Exit Function
            End If
            If  gv1E38(l0208).M4EDC < 1 Then
                Do
                    l0210 = l0210 + 1
                    l0208 = l0208 + 1
                    If  l0208 > mc0232 - 1 Then
                        l0208 = 0
                    End If
                    If  l0210 >= mc0232 Then
                        Exit Do
                    End If
                    If  gv1E38(l0208).M4EDC > 0 Then
                        Exit Do
                    End If
                Loop While l0210 < mc0232
                If  l0210 >= mc0232 Then
                    Exit Do
                End If
            End If
            If  (gv1A66.M5F48 = True And pv00FA = gv1A86) Or gv1A66.M5F48 = False Then
                extsub05E7
                sub1005 pv00FC
            End If
            gv1E66(pv00FA).M547A = l0208
            If  pv00FA = gv1A86 Then
                frmDungeonMain!lblCurrentGroup.Top = frmDungeonMain!lblMonster(l0208).Top
                frmDungeonMain!lblCurrentGroup.Left = frmDungeonMain!lblMonster(l0208).Left - frmDungeonMain!lblCurrentGroup.Width
            End If
            l020E = gv152A(pv00FC).M5B1D
            If  l020E > gv1E38(l0208).M4EDC Then
                l020E = gv1E38(l0208).M4EDC
            End If
            l0214 = 0
            For l020C = 1 To l020E
                l0212 = fn0E5F(pv00FA, pv00FC, -1, p0100, p00FE)
                If  l011A = mc0236 And gv1E38(l0208).M4EAC - l0212 > 0 Then
                    l0212 = 0
                    Exit For
                End If
                l0218 = gv1E38(l0208).M4EAC
                If  gv152A(pv00FC).M5709 = mc022A Then
                    If  l0218 - l0212 > 0 Then
                        l0212 = 0
                    End If
                End If
                gv1E38(l0208).M4EAC = gv1E38(l0208).M4EAC - l0212
                If  gv1E38(l0208).M4EAC < False Then
                    gv1E38(l0208).M4EAC = False
                End If
                If  p0100 = -1 Then
                    sub0CDF pv00FA, l0218 - gv1E38(gv1E66(pv00FA).M547A).M4EAC, gv1E38(gv1E66(pv00FA).M547A).M4ED4, 1
                Else
                    sub0CDF pv00FA, l0218 - gv1E38(gv1E66(pv00FA).M547A).M4EAC, gv1E38(gv1E66(pv00FA).M547A).M4ED4, gc1D70
                End If
                sub08A9 False, 9
                If  gv1E38(l0208).M4EAC > 0 Then
                    l0216 = l0212
                    Exit For
                End If
                If  gv1E38(l0208).M4EAC < 1 Then
                    If  gv152A(pv00FC).M5709 = mc022A Then
                        l021C = l021C + 1
                    Else
                        l0214 = l0214 + 1
                    End If
                    gv1E38(l0208).M4EDC = gv1E38(l0208).M4EDC - 1
                    If  l0208 = False Then
                        If  fn0C3B(1, gv1E38(0).M4ED4) = True Then
                            If  gv1E38(0).M4EDC <= False Then
                                sub0980
                            End If
                        End If
                    End If
                    If  p0100 = -1 Then
                        gv14C2(pv00FA).M5906(m023C) = gv14C2(pv00FA).M5906(m023C) + 1
                        sub0CF3 gv1E38(l0208).M4ED4
                    End If
                    If  p0100 = -1 Then
                        If  gv152A(pv00FC).M5709 = mc022A Then
                            If  fn10D1(pv00FA) > 0 Then
                                l01A4 = fn10BA(pv00FA, gv1E38(l0208), l0218, pv00FC)
                            Else
                                l021C = l021C - 1
                                Exit For
                            End If
                        End If
                    End If
                    If  gv1E38(l0208).M4EDC > 0 Then
                        sub0D08 pv00FA
                    Else
                        Exit For
                    End If
                End If
            Next l020C
            If  l021C > 0 Then
                l0110 = "You charmed " + gv0846$(l021C)
            Else
                If  l0214 > 0 Then
                    If  (gv1A66.M5F48 = True And pv00FA = gv1A86) Or gv1A66.M5F48 = False Then
                        sub0CB7 gv1E38(l0208).M4ED4
                    End If
                    If  gv1E38(l0208).M4F01 = gv1E38(l0208).M4ED4 Then
                        If  fn0380(mc0244, gv14F6(gv1E38(l0208).M4ED4).M55BE) = True Then
                            If  gv14C2(pv00FA).M56B9(mc0176) <> False Then
                                sub1043 mc0246, pv00FA, gv14F6(gv1E38(l0208).M4ED4).M5467
                            End If
                        Else
                            sub1043 mc0246, pv00FA, gv14F6(gv1E38(l0208).M4ED4).M5467
                        End If
                    End If
                    If  l0214 > 10 Then
                        l0214 = 11
                    End If
                    l0110 = l0112 + gv0972$(gv152A(pv00FC).M5B12) + " " + gv0846$(l0214)
                End If
                If  l0216 > 0 Then
                    If  l0214 > 0 Then
                        l0110 = l0110 + " and damaged one for" + Str$(l0216)
                    Else
                        l0110 = l0112 + "damaged one for" + Str$(l0216)
                    End If
                Else
                    If  l0214 = 0 Then
                        If  p0100 = -1 Then
                            sub102F pv00FA, mc0122
                            l0110 = "Failed"
                        Else
                            l0110 = l0112 + "failed in casting " + Chr$(34) + gv152A(pv00FC).M548B + Chr$(34)
                        End If
                    End If
                End If
            End If
            l0216 = False
            If  pv00FA = gv1A86 Then
                frmDungeonMain!lblCharacterHit.Caption = l0110 + "!"
                sub07E2 .5#
            End If
            sub0BBA gv14C2(pv00FA).M59BB
            If  pv00FA = gv1A86 Then
                frmDungeonMain!lblCharacterHit.Caption = ""
            End If
            If  fn0DCD(-1) = -1 Then
                sub0BCD
                Exit Do
            End If
            l0208 = l0208 + 1
            l020A = l020A + 1
            l0210 = l0210 + 1
        Loop While l020A < l0206 And l0210 < l0206
        If  gv1E38(l021A).M4EDC < 1 Then
            gv1E66(pv00FA).M547A = fn0DCD(-1)
        Else
            gv1E66(pv00FA).M547A = l021A
        End If
        If  pv00FA = gv1A86 Then
            frmDungeonMain!lblCharacterHit.ForeColor = QBColor(mc0250)
        End If
        If  p0100 = -1 Then
            If  p00FE = False Then
                gv14C2(pv00FA).M5830 = gv14C2(pv00FA).M5830 - fn142F(pv00FA, pv00FC)
                sub08A9 False, 5
            End If
        End If
        sub0BBA gv14C2(pv00FA).M59BB
        sub0BCD
        If  fn0DCD(-1) = -1 Then
            sub0C53
        End If
        sub08A9 False, 50
    End If
    If  pv00FA > UBound(gv14C2) Then pv00FA = UBound(gv14C2)
    If  p0100 = -1 Then
        If  l0114 = gv14C2(pv00FA).M59BB Then
            sub0BBA gv14C2(pv00FA).M59BB
            sub0BCD
        End If
    End If
    fn1173 = True
    m0078 = False
    Exit Function

L32FC2:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharCastSpell.  Please Report."
    m0078 = False
    Resume L33048
L33048:
End Function

Function fn10BA (ByVal pv0254 As Integer ' 81, p0258 As T4E8B ' 4A, p025A As Integer ' 41, p025C As Integer ' 41) As Integer ' 1
Dim l025E ' 80
    For l025E = 0 To mc018A - 1
        If  gv14C2(pv0254).M58CB(l025E).M4ED4 = -1 And p025A > 0 Then
            gv14C2(pv0254).M58CB(l025E).M4ED4 = p0258.M4ED4
            gv14C2(pv0254).M58CB(l025E).M57D4 = gv14F6(p0258.M4ED4).M5467
            gv14C2(pv0254).M58CB(l025E).M4EAC = p025A
            gv14C2(pv0254).M58CB(l025E).M4EB4 = p0258.M4EB4
            gv14C2(pv0254).M58CB(l025E).M4EBF = p0258.M4EBF
            gv14C2(pv0254).M58CB(l025E).M4E97 = p0258.M4E97
            gv14C2(pv0254).M58CB(l025E).M4EA1 = p0258.M4EA1
            If  p025C > 0 Then
                gv14C2(pv0254).M58CB(l025E).M57E1 = gv152A(p025C).M4E82
            Else
                gv14C2(pv0254).M58CB(l025E).M57E1 = p025C
            End If
            gv14C2(pv0254).M58CB(l025E).M4EEE = fn121C(pv0254, gv14F6(p0258.M4ED4).M5A7C, gv14F6(p0258.M4ED4).M5693, True)
            Exit For
        End If
    Next l025E
    sub0B82 pv0254
End Function

Function fn10D1 (ByVal pv0264 As Integer ' 81) As Integer ' 1
Dim l0266 ' 80
Dim l0268 As Integer ' 81
    For l0266 = 0 To mc018A - 1
        If  gv14C2(pv0264).M58CB(l0266).M4ED4 = -1 Then
            l0268 = l0268 + 1
        End If
    Next l0266
    fn10D1 = l0268
End Function

Function fn10E5 (ByVal pv026C As Integer ' 81, ByVal pv026E As Integer ' 81, p0270 As Integer ' 41, p0272 As Integer ' 41) As Integer ' 1
Dim l0274 ' 80
Dim l0276 As Integer ' 81
Dim l027C As Single ' 83
Dim l027E As Integer ' 81
Dim l0280 As Integer ' 81
Dim l0282 ' 80
' Const mc0286 = 6 ' &H6%
' Const mc028E = 18 ' &H12%
' Const mc0290 = 10 ' &HA%
' Const mc0292 = 7 ' &H7%
' Const m0294 = 0 ' &H0%
    On Error GoTo L33F74
    gv1E66(pv026C).M4E97 = False
    If  pv026E >= 1000 Then
        pv026E = pv026E - 1000
    End If
    For l0274 = 0 To gv1BEA - 1
        If  gv14C2(pv026C).M5584(l0274).M4E82 > False Then
            If  (gv145A(l0274).M55F6(gv152A(pv026E).M5709, 0) > False And gv145A(l0274).M55F6(gv152A(pv026E).M5709, 1) >= gv152A(pv026E).M4E82) Or p0270 <> False Then
                l0276 = True
            End If
        End If
    Next l0274
    If  l0276 = False And p0270 = False Then
        If  p0272 Then
            Exit Function
        End If
        If  pv026C <> gv1A82 Then
            sub085B Chr$(34) + RTrim(gv14C2(pv026C).M548B) + Chr$(34) + " does not know " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "."
        Else
            sub085B "You do not know " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "."
        End If
        gv1E66(pv026C).M56C4 = -1
        Exit Function
    End If
    l0276 = False
    For l0274 = 0 To gv1BEA - 1
        If  gv14C2(pv026C).M5584(l0274).M4E82 > False Then
            If  gv145A(l0274).M55F6(gv152A(pv026E).M5709, 0) > False Then
                l027C = gv145A(l0274).M55F6(gv152A(pv026E).M5709, 0)
                l027E = gv152A(pv026E).M4E82 * l027C
                l0280 = Int((gv14C2(pv026C).M5584(l0274).M4E82 / 2) + .5#)
                If  l027E <= l0280 Then
                    l0276 = True
                    Exit For
                End If
            End If
        End If
    Next l0274
    If  l0276 = False And p0270 = False Then
        If  p0272 Then
            Exit Function
        End If
        If  pv026C <> gv1A82 Then
            sub085B Chr$(34) + RTrim(gv14C2(pv026C).M548B) + Chr$(34) + ", your Spell Level is too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        Else
            sub085B "Spell Level too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        End If
        gv1E66(pv026C).M56C4 = -1
        Exit Function
    End If
    If  p0270 = False Then
        For l0282 = 0 To mc0286 - 1
            If  (gv14C2(pv026C).M55B5(l0282) + gv14C2(pv026C).M584B(l0282)) < gv152A(pv026E).M5B4F(l0282) Then
                If  p0272 Then
                    Exit Function
                End If
                If  pv026C <> gv1A82 Then
                    sub085B RTrim(gv14C2(pv026C).M548B) + "s " + gv05EE$(l0282) + " is too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
                Else
                    sub085B "Your " + gv05EE$(l0282) + " is too low to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
                End If
                gv1E66(pv026C).M56C4 = -1
                Exit Function
            End If
        Next l0282
    End If
    If  p0272 Then
        fn10E5 = True
        Exit Function
    End If
    If  fn142F(pv026C, pv026E) > gv14C2(pv026C).M5830 And p0270 = False Then
        If  pv026C <> gv1A82 Then
            sub085B RTrim(gv14C2(pv026C).M548B) + " doesn't have enough spell points to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        Else
            sub085B "Not enough spell points to cast " + Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + "!"
        End If
        gv1E66(pv026C).M56C4 = -1
        Exit Function
    End If
    If  fn0EEF() > 0 And gv1E38(0).M4ECC = mc0220 And fn1448(pv026E) = gc1EE2 Then
        If  pv026C <> gv1A82 Then
            sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " is a Non-Combat Spell, " + RTrim(gv14C2(pv026C).M548B) + "."
        Else
            sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " is a Non-Combat Spell!"
        End If
        gv1E66(pv026C).M56C4 = -1
        gv1E66(pv026C).M5766 = -1
        Exit Function
    End If
    If  fn0380(mc028E, fn0AD3(fn0AE8(gv14C2(pv026C)))) = True Or fn0380(mc0290, fn0AD3(fn0AE8(gv14C2(pv026C)))) = True Then
        sub085B "Anti-Magic area!"
        sub087C mc028E, True
        If  gv1D64 <> m01AA Then frmAutoMap!lblCall = "DRAWSQ"
        sub102F pv026C, -1
        Exit Function
    End If
    If  fn1448(pv026E) = gv1EE0 Or fn1448(pv026E) = gc1EE4 Then
        If  fn0EEF() <= False Then
            If  fn1448(pv026E) = gv1EE0 Then
                sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " is a Combat Spell!"
                gv1E66(pv026C).M56C4 = -1
                gv1E66(pv026C).M5766 = -1
                Exit Function
            End If
        Else
            If  gv152A(pv026E).M4E82 > mc0292 And gv1E38(0).M4ECC = m0294 Then
                sub085B Chr$(34) + gv152A(pv026E).M548B + Chr$(34) + " Takes too long to throw when peaced, " + RTrim(gv14C2(pv026C).M548B) + "."
                gv1E66(pv026C).M56C4 = -1
                gv1E66(pv026C).M5766 = -1
                Exit Function
            End If
            If  gv1E38(0).M4ECC = m0294 Then
                gv1E38(0).M4ECC = mc0220
                sub0BDE -1
            End If
            sub0BBA gv14C2(pv026C).M59BB
        End If
    End If
    sub0BCD
    fn10E5 = True
    Exit Function

L33F74:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharCheckCast."
    Resume L33FE2
L33FE2:
End Function

Sub sub10F9 (ByVal pv0296 As Integer ' 81, p0298 As Integer ' 41, p029A ' 40)
    gv14C2(pv0296).M4EAC = gv14C2(pv0296).M4EAC - p0298
    If  gv14C2(pv0296).M4EAC < 1 Then
        gv14C2(pv0296).M4EAC = 0
        sub091E pv0296, p029A
        sub0930 pv0296
    Else
        sub08A9 False, 7
    End If
End Sub

Function fn110D (ByVal pv02A0 As Integer ' 81, p02A2 As Integer ' 41, p02A4 As Integer ' 41, p02A6 As Integer ' 41) As Variant ' 6
Dim l02A8 As Integer ' 81
Dim l02AA As Integer ' 81
Dim l02AC ' 80
    l02A8 = gv1592(gv1426(p02A2).M5709).M54D5
    fn110D = False
    If  gv14C2(pv02A0).M5700 + gv1426(p02A2).M5700 > 2 And p02A6 = False Then
        sub085B "No Free Hands!"
        Exit Function
    End If
    If  gv15C6(l02A8).M54F1 > False And p02A6 = False Then
        If  gv14C2(pv02A0).M586D(l02A8) = gv15C6(l02A8).M54F1 Then
            If  p02A4 <> False Then
                sub085B "Using too Many!"
            End If
            Exit Function
        End If
    End If
    l02AA = True
    If  gv1426(p02A2).M5742 = False Then
        For l02AC = 0 To gv1BEA - 1
            If  fn0380(l02AC, gv1426(p02A2).M56E6) <> False And gv14C2(pv02A0).M5584(l02AC).M4E82 > False Then
                l02AA = False
                Exit For
            End If
        Next l02AC
    Else
        If  fn0380(gv14C2(pv02A0).M58BB, gv1426(p02A2).M56E6) = False Then
            If  p02A4 <> False Then
                sub085B "Your current guild cannot use this item!"
            End If
            Exit Function
        Else
            l02AA = False
        End If
    End If
    If  l02AA = True Then
        If  p02A4 <> False Then
            sub085B "Your currently joined guilds cannot use this item!"
        End If
        Exit Function
    End If
    l02AA = True
    If  gv1426(p02A2).M5742 = True Then
        If  gv14C2(pv02A0).M5584(gv14C2(pv02A0).M58BB).M4E82 < fn030F(p02A2, gv14C2(pv02A0).M58BB) Then
            If  p02A4 <> False Then
                sub085B "Your guild level is too low to use item!"
            End If
            Exit Function
        Else
            l02AA = False
        End If
    Else
        For l02AC = 0 To gv1BEA - 1
            If  fn0380(l02AC, gv1426(p02A2).M56E6) <> False Then
                If  gv14C2(pv02A0).M5584(l02AC).M4E82 > False Then
                    If  gv14C2(pv02A0).M5584(l02AC).M4E82 >= fn030F(p02A2, l02AC) Then
                        l02AA = False
                        Exit For
                    End If
                End If
            End If
        Next l02AC
    End If
    If  l02AA = True Then
        If  p02A4 <> False Then
            sub085B "All guild levels too low to use item!"
        End If
        Exit Function
    End If
    l02AA = False
    For l02AC = 0 To mc0286 - 1
        If  gv14C2(pv02A0).M55B5(l02AC) < gv1426(p02A2).M5712(l02AC) Then
            l02AA = True
            Exit For
        End If
    Next l02AC
    If  l02AA = True Then
        If  p02A4 <> False Then
            sub085B "One or more stats are too low!"
        End If
        Exit Function
    End If
    fn110D = True
End Function

Function fn1121 (p02CA As Integer ' 41) As Integer ' 1
    If  gv1426(p02CA).M56B9 < 500 Or gv1426(p02CA).M56B9 > (500 + gv1BEA - 1) Then
        fn1121 = True
    End If
End Function

Function fn1139 (ByVal pv02CE As Integer ' 81, p02D0 As Integer ' 41) As Integer ' 1
Dim l02D2 ' 80
Dim l02D4 As Integer ' 81
' Const mc02D6 = 40 ' &H28%
' Const mc02D8 = 1 ' &H1%
    On Error GoTo L348FA
    For l02D2 = 1 To mc02D6 - 1
        If  gv14C2(pv02CE).M5857(l02D2).M577E = mc02D8 Then
            If  fn110D(pv02CE, gv14C2(pv02CE).M5857(l02D2).M4ED4, False, 1) = False Then
                l02D4 = True
                sub0F74 pv02CE, l02D2
                If  p02D0 Then
                    If  UBound(gv14C2) > m00DC Then
                        sub085B Chr(34) + RTrim(gv14C2(pv02CE).M548B) + Chr(34) + " can no longer use their " + fn12EF(gv14C2(pv02CE).M5857(l02D2).M4ED4, gv14C2(pv02CE).M5857(l02D2).M4EEE, gv14C2(pv02CE).M5857(l02D2).M4EBF, gv14C2(pv02CE).M5857(l02D2).M56DB) + "!"
                    Else
                        sub085B "You can no longer use your " + fn12EF(gv14C2(pv02CE).M5857(l02D2).M4ED4, gv14C2(pv02CE).M5857(l02D2).M4EEE, gv14C2(pv02CE).M5857(l02D2).M4EBF, gv14C2(pv02CE).M5857(l02D2).M56DB) + "!"
                    End If
                End If
            End If
        End If
    Next l02D2
    If  l02D4 Then fn1139 = True
    Exit Function

L348FA:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharCheckItems"
    Resume L34968
L34968:
End Function

Sub sub0CF3 (p02DA As Integer ' 41)
Dim l02DC ' 80
' Const mc02DE = 1 ' &H1%
' Const mc02E0 = 3 ' &H3%
    For l02DC = m00DC To UBound(gv14C2)
        If  gv14C2(l02DC).M5584(gv14C2(l02DC).M58BB).M55CB = mc02DE Then
            If  gv14C2(l02DC).M5584(gv14C2(l02DC).M58BB).M57B2 = False Then
                If  gv14F6(p02DA).M5467 = gv14C2(l02DC).M5584(gv14C2(l02DC).M58BB).M57A9 Then
                    gv14C2(l02DC).M5906(mc02E0) = gv14C2(l02DC).M5906(mc02E0) + 1
                    If  UBound(gv14C2) = False Then
                        sub085B "You have completed your quest!"
                    Else
                        sub085B Chr$(34) + RTrim(gv14C2(l02DC).M548B) + Chr$(34) + " completed " + fn1286(l02DC) + " quest!"
                    End If
                    gv14C2(l02DC).M5584(gv14C2(l02DC).M58BB).M57B2 = True
                End If
            End If
        End If
    Next l02DC
End Sub

Function fn11A1 (ByVal pv02E4 As Integer ' 81) As Integer ' 1
Dim l02E6 As Integer ' 81
Dim l02E8 ' 80
' Const mc02F2 = 38 ' &H26%
' Const mc02F4 = 2 ' &H2%
' Const m02F6 = 0 ' &H0%
' Const mc02F8 = 1 ' &H1%
' Const mc02FA = 5475 ' &H1563%
' Const mc02FC = 64 ' &H40%
' Const mc02FE = 54 ' &H36%
    If  (Int(Rnd * 100) < ((gv14C2(pv02E4).M5577 / mc0204) / (gv148E(gv14C2(pv02E4).M5821).M5577 / 2)) * 100) Or gv14C2(pv02E4).M5483 = mc01C8 Then
        sub086D mc02F2
        l02E6 = MsgBox("There are complications...", mc00A4, "Raise Info")
        gv14C2(pv02E4).M5906(mc02F4) = gv14C2(pv02E4).M5906(mc02F4) + 1
        sub047C pv02E4, m02F6
        For l02E8 = 0 To mc0286 - 1
            gv14C2(pv02E4).M55B5(l02E8) = gv14C2(pv02E4).M55B5(l02E8) - 5
            If  gv14C2(pv02E4).M55B5(l02E8) < gv148E(gv14C2(pv02E4).M5821).M5530(l02E8) Then
                gv14C2(pv02E4).M55B5(l02E8) = gv148E(gv14C2(pv02E4).M5821).M5530(l02E8)
            End If
        Next l02E8
        sub047C pv02E4, mc02F8
        sub0EAE True, pv02E4, mc02FA, False
        gv14C2(pv02E4).M4EB4 = Int(gv14C2(pv02E4).M4EB4 / 1.2#)
        gv14C2(pv02E4).M4EAC = gv14C2(pv02E4).M4EB4
        l02E6 = False
        For l02E8 = 1 To mc02D6
            If  gv14C2(pv02E4).M5857(l02E8 - 1).M577E = mc02D8 Then
                If  fn110D(pv02E4, gv14C2(pv02E4).M5857(l02E8 - 1).M4ED4, 0, 1) = False Then
                    l02E6 = True
                    sub0F74 pv02E4, (l02E8 - 1)
                End If
            End If
        Next l02E8
        If  l02E6 = True Then
            MsgBox "One or more items were unequipped due to lack of stats...", mc02FC, "Notice!"
        End If
        fn11A1 = True
    Else
        sub0EAE True, pv02E4, mc02FE, False
        gv14C2(pv02E4).M58DC = False
        gv14C2(pv02E4).M58E9 = False
        gv14C2(pv02E4).M58F9 = ""
        sub08A9 True, 4
        l02E6 = fn04ED(gv14C2(UBound(gv14C2)))
    End If
End Function

Sub sub04FC (ByVal p0302 As String ' 47)
Dim l0304 As Integer ' 81
    On Error GoTo L3501E
    If  gv1A66.M5F55 Then
        sub085B p0302
    End If
    If  gv1A66.M5F63 Then
        l0304 = FreeFile
        Open gv19E8 + gc1C54 For Append As #l0304
        Print #l0304, Now + " - " + Chr(34) + p0302 + Chr(34)
        Close #l0304
    End If
    Exit Sub

L3501E:
    Resume Next
End Sub

Sub sub0F74 (ByVal pv0308 As Integer ' 81, p030A As Integer ' 41)
Dim l030C As Integer ' 81
Dim l0312 As Integer ' 81
Dim l0314 As Integer ' 81
Dim l0316 As Integer ' 81
Dim l0318 ' 80
Dim l031A As Integer ' 81
' Const m031C = 0 ' &H0%
' Const mc031E = 2 ' &H2%
' Const mc0320 = 1 ' &H1%
' Const mc0322 = 2 ' &H2%
    If  p030A < False Then
        p030A = Abs(p030A)
        l0316 = True
    End If
    If  p030A < 0 Or p030A > mc02D6 - 1 Then
        Exit Sub
    End If
    If  gv14C2(pv0308).M5857(p030A).M4ED4 < 1 And p030A > 0 Then
        Exit Sub
    End If
    l030C = gv1592(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M5709).M54D5
    If  gv15C6(l030C).M54F1 = 0 Then
        Exit Sub
    End If
    If  gv14C2(pv0308).M5857(p030A).M577E = mc02D8 Then
        If  gv14C2(pv0308).M5857(p030A).M572A <> False And l0316 = False Then
            sub085B "Cannot unequip!  Item is cursed!"
            Exit Sub
        End If
        If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And gv14C2(pv0308).M5857(p030A).M4EBF <> gv14C2(pv0308).M4EBF + 1 Then
            If  Abs(gv14C2(pv0308).M4EBF - (gv14C2(pv0308).M5857(p030A).M4EBF - 1)) <> 1 Then
                l0312 = -gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4E97
                l0314 = -gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4EA1
            Else
                l0312 = Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4E97) / 2
                l0314 = Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4EA1) / 2
            End If
        Else
            l0312 = gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4E97
            l0314 = gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4EA1
        End If
        If  gv14C2(pv0308).M5857(p030A).M572A <> False Then
            gv14C2(pv0308).M5857(p030A).M572A = False
        End If
        gv14C2(pv0308).M4E97 = gv14C2(pv0308).M4E97 - l0312
        gv14C2(pv0308).M4EA1 = gv14C2(pv0308).M4EA1 - l0314
        gv14C2(pv0308).M5857(p030A).M577E = m031C
        sub11B9 pv0308
        sub0894 pv0308
        gv14C2(pv0308).M5700 = gv14C2(pv0308).M5700 - gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M5700
        gv14C2(pv0308).M586D(l030C) = gv14C2(pv0308).M586D(l030C) - 1
        If  l030C = False Then
            If  gv14C2(pv0308).M5997(0) = gv14C2(pv0308).M5857(p030A).M4ED4 Then
                gv14C2(pv0308).M5997(0) = -1
            Else
                gv14C2(pv0308).M5997(1) = -1
            End If
        End If
        sub047C pv0308, m02F6
        For l0318 = 0 To mc0286 - 1
            If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And Abs((gv14C2(pv0308).M4EBF + 1) - (gv14C2(pv0308).M5857(p030A).M4EBF)) > 1 Then
                gv14C2(pv0308).M584B(l0318) = gv14C2(pv0308).M584B(l0318) + gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318)
            Else
                If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And gv14C2(pv0308).M5857(p030A).M4EBF - 1 <> gv14C2(pv0308).M4EBF Then
                    gv14C2(pv0308).M584B(l0318) = gv14C2(pv0308).M584B(l0318) - Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318) / 2)
                Else
                    gv14C2(pv0308).M584B(l0318) = gv14C2(pv0308).M584B(l0318) - gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318)
                End If
            End If
        Next l0318
        sub047C pv0308, mc02F8
    Else
        If  gv14C2(pv0308).M5857(p030A).M577E = m031C Then
            If  fn110D(pv0308, gv14C2(pv0308).M5857(p030A).M4ED4, 1, 0) = False Then
                Exit Sub
            End If
            For l0318 = 0 To mc0286 - 1
                If  gv14C2(pv0308).M55B5(l0318) < gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M5712(l0318) Then
                    sub085B gv05EE$(l0318) + " is too low!"
                    Exit Sub
                End If
            Next l0318
            If  gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M572A Then
                gv14C2(pv0308).M5857(p030A).M572A = gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M572A
            End If
            l031A = False
            For l0318 = 0 To mc0286 - 1
                If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And Abs((gv14C2(pv0308).M4EBF + 1) - (gv14C2(pv0308).M5857(p030A).M4EBF)) > 1 Then
                    If  (gv14C2(pv0308).M55B5(l0318) + gv14C2(pv0308).M584B(l0318)) - gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318) < gv148E(gv14C2(pv0308).M5821).M5530(l0318) Then
                        l031A = True
                        Exit For
                    End If
                Else
                    If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And gv14C2(pv0308).M5857(p030A).M4EBF - 1 <> gv14C2(pv0308).M4EBF Then
                        If  (gv14C2(pv0308).M55B5(l0318) + gv14C2(pv0308).M584B(l0318)) + Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318) / 2) < gv148E(gv14C2(pv0308).M5821).M5530(l0318) Then
                            l031A = True
                            Exit For
                        End If
                    Else
                        If  (gv14C2(pv0308).M55B5(l0318) + gv14C2(pv0308).M584B(l0318)) + gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318) < gv148E(gv14C2(pv0308).M5821).M5530(l0318) Then
                            l031A = True
                            Exit For
                        End If
                    End If
                End If
            Next l0318
            If  l031A Then
                If  gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M572A = mc031E Then
                    sub085B "Your stats are too low for the item to properly attach!"
                Else
                    sub085B "You are too weak to equip this item!"
                End If
                Exit Sub
            End If
            If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And gv14C2(pv0308).M5857(p030A).M4EBF <> gv14C2(pv0308).M4EBF + 1 Then
                If  Abs(gv14C2(pv0308).M4EBF - (gv14C2(pv0308).M5857(p030A).M4EBF - 1)) <> 1 Then
                    l0312 = -gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4E97
                    l0314 = -gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4EA1
                    gv14C2(pv0308).M5857(p030A).M572A = mc0320
                Else
                    l0312 = Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4E97) / 2
                    l0314 = Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4EA1) / 2
                End If
            Else
                l0312 = gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4E97
                l0314 = gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M4EA1
            End If
            gv14C2(pv0308).M4E97 = gv14C2(pv0308).M4E97 + l0312
            gv14C2(pv0308).M4EA1 = gv14C2(pv0308).M4EA1 + l0314
            gv14C2(pv0308).M5857(p030A).M577E = mc02D8
            sub11B9 pv0308
            sub0894 pv0308
            gv14C2(pv0308).M5700 = gv14C2(pv0308).M5700 + gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M5700
            gv14C2(pv0308).M586D(l030C) = gv14C2(pv0308).M586D(l030C) + 1
            If  l030C = False Then
                If  gv14C2(pv0308).M5997(0) < 0 Then
                    gv14C2(pv0308).M5997(0) = gv14C2(pv0308).M5857(p030A).M4ED4
                Else
                    gv14C2(pv0308).M5997(1) = gv14C2(pv0308).M5857(p030A).M4ED4
                End If
            End If
            sub047C pv0308, m02F6
            For l0318 = 0 To mc0286 - 1
                If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And Abs((gv14C2(pv0308).M4EBF + 1) - (gv14C2(pv0308).M5857(p030A).M4EBF)) > 1 Then
                    gv14C2(pv0308).M584B(l0318) = gv14C2(pv0308).M584B(l0318) - gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318)
                Else
                    If  gv14C2(pv0308).M5857(p030A).M4EBF > 0 And gv14C2(pv0308).M5857(p030A).M4EBF - 1 <> gv14C2(pv0308).M4EBF Then
                        gv14C2(pv0308).M584B(l0318) = gv14C2(pv0308).M584B(l0318) + Int(gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318) / 2)
                    Else
                        gv14C2(pv0308).M584B(l0318) = gv14C2(pv0308).M584B(l0318) + gv1426(gv14C2(pv0308).M5857(p030A).M4ED4).M571E(l0318)
                    End If
                End If
            Next l0318
            sub047C pv0308, mc02F8
        End If
    End If
    sub0F61 pv0308, m00DC, p030A
    If  frmCharStat1!tabStatTab.P?C01E = mc0322 Then frmCharStat1!tabStatTab.P?C01E = mc0322
    sub08A9 False, 8
    sub08A9 False, 11
    sub08A9 False, 12
End Sub

Sub sub11B9 (ByVal pv0324 As Integer ' 81)
Dim l0326 ' 80
Dim l0328 ' 80
Dim l032A As Integer ' 81
' Const mc032C = 6 ' &H6%
' Const mc032E = 90 ' &H5A%
    gv14C2(pv0324).M5977 = 0
    For l0326 = 0 To mc0060 - 1
        gv14C2(pv0324).M5985(l0326) = 0
    Next l0326
    For l0328 = 0 To mc02D6 - 1
        If  gv14C2(pv0324).M5857(l0328).M577E = mc02D8 Then
            If  gv14C2(pv0324).M5857(l0328).M4EBF = 0 Or gv14C2(pv0324).M5857(l0328).M4EBF - 1 = gv14C2(pv0324).M4EBF Then
                If  gv1426(gv14C2(pv0324).M5857(l0328).M4ED4).M55BE > 0 Then
                    For l0326 = 0 To mc032C - 1
                        If  fn0380(l0326, gv1426(gv14C2(pv0324).M5857(l0328).M4ED4).M55BE) <> 0 Then
                            gv14C2(pv0324).M5977 = fn0418(l0326, gv14C2(pv0324).M5977, True)
                        End If
                    Next l0326
                End If
                If  gv1426(gv14C2(pv0324).M5857(l0328).M4ED4).M5548 > 0 Then
                    For l0326 = 0 To mc0060 - 1
                        If  fn0380(l0326, gv1426(gv14C2(pv0324).M5857(l0328).M4ED4).M5548) <> 0 Then
                            l032A = True
                            gv14C2(pv0324).M5985(l0326) = mc032E
                        End If
                    Next l0326
                End If
            End If
        End If
    Next l0328
    If  l032A Then
        If  frmCharStat1!tabStatTab.P?C01E = mc019C Then
            frmCharStat1!tabStatTab.P?C01E = mc019C
        End If
        sub08B9 False
    End If
    sub08A9 True, 12
End Sub

Sub sub0F29 (ByVal pv0330 As Integer ' 81)
Dim l0332 As Integer ' 81
    l0332 = Int(Rnd * 3)
    gv14C2(pv0330).M4EAC = Int(Rnd * gv14C2(pv0330).M4EB4) + 1
    gv14C2(pv0330).M5830 = Int(Rnd * fn1338(pv0330)) + 1
End Sub

Function fn11D4 (ByVal pv0336 As Integer ' 81, p0338 As Integer ' 41, p033A As Integer ' 41) As Single ' 3
Dim l033C As Single ' 83
Dim l033E As Single ' 83
Dim l0340 As Single ' 83
Dim l0342 As Single ' 83
Dim l0344 As Single ' 83
Dim l0346 ' 80
Dim l034A As T5B86 ' 8A
' Const m0350 = 0 ' &H0%
' Const mc0352 = 2 ' &H2%
' Const mc0354 = 5 ' &H5%
' Const mc0356 = 3 ' &H3%
' Const mc0358 = 1 ' &H1%
' Const mc035A = 2 ' &H2%
' Const mc035C = 4 ' &H4%
' Const mc035E = 5 ' &H5%
    gv141C.M5B95 = False
    gv141C.M5B9F = False
    For l0346 = 0 To gv1BEA - 1
        If  gv14C2(pv0336).M5584(l0346).M4E82 > False Then
            l034A.M5493 = l0346
            l034A.M5B95 = gv145A(l0346).M55BE(p0338)
            l034A.M5B9F = gv14C2(pv0336).M5584(l0346).M4E82
            Select Case p0338
                Case m0350
                    If  gv14C2(pv0336).M59BB > -1 And gv14C2(pv0336).M5470 > False And p033A = False Then
                        l033C = ((gv14C2(pv0336).M55B5(mc0352) + gv14C2(pv0336).M584B(mc0352)) / 4)
                        l033C = l033C + ((gv14C2(pv0336).M55B5(mc0354) + gv14C2(pv0336).M584B(mc0354)) / 2)
                        l033E = (Log(gv14F6(gv1E50.M4F24).M5A7C) * 4) * (Log(gv14C2(pv0336).M5470 + 1) * 1.25#) * 1.25#
                        l0342 = (l033C + (4.5# + (Exp(Log(l034A.M5B9F + 1) / Log(15)))) * ((l034A.M5B95 / 10) * 14)) - (l033E * 1.5#)
                        If  l0342 < 5 Then
                            l0342 = 5
                            ElseIf l0342 > 98 Then
                            l0342 = 98
                        End If
                    Else
                        l033C = ((gv14C2(pv0336).M55B5(mc0352) + gv14C2(pv0336).M584B(mc0352)) / 4)
                        l033C = l033C + ((gv14C2(pv0336).M55B5(mc0354) + gv14C2(pv0336).M584B(mc0354)) / 2)
                        l033E = (Log(2) * 4) * (Log(gv14C2(pv0336).M5470 + 1) * 1.25#) * 1.25#
                        l0342 = (l033C + (4.5# + (Exp(Log(l034A.M5B9F + 1) / Log(15)))) * ((l034A.M5B95 / 10) * 14)) - (l033E * 1.5#)
                    End If
                Case mc0356
                    l0342 = (l034A.M5B95 * l034A.M5B9F)
                Case mc0358, mc035A
                    l0342 = (l034A.M5B95 * l034A.M5B9F)
                Case mc035C
                    l0342 = mc0080 + ((((Log(100 + l034A.M5B9F) / 1.75#) - 2.3#) * (l034A.M5B95 * l034A.M5B95)) / 2)
                Case mc035E
                    l033C = (gv14C2(pv0336).M55B5(mc0352) + gv14C2(pv0336).M584B(mc0352) / 4)
                    l0340 = Log(l034A.M5B9F) / Log(1.25#)
                    l0342 = ((l034A.M5B95) + (l0340)) * (l034A.M5B95 * .3#) + l033C
                    l0342 = l0342 - (gv14C2(pv0336).M5470 * 2)
                    If  l0342 < 5 Then
                        l0342 = 5
                        ElseIf l0342 > 90 Then
                        l0342 = 90
                    End If
            End Select
            If  l0342 > l0344 Then
                l0344 = l0342
                gv141C.M5493 = l0346
                gv141C.M5B95 = gv145A(l0346).M55BE(p0338)
                gv141C.M5B9F = gv14C2(pv0336).M5584(l0346).M4E82
            End If
        End If
    Next l0346
    fn11D4 = l0344
End Function

Function fn11E9 (ByVal pv0362 As Integer ' 81, p0364 ' 40) As Integer ' 1
Dim l0366 As Single ' 83
Dim l0368 As Single ' 83
Dim l036A As Integer ' 81
    l0366 = fn11D4(pv0362, p0364, True)
    Select Case p0364
        Case m0350
            l0366 = ((gv14C2(pv0362).M55B5(mc0352) + gv14C2(pv0362).M584B(mc0352)) / 4)
            l0366 = l0366 + ((gv14C2(pv0362).M55B5(mc0354) + gv14C2(pv0362).M584B(mc0354)) / 2)
            l0368 = (Log(2) * 4) * (Log(1 + 1) * 1.25#) * 1.25#
            l0366 = (l0366 + (4.5# + (Exp(Log(gv141C.M5B9F + 1) / Log(15)))) * ((gv141C.M5B95 / 10) * 14)) - (l0368 * 1.5#)
        Case mc035C
            l0366 = mc0080 + ((((Log(100 + gv141C.M5B9F) / 1.75#) - 2.3#) * (gv141C.M5B95 * gv141C.M5B95)) / 2)
        Case mc035E
            l0366 = ((gv141C.M5B95) + (Log(gv141C.M5B9F + 1) / Log(1.25#))) * (gv141C.M5B95 * .3#) + (gv14C2(pv0362).M55B5(mc0352) + gv14C2(pv0362).M584B(mc0352) / 4)
        Case Else
            l0366 = ((Log((gv141C.M5B9F / 999) + 1) * 100) * Log(gv141C.M5B95 + 1)) / 3
    End Select
    l036A = CInt(((l0366 - fn1354(p0364)) / (fn1305(p0364) - fn1354(p0364))) * 100)
    If  l036A <= 1 Then
        l036A = 1
    End If
    fn11E9 = l036A
End Function

Function fn1205 () As Integer ' 1
Dim l036E ' 80
Dim l0370 ' 80
Dim l0372 As Integer ' 81
    For l036E = 0 To UBound(gv14C2)
        l0372 = l0372 + 1
        For l0370 = 0 To mc018A - 1
            If  gv14C2(l036E).M58CB(l0370).M4ED4 > -1 And gv14C2(l036E).M58CB(l0370).M4EAC > 0 Then
                l0372 = l0372 + 1
            End If
        Next l0370
    Next l036E
    fn1205 = l0372
End Function

Sub sub0CCC (ByVal pv0374 As Integer ' 81)
Dim l0376 ' 80
Dim l0378 As Integer ' 81
    On Error GoTo L3741C
    If  gv14C2(pv0374).M5943 < mc018A Then
        l0378 = -1
        For l0376 = 0 To mc018A - 1
            If  gv14C2(pv0374).M58CB(l0376).M4ED4 > -1 Then
                If  gv14C2(pv0374).M58CB(l0376).M4EAC <= 0 Then
                    gv14C2(pv0374).M58CB(l0376).M4EAC = 0
                    If  l0378 > -1 Then
                        If  gv14C2(pv0374).M58CB(l0376).M4EB4 > gv14C2(pv0374).M58CB(l0378).M4EB4 Then
                            sub085B Chr$(34) + RTrim(gv14C2(pv0374).M548B) + Chr$(34) + " dropped " + fn1235(pv0374, gv14C2(pv0374).M5943) + " to carry " + fn1235(pv0374, l0376) + "."
                            l0378 = l0376
                        End If
                    Else
                        l0378 = l0376
                    End If
                End If
            End If
        Next l0376
        If  l0378 > -1 Then
            If  gv14C2(pv0374).M5943 <> l0378 Then
                If  gv14F6(gv14C2(pv0374).M58CB(l0378).M4ED4).M5565 - gv148E(gv14C2(pv0374).M5821).M5565 <= 1 Then
                    gv14C2(pv0374).M5943 = l0378
                    If  l0378 > -1 Then
                        If  pv0374 = gv1A86 Then
                            sub085B "You are now carrying " + fn1235(gv1A86, l0378) + "."
                        Else
                            sub085B RTrim(gv14C2(pv0374).M548B) + ", you are now carrying " + fn1235(pv0374, l0378) + "."
                        End If
                    End If
                Else
                    gv14C2(pv0374).M58CB(l0378).M4ED4 = -1
                    If  pv0374 = gv1A82 Then
                        sub085B fn1235(gv1A86, l0378) + " was too big to carry."
                    Else
                        sub085B RTrim(gv14C2(pv0374).M548B) + ", " + fn1235(pv0374, l0378) + " was too big to carry."
                    End If
                End If
                sub0B82 pv0374
            End If
        End If
    End If
    For l0376 = 0 To mc018A - 1
        If  gv14C2(pv0374).M58CB(l0376).M4ED4 > -1 Then
            If  gv14C2(pv0374).M58CB(l0376).M4EAC = 0 And gv14C2(pv0374).M5943 <> l0376 Then
                gv14C2(pv0374).M58CB(l0376).M4ED4 = -1
            End If
        End If
    Next l0376
    Exit Sub

L3741C:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharGetCarry."
    Resume L37488
L37488:
End Sub

Function fn121C (ByVal pv037C As Integer ' 81, p037E As Integer ' 41, p0380 As Integer ' 41, p0382 As Integer ' 41) As Integer ' 1
Dim l0384 As Integer ' 81
' Const m0386 = 0 ' &H0%
' Const mc0388 = 3 ' &H3%
' Const mc038A = 2 ' &H2%
' Const mc038C = 1 ' &H1%
    l0384 = (30 + p0380) * Log(((p037E + 5) / 10) + 1)
    If  p0382 = False Then l0384 = (l0384 * 1.5#)
    l0384 = fn12AF(pv037C) - l0384
    Select Case l0384
        Case Is >= m0088
            l0384 = m0386
        Case Is <= (-mc008C)
            l0384 = mc0388
        Case Is <= (-mc008A)
            l0384 = mc038A
        Case Is < m0088
            l0384 = mc038C
        Case Else
            l0384 = mc0388
    End Select
    fn121C = l0384
End Function

Function fn1235 (p0390 As Integer ' 41, p0392 As Integer ' 41) As String ' 7
    If  RTrim(gv14C2(p0390).M58CB(p0392).M548B) = "" Then
        fn1235 = "Companion #" + CStr(p0392 + 1)
    Else
        fn1235 = Chr(34) + RTrim(gv14C2(p0390).M58CB(p0392).M548B) + Chr(34)
    End If
End Function

Function fn124B (p0398 As T5810 ' 4A) As Long ' 2
Dim l039A ' 80
Dim l039C As Integer ' 81
Dim l039E As Single ' 83
Dim l03A0 As Single ' 83
Dim l03A2 As Currency ' 85
Dim l03A4 As Currency ' 85
Dim l03A6 As Currency ' 85
Dim l03A8 As Currency ' 85
    l039C = p0398.M5584(p0398.M58BB).M4E82
    l039E = gv145A(p0398.M58BB).M557E
    l03A0 = gv148E(p0398.M5821).M557E + 1
    For l039A = 1 To l039C
        l03A2@ = (l039A + l039A) * l039E
        l03A4@ = (l039A / 2) * 2 + (l039A - 1)
        l03A6@ = ((l03A2@ / 12) * 500 * l039A + 344 * l03A4@ - 2) / 10
        l03A8@ = ((l03A6@ + l03A4@) * l03A0)
    Next l039A
    l03A6@ = l03A6@ * (((Log(l03A0) / Log(l03A0 + 1)) + 1) - .7# + (l03A0 / 25))
    fn124B = l03A6@
End Function

Function fn125C (p03AE As T5810 ' 4A) As Long ' 2
Dim l03B0 ' 80
Dim l03B2 As Integer ' 81
Dim l03B4 As Single ' 83
Dim l03B6 As Single ' 83
Dim l03BA As Long ' 82
Dim l03BC As Long ' 82
    l03B2 = p03AE.M5584(p03AE.M58BB).M4E82
    l03B4 = gv145A(p03AE.M58BB).M557E
    l03B6 = gv148E(p03AE.M5821).M557E
    For l03B0 = 1 To l03B2
        l03BA& = (l03B0 / 2) * 2 + (l03B0 - 1)
        l03BC& = l03BC& + (((l03B2 / 2) * l03BA&) * 60.2#) / l03B2
    Next l03B0
    fn125C = l03BC& + (l03BC& * (gv145A(p03AE.M58BB).M4F2D / 10))
End Function

Function fn126E (p03C4 As Integer ' 41) As Variant ' 6
    Select Case gv14C2(p03C4).M58BB
        Case 0
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Vagrant"
                Case Is < 20
                    fn126E = "Drifter"
                Case Is < 30
                    fn126E = "Vagabond"
                Case Is < 40
                    fn126E = "Wanderer"
                Case Is < 50
                    fn126E = "Traveller"
                Case Is < 60
                    fn126E = "Wayfarer"
                Case Is < 80
                    fn126E = "Rover"
                Case Is < 100
                    fn126E = "Pioneer"
                Case Is < 130
                    fn126E = "Pilgrim"
                Case Is < 150
                    fn126E = "Journeyor"
                Case Is < 190
                    fn126E = "Voyager"
                Case Is < 220
                    fn126E = "Nomad"
                Case Else
                    fn126E = "Master Nomad"
            End Select
        Case 1
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Bravo"
                Case Is < 20
                    fn126E = "Soldier"
                Case Is < 30
                    fn126E = "Fighter"
                Case Is < 50
                    fn126E = "Mercenary"
                Case Is < 70
                    fn126E = "Swordsman"
                Case Is < 90
                    fn126E = "Duelist"
                Case Is < 120
                    fn126E = "Gladiator"
                Case Is < 140
                    fn126E = "Combatant"
                Case Is < 160
                    fn126E = "Hero"
                Case Is < 180
                    fn126E = "Swashbuckler"
                Case Is < 200
                    fn126E = "Master Hero"
                Case Is < 230
                    fn126E = "Master Swordsman"
                Case Else
                    fn126E = "Warlord"
            End Select
        Case 2
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Guard"
                Case Is < 20
                    fn126E = "Sentry"
                Case Is < 50
                    fn126E = "Defender"
                Case Is < 80
                    fn126E = "Protector"
                Case Is < 100
                    fn126E = "Sentinel"
                Case Is < 120
                    fn126E = "Guardian"
                Case Is < 150
                    fn126E = "Knight"
                Case Is < 180
                    fn126E = "Champion"
                Case Is < 210
                    fn126E = "Paladin"
                Case Else
                    fn126E = "Master of the Guard"
            End Select
        Case 3
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Apprentice"
                Case Is < 20
                    fn126E = "Student"
                Case Is < 40
                    fn126E = "Mentor"
                Case Is < 70
                    fn126E = "Teacher"
                Case Is < 90
                    fn126E = "Instructor"
                Case Is < 120
                    fn126E = "Assassin"
                Case Is < 120
                    fn126E = "Ninja"
                Case Is < 120
                    fn126E = "Master Ninja"
                Case Is < 150
                    fn126E = "Shogun"
                Case Is < 220
                    fn126E = "Weapons Master"
                Case Else
                    fn126E = "Death Master"
            End Select
        Case 4
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Rascal"
                Case Is < 20
                    fn126E = "Knave"
                Case Is < 30
                    fn126E = "Trickster"
                Case Is < 40
                    fn126E = "Scoundrel"
                Case Is < 50
                    fn126E = "Miscreant"
                Case Is < 70
                    fn126E = "Criminal"
                Case Is < 90
                    fn126E = "Ruffian"
                Case Is < 120
                    fn126E = "Convict"
                Case Is < 150
                    fn126E = "Murderer"
                Case Is < 180
                    fn126E = "Villain"
                Case Is < 210
                    fn126E = "Evil Being"
                Case Else
                    fn126E = "Master Villain"
            End Select
        Case 5
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Apprentice"
                Case Is < 20
                    fn126E = "Journeyman"
                Case Is < 30
                    fn126E = "Guide"
                Case Is < 40
                    fn126E = "Searcher"
                Case Is < 60
                    fn126E = "Tracer"
                Case Is < 80
                    fn126E = "Hunter"
                Case Is < 100
                    fn126E = "Navigator"
                Case Is < 120
                    fn126E = "Explorer"
                Case Is < 140
                    fn126E = "Infiltrator"
                Case Is < 160
                    fn126E = "Adventurer"
                Case Is < 180
                    fn126E = "Delver"
                Case Is < 200
                    fn126E = "Questor"
                Case Is < 230
                    fn126E = "Seeker"
                Case Else
                    fn126E = "Master Seeker"
            End Select
        Case 6
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Footpad"
                Case Is < 20
                    fn126E = "Sneak"
                Case Is < 30
                    fn126E = "Pickpocket"
                Case Is < 40
                    fn126E = "Trickster"
                Case Is < 50
                    fn126E = "Cutpurse"
                Case Is < 60
                    fn126E = "Robber"
                Case Is < 80
                    fn126E = "Swindler"
                Case Is < 100
                    fn126E = "Shyster"
                Case Is < 120
                    fn126E = "Convict"
                Case Is < 140
                    fn126E = "Criminal"
                Case Is < 160
                    fn126E = "Thief"
                Case Is < 180
                    fn126E = "Racketeer"
                Case Is < 200
                    fn126E = "Kingpin"
                Case Is < 240
                    fn126E = "Master Thief"
                Case Else
                    fn126E = "Master of Shadows"
            End Select
        Case 7
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Rogue"
                Case Is < 20
                    fn126E = "Scrounger"
                Case Is < 30
                    fn126E = "Forager"
                Case Is < 40
                    fn126E = "Acquirer"
                Case Is < 70
                    fn126E = "Plunderer"
                Case Is < 100
                    fn126E = "Pillager"
                Case Is < 140
                    fn126E = "Ransacker"
                Case Is < 180
                    fn126E = "Marauder"
                Case Is < 220
                    fn126E = "Mugger"
                Case Is < 285
                    fn126E = "Scavenger"
                Case Else
                    fn126E = "Master Scavenger"
            End Select
        Case 8
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Apprentice"
                Case Is < 30
                    fn126E = "Enchanter"
                Case Is < 50
                    fn126E = "Charmer"
                Case Is < 80
                    fn126E = "Conjuror"
                Case Is < 120
                    fn126E = "Illusionist"
                Case Is < 150
                    fn126E = "Magician"
                Case Is < 180
                    fn126E = "Mage"
                Case Is < 230
                    fn126E = "Spellbinder"
                Case Is < 260
                    fn126E = "Arch-Mage"
                Case Else
                    fn126E = "Master of Magic"
            End Select
        Case 9
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Alchemist"
                Case Is < 30
                    fn126E = "Warlock"
                Case Is < 50
                    fn126E = "Sorcerer"
                Case Is < 70
                    fn126E = "Necromancer"
                Case Is < 90
                    fn126E = "Element Mage"
                Case Is < 120
                    fn126E = "Fire Master"
                Case Is < 150
                    fn126E = "Master of Electricity"
                Case Is < 170
                    fn126E = "Earth Shaker"
                Case Is < 240
                    fn126E = "Master Sorcerer"
                Case Else
                    fn126E = "Master of Elements"
            End Select
        Case 10
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Prophet"
                Case Is < 40
                    fn126E = "Diviner"
                Case Is < 70
                    fn126E = "SoothSayer"
                Case Is < 100
                    fn126E = "Theurgist"
                Case Is < 130
                    fn126E = "Thaumaturgist"
                Case Is < 160
                    fn126E = "Wizard"
                Case Is < 190
                    fn126E = "Adept"
                Case Is < 230
                    fn126E = "Master Wizard"
                Case Else
                    fn126E = "Master Adept"
            End Select
        Case 11
            Select Case gv14C2(p03C4).M5584(gv14C2(p03C4).M58BB).M4E82
                Case Is < 10
                    fn126E = "Apprentice"
                Case Is < 30
                    fn126E = "Medic"
                Case Is < 60
                    fn126E = "Benefactor"
                Case Is < 90
                    fn126E = "Altruist"
                Case Is < 120
                    fn126E = "Healer"
                Case Is < 150
                    fn126E = "Shaman"
                Case Is < 200
                    fn126E = "Magus"
                Case Is < 250
                    fn126E = "Raiser of the Dead"
                Case Else
                    fn126E = "Master Healer"
            End Select
    End Select
End Function

Function fn1286 (p03C8 As Integer ' 41) As String ' 7
    If  gv14C2(p03C8).M5829 = 0 Then
        fn1286 = "his"
    Else
        fn1286 = "her"
    End If
End Function

Function fn129A (ByVal pv03CE As Integer ' 81, p03D0 As Integer ' 41) As Variant ' 6
Dim l03D2 As Integer ' 81
Dim l03D4 As Integer ' 81
Dim l03D6 As Integer ' 81
    l03D2 = fn12AF(pv03CE)
    l03D6 = mc038A
    l03D4 = 25 + ((Log(gv1426(p03D0).M56F7 + 1) + .3#) * Log(gv1426(p03D0).M560D + 1) * gv1426(p03D0).M5693)
    If  l03D4 <= l03D2 Then
        If  gv1426(p03D0).M5693 <= 5 Then
            l03D6 = mc038C
        End If
    Else
        If  (l03D4 - l03D2) >= 10 Then
            l03D6 = mc038A
        End If
        If  (l03D4 - l03D2) >= 20 Then
            l03D6 = mc0388
        End If
    End If
    fn129A = l03D6
End Function

Function fn12AF (ByVal pv03DA As Integer ' 81) As Single ' 3
Dim l03DE As Integer ' 81
Dim l03E0 As Single ' 83
' Const mc03E2 = 1 ' &H1%
    On Error GoTo L39556
    l03DE = fn131D(pv03DA)
    If  l03DE = 0 Then
        Exit Function
    End If
    l03E0 = gv14C2(pv03DA).M55B5(mc03E2) + gv14C2(pv03DA).M55B5(mc0352)
    l03E0 = l03E0 + gv14C2(pv03DA).M584B(mc03E2) + gv14C2(pv03DA).M584B(mc0352)
    l03E0 = (l03E0 / 2) * Log(((l03DE + 5) / 10) + 1)
    fn12AF = l03E0
    Exit Function

L39556:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharGetIDSkill."
    Resume L395C4
L395C4:
End Function

Function fn12C4 (p03E6 As String ' 47) As Integer ' 1
Dim l03EC As Integer ' 81
Dim l03EE As String ' 87
    On Error GoTo L396E4
    If  p03E6 = "" Then
        Exit Function
    End If
    l03EC = Val(p03E6)
    If  l03EC < 1 Or l03EC > mc02D6 Then
        fn12C4 = -1
        Exit Function
    End If
    If  l03EC > 0 Then
        If  gv14C2(gv1A86).M5857(l03EC - 1).M4ED4 Or l03EC = 1 Then
            l03EE = gv1426(gv14C2(gv1A86).M5857(l03EC - 1).M4ED4).M548B
            If  l03EE <> "" Then
                fn12C4 = l03EC - 1
                Exit Function
            End If
        End If
    End If
    fn12C4 = -1
    Exit Function

L396E4:
    fn12C4 = -1
    Resume L396FA
L396FA:
End Function

Function fn12D6 (p03F2 As Integer ' 41) As String ' 7
    Select Case p03F2
        Case m0386
            fn12D6 = "Completely Identified"
        Case mc038C
            fn12D6 = "Mostly identified"
        Case mc038A
            fn12D6 = "Partially identified"
        Case Else
            fn12D6 = "Barely identified"
    End Select
End Function

Function fn12EF (p03F6 As Integer ' 41, p03F8 As Integer ' 41, p03FA As Integer ' 41, p03FC As Integer ' 41) As String ' 7
Dim l03FE As String ' 87
    Select Case p03F8
        Case m0386
            l03FE = l03FE + gv1426(p03F6).M548B
            If  p03FA > 0 Then
                l03FE = l03FE + " " + gv077E$(p03FA)
            End If
            If  p03FC > 0 Or (gv1426(p03F6).M56DB > False And p03FC = False) Then
                l03FE = l03FE + " [" + LTrim$(Str$(p03FC)) + "]"
            End If
            If  gv1426(p03F6).M572A Then
                l03FE = l03FE + " (cursed)"
            End If
        Case mc038C
            l03FE = l03FE + gv1426(p03F6).M548B
        Case mc038A
            l03FE = l03FE + gv1592(gv1426(p03F6).M5709).M548B
        Case mc0388
            l03FE = l03FE + gv15C6(gv1592(gv1426(p03F6).M5709).M54D5).M548B
        Case Else
            l03FE = l03FE + "Unidentified Item"
    End Select
    If  p03F6 = 0 Then
        l03FE = gv1426(0).M548B
    End If
    fn12EF = l03FE
End Function

Function fn1305 (p0408 As Variant ' 46) As Single ' 3
Dim l040C ' 80
Dim l040E As Single ' 83
Dim l0410 As Single ' 83
Dim l0412 As Single ' 83
Dim l0416 As T5B86 ' 8A
' Const mc0418 = 999 ' &H3E7%
    For l040C = 0 To gv1BEA - 1
        If  gv145A(l040C).M55BE(p0408) > l0416.M5B95 Then
            l0416.M5B95 = gv145A(l040C).M55BE(p0408)
        End If
    Next l040C
    Select Case p0408
        Case m0350
            l0410 = ((30) / 4)
            l0410 = l0410 + ((40) / 2)
            l040E = (Log(2) * 4) * (Log(1 + 1) * 1.25#) * 1.25#
            l0410 = (l0410 + (4.5# + (Exp(Log(mc0418 + 1) / Log(15)))) * ((9 / 10) * 14)) - (l040E * 1.5#)
        Case mc035C
            l0410 = mc0080 + ((((Log(100 + mc0418) / 1.75#) - 2.3#) * (l0416.M5B95 * l0416.M5B95)) / 2)
        Case mc035E
            l0412 = (60 / 4)
            l040E = Log(mc0418) / Log(1.25#)
            l0410 = ((l0416.M5B95) + (l040E)) * (l0416.M5B95 * .3#) + l0412
        Case Else
            l0410 = ((Log((mc0418 / 999) + 1) * 100) * Log(l0416.M5B95 + 1)) / 3
    End Select
    fn1305 = l0410
End Function

Function fn131D (ByVal pv041C As Integer ' 81) As Integer ' 1
Dim l041E ' 80
Dim l0420 As Integer ' 81
    For l041E = 0 To gv1BEA - 1
        If  gv14C2(pv041C).M5584(l041E).M4E82 > l0420 Then
            l0420 = gv14C2(pv041C).M5584(l041E).M4E82
        End If
    Next l041E
    fn131D = l0420
End Function

Function fn1338 (ByVal pv0424 As Integer ' 81) As Integer ' 1
    fn1338 = ((gv14C2(pv0424).M55B5(mc03E2) * 10) / 2) + ((gv14C2(pv0424).M55B5(mc0352) * 10) / 2)
End Function

Function fn1354 (p0428 As Variant ' 46) As Single ' 3
Dim l042C ' 80
Dim l042E As Single ' 83
Dim l0430 As Single ' 83
Dim l0432 As Single ' 83
Dim l0436 As T5B86 ' 8A
    For l042C = 0 To gv1BEA - 1
        If  gv145A(l042C).M55BE(p0428) < l0436.M5B95 Then
            l0436.M5B95 = gv145A(l042C).M55BE(p0428)
        End If
    Next l042C
    If  gv145A(0).M55BE(p0428) > l0436.M5B95 Then
        l0436.M5B95 = gv145A(0).M55BE(p0428)
    End If
    Select Case p0428
        Case m0350
            l0430 = ((2) / 4)
            l0430 = l0430 + ((2) / 2)
            l042E = (Log(2) * 4) * (Log(1 + 1) * 1.25#) * 1.25#
            l0430 = (l0430 + (4.5# + (Exp(Log(1 + 1) / Log(15)))) * ((5 / 10) * 14)) - (l042E * 1.5#)
        Case mc035C
            l0430 = mc0080 + ((((Log(100 + 1) / 1.75#) - 2.3#) * (l0436.M5B95 * l0436.M5B95)) / 2)
        Case mc035E
            l0432 = (8 / 4)
            l042E = Log(2) / Log(1.25#)
            l0430 = ((l0436.M5B95) + (l042E)) * (l0436.M5B95 * .3#) + l0432
        Case Else
            l0430 = ((Log((1 / 999) + 1) * 100) * Log(l0436.M5B95 + 1)) / 3
    End Select
    fn1354 = l0430
End Function

Function fn136C (ByVal pv043A As Integer ' 81) As String ' 7
    If  UBound(gv14C2) = m00DC Then
        fn136C = "You were"
    Else
        fn136C = Chr(34) + RTrim(gv14C2(pv043A).M548B) + Chr(34) + " was"
    End If
End Function

Function fn137E (p043E As Integer ' 41, p0440 As Integer ' 41) As Integer ' 1
Dim l0442 As Single ' 83
Dim l0444 As Single ' 83
Dim l0446 ' 80
Dim l0448 As Integer ' 81
    If  p0440 > gv145A(p043E).M559A Then
        l0442! = gv145A(p043E).M559A
        l0444! = 0
        If  p043E = 0 And p0440 > gv145A(p043E).M559A Then
            l0444! = 3
        End If
        For l0446 = gv145A(p043E).M559A To p0440
            l0448 = (((Int(gv145A(p043E).M559A) / 2) + (l0442! / 18)) / (gv145A(p043E).M5626 + l0444!))
            l0442! = l0442! + l0448
            If  l0442! > p0440 Then
                Exit For
            End If
        Next l0446
        If  l0442! = gv145A(p043E).M559A Then
            l0442! = p0440 + 1
        End If
    Else
        l0442! = 0
    End If
    If  p0440 > gv145A(p043E).M561A Then
        l0442! = l0442! * 1.1#
    End If
    fn137E = CInt(l0442!)
End Function

Function fn1397 (p044E As T5810 ' 4A) As Long ' 2
    p044E.M5584(p044E.M58BB).M4E82 = p044E.M5584(p044E.M58BB).M4E82 + 1
    fn1397 = fn124B(p044E) - 1
    p044E.M5584(p044E.M58BB).M4E82 = p044E.M5584(p044E.M58BB).M4E82 - 1
End Function

Function fn13A8 (ByVal pv0452 As Integer ' 81) As Integer ' 1
    If  gv14C2(pv0452).M56B9(mc017A) > False Then
        fn13A8 = Log(gv14C2(pv0452).M56B9(mc017A)) * (Log(gv14C2(pv0452).M56B9(mc017A)) * 3)
    End If
End Function

Function fn13C0 (p0458 As Integer ' 41) As Variant ' 6
Dim l045A As Integer ' 81
Dim l045E As T5810 ' 8A
Dim l0460 As Long ' 82
    l045A = FreeFile
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l045A Len = mc01EC
        Get #l045A, gv1732(p0458).M5467, l045E
    Close #l045A
    If  l045E.M58E9 > 0 Then
        fn13C0 = -1
        Exit Function
    End If
    l0460 = 2912.32# * (l045E.M4EB4 / 1.5#)
    fn13C0 = l0460
End Function

Function fn13D7 (p0464 As Integer ' 41, p0466 As Integer ' 41) As Integer ' 1
Dim l0468 As Integer ' 81
Dim l046A As Integer ' 81
Dim l046C As Integer ' 81
Dim l0470 As T5810 ' 8A
' Const mc0472 = 2 ' &H2%
' Const mc0474 = 21 ' &H15%
    If  p0464 > -1 Then
        l046C = FreeFile
        Open gv19E8 + gc1C74 + gc1C10 For Random As #l046C Len = mc01EC
            Get #l046C, gv1732(p0464).M5467, l0470
        Close #l046C
        Select Case l0470.M5483
            Case mc0472
                If  p0466 <> mc0474 And p0466 > -1 Then
                    sub085B "Character is stoned!  This Spell will not work!"
                    Exit Function
                End If
            Case mc01C8
                If  l0470.M5483 = mc01C8 And p0466 = -1 Then
                    MsgBox "The morgue cannot help characters pulled from Rock.", mc02FC, "Raise Character"
                    Exit Function
                End If
                If  p0466 <> mc0198 Then
                    sub085B "Character is Rock!  This spell will not work!"
                    Exit Function
                End If
            Case Else
        End Select
        l0468 = p0466 - (mc0188 - 1)
        If  l0468 < 1 Then l0468 = 1
        l046A = (35 * (l0470.M55B5(mc018E) / 4.5#)) + (l0468 * 10)
    Else
        If  gv14C2(gv1A86).M58E9 > 0 Then
            l0468 = gv14C2(gv1A86).M58DC
        Else
            l0468 = (mc0188 + 3)
        End If
        l0468 = l0468 - (mc0188 - 1)
        If  l0468 < 1 Then l0468 = 1
        l046A = (35 * (gv14C2(gv1A86).M55B5(mc018E) / 4.5#)) + (l0468 * 10)
    End If
    If  l046A < 10 Then
        l046A = 10
    End If
    If  l046A > 98 Then
        l046A = 98
    End If
    If  l0470.M5483 = mc01C8 Then
        l046A = 10
    End If
    fn13D7 = l046A
End Function

Sub sub0894 (ByVal pv0476 As Integer ' 81)
Dim l0478 ' 80
    gv14C2(pv0476).M56B9(mc016C) = False
    gv14C2(pv0476).M56B9(mc0172) = False
    gv14C2(pv0476).M56B9(mc017A) = False
    gv14C2(pv0476).M56B9(mc0176) = False
    sub13F1 pv0476
    For l0478 = 0 To mc032C - 1
        If  fn0380(l0478, gv14C2(pv0476).M5977) <> 0 Or fn0380(l0478, gv14C2(pv0476).M591F) <> 0 Then
            Select Case l0478
                Case 0
                    gv14C2(pv0476).M56B9(mc016C) = True
                Case 1
                    gv14C2(pv0476).M56B9(mc0172) = True
                Case 2
                    gv14C2(pv0476).M56B9(mc017A) = Int(gv14C2(pv0476).M5584(gv14C2(pv0476).M58BB).M4E82 / 2) + 1
                Case 3
                    gv14C2(pv0476).M56B9(mc0176) = True
                Case 4
            End Select
        End If
    Next l0478
    For l0478 = 0 To mc0060 - 1
        If  gv14C2(pv0476).M5985(l0478) > 0 Then
            gv14C2(pv0476).M5548(l0478) = gv14C2(pv0476).M5985(l0478)
        End If
        If  gv14C2(pv0476).M592F(l0478) > gv14C2(pv0476).M5548(l0478) Then
            gv14C2(pv0476).M5548(l0478) = gv14C2(pv0476).M592F(l0478)
        End If
    Next l0478
    If  fn0380(mc016C, gv14C2(pv0476).M591F) = True Then
        gv14C2(pv0476).M56B9(mc016C) = True
    End If
    If  fn0380(mc0172, gv14C2(pv0476).M591F) = True Then
        gv14C2(pv0476).M56B9(mc0172) = True
    End If
    If  fn0380(mc017A, gv14C2(pv0476).M591F) = True Then
        gv14C2(pv0476).M56B9(mc017A) = Int(gv14C2(pv0476).M5584(gv14C2(pv0476).M58BB).M4E82 / 2) + 1
    End If
    If  fn0380(mc0176, gv14C2(pv0476).M591F) = True Then
        gv14C2(pv0476).M56B9(mc0176) = True
    End If
    If  fn0EEF() > False Then sub0BBA gv14C2(m00DC).M59BB
End Sub

Function fn13FF (ByVal pv047C As Integer ' 81, p047E As Integer ' 41) As Integer ' 1
Dim l0480 ' 80
Dim l0482 As Integer ' 81
Dim l0484 As Integer ' 81
    For l0480 = 0 To gv1BEA - 1
        If  gv145A(l0480).M55F6(gv152A(p047E).M5709, 0) > False And gv145A(l0480).M55F6(gv152A(p047E).M5709, 1) >= gv152A(p047E).M4E82 Then
            If  gv14C2(pv047C).M5584(l0480).M4E82 > False Then
                If  Int((gv14C2(pv047C).M5584(l0480).M4E82 / 2) + .5#) > l0482 Then
                    l0482 = Int((gv14C2(pv047C).M5584(l0480).M4E82 / 2) + .5#)
                    l0484 = l0480
                End If
            End If
        End If
    Next l0480
    fn13FF = l0484
End Function

Function fn1417 (ByVal pv0488 As Integer ' 81, p048A As Integer ' 41) As Integer ' 1
Dim l048C ' 80
Dim l048E As Integer ' 81
    For l048C = 0 To gv1BEA - 1
        If  gv145A(l048C).M55F6(gv152A(p048A).M5709, 0) > False And gv145A(l048C).M55F6(gv152A(p048A).M5709, 1) >= gv152A(p048A).M4E82 Then
            If  gv14C2(pv0488).M5584(l048C).M4E82 > False Then
                If  Int((gv14C2(pv0488).M5584(l048C).M4E82 / 2) + .5#) > l048E Then
                    gv1D08 = l048C
                    l048E = Int((gv14C2(pv0488).M5584(l048C).M4E82 / 2) + .5#)
                End If
            End If
        End If
    Next l048C
    fn1417 = l048E
End Function

Function fn142F (ByVal pv0494 As Integer ' 81, p0496 As Integer ' 41) As Integer ' 1
Dim l0498 As Integer ' 81
Dim l049C As Integer ' 81
Dim l049E As Integer ' 81
Dim l04A0 As Single ' 83
Dim l04A2 As Integer ' 81
Dim l04A4 ' 80
' Const mc04A6 = 255 ' &HFF%
    l049E = -1
    If  p0496 > -1 Then
        For l04A4 = 0 To gv1BEA - 1
            If  gv152A(p0496).M4E82 <= gv145A(l04A4).M55F6(gv152A(p0496).M5709, 1) And gv14C2(pv0494).M5584(l04A4).M4E82 > 0 Then
                l049C = gv152A(p0496).M4E82
                l04A2 = Int((gv14C2(pv0494).M5584(l04A4).M4E82 / 2) + .5#)
                If  l04A2 < 1 Then
                    l04A2 = 1
                End If
                If  l04A2 > mc04A6 Then
                    l04A2 = mc04A6
                End If
                l04A0 = gv145A(l04A4).M55F6(gv152A(p0496).M5709, 0)
                If  l04A0 = 0 Then
                    l04A0 = 1
                End If
                l049C = l049C * l04A0
                If  Int(((l049C / l04A2) * gv152A(p0496).M556D) * l04A0 * 1.9#) <= l0498 Or l0498 = False Then
                    l0498 = Int(((l049C / l04A2) * gv152A(p0496).M556D) * l04A0 * 1.9#)
                    If  l049C < l049E Or l049E = -1 Then l049E = l049C
                    If  l0498 < l049E Then
                        l0498 = l049E
                    End If
                End If
            End If
        Next l04A4
        fn142F = l0498
    Else
        gv1E66(pv0494).M56C4 = -1
    End If
End Function

Function fn1448 (p04AA As Integer ' 41) As Integer ' 1
Dim l04AC As Integer ' 81
' Const mc04AE = 9 ' &H9%
    If  (gv152A(p04AA).M5B33 = 0 Or gv152A(p04AA).M5709 = mc04AE) Then
        l04AC = gc1EE2
    Else
        l04AC = gv1EE0
    End If
    Select Case gv152A(p04AA).M56B9
        Case mc0150, mc01A0
            l04AC = gc1EE4
        Case Else
    End Select
    fn1448 = l04AC
End Function

Sub sub145F (p04B0 As Integer ' 41, p04B2 As Integer ' 41, p04B4 As Integer ' 41, p04B6 As Long ' 42)
Dim l04B8 As Integer ' 81
Dim l04BA As Integer ' 81
Dim l04BC ' 80
Dim l04BE As String ' 87
' Const m04C0 = 0 ' &H0%
    If  p04B6 > False Then
        gv14C2(p04B2).M4F2D = gv14C2(p04B2).M4F2D + p04B6
        gv14C2(p04B0).M4F2D = gv14C2(p04B0).M4F2D - p04B6
        sub08A9 True, 50
        sub085B "Give of " + fn036D(CCur(p04B6), m04C0) + " gold to " + Chr$(34) + RTrim(gv14C2(p04B2).M548B) + Chr$(34) + " Completed!"
    End If
    If  p04B4 > False Then
        If  gv14C2(p04B0).M5857(p04B4).M4ED4 > False Then
            If  fn1121(gv14C2(p04B0).M5857(p04B4).M4ED4) = False Then
                sub085B "Cannot give Guild-Issued Items!"
                Exit Sub
            End If
            If  gv14C2(p04B0).M5857(p04B4).M577E > False Then
                sub085B "Cannot give equipped items!"
                Exit Sub
            End If
            For l04BC = 1 To mc02D6 - 1
                If  gv14C2(p04B2).M5857(l04BC).M4ED4 = False Then
                    l04B8 = l04BC
                    Exit For
                End If
            Next l04BC
            If  l04B8 = False Then
                l04BA = MsgBox(Chr(34) + RTrim(gv14C2(p04B2).M548B) + Chr(34) + " has no free slots!", mc02FC, "SORRY!")
                Exit Sub
            End If
            gv14C2(p04B2).M5857(l04B8) = gv14C2(p04B0).M5857(p04B4)
            If  gv14C2(p04B2).M5857(l04B8).M4EEE <> m0386 Then
                If  fn129A(p04B2, gv14C2(p04B2).M5857(l04B8).M4ED4) < gv14C2(p04B2).M5857(l04B8).M4EEE Then
                    gv14C2(p04B2).M5857(l04B8).M4EEE = fn129A(p04B2, gv14C2(p04B2).M5857(l04B8).M4ED4)
                    l04BE = fn12EF(gv14C2(p04B2).M5857(l04B8).M4ED4, gv14C2(p04B2).M5857(l04B8).M4EEE, gv14C2(p04B2).M5857(l04B8).M4EBF, gv14C2(p04B2).M5857(l04B8).M56DB)
                    sub085B Chr(34) + RTrim(gv14C2(p04B2).M548B) + Chr(34) + " identified the given item as: " + l04BE
                    sub0730 p04B2, gv14C2(p04B2).M5857(l04B8).M4ED4, gv14C2(p04B2).M5857(l04B8).M4EEE, -1, False
                End If
            End If
            sub0EDA p04B0, p04B4
            If  p04B2 = gv1A82 Then
                sub0F61 p04B2, m00DC, l04B8
            End If
        Else
            p04B4 = False
        End If
    ElseIf p04B4 < False Then
            p04B4 = Abs(p04B4) - 1
            If  fn1121(gv14C2(p04B0).M5860(p04B4).M4ED4) = False Then
                sub085B "Cannot give Guild-Issued Items!"
                Exit Sub
            End If
            For l04BC = 1 To mc02D6 - 1
                If  gv14C2(p04B2).M5857(l04BC).M4ED4 = False Then
                    l04B8 = l04BC
                    Exit For
                End If
            Next l04BC
            If  l04B8 = False Then
                l04BA = MsgBox(gv14C2(p04B2).M548B + " has no free slots!", mc02FC, "SORRY!")
                Exit Sub
            End If
            gv14C2(p04B2).M5857(l04B8) = gv14C2(p04B0).M5860(p04B4)
            If  gv14C2(p04B2).M5857(l04B8).M4EEE <> m0386 Then
                If  fn129A(p04B2, gv14C2(p04B2).M5857(l04B8).M4ED4) < gv14C2(p04B2).M5857(l04B8).M4EEE Then
                    gv14C2(p04B2).M5857(l04B8).M4EEE = fn129A(p04B2, gv14C2(p04B2).M5857(l04B8).M4ED4)
                    l04BE = fn12EF(gv14C2(p04B2).M5857(l04B8).M4ED4, gv14C2(p04B2).M5857(l04B8).M4EEE, gv14C2(p04B2).M5857(l04B8).M4EBF, gv14C2(p04B2).M5857(l04B8).M56DB)
                    sub085B Chr(34) + RTrim(gv14C2(p04B2).M548B) + Chr(34) + " identified the given item as: " + l04BE
                    sub0730 p04B2, gv14C2(p04B2).M5857(l04B8).M4ED4, gv14C2(p04B2).M5857(l04B8).M4EEE, -1, False
                End If
            End If
            gv14C2(p04B0).M5860(p04B4).M4ED4 = False
            frmCityBank!lblCall = "UPDATE"
            If  p04B2 = gv1A82 Then
                sub0F61 p04B2, m00DC, l04B8
            End If
            p04B4 = 1
    End If
    If  p04B4 <> False Then
        sub085B "Give of Item to " + Chr$(34) + RTrim(gv14C2(p04B2).M548B) + Chr$(34) + " Completed!"
    End If
End Sub

Sub sub13F1 (ByVal pv04C8 As Integer ' 81)
Dim l04CA ' 80
    For l04CA = 0 To mc0060 - 1
        gv14C2(pv04C8).M5548(l04CA) = gv148E(gv14C2(pv04C8).M5821).M5548(l04CA)
    Next l04CA
End Sub

Sub sub0930 (ByVal pv04CC As Integer ' 81)
Dim l04CE ' 80
Dim l04D0 As Integer ' 81
Dim l04D2 As Integer ' 81
Dim l04D4 As String ' 87
' Const mc04DC = 1 ' &H1%
Dim l04E4 As Long ' 82
' Const mc04E6 = 11 ' &HB%
' Const mc04E8 = 84 ' &H54%
    On Error GoTo L3C600
    frmDungeonMain!picMaze2.Cls
    gv1B50 = False
    For l04CE = 0 To mc018A - 1
        gv14C2(pv04CC).M58CB(l04CE).M4ED4 = -1
    Next l04CE
    sub0B82 pv04CC
    gv14C2(pv04CC).M5943 = -1
    sub0F38
    gv1E66(pv04CC).M68C8 = False
    sub048C pv04CC
    l04D0 = fn04ED(gv14C2(pv04CC))
    If  UBound(gv14C2) > False Then
        frmParty!lblCall = "UPDATE"
        Exit Sub
    End If
    sub08A9 False, 50
    frmDungeonMain!timCombat.Enabled = False
    frmDungeonMain!picTrap.Visible = False
    If  gv14C2(pv04CC).M5483 = False Then sub091E pv04CC, mc04DC
    frmDungeonMain!lblDead.Caption = gv0814$(gv14C2(pv04CC).M5483 - 1)
    frmDungeonMain!lblDead.Visible = True
    If  gv14C2(pv04CC).M5470 > False Then
        frmDungeonMain!cmdWait.Caption = "&Wait for Rescue"
    Else
        frmDungeonMain!cmdWait.Caption = "&Visit the Morgue"
    End If
    If  gv14C2(pv04CC).M5483 <> mc01C8 Then
        frmDungeonMain!cmdWait.Visible = True
        frmDungeonMain!lblSquareInfo.Caption = "You are Dead.  You may be resurrected by the morgue or a character, wait for rescue, or run another character."
    Else
        frmDungeonMain!lblSquareInfo.Caption = "You are Dead.  You must be summoned out of the Rock before you can be resurrected."
    End If
    frmDungeonMain!picMonsters.Visible = False
    frmDungeonMain.Refresh
    If  gv14C2(pv04CC).M5483 > False And gv14C2(pv04CC).M58E9 > 0 Then
        If  fn10A3(pv04CC) = True Then
            sub1476 pv04CC
            Exit Sub
        Else
            gv14C2(pv04CC).M58E9 = 0
            gv14C2(pv04CC).M58F9 = " "
            l04D0 = fn04ED(gv14C2(pv04CC))
        End If
    End If
    If  gv14C2(pv04CC).M5470 = 0 Then
        If  gv14C2(pv04CC).M5483 = mc01C8 Then
            MsgBox "You are in the morgue.  However, since you were pulled from Rock, they can't help you.", mc02FC, "Morgue"
            Exit Sub
        End If
        l04E4 = Int(2912.32# * ((gv14C2(pv04CC).M4EB4) / 1.5#))
        Beep
        l04D0 = False
        l04D4 = "A small fee of " + fn036D(CCur(l04E4), m04C0) + " is required for your Resurrection."
        If  fn131D(pv04CC) <= 5 Then
            If  gv14C2(pv04CC).M4F2D + gv14C2(pv04CC).M58AF < l04E4 Then
                l04D0 = True
                l04D4 = l04D4 + Chr(13) + "However, since you are just starting out, the guild offers to pay for your resurrection."
                l04D4 = l04D4 + Chr(13) + "Is this acceptable?"
            End If
        Else
            l04D4 = l04D4 + Chr$(13) + "Do you wish to pay?"
        End If
        l04D4 = l04D4 + Chr$(13) + "Chance of success is" + Str$(fn13D7(-1, -1)) + "%."
        If  MsgBox(l04D4, 36, "Welcome to the morgue!") = 6 Then
            If  l04D0 = False Then
                If  fn114E(l04E4) = False Then
                    l04E4 = MsgBox("Not Enough Gold!", 64, "SORRY!")
                    Exit Sub
                End If
            End If
            If  Int(Rnd * 100) > fn13D7(-1, -1) Then
                l04D0 = MsgBox("Raise Failed!", mc00A4, "Raise Info")
                If  fn11A1(pv04CC) = False Then
                    Exit Sub
                End If
            Else
                sub086D mc04E6
                l04D0 = MsgBox("Success!", mc00A4, "Raise Info")
            End If
            l04D2 = mc02FE
            If  gv14C2(pv04CC).M5483 = mc0472 Then
                gv14C2(pv04CC).M55B5(mc018E) = gv14C2(pv04CC).M55B5(mc018E) - 1
                sub0EBF pv04CC, mc018E, -1
                l04D2 = mc04E8
            End If
            sub0EAE True, pv04CC, l04D2, False
            sub0578 gv14C2(pv04CC).M58BB, Chr$(34) + RTrim(gv14C2(pv04CC).M548B) + Chr$(34) + " was resurrected in the morgue."
            gv14C2(pv04CC).M5483 = 0
            gv14C2(pv04CC).M4EAC = gv14C2(pv04CC).M4EB4
            If  Rnd * 100 < (50 - gv14C2(pv04CC).M55B5(mc018E) * 2) Then
                sub085B "MORGUE: You lost a point of Constitution during the raise."
                gv14C2(pv04CC).M55B5(mc018E) = gv14C2(pv04CC).M55B5(mc018E) - 1
            End If
            If  gv14C2(pv04CC).M55B5(mc018E) < gv148E(gv14C2(pv04CC).M5821).M5530(mc018E) Then
                gv14C2(pv04CC).M55B5(mc018E) = gv148E(gv14C2(pv04CC).M5821).M5530(mc018E)
            End If
            sub1476 pv04CC
            sub08A9 False, 50
            Exit Sub
        End If
    End If
    l04D0 = fn09A4(False, False)
    Exit Sub

L3C600:
    sub04FC "Error '" + Error + "' Occurred in MAINMOD2:mdrcharIsDead"
    Resume L3C66A
L3C66A:
End Sub

Sub sub1476 (ByVal pv04EA As Integer ' 81)
Dim l04EC As Integer ' 81
' Const mc04F2 = 11 ' &HB%
    l04EC = fn04ED(gv14C2(pv04EA))
    sub08A9 False, 50
    If  gv14C2(pv04EA).M5470 > 0 Then
        frmDungeonMain!picMonsters.Visible = True
        frmDungeonMain!lblRoom.Visible = True
        frmDungeonMain!timCombat.Enabled = True
        frmDungeonMain!timAilment.Enabled = True
        frmDungeonMain!lblDead.Visible = False
        frmDungeonMain!cmdWait.Visible = False
        l04EC = fn09A4(False, False)
        sub0835 gv14C2(m00DC).M5470
        sub0980
        frmDungeonMain.SetFocus
    Else
        Unload frmDungeonMain
        frmCityMain.Show
    End If
    sub096E
End Sub

Sub sub148A ()
' Const m0500 = 0 ' &H0%
    Screen.MousePointer = mc04F2
    Load frmCharStat1
    Load frmCharStat3
    Load frmCharStat4
    frmParty.Show
    If  Not gv1A66.M5F1B Then frmAutoMap.Show
    sub0894 gv1A86
    If  gv14C2(gv1A86).M5943 > mc018A - 1 Then
        gv14C2(gv1A86).M5943 = -1
    End If
    sub0F38
    If  gv14C2(gv1A86).M5470 = 0 And gv14C2(gv1A86).M5483 = False Then
        frmCityMain.Show
    Else
        Load frmDungeonMain
        If  gv14C2(gv1A86).M5470 > 0 Or gv14C2(gv1A86).M5483 > 0 Then
            frmDungeonMain.Show
        Else
            Unload frmDungeonMain
            frmCityMain.Show
        End If
    End If
    If  gv14C2(gv1A86).M5483 <> False Then
        sub0930 gv1A86
    End If
    Screen.MousePointer = m0500
End Sub

Function fn14A0 (p0506 As T5810 ' 4A) As Integer ' 1
    If  p0506.M579B >= fn124B(p0506) Then
        If  p0506.M4F2D + p0506.M58AF >= fn125C(p0506) Then
            fn14A0 = True
        End If
    End If
End Function

Sub sub085B (p0508 As String ' 47)
' Const mc050E = 20 ' &H14%
' Const mc0510 = 66 ' &H42%
    If  gv1B52 = False Then
        Exit Sub
    End If
    frmCharStat4!lstMessages.AddItem p0508
    If  frmCharStat4!lstMessages.ListCount > mc050E Then
        frmCharStat4!lstMessages.RemoveItem False
    End If
    frmCharStat4!lstMessages.ListIndex = frmCharStat4!lstMessages.ListCount - 1
    If  gv1A66.M5F11 = False Then sub09DE mc0510
    frmCharStat4!lstMessages.Refresh
End Sub

Sub sub14B4 ()
Dim l0512 As Integer ' 81
Dim l0514 As Integer ' 81
' Const m0516 = 0 ' &H0%
' Const mc0518 = 10 ' &HA%
' Const mc051A = 13 ' &HD%
' Const mc051C = 2 ' &H2%
' Const mc051E = 17 ' &H11%
' Const mc0520 = 4 ' &H4%
' Const mc0524 = 33 ' &H21%
' Const mc052A = 3 ' &H3%
' Const mc052C = 18 ' &H12%
    gv14C2(gv1A86).M5958(m0516).M425F = Screen.TwipsPerPixelX
    gv14C2(gv1A86).M5958(m0516).M4258 = Screen.TwipsPerPixelY
    gv14C2(gv1A86).M5958(m0516).M5801 = 0
    gv14C2(gv1A86).M5958(mc0518).M425F = gv14C2(gv1A86).M5958(m0516).M425F + gv14C2(gv1A86).M5958(m0516).M4216 + Screen.TwipsPerPixelX
    gv14C2(gv1A86).M5958(mc0518).M4258 = Screen.TwipsPerPixelY
    gv14C2(gv1A86).M5958(mc0518).M5801 = 0
    gv14C2(gv1A86).M5958(mc051A).M425F = gv14C2(gv1A86).M5958(m0516).M425F + gv14C2(gv1A86).M5958(m0516).M4216 + Screen.TwipsPerPixelX
    gv14C2(gv1A86).M5958(mc051A).M4258 = gv14C2(gv1A86).M5958(m0516).M4258
    l0512 = gv14C2(gv1A86).M5958(mc051A).M425F + gv14C2(gv1A86).M5958(mc051A).M4216 - gv14C2(gv1A86).M5958(mc051C).M4216
    gv14C2(gv1A86).M5958(mc051C).M425F = l0512
    gv14C2(gv1A86).M5958(mc051C).M4258 = gv14C2(gv1A86).M5958(mc051A).M4258 + gv14C2(gv1A86).M5958(mc051A).M420C + 50 + Screen.TwipsPerPixelY
    gv14C2(gv1A86).M5958(mc051C).M5801 = 0
    gv14C2(gv1A86).M5958(mc051E).M425F = Screen.TwipsPerPixelX
    gv14C2(gv1A86).M5958(mc051E).M4258 = gv14C2(gv1A86).M5958(m0516).M420C + (Screen.TwipsPerPixelY * 2)
    gv14C2(gv1A86).M5958(mc051E).M5801 = False
    l0514 = (extfn01D2(mc0520) + extfn01D2(mc0524)) * (Screen.TwipsPerPixelY * 2.5#)
    gv14C2(gv1A86).M5958(mc052A).M425F = gv1ACC.M6049 - gv14C2(gv1A86).M5958(mc052A).M4216 - (Screen.TwipsPerPixelX * 8)
    gv14C2(gv1A86).M5958(mc052A).M4258 = gv1ACC.M6039 - l0514 - gv14C2(gv1A86).M5958(mc052A).M420C
    gv14C2(gv1A86).M5958(mc052A).M5801 = 0
    gv14C2(gv1A86).M5958(mc052C).M425F = gv14C2(gv1A86).M5958(m0516).M425F + gv14C2(gv1A86).M5958(m0516).M4216 + Screen.TwipsPerPixelX
    gv14C2(gv1A86).M5958(mc052C).M4258 = gv14C2(gv1A86).M5958(mc051A).M4258 + gv14C2(gv1A86).M5958(mc051A).M420C + 50 + Screen.TwipsPerPixelY
    gv14C2(gv1A86).M5958(mc052C).M5801 = 0
End Sub

Sub sub09B8 (p0530 As Control ' 49, p0532 As Integer ' 41, p0534 As Integer ' 41, p0536 As String ' 47, p0538 As Integer ' 41)
Dim l053A As Variant ' 86
Dim l0540 As T3751 ' 8A
' Const m0544 = 0 ' &H0%
' Const mc0546 = 1 ' &H1%
' Const mc0548 = 2 ' &H2%
    p0532 = p0532 - 1
    p0530.FontBold = False
    p0530.FontItalic = False
    l053A = extfn00D1(p0530.hDC, l0540)
    Select Case p0538
        Case m0544
            p0530.FontBold = False
            p0530.FontItalic = False
        Case mc0546
            p0530.FontBold = True
            p0530.FontItalic = False
        Case mc0548
            p0530.FontBold = False
            p0530.FontItalic = True
    End Select
    If  l053A And p0532 <> -1 And p0534 <> -1 Then
        p0530.CurrentX = (l0540.M37C0 * Screen.TwipsPerPixelX) * p0534
        p0530.CurrentY = (l0540.M375F * Screen.TwipsPerPixelY) * p0532
        p0530.Print p0536
    End If
    If  m007C = True Then
        l053A = FreeFile
        If  p0530.FontBold = False Then
            p0536 = Chr$(9) + p0536
        End If
        Open gv19E8 + gc1C00 For Append As #l053A
        Print #l053A, p0536
        Close #l053A
    End If
End Sub

Function fn14CB (p054E ' 40, p0550 ' 40) As Integer ' 1
Dim l0552 As String ' 87
Dim l0554 As Integer ' 81
Dim l0556 As Long ' 82
Dim l0558 As Long ' 82
Dim l055A As Integer ' 81
Dim l055C As Integer ' 81
Dim l055E ' 80
Dim l0564 As T5810 ' 8A
Dim l0566 As Integer ' 81
Dim l0568 As Integer ' 81
Dim l056A As Integer ' 81
' Const mc056C = 27 ' &H1B%
' Const mc0572 = 188 ' &HBC%
' Const mc0574 = 1 ' &H1%
' Const mc0576 = 1 ' &H1%
' Const mc0578 = 190 ' &HBE%
' Const mc057A = 112 ' &H70%
' Const mc057C = 1 ' &H1%
' Const mc0580 = 83 ' &H53%
' Const mc0582 = 4 ' &H4%
Dim l0586 As T576E ' 8A
' Const mc0588 = 10 ' &HA%
' Const mc058A = 65 ' &H41%
' Const mc058C = 4 ' &H4%
' Const mc0590 =-2 ' &HFFFE%
' Const mc0592 = 192 ' &HC0%
' Const mc0594 = 191 ' &HBF%
' Const mc0596 = 77 ' &H4D%
' Const mc0598 = 113 ' &H71%
' Const mc059A = 4 ' &H4%
' Const mc059C = 114 ' &H72%
' Const m059E = 0 ' &H0%
' Const mc05A0 = 115 ' &H73%
' Const mc05A2 = 3 ' &H3%
' Const mc05A4 = 116 ' &H74%
' Const mc05A6 = 2 ' &H2%
' Const mc05A8 = 117 ' &H75%
' Const mc05AA = 6 ' &H6%
' Const mc05AC = 118 ' &H76%
' Const mc05AE = 7 ' &H7%
' Const mc05B0 = 119 ' &H77%
' Const mc05B2 = 120 ' &H78%
' Const mc05B4 = 5 ' &H5%
' Const mc05B6 = 121 ' &H79%
' Const mc05BC = 1 ' &H1%
' Const mc05BE = 90 ' &H5A%
' Const m05C2 = 0 ' &H0%
' Const mc05C4 = 1 ' &H1%
' Const mc05C6 = 67 ' &H43%
' Const mc05C8 = 1 ' &H1%
' Const m05CA = 0 ' &H0%
' Const mc05CC = 69 ' &H45%
Static m05CE As Integer ' 61
' Const mc05D0 = 68 ' &H44%
' Const mc05D8 = 2 ' &H2%
' Const mc05DA = 2 ' &H2%
' Const mc05DC = 73 ' &H49%
' Const mc05DE = 3 ' &H3%
' Const mc05E0 = 85 ' &H55%
' Const mc05E2 = 1 ' &H1%
' Const mc05E4 = 81 ' &H51%
' Const mc05E6 = 80 ' &H50%
' Const mc05EA = 2 ' &H2%
' Const mc05EC = 76 ' &H4C%
' Const mc05EE = 71 ' &H47%
Dim l05F0 As Long ' 82
Dim l05F2 As Integer ' 81
' Const mc05F4 = 78 ' &H4E%
' Const mc05F6 = 82 ' &H52%
' Const mc05FE = 38 ' &H26%
' Const mc0600 = 39 ' &H27%
' Const mc0602 = 37 ' &H25%
' Const mc0604 = 40 ' &H28%
Static m060A As Integer ' 61
' Const mc060C = 1 ' &H1%
' Const mc060E = 2 ' &H2%
' Const mc0610 = 5 ' &H5%
' Const mc0612 = 3 ' &H3%
' Const mc0614 = 1 ' &H1%
' Const mc0618 = 35 ' &H23%
' Const mc0620 = 4 ' &H4%
' Const mc0622 = 2 ' &H2%
Static m0624 As Integer ' 61
' Const mc0628 = 20 ' &H14%
' Const mc062A = 84 ' &H54%
' Const mc062C = 12 ' &HC%
' Const mc0630 = 13 ' &HD%
' Const mc0632 = 21 ' &H15%
' Const mc0634 = 15 ' &HF%
' Const mc0636 = 70 ' &H46%
' Const mc0638 = 32 ' &H20%
Static m063A As Integer ' 61
' Const mc063C = 79 ' &H4F%
' Const mc0642 = 1 ' &H1%
' Const mc0644 = 74 ' &H4A%
Dim l0646 As Integer ' 81
    DoEvents
    On Error GoTo L4154E
    If  gv1B52 = False Then Exit Function
    If  fn1589(p054E, p0550) Then Exit Function
    If  p054E = mc056C Then
        fn14CB = True
        gv1BFC.SetFocus
        Exit Function
    End If
    Select Case p054E
        Case mc0572
            fn14CB = True
            If  gv1D64 = mc0574 Then
                If  p0550 = mc0576 Then
                    If  frmAutoMap!hsbLevel.Value > 1 Then
                        frmAutoMap!hsbLevel.Value = frmAutoMap!hsbLevel.Value - 1
                    End If
                End If
            End If
        Case mc0578
            fn14CB = True
            If  gv1D64 = mc0574 Then
                If  p0550 = mc0576 Then
                    If  frmAutoMap!hsbLevel.Value < frmAutoMap!hsbLevel.Max Then
                        frmAutoMap!hsbLevel.Value = frmAutoMap!hsbLevel.Value + 1
                    End If
                End If
            End If
        Case mc057A
            fn14CB = True
            l0552 = Space$(Len(App.HelpFile))
            l0552 = App.HelpFile
            l0554 = extfn012C(frmMain.hWnd, l0552, mc057C, CLng(Screen.ActiveForm.HelpContextID))
        Case mc0580
            fn14CB = True
            If  p0550 = mc0582 Then
                If  gv1A82 <> gv1A86 Then sub14E0 gv1A86
            Else
                l0552 = fn16A0("Swap Items", "Enter the Item Slots to Swap" + Chr$(13) + "(i.e '12,17')", "", "TELEPORT")
                If  l0552 = "" Or InStr(l0552, ",") = False Or Len(l0552) > 5 Then
                    Exit Function
                End If
                l0568 = CInt(Left(l0552, InStr(l0552, ",") - 1))
                l056A = CInt(Right(l0552, Len(l0552) - InStr(l0552, ",")))
                If  l0568 <= 1 Or l0568 > mc02D6 Then
                    Exit Function
                End If
                If  l056A <= 1 Or l056A > mc02D6 Then
                    Exit Function
                End If
                l0568 = l0568 - 1
                l056A = l056A - 1
                l0586 = gv14C2(gv1A86).M5857(l0568)
                gv14C2(gv1A86).M5857(l0568) = gv14C2(gv1A86).M5857(l056A)
                gv14C2(gv1A86).M5857(l056A) = l0586
                sub0F61 gv1A86, m00DC, l0568
                sub0F61 gv1A86, m00DC, l056A
                sub085B "Item swap completed!"
                For l055E = 0 To mc0588 - 1
                    sub0F4C l055E
                Next l055E
            End If
        Case mc058A
            fn14CB = True
            If  gv14C2(m00DC).M5483 = False Then
                If  UBound(gv14C2) >= mc058C - 1 Then
                    sub085B "Your party is too full!"
                    Exit Function
                End If
                l055C = Val(fn16A0("Ask to Join", "Character's Name?", "", "JOIN"))
                If  l055C = -1 Then
                    Exit Function
                End If
                l0566 = FreeFile
                Open gv19E8 + gc1C74 + gc1C10 For Random As #l0566 Len = mc01EC
                Get #l0566, gv1732(l055C).M5467, l0564
                Close #l0566
                If  RTrim(l0564.M594C) <> "" Then
                    l0552 = fn16A0("Ask to Join", "Enter Password", "", "PASSWORD")
                    If  l0552 = "-1" Then
                        Exit Function
                    End If
                Else
                    l0552 = ""
                End If
                l055A = fn04CD(gv1732(l055C).M548B, l0552, UBound(gv14C2) + 1, False)
                Select Case l055A
                    Case True
                        For l055E = 0 To UBound(gv14C2) - 1
                            If  Abs(gv14C2(l055E).M4EBF - gv14C2(UBound(gv14C2)).M4EBF) > 1 Then
                                sub085B Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is oppositely aligned to one or more members of the party!"
                                sub04DC UBound(gv14C2)
                                Exit Function
                            End If
                        Next l055E
                        sub0848 True
                        If  gv14C2(UBound(gv14C2)).M5483 <> False Then
                            If  fn0EEF() > False Then
                                sub085B "Cannot raise character in Combat!"
                                sub04DC UBound(gv14C2)
                                Exit Function
                            End If
                            If  gv14C2(gv1A86).M5943 >= mc018A Then
                                If  RTrim(gv14C2(UBound(gv14C2)).M548B) = RTrim(gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B) Then
                                    sub085B "Drop the character before you raise them!"
                                    sub04DC UBound(gv14C2)
                                    Exit Function
                                End If
                            End If
                            If  gv14C2(UBound(gv14C2)).M58E9 > False Then
                                If  fn10A3(UBound(gv14C2)) = False Then
                                    sub04DC UBound(gv14C2)
                                    Exit Function
                                End If
                            Else
                                sub085B Chr$(34) + RTrim(gv14C2(UBound(gv14C2)).M548B) + Chr$(34) + " is Dead!  Cast a Resurrect spell on the character to have them re-join!"
                                sub04DC UBound(gv14C2)
                                Exit Function
                            End If
                        End If
                        If  UBound(gv14C2) > m00DC Then
                            If  gv14C2(m00DC).M5470 = False Then
                                gv14C2(UBound(gv14C2)).M4EAC = gv14C2(UBound(gv14C2)).M4EB4
                            End If
                        End If
                        gv14C2(UBound(gv14C2)).M583F = gv14C2(m00DC).M583F
                        gv14C2(UBound(gv14C2)).M5845 = gv14C2(m00DC).M5845
                        gv14C2(UBound(gv14C2)).M5470 = gv14C2(m00DC).M5470
                        If  gv14C2(m00DC).M5470 = 0 Then gv14C2(UBound(gv14C2)).M5830 = fn1338(UBound(gv14C2))
                        sub14F4
                        If  fn0EEF() > False Then sub0BDE UBound(gv14C2)
                    Case False
                        l0554 = MsgBox("An error occurred while trying" + Chr$(13) + "to load " + gv1732(l055C).M548B + "!", 64, "ERROR!")
                        Exit Function
                    Case mc0590
                        l0554 = MsgBox("Incorrect Password!", 64, "SORRY!")
                        Exit Function
                    Case Else
                        l0554 = MsgBox("Unknown error" + Str$(l055A) + " reading character!", 64, "SORRY!")
                        Exit Function
                End Select
            End If
        Case mc0592
        Case mc0594
        Case mc0596
            fn14CB = True
        Case mc0598
            fn14CB = True
            sub150A mc059A, 0, 0, 0, 0, 0
        Case mc059C
            fn14CB = True
            frmCharStat1!tabStatTab.P?C01E = m059E
            frmCharStat1!lblCall = "UPDATE"
        Case mc05A0
            If  p0550 = mc0582 Then
                Exit Function
            Else
                fn14CB = True
                sub150A mc05A2, 0, 0, 0, 0, 0
            End If
        Case mc05A4
            fn14CB = True
            sub151C mc05A6, 0, 0, 0, 0, 0
        Case mc05A8
            fn14CB = True
            If  p0550 = False Then
                sub150A mc05AA, 0, 0, 0, 0, 0
            Else
                sub150A mc05AA, True, 0, 0, 0, 0
                sub150A mc05AA, 0, 0, 0, 0, 0
            End If
        Case mc05AC
            fn14CB = True
            sub150A mc05AE, 0, 0, 0, 0, 0
        Case mc05B0
            fn14CB = True
            frmAutoMap.Show
            frmAutoMap.WindowState = False
        Case mc05B2
            fn14CB = True
            frmCharStat1!tabStatTab.P?C01E = mc05B4
            frmCharStat1!lblCall = "UPDATE"
        Case mc05B6
            frmControlPanel.Show mc05BC
            fn14CB = True
            If  gv14C2(m00DC).M5470 = 0 Then
                frmCityMain.SetFocus
            Else
                frmDungeonMain.SetFocus
            End If
        Case mc05BE
            If  gv19D8 = m05C2 Then
                sub152F mc05C4
            Else
                sub152F m05C2
            End If
        Case mc05C6
            fn14CB = True
            If  gv14C2(gv1A86).M5470 = 0 Or gv14C2(gv1A86).M5483 <> False Then
                Exit Function
            End If
            If  frmCharStat3.WindowState = mc05C8 Then
                frmCharStat3.WindowState = m05CA
            End If
            frmCharStat3!lblCall = "SPELL"
        Case mc05CC
            fn14CB = True
            frmCharStat3!lblCall = Str$(m05CE + 1)
        Case mc05D0
            fn14CB = True
            If  fn0EEF() > False And gv14C2(gv1A86).M56B9(mc0152) = False Then
                If  gv1E7C(gv1A86) > 0 Then
                    frmDungeonMain!lblCharacterHit.Caption = ""
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                gv1E66(gv1A86).M4E97 = mc05D8
                gv1E66(gv1A86).M56C4 = -1
                gv1E66(gv1A86).M5766 = -1
                sub0BCD
            Else
                frmCharStat3!lblCall = Str$(mc05DA + 1)
            End If
        Case mc05DC
            fn14CB = True
            If  gv14C2(gv1A86).M5470 > 0 Then
                frmCharStat3!lblCall = Str$(mc05DE + 1)
            End If
        Case mc05E0
            fn14CB = True
            If  gv14C2(gv1A86).M5470 > 0 Then
                frmCharStat3!lblCall = Str$(mc05E2 + 1)
            End If
        Case mc05E4
            fn14CB = True
            If  (fn0EEF() = False And gv14C2(m00DC).M5470 > False) Or gv14C2(0).M5470 = False Or gv14C2(gv1A86).M5483 > 0 Then
                l0552 = "Exit to Main Menu?"
                If  MsgBox(l0552, 36, "EXIT") = mc00BE Then
                    gv1ACC.M6023 = True
                    gv1ACC.M6014 = True
                    Exit Function
                End If
            Else
                Beep
                sub085B "Cannot exit while monsters are in the area!"
                Exit Function
            End If
        Case mc05E6
            fn14CB = True
            Select Case p0550
                Case mc0582
                    If  fn0EEF() > 0 And gv1E38(0).M4ECC = mc0220 Then
                        sub085B "Cannot pool gold while in combat!"
                    Else
                        If  UBound(gv14C2) > m00DC Then
                            For l055E = False To UBound(gv14C2)
                                If  l055E = gv1A84 Then
                                Else
                                    gv14C2(gv1A86).M4F2D = gv14C2(gv1A86).M4F2D + gv14C2(l055E).M4F2D
                                    gv14C2(l055E).M4F2D = False
                                End If
                            Next l055E
                            sub08A9 True, 10
                            sub085B "Pool of party's on-hand gold to " + Chr(34) + RTrim(gv14C2(gv1A86).M548B) + Chr(34) + " completed!"
                        Else
                            sub085B "Nobody else in party to Pool to!"
                        End If
                    End If
                Case Else
                    If  gv14C2(gv1A86).M5483 = False And gv14C2(gv1A86).M56B9(mc0152) = 0 Then
                        l055C = Val(fn16A0("Pickup Character", "Character's Name?", "", "PICKUP"))
                        If  l055C = -1 Then
                            Exit Function
                        End If
                        l0566 = FreeFile
                        Open gv19E8 + gc1C74 + gc1C10 For Random As #l0566 Len = mc01EC
                        Get #l0566, gv1732(l055C).M5467, l0564
                        Close #l0566
                        If  l0564.M5914(mc05EA) = True Then
                            sub085B Chr$(34) + l0564.M548B + Chr$(34) + " is Hidden!"
                            Exit Function
                        End If
                        If  gv14C2(gv1A86).M5943 <> -1 Then
                            If  gv14C2(gv1A86).M5943 < mc018A Then
                                gv14C2(gv1A86).M58CB(gv14C2(gv1A86).M5943).M4ED4 = -1
                                sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + fn1235(gv1A86, gv14C2(gv1A86).M5943) + "."
                                sub0B82 gv1A86
                            Else
                                sub0A7C gv14C2(gv1A86).M5943 - mc018A, 0, 0
                                sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34) + "."
                            End If
                            gv14C2(gv1A86).M5943 = -1
                            sub0F38
                        End If
                        gv14C2(gv1A86).M5943 = l055C + mc018A
                        sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is now carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34) + "."
                        sub0F38
                    End If
            End Select
        Case mc05EC
            fn14CB = True
            If  p0550 = mc0582 Then
                sub1547 gv1A86
            Else
                If  gv14C2(gv1A86).M56B9(mc0152) = 0 Then
                    If  gv14C2(gv1A86).M5943 <> -1 Then
                        If  gv14C2(gv1A86).M5943 < mc018A Then
                            gv14C2(gv1A86).M58CB(gv14C2(gv1A86).M5943).M4ED4 = -1
                            sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + fn1235(gv1A86, gv14C2(gv1A86).M5943) + "."
                            sub0B82 gv1A86
                        Else
                            sub0A7C gv14C2(gv1A86).M5943 - mc018A, 0, 0
                            sub085B Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " is no longer carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34) + "."
                        End If
                        gv14C2(gv1A86).M5943 = -1
                        sub0F38
                    End If
                End If
            End If
        Case mc05EE
            fn14CB = True
            If  gv14C2(gv1A86).M56B9(mc0152) = False Then
                If  UBound(gv14C2) = False Then
                    sub085B "Nobody in party to give to!"
                    Exit Function
                End If
                l055C = Val(fn16A0("Give to Character", "Character's Name?", "", "GIVE"))
                If  l055C = -1 Then
                    Exit Function
                End If
                l05F0 = CLng(fn16A0("Give to " + Chr$(34) + RTrim(gv14C2(l055C).M548B) + Chr$(34), "How much Gold?", "", "GIVEGOLD"))
                If  l05F0 = -1 Then
                    Exit Function
                End If
                l05F2 = Val(fn16A0("Give to " + Chr$(34) + RTrim(gv14C2(l055C).M548B) + Chr$(34), "Which Item #?", "", "GIVEITEM"))
                If  l05F2 = -1 Then
                    Exit Function
                End If
                If  l05F2 > 1 Then
                    l05F2 = l05F2 - 1
                Else
                    l05F2 = False
                End If
                sub145F gv1A86, l055C, l05F2, l05F0
            End If
        Case mc05F4
            fn14CB = True
            If  UBound(gv14C2) > False Then
                l055E = gv1A86 + 1
                If  l055E > UBound(gv14C2) Then
                    l055E = False
                End If
                frmParty!lblCall = CStr(l055E)
            End If
        Case mc05F6
            If  p0550 = mc0582 Then
                If  fn0EEF() = False Or gv1E38(0).M4ECC = m0294 Then
                    If  fn03BD(frmAutoMap) Then
                        sub085B "Printing Current Automap Level..."
                        frmPrint.Show mc05BC
                        Unload frmPrint
                    Else
                        sub085B "Must have Automap open to print!"
                    End If
                Else
                    sub085B "Cannot print the Automap while in Combat!"
                End If
            End If
        Case 48 To 57
        Case Else
    End Select
    If  gv14C2(gv1A86).M5470 > 0 And gv14C2(gv1A86).M5483 = False Then
        Select Case p054E
            Case mc05FE, mc0600, mc0602, mc0604
                fn14CB = True
                If  gv1E7C(gv1A86) > 0 Then
                    frmDungeonMain!lblCharacterHit.Caption = ""
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                If  gv14C2(gv1A86).M56B9(mc0152) = False And gv1EB2 = False Then
                    If  gv1E38(0).M4ED4 > -1 Then
                        sub0BCD
                    End If
                    If  p054E = mc05FE Then
                        l0558 = fn0B1B(gv14C2(m00DC))
                        If  fn0380(m060A, l0558) = False Then
                            If  gv14C2(gv1A86).M5899 = mc01B6 Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845)
                                    If  fn0380(mc060E, l0558) Then
                                        l0556 = fn0418(mc0610, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0612, l0556, True)
                                    End If
                                    l0556 = fn0418(mc0614, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D54% = gv14C2(m00DC).M5845
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + 1
                                If  gv14C2(m00DC).M5845 > gv1864.M420C Then
                                    gv14C2(m00DC).M5845 = gv1864.M420C
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv14C2(m00DC).M5899 = mc01B8 Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845)
                                    If  gv1B5C(2) = mc0620 + 10 Then
                                        l0556 = fn0418(mc0620, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0622, l0556, True)
                                    End If
                                    l0556 = fn0418(m0624, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D52% = gv14C2(m00DC).M583F
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + 1
                                If  gv14C2(m00DC).M583F > gv1864.M4216 Then
                                    gv14C2(m00DC).M583F = gv1864.M4216
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv14C2(m00DC).M5899 = mc01BA Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845 - 1)
                                    If  gv1B5C(2) = mc0610 + 10 Then
                                        l0556 = fn0418(mc0610, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0612, l0556, True)
                                    End If
                                    l0556 = fn0418(mc0614, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845 - 1, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D54% = gv14C2(m00DC).M5845
                                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - 1
                                If  gv14C2(m00DC).M5845 < 1 Then
                                    gv14C2(m00DC).M5845 = 1
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv14C2(m00DC).M5899 = mc01BC Then
                                If  fn0380(mc060C, l0558) Or fn0380(mc060E, l0558) Then
                                    l0556 = fn0A34(gv14C2(m00DC).M583F - 1, gv14C2(m00DC).M5845)
                                    If  gv1B5C(2) = mc0620 + 10 Then
                                        l0556 = fn0418(mc0620, l0556, True)
                                    Else
                                        l0556 = fn0418(mc0622, l0556, True)
                                    End If
                                    l0556 = fn0418(m0624, l0556, False)
                                    If  fn0ABD(gv14C2(m00DC).M583F - 1, gv14C2(m00DC).M5845, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                End If
                                gv1D52% = gv14C2(m00DC).M583F
                                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - 1
                                If  gv14C2(m00DC).M583F < 1 Then
                                    gv14C2(m00DC).M583F = 1
                                    sub09DE mc0618
                                End If
                            End If
                            If  gv1D52% <> gv14C2(m00DC).M583F Or gv1D54% <> gv14C2(m00DC).M5845 Then
                                sub0835 gv14C2(m00DC).M5470
                            End If
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "DRAW"
                            End If
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            sub0980
                        Else
                            If  fn0380(mc0628, fn0AD3(fn0AE8(gv14C2(m00DC)))) = True Then
                                Select Case gv14C2(m00DC).M5899
                                    Case mc01B6
                                        l0568 = gv14C2(m00DC).M583F
                                        l056A = gv14C2(m00DC).M5845
                                    Case mc01B8
                                        l0568 = gv14C2(m00DC).M583F
                                        l056A = gv14C2(m00DC).M5845
                                    Case mc01BA
                                        l0568 = gv14C2(m00DC).M583F
                                        l056A = gv14C2(m00DC).M5845 - 1
                                    Case mc01BC
                                        l0568 = gv14C2(m00DC).M583F - 1
                                        l056A = gv14C2(m00DC).M5845
                                    Case Else
                                End Select
                                If  l0568 > False And l056A > False And l0568 <= gv1864.M4216 And l056A <= gv1864.M420C Then
                                    Select Case gv14C2(m00DC).M5899
                                        Case mc01B6, mc01BA
                                            l0556 = fn0A34(l0568, l056A)
                                            l0556 = fn0418(mc0614, l0556, True)
                                        Case Else
                                            l0556 = fn0A34(l0568, l056A)
                                            l0556 = fn0418(m0624, l0556, True)
                                    End Select
                                    If  fn0ABD(l0568, l056A, l0556) = False Then
                                        MsgBox "mdrcharProcessKey:Error updating AutoMap!", mc00A4, "Error!"
                                    End If
                                    If  gv1D64 <> m01AA Then
                                        frmAutoMap!lblCall = "DRAW"
                                    End If
                                End If
                            End If
                            sub09DE mc0618
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                    If  p054E = mc0600 Then
                        gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 + 1
                        If  gv14C2(m00DC).M5899 > mc01BC Then
                            gv14C2(m00DC).M5899 = mc01B6
                        End If
                        sub0980
                        If  p0550 = mc0576 Then
                            l0554 = fn14CB(mc05FE, False)
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                    If  p054E = mc0602 Then
                        gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 - 1
                        If  gv14C2(m00DC).M5899 < mc01B6 Then
                            gv14C2(m00DC).M5899 = mc01BC
                        End If
                        sub0980
                        If  p0550 = mc0576 Then
                            l0554 = fn14CB(mc05FE, False)
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                    If  p054E = mc0604 Then
                        gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 - 2
                        If  gv14C2(m00DC).M5899 < mc01B6 Then
                            gv14C2(m00DC).M5899 = gv14C2(m00DC).M5899 + mc01BC
                        End If
                        sub0980
                        If  p0550 = mc0576 Then
                            l0554 = fn14CB(mc05FE, False)
                        Else
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                        End If
                    End If
                End If
            Case mc062A
                fn14CB = True
                If  gv1E7C(gv1A86) > 0 Then
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                gv1D6C = gv14C2(m00DC).M5470
                If  gv14C2(gv1A86).M5483 = False And gv14C2(gv1A86).M56B9(mc0152) = False Then
                    If  fn0380(mc062C, fn0AD3(fn0AE8(gv14C2(gv1A86)))) <> False Then
                        If  gv14C2(m00DC).M5470 = 1 Then
                            gv14C2(m00DC).M5470 = 0
                            Unload frmDungeonMain
                            frmCityMain.Show
                            Exit Function
                        Else
                            gv14C2(m00DC).M5470 = gv14C2(m00DC).M5470 - 1
                            If  fn0A0B(m00DC) = False Then
                                l0554 = MsgBox("Failure opening " + gv19E8 + gc1C34 + "!", 64, "ERROR")
                                Unload frmDungeonMain
                                gv14C2(m00DC).M5470 = 0
                                frmCityMain.Show
                            End If
                            sub0835 gv1D6C
                            sub0980
                            If  gv1D64 <> m01AA Then
                                frmAutoMap!lblCall = "UPDATE"
                            End If
                            Exit Function
                        End If
                    End If
                End If
                If  fn0380(mc0630, fn0AD3(fn0AE8(gv14C2(gv1A86)))) Then
                    If  gv14C2(m00DC).M5470 = mc01F8 Then
                        Exit Function
                    Else
                        gv14C2(m00DC).M5470 = gv14C2(m00DC).M5470 + 1
                        If  fn0A0B(m00DC) = False Then
                            l0554 = MsgBox("Failure opening " + gv19E8 + gc1C34 + "!", 64, "ERROR")
                            Unload frmDungeonMain
                            gv14C2(m00DC).M5470 = 0
                            frmCityMain.Show
                        End If
                        sub0835 gv1D6C
                        sub0980
                        If  gv1D64 <> m01AA Then
                            frmAutoMap!lblCall = "UPDATE"
                        End If
                        Exit Function
                    End If
                End If
                If  fn0380(mc0632, fn0AD3(fn0AE8(gv14C2(gv1A86)))) Then
                    If  m00B6 = True And gv14C2(m00DC).M5470 = mc0634 Then
                        sub085B "You cannot take this Chute in the Limited Version."
                    Else
                        For l055E = m00DC To UBound(gv14C2)
                            sub08F5 l055E
                        Next l055E
                        l0554 = fn0A0B(m00DC)
                        sub0835 gv14C2(m00DC).M5470
                        sub0980
                        If  gv1D64 <> m01AA Then
                            frmAutoMap!lblCall = "UPDATE"
                        End If
                    End If
                End If
            Case mc0636
                fn14CB = True
                l0554 = False
                If  gv1E7C(gv1A86) > 0 Then
                    frmDungeonMain!lblCharacterHit.Caption = ""
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                If  gv1E38(0).M4EF9 > 0 Then
                    frmDungeonMain!lblMonsterHit = ""
                    gv1E38(0).M4EF9 = 0
                End If
                If  gv14C2(gv1A86).M5483 = False Then
                    If  gv1E38(0).M4ED4 > -1 Then
                        If  gv1E38(0).M4ECC = m0294 Then
                            gv1E38(0).M4ECC = mc0220
                            sub0BDE -1
                            l0554 = True
                        End If
                        gv1E66(gv1A86).M4E97 = mc0122
                        gv1E66(gv1A86).M56C4 = -1
                        gv1E66(gv1A86).M5766 = -1
                        sub0BBA 0
                        sub0BCD
                        If  l0554 = True Then
                            sub155A gv14C2(m00DC).M59BB
                        End If
                    End If
                End If
            Case mc0638
                fn14CB = True
                If  gv1E7C(gv1A86) > 0 Then
                    gv1E7C(gv1A86) = 0
                    sub0FE1
                End If
                If  gv14C2(gv1A86).M5483 = False Then
                    If  gv1E38(0).M4ED4 > -1 Then
                        gv1E66(gv1A86).M4E97 = m063A
                        gv1E66(gv1A86).M56C4 = -1
                        gv1E66(gv1A86).M5766 = -1
                        sub0BBA 0
                        sub0BCD
                    End If
                End If
            Case mc063C
                fn14CB = True
                If  p0550 = mc0582 Then
                    If  fn0EEF() = False Then
                        frmPartyOptions.Show mc05BC
                    Else
                        sub085B "Cannot set default options while monsters are in the area!"
                    End If
                Else
                    If  gv14C2(gv1A86).M5483 = False And gv14C2(gv1A86).M56B9(mc0152) = 0 And gv1E50.M4F3D <= m0184 Then
                        If  fn0EEF() <= False And gv1E50.M4F1B > False And gv1E50.M4F2D > 0 And gv1E50.M4F3D <= m0184 Then
                            sub0F01 gv1A86
                        Else
                            If  gv1E38(0).M4ED4 <> -1 And gv1E50.M4F1B > False Then
                                gv1E38(0).M4ECC = mc0220
                                sub0BDE -1
                                gv1E66(gv1A86).M4E97 = False
                                gv1E66(gv1A86).M56C4 = -1
                                gv1E66(gv1A86).M5766 = -1
                                sub0BBA gv14C2(gv1A86).M59BB
                                sub0BCD
                                If  frmDungeonMain!lblTrap.Visible = True Then
                                    If  gv1E7C(gv1A86) > 0 Then
                                        gv1E7C(gv1A86) = 0
                                    Else
                                        gv1E7C(gv1A86) = CInt(10 - (Log(fn11D4(gv1A86, m0350, False) - 10) * 2))
                                        If  gv1E7C(gv1A86) < 2 Then
                                            gv1E7C(gv1A86) = 2
                                        End If
                                    End If
                                    sub0FE1
                                End If
                            End If
                        End If
                        If  gv14C2(gv1A86).M4EAC < 1 Then
                            gv14C2(gv1A86).M5906(mc0642) = gv14C2(gv1A86).M5906(mc0642) + 1
                            sub0930 l055C
                        End If
                    End If
                End If
            Case mc0644
                fn14CB = True
                If  gv1E38(0).M4EF9 > 0 And gv1E38(0).M4EDC > 0 Then
                    l0646 = gv1E38(0).M4EF9
                    frmDungeonMain!lblMonsterHit.Visible = False
                    If  fn10D1(gv1A86) > 0 Then
                        gv1E38(0).M4EF9 = 0
                        For l055E = 0 To l0646 - 1
                            If  fn10D1(gv1A86) > 0 And gv1E38(0).M4EDC > 0 Then
                                l0554 = fn10BA(gv1A86, gv1E38(0), gv1E38(0).M4EAC, -10)
                                gv1E38(0).M4EDC = gv1E38(0).M4EDC - 1
                            Else
                                Exit For
                            End If
                        Next l055E
                        If  gv1E38(0).M4EDC > 0 Then
                            sub0D08 gv1A86
                        Else
                            If  fn0DCD(-1) = -1 Then
                                sub0C53
                            Else
                                gv1E66(gv1A86).M547A = fn0DCD(-1)
                                sub0BCD
                            End If
                        End If
                    Else
                        gv1E38(0).M4EF9 = l0646
                        sub085B "Join - No room for more Companions!"
                    End If
                    sub0BBA gv14C2(gv1A86).M59BB
                    sub0BCD
                End If
            Case 48 To 57
                fn14CB = True
                Select Case p0550
                    Case False
                        If  p054E > 48 And p054E < 53 Then
                            If  gv1E38(p054E - 49).M4EDC > 0 Then
                                gv1E66(gv1A86).M547A = p054E - 49
                                sub0BCD
                            End If
                        End If
                    Case mc0576
                        If  p054E = 48 Then
                            p054E = 58
                        End If
                        If  gv14C2(gv1A86).M59B0(p054E - 49) > -1 Then
                            If  gv1E7C(gv1A86) > 0 Then
                                frmDungeonMain!lblCharacterHit.Caption = ""
                                gv1E7C(gv1A86) = 0
                                sub0FE1
                            End If
                            If  gv14C2(gv1A86).M59B0(p054E - 49) < mc02D6 Then
                                sub1577 gv1A86, gv14C2(gv1A86).M59B0(p054E - 49)
                            Else
                                l0554 = gv14C2(gv1A86).M59B0(p054E - 49) - mc02D6
                                If  fn0EEF() > False And (gv1E38(0).M4ECC = mc0220 Or (gv1E38(0).M4ECC = m0294 And (fn1448(l0554) = gv1EE0 Or fn1448(l0554) = gc1EE4))) Then
                                    gv1E66(gv1A86).M56C4 = l0554
                                    gv1E66(gv1A86).M5766 = -1
                                    l0554 = fn10E5(gv1A86, gv1E66(gv1A86).M56C4, False, False)
                                    sub0BCD
                                    frmDungeonMain.SetFocus
                                    Exit Function
                                End If
                                l0554 = fn1173(gv1A86, gv14C2(gv1A86).M59B0(p054E - 49) - mc02D6, 0, -1)
                            End If
                        End If
                    Case Else
                End Select
            Case Else
        End Select
    End If
    Exit Function

L4154E:
    sub04FC "Error '" + Error + "' Occurred in MAINMOD2:mdrcharProcessKey.  Please Report."
    Resume L415CC
L415CC:
End Function

Function fn1589 (p064A As Integer ' 41, p064C As Integer ' 41) As Integer ' 1
Dim l064E As Integer ' 81
' Const mc0650 = 2 ' &H2%
' Const mc0652 = 4 ' &H4%
' Const mc0654 = 66 ' &H42%
' Const mc0656 = 83 ' &H53%
' Const mc0658 = 3 ' &H3%
Static m065A As Integer ' 61
' Const mc065C = 1 ' &H1%
' Const mc065E = 2 ' &H2%
' Const mc0660 = 9 ' &H9%
    On Error GoTo L418F2
    Select Case p064C
        Case mc0650
            Select Case p064A
                Case mc05EC
                    frmCharStat1!tabStatTab.P?C01E = mc0652
                    l064E = True
                Case mc0654
                    frmCharStat1!tabStatTab.P?C01E = mc05B4
                    l064E = True
                Case mc0596
                    frmCharStat1!tabStatTab.P?C01E = mc014C
                    l064E = True
                Case mc0656
                    frmCharStat1!tabStatTab.P?C01E = m059E
                    l064E = True
                Case mc05F6
                    frmCharStat1!tabStatTab.P?C01E = mc019C
                    l064E = True
                Case mc05C6
                    frmCharStat1!tabStatTab.P?C01E = mc0322
                    l064E = True
                Case mc05EE
                    frmCharStat1!tabStatTab.P?C01E = mc0658
                    l064E = True
                Case mc05DC
                    frmCharStat3!tabItemTab.P?C01E = m065A
                    l064E = True
                Case mc05E6
                    frmCharStat3!tabItemTab.P?C01E = mc065C
                    l064E = True
                Case mc063C
                    frmCharStat3!tabItemTab.P?C01E = mc065E
                    l064E = True
                Case Else
            End Select
        Case mc0582
            Select Case p064A
                Case 48 To 57
                    If  UBound(gv14C2) > False Then
                        If  (p064A - 49) <= (UBound(gv14C2)) Then
                            frmParty!lblCall = CStr(p064A - 49)
                            l064E = True
                        End If
                    End If
                Case Else
            End Select
        Case Else
    End Select
    If  p064C = mc0582 And p064A = mc0660 Then
        l064E = True
    End If
    If  p064C = mc0650 And p064A = mc056C Then
        l064E = True
    End If
    fn1589 = l064E
    Exit Function

L418F2:
    sub04FC "Error '" + Error + "' Occurred in MAINMOD2:mdrcharProcessTabKey.  Please Report."
    Resume L41974
L41974:
End Function

Sub sub15A1 (ByVal pv0662 As Integer ' 81)
Dim l0664 ' 80
Dim l0666 As Integer ' 81
    For l0664 = 1 To mc02D6 - 1
        If  gv14C2(pv0662).M5857(l0664).M4ED4 > 0 Then
            If  gv1426(gv14C2(pv0662).M5857(l0664).M4ED4).M56B9 >= 500 And gv1426(gv14C2(pv0662).M5857(l0664).M4ED4).M56B9 <= 500 + (gv1BEA - 1) Then
                If  gv14C2(pv0662).M5857(l0664).M56DB < gv1426(gv14C2(pv0662).M5857(l0664).M4ED4).M56DB Then
                    l0666 = True
                    gv14C2(pv0662).M5857(l0664).M56DB = gv1426(gv14C2(pv0662).M5857(l0664).M4ED4).M56DB
                    sub0F61 pv0662, m00DC, l0664
                End If
            End If
        End If
    Next l0664
    If  l0666 = True Then
        If  UBound(gv14C2) = m00DC Then
            sub085B "Your Guild Item(s) were recharged when you entered the city."
        Else
            sub085B Chr(34) + RTrim(gv14C2(pv0662).M548B) + Chr(34) + " had their Guild Item(s) recharged when they entered the city."
        End If
    End If
End Sub

Sub sub0730 (ByVal pv0668 As Integer ' 81, ByVal pv066A As Integer ' 81, ByVal pv066C As Integer ' 81, p066E As Integer ' 41, p0670 As Integer ' 41)
Dim l0674 As T5BF1 ' 8A
Dim l067A As Integer ' 81
Dim l067C As Integer ' 81
' Const mc067E = 1 ' &H1%
' Const mc0680 = 4 ' &H4%
' Const mc0682 = 3 ' &H3%
    If  pv066A < False Then
        pv066A = Abs(pv066A)
        l067C = True
    End If
    sub0F9A pv066A, mc067E, l0674
    If  pv066C = m0386 Then
        l067A = mc0680
    ElseIf pv066C = mc038C Then
        l067A = mc0682
    Else
        l067A = False
    End If
    If  l0674.M4EEE = False And l067A <> False Then
        sub0FB0 mc067E, (fn1BD5(mc067E) + 1)
    End If
    If  l0674.M4EEE = False Then
        If  l067C = False Then
            l0674.M5C09 = gv14C2(pv0668).M548B
        Else
            l0674.M5C09 = ""
        End If
    End If
    If  l0674.M4EEE < l067A Then
        l0674.M4EEE = l067A
    End If
    If  p066E >= False Then
        l0674.M5C14 = gv14F6(p066E).M5467
        l0674.M5C21 = CLng(Date)
    Else
        If  p066E = -2 Then
            l0674.M5C14 = -2
            l0674.M5C21 = CLng(Date)
        End If
    End If
    If  p0670 Then
        If  l067C = False Then
            If  gv14C2(m00DC).M59F4(mc01D0) = False And gv14C2(m00DC).M59F4(m01D2) = False Then
                l0674.M5C2F = CStr(gv14C2(m00DC).M5470)
            Else
                l0674.M5C2F = "?"
            End If
        Else
            l0674.M5C2F = "?"
        End If
        l0674.M5C00 = l0674.M5C00 + 1
    End If
    l0674.M5467 = gv1426(pv066A).M5467
    sub0FCB pv066A, mc067E, l0674
End Sub

Sub sub0EDA (ByVal pv0686 As Integer ' 81, p0688 As Integer ' 41)
Dim l068C ' 80
    On Error GoTo L4200E
    If  gv14C2(pv0686).M5857(p0688).M577E = mc02D8 Then
        If  gv14C2(pv0686).M5857(p0688).M572A <> False Then
            sub0F74 pv0686, -p0688
        Else
            sub0F74 pv0686, p0688
        End If
    End If
    gv14C2(pv0686).M5857(p0688).M577E = m031C
    gv14C2(pv0686).M5857(p0688).M572A = False
    gv14C2(pv0686).M5857(p0688).M4ED4 = 0
    gv14C2(pv0686).M5857(p0688).M56DB = 0
    gv14C2(pv0686).M5857(p0688).M5467 = -1
    sub0F61 pv0686, m00DC, p0688
    If  pv0686 = gv1A82 Then
        For l068C = 0 To mc0588 - 1
            sub0F4C l068C
        Next l068C
    End If
    Exit Sub

L4200E:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharRemoveItem giCurrentChar,."
    Resume L4208C
L4208C:
End Sub

Sub sub048C (ByVal pv068E As Integer ' 81)
Dim l0690 ' 80
    If  gv14C2(pv068E).M56B9(mc0152) <> False Then sub0D1D pv068E, 1, 0
    gv14C2(pv068E).M56B9(m0162) = 0
    gv14C2(pv068E).M56B9(mc0164) = 0
    gv14C2(pv068E).M56B9(mc0152) = 0
    gv14C2(pv068E).M56B9(mc016C) = 0
    gv14C2(pv068E).M56B9(mc0172) = 0
    gv14C2(pv068E).M56B9(mc0176) = 0
    gv14C2(pv068E).M56B9(mc017A) = 0
    For l0690 = 0 To mc0060 - 1
        gv14C2(pv068E).M592F(l0690) = 0
    Next l0690
    sub0894 pv068E
End Sub

Sub sub15BE (ByVal pv0692 As Integer ' 81, ByVal pv0694 As Integer ' 81, p0698 As Form ' 49, p069A As Integer ' 41)
Dim l069C ' 80
Dim l069E As Integer ' 81
Dim l06A0 As Integer ' 81
' Const mc06A2 = 1 ' &H1%
' Const mc06A4 = 1 ' &H1%
    On Error GoTo L42316
    If  pv0692 = -1 Then
        l069E = m00DC
        l06A0 = UBound(gv14C2)
    Else
        l069E = pv0692
        l06A0 = pv0692
    End If
    For l069C = l069E To l06A0
        If  p0698.WindowState <> mc06A2 Then
            gv14C2(l069C).M5958(pv0694).M425F = p0698.Left
            gv14C2(l069C).M5958(pv0694).M4258 = p0698.Top
            gv14C2(l069C).M5958(pv0694).M4216 = p0698.Width
            gv14C2(l069C).M5958(pv0694).M420C = p0698.Height
        End If
        If  p069A Then gv14C2(l069C).M5958(pv0694).M5801 = p0698.WindowState
    Next l069C

L42308:
    Exit Sub

L42316:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharSaveWindowPos."
    Resume L42308
End Sub

Sub sub15D6 ()
    If  fn03BD(frmCharStat1) Then
        If  frmCharStat1.WindowState <> mc06A2 Then
            gv14C2(gv1A82).M5958(m0516).M425F = frmCharStat1.Left
            gv14C2(gv1A82).M5958(m0516).M4258 = frmCharStat1.Top
            gv14C2(gv1A82).M5958(m0516).M4216 = frmCharStat1.Width
            gv14C2(gv1A82).M5958(m0516).M420C = frmCharStat1.Height
        End If
        gv14C2(gv1A82).M5958(m0516).M5801 = frmCharStat1.WindowState
    End If
    If  fn03BD(frmCharStat3) Then
        If  frmCharStat3.WindowState <> mc06A2 Then
            gv14C2(gv1A82).M5958(mc051C).M425F = frmCharStat3.Left
            gv14C2(gv1A82).M5958(mc051C).M4258 = frmCharStat3.Top
            gv14C2(gv1A82).M5958(mc051C).M4216 = frmCharStat3.Width
            gv14C2(gv1A82).M5958(mc051C).M420C = frmCharStat3.Height
        End If
        gv14C2(gv1A82).M5958(mc06A4).M5801 = frmCharStat3.WindowState
    End If
    If  fn03BD(frmCharStat4) Then
        If  frmCharStat4.WindowState <> mc06A2 Then
            gv14C2(gv1A82).M5958(mc052A).M425F = frmCharStat4.Left
            gv14C2(gv1A82).M5958(mc052A).M4258 = frmCharStat4.Top
            gv14C2(gv1A82).M5958(mc052A).M4216 = frmCharStat4.Width
            gv14C2(gv1A82).M5958(mc052A).M420C = frmCharStat4.Height
        End If
        gv14C2(gv1A82).M5958(mc052A).M5801 = frmCharStat4.WindowState
    End If
    If  fn03BD(frmAutoMap) Then
        If  frmAutoMap.WindowState <> mc06A2 Then
            gv14C2(gv1A82).M5958(mc052C).M425F = frmAutoMap.Left
            gv14C2(gv1A82).M5958(mc052C).M4258 = frmAutoMap.Top
            gv14C2(gv1A82).M5958(mc052C).M4216 = frmAutoMap.Width
            gv14C2(gv1A82).M5958(mc052C).M420C = frmAutoMap.Height
        End If
        gv14C2(gv1A82).M5958(mc052C).M5801 = frmAutoMap.WindowState
    End If
    If  fn03BD(frmParty) Then
        If  frmParty.WindowState <> mc06A2 Then
            gv14C2(gv1A82).M5958(mc051E).M425F = frmParty.Left
            gv14C2(gv1A82).M5958(mc051E).M4258 = frmParty.Top
            gv14C2(gv1A82).M5958(mc051E).M4216 = frmParty.Width
            gv14C2(gv1A82).M5958(mc051E).M420C = frmParty.Height
        End If
        gv14C2(gv1A82).M5958(mc051E).M5801 = frmParty.WindowState
    End If
End Sub

Sub sub047C (ByVal pv06A6 As Integer ' 81, p06A8 As Integer ' 41)
Dim l06AA As Integer ' 81
Static m06AC As Integer ' 61
    Select Case p06A8
        Case m02F6
            If  gv1EDE = True Then
                sub04FC "Error 'Attempted re-setting of AD while processing' occurred in MAINMOD2:mdrcharSetAD"
                Exit Sub
            End If
            gv1EDE = True
            If  gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) > 12 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) - 12)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (2 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) > 14 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) - 14)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) > 14 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) - 14)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) > 12 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) - 12)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (2 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (2 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (2 * l06AA)
            End If
        Case mc02F8
            If  gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) > 12 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) - 12)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (2 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) > 14 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) - 14)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) > 14 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) - 14)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) > 12 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) - 12)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 + (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 + (2 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(m06AC) + gv14C2(pv06A6).M584B(m06AC) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (2 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc03E2) + gv14C2(pv06A6).M584B(mc03E2) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0352) + gv14C2(pv06A6).M584B(mc0352) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (1 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (1 * l06AA)
            End If
            If  gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) < 8 Then
                l06AA = Abs(gv14C2(pv06A6).M55B5(mc0354) + gv14C2(pv06A6).M584B(mc0354) - 8)
                gv14C2(pv06A6).M4E97 = gv14C2(pv06A6).M4E97 - (2 * l06AA)
                gv14C2(pv06A6).M4EA1 = gv14C2(pv06A6).M4EA1 - (2 * l06AA)
            End If
            gv1EDE = False
    End Select
End Sub

Sub sub091E (ByVal pv06AE As Integer ' 81, p06B0 As Integer ' 41)
Dim l06B2 As Integer ' 81
' Const mc06B4 = 1 ' &H1%
Dim l06BA As Long ' 82
    On Error GoTo L438B4
    If  gv14C2(pv06AE).M5483 <> False Then
        Exit Sub
    End If
    sub086D mc06B4
    frmDungeonMain!picMaze2.Cls
    l06B2 = fn0F88(gv1D68)
    If  p06B0 = mc01C8 Then
        If  gv14C2(pv06AE).M59F4(mc01D0) = False And gv14C2(pv06AE).M59F4(m01D2) = False Then
            l06BA = fn0A34(gv14C2(m00DC).M583F, gv14C2(m00DC).M5845)
            l06BA = fn0418(mc01C4, l06BA, True)
            If  fn0ABD(gv14C2(pv06AE).M583F, gv14C2(pv06AE).M5845, l06BA) = False Then
                MsgBox "Error updating AutoMap!", mc00A4, "Error!"
            End If
        End If
        If  gv14C2(pv06AE).M5470 <= False Then
            gv14C2(pv06AE).M5470 = False
            gv14C2(pv06AE).M59BB = -1
        Else
            gv14C2(pv06AE).M59BB = False
        End If
    End If
    gv14C2(pv06AE).M4EAC = 0
    gv14C2(pv06AE).M5483 = p06B0
    gv14C2(pv06AE).M5906(mc0642) = gv14C2(pv06AE).M5906(mc0642) + 1
    If  gv14C2(pv06AE).M59F4(m01D2) = False Then
        sub0578 gv14C2(pv06AE).M58BB, Chr$(34) + RTrim(gv14C2(pv06AE).M548B) + Chr$(34) + " died on level " + CStr(gv14C2(pv06AE).M5470) + "."
    Else
        sub0578 gv14C2(pv06AE).M58BB, Chr$(34) + RTrim(gv14C2(pv06AE).M548B) + Chr$(34) + " died somewhere in the dungeon."
    End If
    Exit Sub

L438B4:
    Resume
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharSetDead."
    Resume L43924
L43924:
End Sub

Sub sub150A (p06BC As Integer ' 41, p06BE As Integer ' 41, p06C0 As Integer ' 41, p06C2 As Integer ' 41, p06C4 As Integer ' 41, p06C6 As Integer ' 41)
Dim l06C8 As Integer ' 81
' Const mc06CA = 1 ' &H1%
' Const mc06CC = 9 ' &H9%
    On Error GoTo L43BA0
    If  frmCharStat1.WindowState <> m05CA Then frmCharStat1.WindowState = m05CA
    Select Case p06BC
        Case mc06CA, mc0148, mc06CC
            l06C8 = mc014C
        Case mc05A2
            l06C8 = mc019C
        Case mc059A
            l06C8 = mc0652
        Case mc05AA
            l06C8 = mc0322
        Case mc05AE
            l06C8 = mc0658
        Case Else
    End Select
    If  p06BC <> mc05A6 Then
        If  l06C8 <> mc014C Then
            frmCharStat1!picTabPicture.Tag = CStr(p06BC) + "|" + CStr(p06BE) + "|" + CStr(p06C0) + "|" + CStr(p06C2) + "|" + CStr(p06C4) + "|" + CStr(p06C4)
        Else
            frmCharStat1!lblCall.Tag = CStr(p06BC) + "|" + CStr(p06BE) + "|" + CStr(p06C0) + "|" + CStr(p06C2) + "|" + CStr(p06C4) + "|" + CStr(p06C6)
        End If
        If  frmCharStat1!tabStatTab.P?C01E <> l06C8 Then
            frmCharStat1!tabStatTab.P?C01E = l06C8
        Else
            frmCharStat1!lblCall = "UPDATE"
        End If
    End If

L43B92:
    Exit Sub

L43BA0:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharSetInfo"
    Resume L43B92
End Sub

Sub sub0F4C (p06CE As Integer ' 41)
Dim l06D0 As String ' 87
Dim l06D2 As String ' 87
Dim l06D4 As Variant ' 86
    On Error GoTo L43EE4
    l06D4 = gv14C2(gv1A86).M59B0(p06CE)
    If  l06D4 >= mc02D6 And (l06D4 - mc02D6) > UBound(gv152A) Then
        l06D4 = -1
    End If
    If  l06D4 = -1 Then
        l06D0 = "(Nothing)"
    Else
        Select Case l06D4
            Case Is < mc02D6
                If  gv14C2(gv1A86).M5857(l06D4).M4ED4 <= False Then
                    gv14C2(gv1A86).M59B0(p06CE) = -1
                    l06D0 = "(Nothing)"
                Else
                    l06D0 = "Item #" + LTrim$(Str$(l06D4 + 1)) + ". " + fn12EF(gv14C2(gv1A86).M5857(l06D4).M4ED4, gv14C2(gv1A86).M5857(l06D4).M4EEE, gv14C2(gv1A86).M5857(l06D4).M4EBF, gv14C2(gv1A86).M5857(l06D4).M56DB)
                End If
                l06D2 = ""
            Case Is >= mc02D6
                l06D0 = Chr$(34) + gv152A(l06D4 - mc02D6).M548B + Chr$(34)
                l06D2 = LTrim$(Str$(fn142F(gv1A86, l06D4 - mc02D6)))
                If  fn142F(gv1A86, l06D4 - mc02D6) = False Then
                    l06D2 = "?"
                End If
        End Select
    End If
    frmCharStat1!lblBuffer(p06CE).Caption = LTrim$(Str$(p06CE + 1)) + ". " + l06D0
    frmCharStat1!lblBufferStat(p06CE).Caption = l06D2
    Exit Sub

L43EE4:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdcharShowBuffer"
    Resume L43F50
L43F50:
End Sub

Sub sub15EC (p06DA As Control ' 49, ByVal p06DC As String ' 47)
    If  gv1A84 = gv1A82 Then
        p06DA.Caption = p06DC
    End If
End Sub

Sub sub0F38 ()
    On Error GoTo L441C0
    If  gv1A86 = gv1A82 Then
        If  gv14C2(gv1A86).M5943 > -1 Then
            If  gv14C2(gv1A86).M5943 < mc018A Then
                If  RTrim(gv14C2(gv1A86).M58CB(gv14C2(gv1A86).M5943).M548B) <> "" Then
                    frmCharStat3!lblCarryInfo.Caption = "Carrying " + Chr$(34) + RTrim(gv14C2(gv1A86).M58CB(gv14C2(gv1A86).M5943).M548B) + Chr$(34) + "."
                Else
                    frmCharStat3!lblCarryInfo.Caption = "Carrying " + fn1235(gv1A86, gv14C2(gv1A86).M5943) + "."
                End If
            Else
                If  gv1732(gv14C2(gv1A86).M5943 - mc018A).M5483 > 0 Then
                    frmCharStat3!lblCarryInfo.Caption = "Carrying " + Chr$(34) + gv1732(gv14C2(gv1A86).M5943 - mc018A).M548B + Chr$(34)
                    Else
                    gv14C2(gv1A86).M5943 = -1
                    frmCharStat3!lblCarryInfo.Caption = ""
                End If
            End If
        Else
            frmCharStat3!lblCarryInfo.Caption = ""
        End If
    End If

L441B2:
    Exit Sub

L441C0:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharShowCharry."
    Resume L441B2
End Sub

Sub sub0B82 (ByVal pv06DE As Integer ' 81)
Dim l06E0 ' 80
Dim l06E2 As Integer ' 81
Dim l06E6 ' 80
Dim l06E8 As Integer ' 81
Dim l06EA As Integer ' 81
    On Error GoTo L44748
    If  pv06DE <> gv1A82 Then Exit Sub
    For l06E0 = 0 To mc018A - 1
        If  gv14C2(pv06DE).M58CB(l06E0).M4ED4 > -1 Then
            If  gv14C2(pv06DE).M58CB(l06E0).M4ED4 > -1 Then
                If  gv14C2(pv06DE).M58CB(l06E0).M57D4 <> gv14F6(gv14C2(pv06DE).M58CB(l06E0).M4ED4).M5467 Then
                    sub085B "COMPANION SORTER: Remapping Companion #" + LTrim$(Str$(l06E0))
                    For l06E6 = 0 To gv1BF6 - 1
                        If  gv14F6(l06E6).M5467 = gv14C2(pv06DE).M58CB(l06E0).M57D4 Then
                            gv14C2(pv06DE).M58CB(l06E0).M4ED4 = l06E6
                            Exit For
                        End If
                    Next l06E6
                End If
            End If
            l06E2 = l06E2 + 1
            l06E8 = frmCharStat3!picCompanion(l06E0).Width / Screen.TwipsPerPixelX
            l06EA = frmCharStat3!picCompanion(l06E0).Height / Screen.TwipsPerPixelY
            frmCharStat3!picCompanion(l06E0).Refresh
            If  RTrim(gv14C2(pv06DE).M58CB(l06E0).M548B) = "" Then
                frmCharStat3!lblCompName(l06E0).Caption = LTrim$(Str$(l06E0 + 1)) + ". (" + gv14F6(gv14C2(pv06DE).M58CB(l06E0).M4ED4).M548B + ")"
            Else
                frmCharStat3!lblCompName(l06E0).Caption = LTrim$(Str$(l06E0 + 1)) + ". " + Chr$(34) + RTrim(gv14C2(pv06DE).M58CB(l06E0).M548B) + Chr$(34)
            End If
            frmCharStat3!lblCompHits(l06E0).Caption = LTrim$(Str$(gv14C2(pv06DE).M58CB(l06E0).M4EAC)) + "\" + LTrim$(Str$(gv14C2(pv06DE).M58CB(l06E0).M4EB4))
            frmCharStat3!picCompanion(l06E0).Visible = True
            frmCharStat3!lblCompName(l06E0).Visible = True
            frmCharStat3!lblCompHits(l06E0).Visible = True
            frmCharStat3!cmdCompanion(l06E0).Enabled = True
        Else
            gv14C2(pv06DE).M58CB(l06E0).M548B = " "
            frmCharStat3!lblCompName(l06E0).Visible = False
            frmCharStat3!lblCompHits(l06E0).Visible = False
            frmCharStat3!picCompanion(l06E0).Visible = False
            frmCharStat3!cmdCompanion(l06E0).Enabled = False
        End If
    Next l06E0
    If  l06E2 = 0 Then
        frmCharStat3!lblCompName(0).Visible = True
        frmCharStat3!lblCompName(0).Caption = "No Companions"
    End If
    If  fn03BD(frmInteract) Then
        frmInteract!lblCall = "UPDATE"
    End If
    sub0F38
    Exit Sub

L44748:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharShowCompanions."
    Resume L447BA
L447BA:
End Sub

Sub sub151C (p06F2 As Integer ' 41, p06F4 As Integer ' 41, p06F6 As Integer ' 41, p06F8 As Integer ' 41)
' called (p1%, p2%, p3%, p4%, p5%, p6%)
Dim l0700 As Integer ' 81
Dim l0702 As Integer ' 81
Dim l0704 As String ' 87
Dim l0706 As String ' 87
Dim l0708 As Currency ' 85
Dim l070A ' 80
' Const mc071A = 75 ' &H4B%
' Const mc071C = 31 ' &H1F%
Dim l0726 As Single ' 83
Dim l0728 As Single ' 83
Dim l072A As Integer ' 81
Dim l072C As Integer ' 81
' Const mc0736 = 60 ' &H3C%
' Const mc073A = 32 ' ? &H 0020 00CC
' Const mc0758 = 6 ' &H6%
' Const mc0760 = 14 ' &HE%
' Const mc0768 = 18 ' &H12%
Dim l076A As String ' 87
Dim l076C As Integer ' 81
Dim l0776 As Integer ' 81
Dim l0778 As Integer ' 81
Dim l077C As String ' 87
' Const mc077E = 2 ' &H2%
' Const mc0782 = 5 ' &H5%
Dim l0784 As Integer ' 81
Dim l0786 As Integer ' 81
Dim l0788 As Single ' 83
Dim l078A As Single ' 83
' Const mc078C = 40 ' &H28%
' Const mc078E = 4 ' &H4%
' Const mc0790 = 10 ' &HA%
' Const mc0792 = 10 ' &HA%
' Const mc0794 = 5 ' &H5%
' Const mc0796 = 6 ' &H6%
' Const mc079E = 9 ' &H9%
' Const mc07A2 = 10 ' &HA%
' Const mc07A4 = 11 ' &HB%
    On Error GoTo L49874
    If  frmCharStat1.WindowState <> m05CA And p06F2 <> mc05A6 Then
        frmCharStat1.WindowState = m05CA
        Exit Sub
    End If
    Select Case p06F2
        Case mc06CC
            frmCharStat1!picTabPicture.Cls
            sub09B8 frmCharStat1!picTabPicture, 2, 1, "Spell:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 2, 9, Chr$(34) + gv152A(p06F4).M548B + Chr$(34), m0544
            sub09B8 frmCharStat1!picTabPicture, 3, 1, "Class:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 3, 9, gv07B0$(gv152A(p06F4).M5709), m0544
            If  gv152A(p06F4).M5B33 > False Then
                If  gv152A(p06F4).M5709 = mc04AE Then
                    sub09B8 frmCharStat1!picTabPicture, 4, 1, "Heal:", mc0546
                Else
                    sub09B8 frmCharStat1!picTabPicture, 4, 1, "Damage:", mc0546
                End If
                sub09B8 frmCharStat1!picTabPicture, 4, 9, CStr(gv152A(p06F4).M5B33) + "/" + CStr(gv152A(p06F4).M5B41 + 1), m0544
            End If
            sub09B8 frmCharStat1!picTabPicture, 5, 1, "Guild:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 5, 9, gv145A(fn13FF(gv1A86, p06F4)).M548B, m0544
            sub09B8 frmCharStat1!picTabPicture, 6, 1, "Points:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 6, 9, CStr(fn142F(gv1A86, p06F4)), m0544
            If  gv152A(p06F4).M5B5B > False Then
                sub09B8 frmCharStat1!picTabPicture, 8, 1, "Resistance:", mc0546
                sub09B8 frmCharStat1!picTabPicture, 8, 9, gv0620$(gv152A(p06F4).M5B5B), m0544
            End If
            sub09B8 frmCharStat1!picTabPicture, 4, 14, "Stats Required", mc0546
            l0702 = False
            For l070A = False To mc0286 - 1
                If  gv152A(p06F4).M5B4F(l070A) > False Then
                    sub09B8 frmCharStat1!picTabPicture, 5 + l0702, 16, Left$(gv05EE$(l070A), 3) + " (" + CStr(gv152A(p06F4).M5B4F(l070A)) + ")", m0544
                    l0702 = l0702 + 1
                End If
            Next l070A
            l0702 = gv152A(p06F4).M56B9
            If  l0702 >= mc0138 Then
                sub09B8 frmCharStat1!picTabPicture, 12, 1, "This spell affects the entire party", mc0548
                l0702 = l0702 - mc0138
            End If
            l0706 = ""
            Select Case l0702
                Case m0154, mc071A To 99
                    If  gv152A(p06F4).M5709 = mc04AE Then
                        l0706 = "Heals wounds"
                    ElseIf gv152A(p06F4).M5709 = mc022A Then
                        l0706 = "Attempts to Bind/Charm Target(s)"
                    Else
                        If  gv152A(p06F4).M56B9 = mc0236 Then
                            l0706 = "Kills target(s) or has no effect"
                        Else
                            l0706 = "Damages or Kills Target(s)"
                        End If
                    End If
                Case mc0166
                    l0706 = "Removes Poison"
                Case mc0168
                    l0706 = "Removes Disease"
                Case mc016A
                    l0706 = "Levitates a Character"
                Case mc0170
                    l0706 = "Turns character Invisible"
                Case mc0174
                    l0706 = "Allows character to see Invisible"
                Case mc0178
                    l0706 = "Protects a Character"
                Case mc01A0
                    l0706 = "Teleports a Character"
                Case mc019E
                    l0706 = "Displaces a Character"
                Case mc013A
                    l0706 = "Opens a door in Wall"
                Case mc0150
                    l0706 = "Removes Paralysis"
                Case mc01B0
                    l0706 = "Detects Rock"
                Case mc01D6
                    l0706 = "Detects Depth"
                Case mc01DA
                    l0706 = "Determines Location"
                Case mc01E4
                    l0706 = "Locates a Character"
                Case mc01F6
                    l0706 = "Pulls Character from Rock"
                Case mc01FA
                    l0706 = "Sets Sanctuary Coords"
                Case mc01FC
                    l0706 = "Teleports to Sanctuary Coords"
                Case mc0156
                    l0706 = "Removes Poison and Disease"
                Case mc0188 To mc0188 + 5
                    l0706 = "Raises the Dead"
                Case mc017C
                    l0706 = "Unlocks Chest"
                Case mc071C
                    l0706 = "Unlocks Door"
                Case mc017E
                    l0706 = "Unlocks any locked object"
                Case mc019A To mc019A + mc0060 - 1
                    l0706 = "Resists " + gv0620$(gv152A(p06F4).M56B9 - mc019A)
                Case mc0236
                    l0706 = "Kills target(s) or has no effect"
                Case mc014A To mc014A + 2
                    l0706 = "Increases the Bind Level of a Companion"
                Case mc013C
                    l0706 = "Binds a companion to the caster for life"
                Case Else
                    l0706 = "Unknown!"
            End Select
            sub09B8 frmCharStat1!picTabPicture, 10, 1, "Special", mc0546
            sub09B8 frmCharStat1!picTabPicture, 11, 1, l0706, m0544
            Select Case l0702
                Case mc071A To 99
                    sub09B8 frmCharStat1!picTabPicture, 12, 1, "Only Affects " + gv1662(gv152A(p06F4).M56B9 - mc071A).M548B + "s", m0544
                Case Else
            End Select
            If  gv152A(p06F4).M5B33 > False And gv152A(p06F4).M5709 <> mc04AE Then
                l0706 = "This spell will affect " + CStr(gv152A(p06F4).M5B28) + " groups,"
                sub09B8 frmCharStat1!picTabPicture, 14, 1, l0706, m0544
                l0706 = CStr(gv152A(p06F4).M5B1D) + " monsters max in each group."
                sub09B8 frmCharStat1!picTabPicture, 15, 1, l0706, m0544
            End If
            l0706 = "This spell is currently cast at a spell"
            sub09B8 frmCharStat1!picTabPicture, 17, 1, l0706, m0544
            l0706 = "level of " + CStr(fn1417(gv1A86, p06F4)) + " by your " + gv145A(gv1D08).M548B + " training."
            sub09B8 frmCharStat1!picTabPicture, 18, 1, l0706, m0544
        Case mc0148
            If  gv1EBC.M4ED4 = -1 Then
                Exit Sub
            End If
            frmCharStat1!picTabPicture.Cls
            l0700 = gv1EBC.M57D4
            If  gv1EBC.M57D4 > -1 Then
                If  gv14C2(gv1A86).M58CB(gv1EBC.M57D4).M4ED4 = -1 Then
                    Exit Sub
                Else
                    gv1EBC = gv14C2(gv1A86).M58CB(gv1EBC.M57D4)
                    gv1EBC.M57D4 = l0700
                End If
            End If
            l0700 = gv1EBC.M4EEE
            If  gv1EBC.M57D4 > -1 Then
                l0706 = "Comp. #" + CStr(gv1EBC.M57D4 + 1) + " "
                If  RTrim(gv1EBC.M548B) <> "" Then
                    l0706 = l0706 + Chr$(34) + RTrim(gv1EBC.M548B) + Chr$(34) + " "
                End If
                l0706 = l0706 + "(" + gv14F6(gv1EBC.M4ED4).M548B + ")"
            Else
                l0706 = "STORE: " + gv14F6(gv1EBC.M4ED4).M548B
            End If
            l0726 = frmCharStat1.Width / gv19C2(m0516).M5E20
            l0728 = l0726
            l072A = ((gv14F6(gv1EBC.M4ED4).M5A1B - 1) Mod 10)
            l072C = Int((gv14F6(gv1EBC.M4ED4).M5A1B - 1) / 10)
            If  gv1A66.M5F04 = False Then
                l0702 = extfn01C4(frmCharStat1!picTabPicture.hDC, (frmCharStat1!picTabPicture.Width / Screen.TwipsPerPixelX) - ((mc0736 * l0726) * 1.25#), (mc0736 / 4), mc0736 * l0726, mc0736 * l0728, gv2BB8, (l072A * mc0736), (l072C * mc0736), mc0736, mc0736, mc073A)
            Else
                l0702 = extfn182D(frmCharStat1!picTabPicture.hDC, (frmCharStat1!picTabPicture.Width / Screen.TwipsPerPixelX) - (mc0736 * 1.25#), (mc0736 / 4), mc0736, mc0736, gv2BB8, (l072A * mc0736), (l072C * mc0736), mc073A)
            End If
            sub09B8 frmCharStat1!picTabPicture, 2, 1, l0706, mc0546
            sub09B8 frmCharStat1!picTabPicture, 4, 1, "Size:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 4, 8, gv05BC$(gv14F6(gv1EBC.M4ED4).M5565), m0544
            If  l0700 <= mc038A Then
                sub09B8 frmCharStat1!picTabPicture, 5, 1, "Type:", mc0546
                sub09B8 frmCharStat1!picTabPicture, 5, 8, gv1696(gv1662(gv14F6(gv1EBC.M4ED4).M4ED4).M550A).M548B, m0544
            End If
            If  l0700 <= mc038C Then
                sub09B8 frmCharStat1!picTabPicture, 6, 1, "Align:", mc0546
                sub09B8 frmCharStat1!picTabPicture, 6, 8, gv074C$(gv1EBC.M4EBF), m0544
                sub09B8 frmCharStat1!picTabPicture, 7, 1, "A/D:", mc0546
                l0706 = CStr(gv1EBC.M4E97) + "/" + CStr(gv1EBC.M4EA1)
                sub09B8 frmCharStat1!picTabPicture, 7, 8, l0706, m0544
                sub09B8 frmCharStat1!picTabPicture, 8, 1, "Avg. Hits:", mc0546
                sub09B8 frmCharStat1!picTabPicture, 8, 8, CStr(gv14F6(gv1EBC.M4ED4).M4EAC), m0544
                sub09B8 frmCharStat1!picTabPicture, 13, 1, "Stats", mc0546
                l0706 = ""
                For l070A = 0 To mc0286 - 1
                    l0706 = l0706 + CStr(gv14F6(gv1EBC.M4ED4).M55B5(l070A)) + "/"
                Next l070A
                sub09B8 frmCharStat1!picTabPicture, 14, 1, Left(l0706, Len(l0706) - 1), m0544
            End If
            If  gv1EBC.M57D4 > -1 Then
                If  gv1EBC.M57E1 < 0 Then
                    sub09B8 frmCharStat1!picTabPicture, 10, 1, "Content Level:", mc0546
                Else
                    sub09B8 frmCharStat1!picTabPicture, 10, 1, "Bind Level:", mc0546
                End If
                sub09B8 frmCharStat1!picTabPicture, 11, 1, CStr(Abs(gv1EBC.M57E1)) + " (" + fn0D92(gv1A82, gv1EBC.M57D4) + ")", m0544
            End If
            If  l0700 = m0386 Then
                l0708 = False
                sub09B8 frmCharStat1!picTabPicture, 13, 9, "Special", mc0546
                For l070A = 0 To mc0758 - 1
                    If  fn0380(l070A, gv14F6(gv1EBC.M4ED4).M55BE) = True Then
                        l0708 = l0708 + 1
                        sub09B8 frmCharStat1!picTabPicture, 13 + l0708, 9, gv08DC$(l070A), mc0548
                    End If
                Next l070A
                For l070A = 0 To mc0760 - 1
                    If  fn0380(l070A, gv14F6(gv1EBC.M4ED4).M5A35) = True Then
                        l0708 = l0708 + 1
                        sub09B8 frmCharStat1!picTabPicture, 13 + l0708, 9, "Can " + gv090E$(l070A), mc0548
                    End If
                Next l070A
                For l070A = 0 To mc0768 - 1
                    If  fn0380(l070A, gv14F6(gv1EBC.M4ED4).M5A40) = True Then
                        l0708 = l0708 + 1
                        sub09B8 frmCharStat1!picTabPicture, 13 + l0708, 9, "Can Cast " + Chr$(34) + gv07B0$(l070A) + Chr$(34) + " Spells", mc0548
                    End If
                Next l070A
                For l070A = 0 To mc0060 - 1
                    If  gv14F6(gv1EBC.M4ED4).M5548(l070A) > False Then
                        l0708 = l0708 + 1
                        sub09B8 frmCharStat1!picTabPicture, 13 + l0708, 9, "Is " + gv0620$(l070A) + " Resistant", mc0548
                    End If
                Next l070A
                If  l0708 = False Then
                    sub09B8 frmCharStat1!picTabPicture, 14, 9, "(None)", mc0548
                End If
            End If
            sub09B8 frmCharStat1!picTabPicture, 16, 1, "ID Lev:", mc0546
            Select Case l0700
                Case m0386
                    l0706 = "You know All"
                Case mc038C
                    l0706 = "More to learn"
                Case mc038A
                    l0706 = "Lots more to learn"
                Case Else
                    l0706 = "You know Nothing"
            End Select
            sub09B8 frmCharStat1!picTabPicture, 17, 1, l0706, m0544
        Case mc06CA
            frmCharStat1!picTabPicture.Cls
            If  p06F4 < 0 Or p06F4 > UBound(gv1426) Then Exit Sub
            sub09B8 frmCharStat1!picTabPicture, 2, 1, "Item", mc0546
            If  p06F8 < mc038A Then
                l0706 = gv1426(p06F4).M548B
                If  p06F6 > 0 And p06F8 < mc038C Then
                    l0706 = l0706 + " " + gv077E$(p06F6)
                End If
                If  p06F8 = m0386 Then
                    If  gv1426(p06F4).M572A Then
                        l0706 = l0706 + " (cursed)"
                    End If
                End If
            Else
                l0706 = "<Unknown>"
            End If
            sub09B8 frmCharStat1!picTabPicture, 2, 6, l0706, m0544
            If  p06F8 < mc038A Then
                l0704 = LTrim$(Str$(gv1426(p06F4).M4E97)) + "/" + LTrim$(Str$(gv1426(p06F4).M4EA1))
                If  gv1426(p06F4).M56F7 <> False And p06F8 = m0386 And gv1592(gv1426(p06F4).M5709).M54D5 = False Then
                    l0704 = l0704 + " [" + LTrim$(Str$(gv1426(p06F4).M56F7)) + "]"
                End If
                sub09B8 frmCharStat1!picTabPicture, 3, 1, "Att/Def", mc0546
                sub09B8 frmCharStat1!picTabPicture, 3, 6, l0704, m0544
            End If
            sub09B8 frmCharStat1!picTabPicture, 4, 1, "Class", mc0546
            If  p06F8 < mc0388 Then
                l0704 = gv1592(gv1426(p06F4).M5709).M548B
                Else
                If  p06F8 <= mc0388 Then
                    l0704 = gv15C6(gv1592(gv1426(p06F4).M5709).M54D5).M548B
                Else
                    l0704 = "Unknown"
                End If
            End If
            If  p06F8 = m0386 Then
                If  gv1426(p06F4).M5742 = True Then
                    l0704 = l0704 + " (Class Restricted)"
                Else
                    l0704 = l0704 + " (Not Class Restricted)"
                End If
            End If
            sub09B8 frmCharStat1!picTabPicture, 4, 6, l0704, m0544
            If  p06F8 < mc038A Then
                sub09B8 frmCharStat1!picTabPicture, 7, 1, "Req", mc0546
                For l0700 = 0 To mc0286 - 1
                    sub09B8 frmCharStat1!picTabPicture, 6, (l0700 * 2) + 3, Left(gv05EE$(l0700), 3), mc0546
                    sub09B8 frmCharStat1!picTabPicture, 7, (l0700 * 2) + 4, LTrim$(Str$(gv1426(p06F4).M5712(l0700))), m0544
                Next l0700
            End If
            If  p06F8 < mc038C Then
                sub09B8 frmCharStat1!picTabPicture, 8, 1, "Mod", mc0546
                For l0700 = 0 To mc0286 - 1
                    sub09B8 frmCharStat1!picTabPicture, 8, (l0700 * 2) + 4, LTrim$(Str$(gv1426(p06F4).M571E(l0700))), m0544
                Next l0700
            End If
            If  p06F8 = m0386 Then
                Select Case gv1426(p06F4).M56B9
                    Case 1 To 10
                        l076A = "Modifies Stat(s)"
                    Case 11
                        l076A = "Adds 50 Spell Points"
                    Case 12
                        l076A = "Adds 200 Spell Points"
                    Case 13, 14
                        l076A = "Subtracts Age"
                End Select
                sub09B8 frmCharStat1!picTabPicture, 10, 1, l076A, m0544
            End If
            If  p06F8 < mc038A Then
                If  gv1426(p06F4).M5700 > False Then
                    If  gv1426(p06F4).M56AF = 1 Then
                        l076A = ", 1 swing"
                    ElseIf gv1426(p06F4).M56AF > 1 Then
                        l076A = ", " + CStr(gv1426(p06F4).M56AF) + " swings"
                    End If
                    sub09B8 frmCharStat1!picTabPicture, 11, 1, gv0846$(gv1426(p06F4).M5700) + "-handed Item" + l076A, m0544
                Else
                    sub09B8 frmCharStat1!picTabPicture, 11, 1, "Requires no hands", m0544
                End If
            End If
            If  p06F8 < mc038C Then
                If  gv1426(p06F4).M56C4 Then
                    sub09B8 frmCharStat1!picTabPicture, 12, 1, "Casts " + Chr$(34) + gv152A(gv1426(p06F4).M56C4 - 1).M548B + Chr$(34), m0544
                    If  p06F8 = m0386 Then
                        If  gv1426(p06F4).M5734 > False Then
                            sub09B8 frmCharStat1!picTabPicture, 13, 1, "at a Spell Level of " + CStr(gv1426(p06F4).M5734), m0544
                        Else
                            sub09B8 frmCharStat1!picTabPicture, 13, 1, "at the casters Spell Level", m0544
                        End If
                    End If
                End If
            End If
            l076C% = 0
            If  p06F8 < mc038A Then
                sub09B8 frmCharStat1!picTabPicture, 10, 13, "Allowed Guilds", mc0546
                For l0700 = 0 To gv1BEA - 1
                    If  fn0380(l0700, gv1426(p06F4).M56E6) Then
                        l076C% = l076C% + 1
                        sub09B8 frmCharStat1!picTabPicture, 10 + l076C%, 13, gv145A(l0700).M548B, m0544
                        If  p06F8 = m0386 Then
                            sub09B8 frmCharStat1!picTabPicture, 10 + l076C%, 19, Str$(fn030F(p06F4, l0700)), m0544
                        Else
                            sub09B8 frmCharStat1!picTabPicture, 10 + l076C%, 19, "?", m0544
                        End If
                    End If
                Next l0700
            End If
            l076C% = 0
            If  p06F8 < mc038C Then
                For l0700 = 0 To mc0758 - 1
                    If  fn0380(l0700, gv1426(p06F4).M55BE) Then
                        l076C% = l076C% + 1
                        sub09B8 frmCharStat1!picTabPicture, 13 + l076C%, 2, gv0684$(l0700), mc0548
                    End If
                Next l0700
                For l0700 = 0 To mc0060 - 1
                    If  fn0380(l0700, gv1426(p06F4).M5548) Then
                        l076C% = l076C% + 1
                        sub09B8 frmCharStat1!picTabPicture, 13 + l076C%, 2, gv0620$(l0700) + " Res", mc0548
                    End If
                Next l0700
            End If
            sub09B8 frmCharStat1!picTabPicture, 20, 1, "ID Lev:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 21, 1, fn12D6(p06F8), m0544
            If  gv1426(p06F4).M56B9 >= 500 And gv1426(p06F4).M56B9 <= 500 + (gv1BEA - 1) Then
                sub09B8 frmCharStat1!picTabPicture, 23, 1, "This is a Guild-Issued Item", mc0546
            End If
        Case mc05A6
            l0776 = gv14C2(gv1A86).M58BB
            l0778 = gv14C2(gv1A86).M5584(l0776).M4E82
            If  gv14C2(gv1A86).M579B < fn124B(gv14C2(gv1A86)) Then
                l077C = "You need " + fn036D(CCur(fn124B(gv14C2(gv1A86)) - gv14C2(gv1A86).M579B), m04C0) + " more experience and " + fn036D(CCur(fn125C(gv14C2(gv1A86))), m04C0) + " gold for level" + Str$(l0778 + 1) + "."
            Else
                If  gv14C2(gv1A86).M579B = gv14C2(gv1A86).M5970 Then
                    l077C = "You are Pinned and need " + fn036D(CCur(fn125C(gv14C2(gv1A86))), m04C0) + " gold for level" + Str$(l0778 + 1) + "."
                Else
                    l077C = "You need " + fn036D(CCur(gv14C2(gv1A86).M5970 - gv14C2(gv1A86).M579B), m04C0) + " more experience to pin and " + fn036D(CCur(fn125C(gv14C2(gv1A86))), m04C0) + " gold for level" + Str$(l0778 + 1) + "."
                End If
            End If
            sub085B l077C
            l077C = ""
            If  gv14C2(gv1A86).M5584(l0776).M55CB > 0 Then
                Select Case gv14C2(gv1A86).M5584(l0776).M55CB
                    Case mc02DE
                        For l070A = 0 To gv1BF6 - 1
                            If  gv14F6(l070A).M5467 = gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M57A9 Then
                                l0702 = l070A
                                Exit For
                            End If
                        Next l070A
                        l077C = "You must defeat one " + gv14F6(l0702).M548B + "."
                    Case mc077E
                        For l070A = 0 To gv1BEC - 1
                            If  gv1426(l070A).M5467 = gv14C2(gv1A86).M5584(gv14C2(gv1A86).M58BB).M57A9 Then
                                l0702 = l070A
                                Exit For
                            End If
                        Next l070A
                        l077C = "You must return with one " + gv1426(l0702).M548B + "."
                End Select
                If  gv14C2(gv1A86).M5584(l0776).M57B2 Then
                    l077C = "Your quest has been completed."
                End If
            End If
            If  l077C <> "" Then
                sub085B l077C
            End If
        Case mc05A2
            frmCharStat1!picTabPicture.Cls
            sub09B8 frmCharStat1!picTabPicture, 2, 1, "Current Resistances", mc0546
            For l0700 = 0 To mc0060 - 1
                sub09B8 frmCharStat1!picTabPicture, 4 + l0700, 2, gv0620$(l0700), m0544
                If  gv14C2(gv1A86).M5548(l0700) > 0 Then
                    sub09B8 frmCharStat1!picTabPicture, 4 + l0700, 12, CStr(gv14C2(gv1A86).M5548(l0700)) + "%", m0544
                Else
                    sub09B8 frmCharStat1!picTabPicture, 4 + l0700, 12, " -", m0544
                End If
            Next l0700
        Case mc059A
            l0702 = fn09A4(1, False)
        Case mc0782
            l0702 = fn09A4(3, False)
        Case mc05AA
            frmCharStat1!picTabPicture.Cls
            If  m007C = True Then
                Exit Sub
            End If
            If  p06F4 = True Then
                m007C = True
                sub085B "BETA: Writing Character Statistics to File..."
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "  VERSION: " + gc0186, mc0546
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "CHARACTER: " + Chr$(34) + RTrim(gv14C2(gv1A86).M548B) + Chr$(34) + " (" + gv074C$(gv14C2(gv1A86).M4EBF) + " " + gv148E(gv14C2(gv1A86).M5821).M548B + ")", mc0546
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "ITEM INFO", mc0546
                For l0700 = 0 To mc02D6 - 1
                    If  gv14C2(gv1A86).M5857(l0700).M4ED4 > False Then
                        If  gv14C2(gv1A86).M5857(l0700).M577E = mc02D8 Then
                            l0706 = "* "
                        Else
                            l0706 = "  "
                        End If
                        l0706 = l0706 + Str$(l0700) + ". " + fn12EF(gv14C2(gv1A86).M5857(l0700).M4ED4, gv14C2(gv1A86).M5857(l0700).M4EEE, gv14C2(gv1A86).M5857(l0700).M4EBF, gv14C2(gv1A86).M5857(l0700).M56DB)
                        sub09B8 frmCharStat1!picTabPicture, -1, -1, l0706, m0544
                    End If
                Next l0700
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "BANK ITEM INFO", mc0546
                For l0700 = 0 To mc078C - 1
                    If  gv14C2(gv1A86).M5860(l0700).M4ED4 > False Then
                        l0706 = Str$(l0700) + ". " + fn12EF(gv14C2(gv1A86).M5860(l0700).M4ED4, gv14C2(gv1A86).M5860(l0700).M4EEE, gv14C2(gv1A86).M5860(l0700).M4EBF, gv14C2(gv1A86).M5860(l0700).M56DB)
                        sub09B8 frmCharStat1!picTabPicture, -1, -1, l0706, m0544
                    End If
                Next l0700
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
            End If
            sub09B8 frmCharStat1!picTabPicture, 2, 1, "Kills:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 2, 6, fn036D(CCur(gv14C2(gv1A86).M5906(m023C)), m04C0), m0544
            sub09B8 frmCharStat1!picTabPicture, 3, 1, "Died:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 3, 6, Str$(gv14C2(gv1A86).M5906(mc0642)), m0544
            sub09B8 frmCharStat1!picTabPicture, 4, 1, "Comp:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 4, 6, Str$(gv14C2(gv1A86).M5906(mc02F4)), m0544
            sub09B8 frmCharStat1!picTabPicture, 7, 1, "Mon Quests:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 7, 8, Str$(gv14C2(gv1A86).M5906(mc02E0)), m0544
            sub09B8 frmCharStat1!picTabPicture, 8, 1, "Item Quests:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 8, 8, Str$(gv14C2(gv1A86).M5906(mc078E)), m0544
            sub047C gv1A86, m02F6
            For l070A = 0 To gv1BEA - 1
                If  gv14C2(gv1A86).M5584(l070A).M4E97 + mc0790 > l0788 Then l0788 = gv14C2(gv1A86).M5584(l070A).M4E97 + mc0790
                If  gv14C2(gv1A86).M5584(l070A).M4EA1 + mc0792 > l078A Then l078A = gv14C2(gv1A86).M5584(l070A).M4EA1 + mc0792
            Next l070A
            l0784 = gv14C2(gv1A86).M4E97 - l0788
            l0786 = gv14C2(gv1A86).M4EA1 - l078A
            sub09B8 frmCharStat1!picTabPicture, 12, 1, " Item A/D:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 12, 8, Str$(CInt(l0784)) + "/" + CStr(CInt(l0786)), m0544
            sub047C gv1A86, mc02F8
            sub09B8 frmCharStat1!picTabPicture, 10, 1, "Guild A/D:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 10, 8, Str$(Int(l0788)) + "/" + CStr(Int(l078A)), m0544
            sub09B8 frmCharStat1!picTabPicture, 11, 1, "Stats A/D:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 11, 8, Str$(CInt(gv14C2(gv1A86).M4E97 - l0784 - l0788)) + "/" + CStr(CInt(gv14C2(gv1A86).M4EA1 - l0786 - l078A)), m0544
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "Total A/D:", mc0546
            sub09B8 frmCharStat1!picTabPicture, -1, -1, Str$(CInt(gv14C2(gv1A86).M4E97)) + "/" + Str$(CInt(gv14C2(gv1A86).M4EA1)), m0544
            sub09B8 frmCharStat1!picTabPicture, 14, 1, "Time:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 14, 8, Time$, m0544
            sub09B8 frmCharStat1!picTabPicture, 15, 1, "Date:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 15, 8, Date, m0544
            sub09B8 frmCharStat1!picTabPicture, 16, 1, "Play Time:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 16, 8, Format$(CCur(gv14C2(gv1A86).M5906(mc0794) / 60 / 60), "###,###.00") + " Hrs", m0544
            sub09B8 frmCharStat1!picTabPicture, 17, 1, "Created on:", mc0546
            sub09B8 frmCharStat1!picTabPicture, 17, 8, CVDate(gv14C2(gv1A86).M5906(mc0796)), m0544
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
            sub09B8 frmCharStat1!picTabPicture, 2, 13, "Stats Nat(Mod)", mc0546
            For l0700 = 0 To mc0286 - 1
                If  gv14C2(gv1A86).M55B5(l0700) >= gv148E(gv14C2(gv1A86).M5821).M553C(l0700) + 5 Then
                    sub09B8 frmCharStat1!picTabPicture, 3 + l0700, 14, Left$(gv05EE$(l0700), 3) + " " + Str$(gv14C2(gv1A86).M55B5(l0700)) + " (" + LTrim$(Str$(gv14C2(gv1A86).M584B(l0700))) + ")", mc0546
                Else
                    sub09B8 frmCharStat1!picTabPicture, 3 + l0700, 14, Left$(gv05EE$(l0700), 3) + " " + Str$(gv14C2(gv1A86).M55B5(l0700)) + " (" + LTrim$(Str$(gv14C2(gv1A86).M584B(l0700))) + ")", m0544
                End If
            Next l0700
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "GUILD INFO", mc0546
            For l0700 = 0 To gv1BEA - 1
                If  gv14C2(gv1A86).M5584(l0700).M4E82 > 0 Then
                    sub09B8 frmCharStat1!picTabPicture, -1, -1, gv145A(l0700).M548B + " (" + LTrim$(Str$(gv14C2(gv1A86).M5584(l0700).M4E82)) + ") " + CStr(gv14C2(gv1A86).M5584(l0700).M4E97) + "/" + CStr(gv14C2(gv1A86).M5584(l0700).M4EA1), m0544
                End If
            Next l0700
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "Abilities (Lead Guild)", mc0546
            For l0700 = 0 To mc0758 - 1
                p06F4 = CInt(fn11D4(gv1A86, l0700, True))
                If  gv141C.M5B95 > False Then
                    sub09B8 frmCharStat1!picTabPicture, -1, -1, gv0652$(l0700) + " (" + gv145A(gv141C.M5493).M548B + ")", m0544
                End If
            Next l0700
            sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
            sub09B8 frmCharStat1!picTabPicture, 10, 13, "Total Exp.", mc0546
            For l0700 = 0 To gv1BEA - 1
                If  l0700 <> gv14C2(gv1A86).M58BB Then
                    l0708 = l0708 + gv14C2(gv1A86).M5584(l0700).M579B
                End If
            Next l0700
            l0708 = l0708 + gv14C2(gv1A86).M579B
            sub09B8 frmCharStat1!picTabPicture, 11, 14, fn036D(CCur(l0708), m04C0), m0544
            sub09B8 frmCharStat1!picTabPicture, 13, 13, "Total Gold", mc0546
            l0708 = gv14C2(gv1A86).M4F2D + gv14C2(gv1A86).M58AF
            sub09B8 frmCharStat1!picTabPicture, 14, 14, fn036D(CCur(l0708), m04C0), m0544
            If  p06F4 = True Then
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "***** END OF CHARACTER *****", mc0546
                sub09B8 frmCharStat1!picTabPicture, -1, -1, "", mc0546
                sub085B "BETA: Finished writing Character Statistics..."
            End If
            m007C = False
        Case mc05AE
            frmCharStat1!picTabPicture.Cls
            l0702 = False
            sub09B8 frmCharStat1!picTabPicture, 2, 1, "Guilds", mc0546
            For l0700 = 0 To gv1BEA - 1
                If  gv14C2(gv1A86).M5584(l0700).M4E82 > False Then
                    l0702 = l0702 + 1
                    sub09B8 frmCharStat1!picTabPicture, l0702 + 2, 2, gv145A(l0700).M548B + " (" + CStr(gv14C2(gv1A86).M5584(l0700).M4E82) + ")", m0544
                End If
            Next l0700
            sub09B8 frmCharStat1!picTabPicture, l0702 + 4, 1, "Total Skill", mc0546
            sub09B8 frmCharStat1!picTabPicture, l0702 + 5, 2, CStr(fn1BF0(mc079E, gv1A84, False)) + " Fighting", m0544
            sub09B8 frmCharStat1!picTabPicture, l0702 + 6, 2, CStr(fn1BF0(mc07A2, gv1A84, False)) + " Magical", m0544
            sub09B8 frmCharStat1!picTabPicture, l0702 + 7, 2, CStr(fn1BF0(mc07A4, gv1A84, False)) + " Thieving", m0544
            sub09B8 frmCharStat1!picTabPicture, l0702 + 9, 1, "Current Guild", mc0546
            sub09B8 frmCharStat1!picTabPicture, l0702 + 10, 2, gv145A(gv14C2(gv1A86).M58BB).M548B, m0544
            l0702 = False
            sub09B8 frmCharStat1!picTabPicture, 2, 11, "Guild Abilities", mc0546
            For l0700 = 0 To mc0758 - 1
                l0706 = CStr(fn11E9(gv1A86, l0700))
                If  Val(l0706) > False Then
                    l0702 = l0702 + 3
                    sub09B8 frmCharStat1!picTabPicture, l0702, 12, gv0652(l0700), mc0546
                    sub09B8 frmCharStat1!picTabPicture, l0702 + 2, 13, l0706 + " from " + gv145A(gv141C.M5493).M548B, mc0548
                End If
            Next l0700
    End Select
    Exit Sub

L49874:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharShowInfo."
    Resume L498E0
L498E0:
End Sub

Sub sub0F61 (ByVal pv07A6 As Integer ' 81, ByVal pv07A8 As Integer ' 81, ByVal pv07AA As Integer ' 81)
Dim l07AC ' 80
Dim l07AE As String ' 87
Dim l07B0 As String ' 87
Dim l07B2 As Integer ' 81
' Const mc07B4 = 1 ' &H1%
' Const mc07B6 = 2 ' &H2%
' Const mc07B8 = 1 ' &H1%
    On Error GoTo L4A1C4
    If  pv07A8 = m00DC And pv07A6 <> gv1A82 Then
        Exit Sub
    End If
    If  pv07AA > mc02D6 - 1 Then
        Exit Sub
    End If
    Select Case pv07A8
        Case m00DC
            l07B2 = pv07A6
        Case mc07B4
            l07B2 = m00DC
        Case mc07B6
            l07B2 = mc07B8
        Case Else
    End Select
    If  gv14C2(l07B2).M5857(pv07AA).M4ED4 > 0 Then
        If  gv14C2(l07B2).M5857(pv07AA).M5467 <> gv1426(gv14C2(l07B2).M5857(pv07AA).M4ED4).M5467 Then
            sub085B "ITEM SORTER: Remapping Item #" + LTrim$(Str$(pv07AA))
            If  gv14C2(l07B2).M5857(pv07AA).M5467 = -1 Then
                gv14C2(l07B2).M5857(pv07AA).M5467 = gv14C2(l07B2).M5857(pv07AA).M4ED4
            Else
                For l07AC = 0 To gv1BEC - 1
                    If  gv1426(l07AC).M5467 = gv14C2(l07B2).M5857(pv07AA).M5467 Then
                        gv14C2(l07B2).M5857(pv07AA).M4ED4 = l07AC
                        Exit For
                    End If
                Next l07AC
            End If
        End If
    End If
    If  pv07A8 = m00DC Then
        frmCharStat3!lblItem(pv07AA).FontBold = False
        frmCharStat3!lblItem(pv07AA).FontItalic = False
    Else
        If  pv07A8 = mc07B4 Then
            frmExchange!pnlItem(pv07AA).FontBold = False
            frmExchange!pnlItem(pv07AA).FontItalic = False
        Else
            frmExchange!pnlItem(pv07AA + mc02D6).FontBold = False
            frmExchange!pnlItem(pv07AA + mc02D6).FontItalic = False
        End If
    End If
    Select Case gv14C2(l07B2).M5857(pv07AA).M577E
        Case m031C
            l07B0 = " "
        Case mc02D8
            l07B0 = "¤"
        Case Else
    End Select
    l07AE = ""
    If  pv07A8 = m00DC Then
        frmCharStat3!lblItemStatus(pv07AA).Caption = l07B0
    Else
        l07AE = l07B0 + " "
    End If
    l07AE = l07AE + LTrim$(Str$(pv07AA + 1)) + ". "
    If  (pv07AA > 0 And gv14C2(l07B2).M5857(pv07AA).M4ED4 > 0) Or pv07AA = 0 Then
        l07AE = l07AE + fn12EF(gv14C2(l07B2).M5857(pv07AA).M4ED4, gv14C2(l07B2).M5857(pv07AA).M4EEE, gv14C2(l07B2).M5857(pv07AA).M4EBF, gv14C2(l07B2).M5857(pv07AA).M56DB)
    End If
    If  gv14C2(l07B2).M5857(pv07AA).M4EEE = m0386 Then
        If  gv1426(gv14C2(l07B2).M5857(pv07AA).M4ED4).M56DB > 0 Or gv14C2(l07B2).M5857(pv07AA).M56DB > 0 Then
            If  pv07A8 = m00DC Then
                frmCharStat3!lblItem(pv07AA).FontBold = True
            Else
                If  pv07A8 = mc07B4 Then
                    frmExchange!pnlItem(pv07AA).FontBold = True
                Else
                    frmExchange!pnlItem(pv07AA + mc02D6).FontBold = True
                End If
            End If
        Else
            If  pv07A8 = m00DC Then
                frmCharStat3!lblItem(pv07AA).FontBold = False
            Else
                If  pv07A8 = mc07B4 Then
                    frmExchange!pnlItem(pv07AA).FontBold = False
                Else
                    frmExchange!pnlItem(pv07AA + mc02D6).FontBold = False
                End If
            End If
        End If
        If  gv1426(gv14C2(l07B2).M5857(pv07AA).M4ED4).M572A <> False Then
            If  pv07A8 = m00DC Then
                frmCharStat3!lblItem(pv07AA).FontItalic = True
            Else
                If  pv07A8 = mc07B4 Then
                    frmExchange!pnlItem(pv07AA).FontItalic = True
                Else
                    frmExchange!pnlItem(pv07AA + mc02D6).FontItalic = True
                End If
            End If
        Else
            If  pv07A8 = m00DC Then
                frmCharStat3!lblItem(pv07AA).FontItalic = False
            Else
                If  pv07A8 = mc07B4 Then
                    frmExchange!pnlItem(pv07AA).FontItalic = False
                Else
                    frmExchange!pnlItem(pv07AA + mc02D6).FontItalic = False
                End If
            End If
        End If
    End If
    If  gv14C2(l07B2).M5857(pv07AA).M4ED4 < 1 Then
        If  pv07A8 = m00DC Then
            frmCharStat3!lblItem(pv07AA).FontBold = False
        Else
            If  pv07A8 = mc07B4 Then
                frmExchange!pnlItem(pv07AA).FontBold = False
            Else
                frmExchange!pnlItem(pv07AA + mc02D6).FontBold = False
            End If
        End If
    End If
    If  pv07A8 = m00DC Then
        frmCharStat3!lblItem(pv07AA).Caption = l07AE
    Else
        If  pv07A8 = mc07B4 Then
            frmExchange!pnlItem(pv07AA).Caption = l07AE
        Else
            frmExchange!pnlItem(pv07AA + mc02D6).Caption = l07AE
        End If
    End If
    Exit Sub

L4A1C4:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharShowItem.  Please Report."
    Resume L4A240
L4A240:
End Sub

Sub sub1602 ()
Dim l07BE As Integer ' 81
Dim l07C0 As Integer ' 81
Dim l07C2 ' 80
Dim l07C4 ' 80
Dim l07C6 As Integer ' 81
    If  frmCharStat3!cmbClass.ListCount = 0 Then
        For l07C2 = 0 To mc0768 - 1
            l07C6 = False
            For l07C4 = 0 To gv1BEA - 1
                If  gv145A(l07C4).M55F6(l07C2, 0) > 0 And gv14C2(gv1A86).M5584(l07C4).M4E82 > False And l07C6 = False Then
                    l07C6 = True
                    frmCharStat3!cmbClass.AddItem gv07B0$(l07C2)
                    frmCharStat3!cmbClass.ItemData(frmCharStat3!cmbClass.NewIndex) = l07C2
                    l07C0 = l07C0 + 1
                End If
            Next l07C4
        Next l07C2
        m007A = False
        If  l07C0 = 0 Then
            frmCharStat3!cmbClass.AddItem "NO SPELLS"
            frmCharStat3!cmbClass.Enabled = False
        End If
        frmCharStat3!cmbClass.ListIndex = 0
    Else
        l07BE = frmCharStat3!cmbClass.ListIndex
        frmCharStat3!cmbClass.ListIndex = -1
        frmCharStat3!cmbClass.ListIndex = l07BE
    End If
End Sub

Sub sub0EBF (ByVal pv07C8 As Integer ' 81, p07CA As Integer ' 41, p07CC As Integer ' 41)
Dim l07CE As String ' 87
    On Error GoTo L4A6D0
    If  p07CC = False Then Exit Sub
    If  gv14C2(pv07C8).M5829 = 0 Then
        l07CE = "his "
    Else
        l07CE = "her "
    End If
    If  UBound(gv14C2) > m00DC Then
        If  p07CC > False Then
            sub085B Chr(34) + RTrim(gv14C2(pv07C8).M548B) + Chr(34) + " had " + l07CE + gv05EE$(p07CA) + " increased by " + CStr(p07CC) + "."
        Else
            sub085B Chr(34) + RTrim(gv14C2(pv07C8).M548B) + Chr(34) + " had " + l07CE + gv05EE$(p07CA) + " decreased by " + CStr(Abs(p07CC)) + "."
        End If
    Else
        If  p07CC > False Then
            sub085B "Your " + gv05EE$(p07CA) + " has increased by " + CStr(p07CC) + "."
        Else
            sub085B "Your " + gv05EE$(p07CA) + " has decreased by " + CStr(Abs(p07CC)) + "."
        End If
    End If
    Exit Sub

L4A6D0:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharStatRaiseMessage."
    Resume L4A744
L4A744:
End Sub

Sub sub08A9 (p07D0 As Integer ' 41, p07D2 As Integer ' 41)
Dim l07D4 As Integer ' 81
Dim l07D6 ' 80
Dim l07D8 As Integer ' 81
' Const mc07E0 = 7 ' &H7%
    On Error GoTo L4AF0E
    If  (p07D2 = 9 Or p07D2 = 50) Then sub1617 gv1A86, 9
    If  (p07D2 = 10 Or p07D2 = 50) Then sub1617 gv1A86, 10
    l07D8 = gv1A82
    If  p07D0 = False And gv1A86 <> gv1A82 Then
        Exit Sub
    End If
    If  p07D2 = 1 Then
        frmCharStat1.Caption = Chr$(34) + RTrim(gv14C2(l07D8).M548B) + Chr$(34)
    End If
    If  p07D2 = 2 Or p07D2 = 50 Then
        frmCharStat1!lblRaceInfo.Caption = gv06B6$(gv14C2(l07D8).M5829) + " " + gv148E(gv14C2(l07D8).M5821).M548B + " (" + gv074C$(gv14C2(l07D8).M4EBF) + ")"
    End If
    If  p07D2 = 3 Or p07D2 = 50 Then
        frmCharStat1!lblGuildInfo.Caption = fn126E(l07D8) + " (" + LTrim$(Str$(gv14C2(l07D8).M5584(gv14C2(l07D8).M58BB).M4E82)) + ")"
    End If
    If  p07D2 = 4 Or p07D2 = 50 Then
        frmCharStat1!lblStat(0) = Str$(Int(gv14C2(l07D8).M5577 / mc0204))
    End If
    If  p07D2 = 5 Or p07D2 = 50 Then
        frmCharStat1!lblStat(1) = fn036D(CCur(gv14C2(l07D8).M5830), m04C0) + "/" + CStr(fn1338(l07D8))
    End If
    If  p07D2 = 6 Or p07D2 = 50 Then
        l07D4% = Int((gv14C2(l07D8).M5584(gv14C2(l07D8).M58BB).M4E82 / 2) + .5#)
        If  l07D4% < 1 Then l07D4% = 1
        frmCharStat1!lblStat(2) = Str$(l07D4%)
    End If
    If  p07D2 = 7 Or p07D2 = 50 Then
        If  gv14C2(l07D8).M4EAC < 0 Then
            gv14C2(l07D8).M4EAC = 0
        End If
        frmCharStat1!lblStat(3) = CStr(gv14C2(l07D8).M4EAC) + "/" + CStr(gv14C2(l07D8).M4EB4)
    End If
    If  p07D2 = 8 Or p07D2 = 50 Then
        frmCharStat1!lblStat(4) = CStr(Int(gv14C2(l07D8).M4E97)) + "/" + CStr(Int(gv14C2(l07D8).M4EA1))
    End If
    If  p07D2 = 9 Or p07D2 = 50 Then
        frmCharStat1!lblStat(5) = fn036D(CCur(gv14C2(l07D8).M579B), m04C0)
    End If
    If  p07D2 = 10 Or p07D2 = 50 Then
        frmCharStat1!lblStat(6) = fn036D(CCur(gv14C2(l07D8).M4F2D), m04C0)
        If  gv14C2(m00DC).M5470 = 0 Then
            If  fn03BD(frmCityBank) Then
                frmCityBank!lblCall = "GOLD"
            End If
        End If
    End If
    If  p07D2 = 11 Or p07D2 = 50 Then
        For l07D6 = 0 To mc0286 - 1
            frmCharStat1!lblStat(l07D6 + 7) = Str$(gv14C2(l07D8).M55B5(l07D6) + gv14C2(l07D8).M584B(l07D6))
            If  gv14C2(l07D8).M55B5(l07D6) >= gv148E(gv14C2(l07D8).M5821).M553C(l07D6) + 5 Then
                frmCharStat1!lblStat(l07D6 + 7).FontBold = True
            Else
                frmCharStat1!lblStat(l07D6 + 7).FontBold = False
            End If
        Next l07D6
    End If
    If  p07D2 = 12 Or p07D2 = 50 Then
        For l07D6 = 0 To mc07E0 - 1
            If  gv14C2(l07D8).M56B9(l07D6) <> 0 Then
                frmCharStat1!lblSpecial(l07D6).Visible = True
            Else
                frmCharStat1!lblSpecial(l07D6).Visible = False
            End If
        Next l07D6
    End If
    If  p07D2 = 13 Or p07D2 = 50 Then
        If  UBound(gv14C2) = False Then
            frmCharStat1!elaGroupInfo = "You are Alone"
        Else
            For l07D6 = 0 To UBound(gv14C2)
                If  gv14C2(l07D8).M548B = gv14C2(l07D6).M548B Then
                    frmCharStat1!elaGroupInfo.P?C024 = "Character" + Str(l07D6 + 1) + " of" + Str(UBound(gv14C2) + 1)
                End If
            Next l07D6
        End If
    End If
    Exit Sub

L4AF0E:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharStats"
    Resume L4AF76
L4AF76:
End Sub

Sub sub1631 (p07E2 As Integer ' 41, p07E4 As Integer ' 41, p07E6 As Integer ' 41)
    If  gv14C2(p07E2).M58CB(p07E4).M4ED4 > -1 Then
        gv14C2(p07E2).M58CB(p07E4).M4EAC = gv14C2(p07E2).M58CB(p07E4).M4EAC - p07E6
        If  gv14C2(p07E2).M58CB(p07E4).M4EAC <= False Then
            gv14C2(p07E2).M58CB(p07E4).M4EAC = False
            sub0CCC p07E2
        End If
    End If
End Sub

Sub sub0CA0 (ByVal pv07E8 As Integer ' 81, p07EA As Integer ' 41)
Dim l07EC As Integer ' 81
    l07EC = gv14C2(pv07E8).M4EAC
    gv14C2(pv07E8).M4EAC = gv14C2(pv07E8).M4EAC - p07EA
    If  gv14C2(pv07E8).M4EAC < False Then
        gv14C2(pv07E8).M4EAC = False
    End If
    If  UBound(gv14C2) > m00DC And gv1A84 <> pv07E8 Then
        If  gv14C2(pv07E8).M4EAC = False Then
            sub085B RTrim(gv14C2(pv07E8).M548B) + ", " + Chr(34) + "Aigh!" + Chr(34)
        Else
            If  (l07EC - gv14C2(pv07E8).M4EAC) >= (gv14C2(pv07E8).M4EB4 / 3) Then
                sub085B RTrim(gv14C2(pv07E8).M548B) + ", " + Chr(34) + "Ouch!  Hit for " + CStr(l07EC - gv14C2(pv07E8).M4EAC) + "!" + Chr(34)
            End If
        End If
    End If
End Sub

Sub sub1187 (ByVal pv07EE As Integer ' 81, p07F0 As Integer ' 41)
' called (ByVal p1%, p2%, p3%)
Dim l07F4 ' 80
    On Error GoTo L4B3C0
    If  gv14C2(pv07EE).M5857(p07F0).M56DB > 0 Then
        gv14C2(pv07EE).M5857(p07F0).M56DB = gv14C2(pv07EE).M5857(p07F0).M56DB - 1
        If  gv14C2(pv07EE).M5857(p07F0).M56DB = 0 Then
            Select Case gv1426(gv14C2(pv07EE).M5857(p07F0).M4ED4).M5709
                Case 23, 24, 25, 26, 27, 28, 30, 31
                    sub0EDA pv07EE, p07F0
                Case Else
                    sub0F61 pv07EE, m00DC, p07F0
            End Select
        Else
            sub0F61 pv07EE, m00DC, p07F0
        End If
        If  pv07EE = gv1A82 Then
            For l07F4 = 0 To mc0588 - 1
                sub0F4C l07F4
            Next l07F4
        End If
    End If
    Exit Sub
L4B3C0:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharSubtractItemUse"
    Resume L4B432
L4B432:
End Sub

Sub sub152F (p07F6 As Integer ' 41)
Dim l07F8 ' 80
' Const mc07FA = 9 ' &H9%
    If  gv1A66.M5F2C Then Exit Sub
    frmMain!picToolbar.Cls
    Select Case p07F6
        Case m05C2
            For l07F8 = False To mc07FA - 2
                frmMain!cmdTool(l07F8).Visible = True
            Next l07F8
        Case mc05C4
            For l07F8 = False To mc07FA - 2
                frmMain!cmdTool(l07F8).Visible = False
            Next l07F8
        Case Else
    End Select
    gv19D8 = p07F6
    sub08B9 True
End Sub

Function fn164C (ByVal p0800 As String ' 47, p0802 As String ' 47) As Variant ' 6
Dim l0804 As Integer ' 81
Dim l0806() As Integer ' 91
Dim l080C As Integer ' 81
Dim l080E As Integer ' 81
Dim l0810 As Integer ' 81
Dim l0812 As Integer ' 81
Dim l0814 As Integer ' 81
Dim l0816 As Long ' 82
Dim l0818 As String ' 87
' Const mc081E = 29 ' &H1D%
    On Error GoTo L4C1D6
    If  p0802 = "" Then
        Exit Function
    End If
    l0804 = 0
    l080E = 1
    l080C = 0
    gv1D6A = gv14C2(m00DC).M59BB
    gv1D6C = gv14C2(m00DC).M5470
    Do
        l0804 = l0804 + 1
        If  Mid$(p0802, l0804, 1) = gc01A2 Or l0804 = Len(p0802) Then
            l080C = l080C + 1
            If  l0804 = Len(p0802) Then
                l0804 = l0804 + 1
            End If
            ReDim Preserve l0806(l080C - 1)     As Integer
            l0806(l080C - 1) = Val(Mid$(p0802, l080E, l0804 - l080E))
            l080E = l0804 + 1
        End If
        If  l0804 >= Len(p0802) Then
            Exit Do
        End If
    Loop
    If  UBound(l0806) = False Then Exit Function
    If  p0800 = "EDITTELEPORT" Then
        If  l0806(1) < False Or l0806(1) > gv1864.M4216 Then
            Exit Function
        End If
        If  l0806(0) < False Or l0806(0) > gv1864.M420C Then
            Exit Function
        End If
        gv14C2(m00DC).M583F = l0806(0)
        gv14C2(m00DC).M5845 = l0806(1)
    Else
        Select Case gv14C2(m00DC).M5899
            Case mc01B6
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + l0806(0)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + l0806(1)
            Case mc01B8
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + l0806(1)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - l0806(0)
            Case mc01BA
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - l0806(0)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - l0806(1)
            Case mc01BC
                gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - l0806(1)
                gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + l0806(0)
        End Select
    End If
    If  gv14C2(m00DC).M583F < 1 Or gv14C2(m00DC).M583F > gv1864.M4216 Then
        l0810 = Abs(Int((gv14C2(m00DC).M583F - 1) / 30) * 30)
        If  gv14C2(m00DC).M583F < 1 Then
            gv14C2(m00DC).M583F = gv14C2(m00DC).M583F + l0810
        Else
            gv14C2(m00DC).M583F = gv14C2(m00DC).M583F - l0810
        End If
    End If
    If  gv14C2(m00DC).M5845 < 1 Or gv14C2(m00DC).M5845 > gv1864.M420C Then
        l0810 = Abs(Int((gv14C2(m00DC).M5845 - 1) / 30) * 30)
        If  gv14C2(m00DC).M5845 < 1 Then
            gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 + l0810
        Else
            gv14C2(m00DC).M5845 = gv14C2(m00DC).M5845 - l0810
        End If
    End If
    sub086D mc081E
    If  (p0800 = "TELEPORT" Or p0800 = "EDITTELEPORT") And UBound(l0806) > 1 Then
        If  l0806(2) <> 0 Then
            If  p0800 = "EDITTELEPORT" Then
                If  l0806(2) < 1 Or l0806(2) > mc01F8 Then
                    Exit Function
                End If
                gv14C2(m00DC).M5470 = l0806(2)
            Else
                If  Abs(l0806(2)) > 3 Then
                    If  l0806(2) < 0 Then
                        l0806(2) = -3
                    Else
                        l0806(2) = 3
                    End If
                End If
                gv14C2(m00DC).M5470 = gv14C2(m00DC).M5470 + l0806(2)
            End If
            l0810 = fn0A0B(m00DC)
            If  gv14C2(m00DC).M5470 < 0 Then
                gv14C2(m00DC).M5470 = 0
            End If
        End If
    End If
    If  gv14C2(m00DC).M5470 <= False Then
        If  UBound(gv14C2) = m00DC Then
            l0818 = "You have teleported hundreds of feet above the city and fallen to your death!"
        Else
            l0818 = "The party has teleported hundreds of feet above the city and fallen to their deaths!"
        End If
        gv14C2(m00DC).M5470 = 0
        MsgBox l0818, mc00A4, "Teleport"
        For l0804 = m00DC To UBound(gv14C2)
            sub091E l0804, mc04DC
        Next l0804
        Do
            gv1A84 = m00DC
            sub0930 gv1A84
        Loop While UBound(gv14C2) > m00DC
        gv1A84 = m00DC
        sub091E gv1A84, mc04DC
        sub0930 gv1A84
        fn164C = mc01A6
        Exit Function
    End If
    If  fn0380(mc01C4, fn0AD3(fn0AE8(gv14C2(m00DC)))) = True Or gv14C2(m00DC).M5470 > mc01F8 Then
        If  UBound(gv14C2) = m00DC Then
            sub085B "You teleported into solid rock!"
        Else
            sub085B Chr$(34) + RTrim(gv14C2(m00DC).M548B) + Chr$(34) + " teleported into solid rock!"
        End If
        l0812 = gv14C2(m00DC).M583F
        l0814 = gv14C2(m00DC).M5845
        If  gv14C2(m00DC).M5470 >= 1 And gv14C2(m00DC).M5470 <= mc01F8 Then
            If  l0812 > False And l0812 <= gv1864.M4216 And l0814 > False And l0814 <= gv1864.M420C Then
                l0816 = fn0A34(l0812, l0814)
                l0816 = fn0418(mc01C4, l0816, True)
                If  fn0ABD(l0812, l0814, l0816) = False Then
                    MsgBox "Error updating AutoMap!", mc00A4, "Error!"
                End If
                If  gv1D64 <> m01AA Then
                    frmAutoMap!lblCall = "DRAW"
                    frmAutoMap!lblCall = "UPDATE"
                End If
            End If
        End If
        If  gv14C2(m00DC).M5470 < False Then gv14C2(m00DC).M5470 = False
        If  gv14C2(m00DC).M5470 = False Then
            gv14C2(m00DC).M59BB = -1
        Else
            gv14C2(m00DC).M59BB = False
        End If
        sub0956
        Do
            gv1A84 = m00DC
            sub091E gv1A84, mc01C8
            sub0930 gv1A84
        Loop While UBound(gv14C2) > m00DC
        gv1A84 = m00DC
        sub091E gv1A84, mc01C8
        sub0930 gv1A84
        fn164C = mc01A6
    Else
        fn164C = True
        sub0835 gv1D6C
        sub0980
    End If
    If  gv1D64 <> m01AA Then
        frmAutoMap!lblCall = "UPDATE"
    End If
    Exit Function

L4C1D6:
    sub04FC "Error '" + Error + "' occurred in MAINMOD2:mdrcharTeleport"
    fn164C = False
    Resume L4C24C
L4C24C:
End Function

Function fn10A3 (ByVal pv0822 As Integer ' 81) As Integer ' 1
Dim l0824 As Integer ' 81
Dim l0826 As Integer ' 81
Dim l0828 As String ' 87
' Const mc082C = 124 ' &H7C%
' Const mc082E = 23 ' &H17%
' Const mc0830 = 20 ' &H14%
    l0824 = mc02FE
    If  gv14C2(pv0822).M5483 = mc01C8 Then
        l0824 = mc082C
        gv14C2(pv0822).M58E9 = False
    End If
    Beep
    If  UBound(gv14C2) = m00DC Then
        l0828 = Chr(34) + RTrim(gv14C2(pv0822).M58F9) + Chr(34) + " has initiated a raise on your character." + Chr$(13) + "Chance of success is" + Str$(gv14C2(pv0822).M58E9) + "%." + Chr(13) + "Do you accept?"
    Else
        l0828 = Chr(34) + RTrim(gv14C2(pv0822).M58F9) + Chr(34) + " has initiated a raise on " + Chr(34) + RTrim(gv14C2(pv0822).M548B) + Chr(34) + "." + Chr$(13) + "Chance of success is" + Str$(gv14C2(pv0822).M58E9) + "%." + Chr(13) + "Does " + Chr(34) + RTrim(gv14C2(pv0822).M548B) + Chr(34) + " accept?"
    End If
    If  MsgBox(l0828, 36, "RAISE") = mc00BE Then
        If  Int(Rnd * 100) > gv14C2(pv0822).M58E9 Then
            l0826 = MsgBox("Raise Failed!", mc00A4, "Raise Info")
            If  fn11A1(pv0822) = False Then
                Exit Function
            End If
        Else
            sub086D mc04E6
            l0826 = MsgBox("Success!", 64, "RAISE")
        End If
        If  gv14C2(pv0822).M5483 = mc0472 Then
            gv14C2(pv0822).M55B5(mc018E) = gv14C2(pv0822).M55B5(mc018E) - 1
            sub0EBF pv0822, mc018E, (-1)
            l0824 = mc04E8
        End If
        If  gv14C2(pv0822).M58DC = mc082E Then
            If  Rnd * 100 < (50 - gv14C2(pv0822).M55B5(mc018E) * 2) Then
                sub085B "MORGUE: " + Chr(34) + RTrim(gv14C2(pv0822).M548B) + Chr(34) + " lost a point of Constution during the raise."
                gv14C2(pv0822).M55B5(mc018E) = gv14C2(pv0822).M55B5(mc018E) - 1
            End If
        End If
        sub0EAE True, pv0822, l0824, False
        gv14C2(pv0822).M5483 = 0
        Select Case gv14C2(pv0822).M58DC
            Case mc0830, mc0474
                gv14C2(pv0822).M4EAC = 1
            Case mc0198, mc082E
                gv14C2(pv0822).M4EAC = gv14C2(pv0822).M4EB4
            Case Else
                gv14C2(pv0822).M4EAC = 1
        End Select
        sub0578 gv14C2(pv0822).M58BB, Chr$(34) + RTrim(gv14C2(pv0822).M548B) + Chr$(34) + " was resurrected by " + Chr$(34) + RTrim(gv14C2(pv0822).M58F9) + Chr$(34) + "."
        gv14C2(pv0822).M58F9 = " "
        gv14C2(pv0822).M58E9 = 0
        sub08A9 False, 50
        l0826 = fn04ED(gv14C2(pv0822))
        sub096E
        fn10A3 = True
    End If
End Function

Sub sub165F ()
Dim l0832 As Integer ' 81
Dim l0834 ' 80
' Const mc0836 = 32 ' &H20%
' Const mc083A = 3 ' &H3%
    Screen.MousePointer = mc04F2
    If  gv1ACC.M6008 Then
        Unload frmCityMain
    End If
    If  gv1ACC.M6014 Then
    End If
    If  UBound(gv14C2) > False Then
        sub085B "Disbanding Party..."
        If  MsgBox("Do you wish to Reload this Party when " + Chr$(34) + RTrim(gv14C2(m00DC).M548B) + Chr$(34) + " is loaded again?", mc0836 & mc00BC, "Save Party?") = mc00BE Then
            If  fn179B(True) = False Then
                MsgBox "Error saving party!", mc00A4, "Error!"
            End If
        Else
            l0832 = fn179B(False)
        End If
        Unload frmParty
    Else
        l0832 = fn179B(False)
    End If
    sub1673
    For l0834 = m00DC To UBound(gv14C2)
        l0832 = fn04ED(gv14C2(l0834))
    Next l0834
    If  UBound(gv14C2) > False Then
        For l0834 = 1 To UBound(gv14C2)
            sub04DC 1
        Next l0834
    End If
    If  gv14C2(m00DC).M5914(mc083A) = True Then
        l0832 = extfn0184("Loading Information", "Character", RTrim(gv14C2(m00DC).M548B), fn0360$(gv19E4) + "MORDOR.INI")
    Else
        If  fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "Character") = RTrim(gv14C2(m00DC).M548B) Then
            l0832 = extfn0184("Loading Information", "Character", "", fn0360$(gv19E4) + "MORDOR.INI")
        End If
    End If
    Screen.MousePointer = m0500
    gv1ACC.M6008 = False
    gv1ACC.M6023 = False
    gv1ACC.M6014 = False
End Sub

Sub sub1673 ()
    Screen.MousePointer = mc04F2
    sub15D6
    Unload frmDungeonMain
    Unload frmCityMain
    Unload frmParty
    Unload frmCharStat1
    Unload frmCharStat3
    Unload frmCharStat4
    Unload frmAutoMap
    Screen.MousePointer = m0500
End Sub

Sub sub0A7C (p0844 As Integer ' 41, p0846 As Integer ' 41, p0848 As Integer ' 41)
Dim l084A As Integer ' 81
Dim l084E As T5810 ' 8A
    On Error GoTo L4CF98
    l084A = FreeFile
    Open gv19E8 + gc1C74 + gc1C10 For Random As #l084A Len = mc01EC
        Get #l084A, gv1732(p0844).M5467, l084E
        l084E.M583F = gv14C2(gv1A86).M583F
        l084E.M5845 = gv14C2(gv1A86).M5845
        l084E.M5470 = gv14C2(gv1A86).M5470
        If  p0846 > 0 Then
            l084E.M58E9 = p0846
            l084E.M58F9 = RTrim(gv14C2(gv1A86).M548B)
            l084E.M58DC = p0848
            gv1732(p0844).M549C = p0846
        End If
        gv1732(p0844).M547A = gv14C2(gv1A86).M59BB
        gv1732(p0844).M5470 = gv14C2(gv1A86).M5470
        l084E.M59BB = gv14C2(gv1A86).M59BB
        l084E.M5470 = gv14C2(gv1A86).M5470
        Put #l084A, gv1732(p0844).M5467, l084E
    Close #l084A
    Exit Sub

L4CF98:
    sub04FC "Error '" + Error$ + "' updating Character Carried!"
    sub085B "Drop and pick up again. Err=" + Str$(Err)
    Exit Sub
End Sub

Sub sub168B ()
Dim l0850 As Single ' 83
Dim l0852 ' 80
    For l0852 = m00DC To UBound(gv14C2)
        If  gv1B1E(l0852) = False Or gv14C2(l0852).M5906(mc0794) = -1 Then
            gv1B1E(l0852) = Timer
            Exit Sub
        Else
            If  gv1ACC.M602F = False Then
                If  Timer < gv1B1E(l0852) Then
                    l0850 = (86340& - gv1B1E(l0852)) + Timer
                Else
                    l0850 = Timer - gv1B1E(l0852)
                End If
                gv14C2(l0852).M5906(mc0794) = gv14C2(l0852).M5906(mc0794) + l0850
            End If
            gv1B1E(l0852) = Timer
        End If
    Next l0852
End Sub

Sub sub08B9 (p085A As Integer ' 41)
Dim l085C ' 80
Dim l085E As Integer ' 81
Dim l0866 As T3751 ' 8A
    If  gv1A66.M5F2C Then Exit Sub
    frmMain!picToolbar.FontBold = False
    frmMain!picToolbar.FontItalic = False
    l085E = extfn00D1(frmMain!picToolbar.hDC, l0866)
    Select Case gv19D8
        Case m05C2
        Case mc05C4
            l085E = False
            If  p085A = False Then
                For l085C = False To mc0060 - 1
                    If  gv14C2(gv1A86).M5548(l085C) <> m0062(l085C) Then
                        l085E = True
                        Exit For
                    End If
                Next l085C
                If  l085E = False Then Exit Sub
            End If
            frmMain!picToolbar.Cls
            For l085C = False To mc0060 - 1
                sub09B8 frmMain!picToolbar, 1, 7 + (4 * l085C), Left(gv0620$(l085C), 3), mc0546
                If  gv14C2(gv1A86).M5548(l085C) > 0 Then
                    sub09B8 frmMain!picToolbar, 2, 7 + (4 * l085C), CStr(gv14C2(gv1A86).M5548(l085C)), m0544
                Else
                    sub09B8 frmMain!picToolbar, 2, 7 + (4 * l085C), " -", m0544
                End If
                m0062(l085C) = gv14C2(gv1A86).M5548(l085C)
            Next l085C
        Case Else
    End Select
End Sub

Sub sub1617 (ByVal pv0868 As Integer ' 81, p086A As Integer ' 41)
Dim l086C As String ' 87
    If  frmMain!picToolbar.Visible = False Then Exit Sub
    Select Case p086A
        Case 10
            frmMain!lblGold.Caption = "You have a total of " + fn036D(CCur(gv14C2(pv0868).M58AF + gv14C2(pv0868).M4F2D), m04C0) + " Gold."
        Case 9
            If  gv14C2(pv0868).M579B < fn124B(gv14C2(pv0868)) Then
                l086C = "You need " + fn036D(CCur(fn124B(gv14C2(pv0868)) - gv14C2(pv0868).M579B), m04C0) + " more experience for level " + CStr(gv14C2(pv0868).M5584(gv14C2(pv0868).M58BB).M4E82 + 1) + "."
            Else
                If  gv14C2(pv0868).M579B = gv14C2(pv0868).M5970 Then
                    l086C = "You are Pinned."
                Else
                    l086C = "You need " + fn036D(CCur(gv14C2(pv0868).M5970 - gv14C2(pv0868).M579B), m04C0) + " more experience to pin."
                End If
            End If
            frmMain!lblExperience.Caption = l086C
        Case Else
    End Select
End Sub

Sub sub1577 (ByVal pv086E As Integer ' 81, p0870 As Integer ' 41)
Dim l0872 ' 80
Dim l0874 As Integer ' 81
Dim l0876 As Integer ' 81
Dim l0878 As Integer ' 81
Dim l087A As Integer ' 81
Dim l087C As Integer ' 81
Dim l087E As Integer ' 81
Dim l0880 As Integer ' 81
' Const mc0882 = 4 ' &H4%
' Const mc0884 = 28 ' &H1C%
    On Error GoTo L4E56C
    If  gv14C2(pv086E).M5483 > False Then Exit Sub
    If  p0870 < 0 Or p0870 > mc02D6 Then Exit Sub
    If  p0870 < 0 Or p0870 > mc02D6 - 1 Then Exit Sub
    If  gv14C2(pv086E).M5857(p0870).M4ED4 < 1 And p0870 > 0 Then Exit Sub
    If  gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56B9 < 0 Then Exit Sub
    If  gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56DB <= 0 Then
        sub085B Chr$(34) + RTrim(gv14C2(pv086E).M548B) + Chr$(34) + ", the Item doesn't appear to do much of anything."
        Exit Sub
    End If
    If  gv14C2(pv086E).M5857(p0870).M56DB <= False Then
        sub085B Chr$(34) + RTrim(gv14C2(pv086E).M548B) + Chr$(34) + ", the Item is out of charges!"
        Exit Sub
    End If
    If  fn110D(pv086E, gv14C2(pv086E).M5857(p0870).M4ED4, True, 1) = False Then
        Exit Sub
    End If
    l0874 = gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56B9
    l0876 = gv14C2(pv086E).M5857(p0870).M4EBF
    l0878 = gv14C2(pv086E).M5857(p0870).M4ED4
    If  gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56C4 > 0 Then
        If  l0876 > 0 Then
            If  (gv14C2(pv086E).M4EBF + 1) <> l0876 Then
                sub085B "Nothing Happens."
                Exit Sub
            End If
        End If
        Select Case gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M5709
            Case 1 To 22, 29, 32, 33, 34
                If  gv14C2(pv086E).M5857(p0870).M577E <> mc02D8 Then
                    sub085B "Item must be Equipped to use!"
                    Exit Sub
                End If
            Case Else
        End Select
        l0880 = (gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56C4 - 1)
        If  l0880 >= False Then
            If  fn0EEF() > False And (gv1E38(0).M4ECC = mc0220 Or (gv1E38(0).M4ECC = m0294 And (fn1448(l0880) = gv1EE0 Or fn1448(l0880) = gc1EE4))) Then
                If  fn10E5(pv086E, gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56C4 - 1, gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M5734, False) = False Then Exit Sub
                gv1E38(0).M4ECC = mc0220
                sub0BDE -1
                gv1E66(pv086E).M4E97 = False
                gv1E66(pv086E).M56C4 = l0880 + 1000
                gv1E66(pv086E).M5766 = p0870
                sub0B9B
                sub0BCD
                Exit Sub
            Else
                If  fn1173(pv086E, gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M56C4 - 1, gv1426(gv14C2(pv086E).M5857(p0870).M4ED4).M5734, -1) = False Then Exit Sub
            End If
        End If
    End If
    If  pv086E > UBound(gv14C2) Then pv086E = UBound(gv14C2)
    sub1187 pv086E, p0870, 1
    l087A = False
    If  l0876 > 0 Then
        If  Abs((gv14C2(pv086E).M4EBF + 1) - l0876) = 1 Then
            sub085B "Nothing Happens."
            Exit Sub
        ElseIf Abs((gv14C2(pv086E).M4EBF + 1) - l0876) > 1 Then
            l087A = True
        End If
    End If
    l087C = False
    If  l0874 > 0 Then
        Select Case l0874
            Case 500 To 500 + (gv1BEA - 1)
            Case Else
                sub086D mc0882
        End Select
        Select Case l0874
            Case 1
                l087C = True
            Case 11
                If  l087A = False Then
                    gv14C2(pv086E).M5830 = gv14C2(pv086E).M5830 + 50
                    sub08A9 False, 5
                End If
            Case 12
                If  l087A = False Then
                    gv14C2(pv086E).M5830 = gv14C2(pv086E).M5830 + 200
                    sub08A9 False, 5
                End If
            Case 13
                If  l087A = False Then
                    gv14C2(pv086E).M5577 = gv14C2(pv086E).M5577 - mc0204
                    If  gv14C2(pv086E).M5577 < (16 * 365) Then
                        gv14C2(pv086E).M5577 = (16 * 365)
                        sub085B "You cannot get any younger."
                    Else
                        sub085B "You are now one year younger."
                    End If
                    sub08A9 False, 4
                End If
                l087C = True
            Case 14
                If  l087A = False Then
                    gv14C2(pv086E).M5577 = gv14C2(pv086E).M5577 - (mc0204 * 10)
                    If  gv14C2(pv086E).M5577 < (16 * 365) Then
                        gv14C2(pv086E).M5577 = (16 * 365)
                        sub085B "You cannot get any younger."
                    Else
                        sub085B "You are now ten years younger."
                    End If
                    sub08A9 False, 4
                End If
                l087C = True
            Case Else
        End Select
        If  l087C Then
            sub047C pv086E, m02F6
            For l0872 = 0 To mc0286 - 1
                If  gv1426(l0878).M571E(l0872) <> False Then
                    If  l087A = True And gv1426(l0878).M571E(l0872) > False Then
                        gv14C2(pv086E).M55B5(l0872) = gv14C2(pv086E).M55B5(l0872) - gv1426(l0878).M571E(l0872)
                        If  gv14C2(pv086E).M55B5(l0872) > gv148E(gv14C2(pv086E).M5821).M553C(l0872) + 5 Then
                            gv14C2(pv086E).M55B5(l0872) = gv148E(gv14C2(pv086E).M5821).M553C(l0872) + 5
                        Else
                            sub0EBF pv086E, l0872, -gv1426(l0878).M571E(l0872)
                        End If
                    Else
                        gv14C2(pv086E).M55B5(l0872) = gv14C2(pv086E).M55B5(l0872) + gv1426(l0878).M571E(l0872)
                        If  gv14C2(pv086E).M55B5(l0872) > gv148E(gv14C2(pv086E).M5821).M553C(l0872) + 5 Then
                            gv14C2(pv086E).M55B5(l0872) = gv148E(gv14C2(pv086E).M5821).M553C(l0872) + 5
                        Else
                            sub0EBF pv086E, l0872, gv1426(l0878).M571E(l0872)
                        End If
                        sub1043 l0872, pv086E, CCur(gv14C2(pv086E).M55B5(l0872))
                    End If
                End If
                If  gv14C2(pv086E).M55B5(l0872) < gv148E(gv14C2(pv086E).M5821).M5530(l0872) Then
                    gv14C2(pv086E).M55B5(l0872) = gv148E(gv14C2(pv086E).M5821).M5530(l0872)
                End If
            Next l0872
            sub047C pv086E, mc02F8
            l087E = fn1139(pv086E, True)
            If  gv1426(l0878).M5709 = 25 Then sub0EAE True, pv086E, mc0884, False
            frmCharStat1!picTabPicture.Refresh
            sub1602
        End If
        sub08A9 False, 50
    End If
    Exit Sub

L4E56C:
    sub04FC "Error '" + Error + "' Occurred in MAINMOD2:mdrcharUseItem.  Please Report."
    Resume L4E5E8
L4E5E8:
End Sub

Function fn16A0 (ByVal p0888 As String ' 47, ByVal p088A As String ' 47, ByVal p088C As String ' 47, ByVal p088E As String ' 47) As String ' 7
    On Error GoTo L4E72C
    Load frmInteract
    frmInteract.Caption = p0888
    frmInteract!lblQuestion.Caption = p088A
    frmInteract!txtQuestion.Text = p088C
    frmInteract.Tag = p088E
    Select Case p088E
        Case "TELEPORT", "DISPLACEMENT"
            frmInteract!txtQuestion.Top = frmInteract!txtQuestion.Top + frmInteract!txtQuestion.Height
    End Select
    frmInteract.Show mc05BC
    fn16A0 = frmInteract.Tag
    frmInteract.Hide
    Unload frmInteract

L4E71E:
    Exit Function

L4E72C:
    Set frmInteract = Nothing
    Resume L4E71E
End Function

Function fn16B8 (p0892 As String ' 47) As Integer ' 1
Dim l0894 ' 80
Dim l0896 As Integer ' 81
Dim l0898 As Variant ' 86
    For l0894 = 0 To gv1BF8 - 1
        If  Len(gv152A(l0894).M548B) >= Len(p0892) Then
            If  UCase$(Left$(gv152A(l0894).M548B, Len(p0892))) = UCase$(p0892) Then
                If  UCase$(p0892) = UCase$(gv152A(l0894).M548B) Then
                    l0898 = l0894
                    l0896 = 1
                    Exit For
                End If
                l0896 = l0896 + 1
                l0898 = l0894
            End If
        End If
    Next l0894
    If  l0896 = 0 Then
        sub085B "Spell not found!"
        fn16B8 = -1
        Exit Function
    End If
    If  l0896 > 1 Then
        sub085B "Spell name is ambiguous!"
        fn16B8 = -1
        Exit Function
    End If
    fn16B8 = l0898
End Function

Sub sub16CB ()
Dim l089E As Integer ' 81
Dim l08A0 ' 80
    On Error GoTo L4EA56
    Unload frmMenu
    gv1A82 = m00DC
    If  gv1A66.M5F2C = False Then
        frmMain!picToolbar.Visible = True
    End If
    sub148A
    sub16D8
    sub0BDE -1
    gv1B52 = True
    sub085B gc018A
    Do
        DoEvents
        sub0695
        DoEvents
        sub168B
        DoEvents
    Loop While gv1ACC.M6008 = False And gv1ACC.M6014 = False And gv1ACC.M6023 = False
    gv1B52 = False
    For l08A0 = m00DC To UBound(gv14C2)
        l089E = fn04ED(gv14C2(l08A0))
        gv1B1E(l08A0) = False
    Next l08A0
    If  gv1ACC.M6023 Then
        sub15D6
        sub165F
    End If
    sub1673
    frmMain!picToolbar.Visible = False
    frmMenu.Show
    Exit Sub

L4EA56:
    If  MsgBox("Base Error '" + Error$(Err) + "' has occurred at location" + Str$(Erl) + "." + Chr$(13) + "Attempt to continue?", mc00A4 & mc00BC, "Error!") = mc00BE Then
        Resume Next
    Else
        sub05F6
    End If
End Sub

Sub sub16EB ()
Dim l08A8 As String ' 87
    l08A8 = "This is the PUBLIC version of Mordor " + gc0186 + ", so please feel free to give it to your friends and distribute it as you wish!" + Chr(13) + Chr(13)
    l08A8 = l08A8 + "Order the full commercial release now for hundreds of additional monsters, items and over a dozen more levels to explore!" + Chr(13) + Chr(13)
    l08A8 = l08A8 + "For information on Ordering, see the About/Ordering Information section from the Main Menu!"
    MsgBox l08A8, mc02FC, "Public Version"
End Sub

Sub sub0F11 (ByVal pv08AA As Integer ' 81, p08AC As Long ' 42)
Dim l08AE As Integer ' 81
Dim l08B0 As Integer ' 81
    If  gv14C2(pv08AA).M579B >= gv14C2(pv08AA).M5970 Then
        l08AE = True
    End If
    If  gv14C2(pv08AA).M579B >= fn124B(gv14C2(pv08AA)) Then
        l08B0 = True
    End If
    p08AC = p08AC * (1 - ((UBound(gv14C2) * 2) * .02#))
    gv14C2(pv08AA).M579B = gv14C2(pv08AA).M579B + p08AC
    If  gv14C2(pv08AA).M579B >= gv14C2(pv08AA).M5970 Then
        l08B0 = True
        gv14C2(pv08AA).M579B = gv14C2(pv08AA).M5970
        If  l08AE = False Then
            If  UBound(gv14C2) = m00DC Then
                sub085B "You are now pinned."
            Else
                sub085B Chr$(34) + RTrim(gv14C2(pv08AA).M548B) + Chr$(34) + " is now pinned."
            End If
        End If
    End If
    If  gv14C2(pv08AA).M579B >= fn124B(gv14C2(pv08AA)) Then
        If  l08B0 = False Then
            If  UBound(gv14C2) = m00DC Then
                sub085B "You now have enough experience to make a level."
            Else
                sub085B Chr$(34) + RTrim(gv14C2(pv08AA).M548B) + Chr$(34) + " now has enough experience to make a level."
            End If
        End If
    End If
    sub08A9 False, 9
End Sub
