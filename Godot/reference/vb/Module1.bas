' Module1
Option Explicit
Declare Function extfn026A Lib "User" Alias "CloseClipboard" () As Integer ' 1
Declare Function extfn01B8 Lib "GDI" Alias "CreateDC" () As Integer ' 1
Declare Function extfn0200 Lib "User" Alias "DefWindowProc" () As Long ' 2
Declare Function extfn00B0 Lib "SETUPKIT.DLL" Alias "DiskSpaceFree" () As Long ' 2
Declare Function extfn027C Lib "User" Alias "EmptyClipboard" () As Integer ' 1
Declare Function extfn029D Lib "kernel" Alias "FindResource" (ByVal p1%, ByVal p2$, ByVal p3$) As Integer ' 1
Declare Sub extsub02DD Lib "kernel" Alias "FreeLibrary" (ByVal p1%)
Declare Function extfn02CD Lib "kernel" Alias "FreeResource" () As Integer ' 1
Declare Function extfn00E3 Lib "User" Alias "GetActiveWindow" () As Integer ' 1
Declare Function extfn0256 Lib "User" Alias "GetClipboardData" () As Integer ' 1
Declare Function extfn01E6 Lib "User" Alias "GetFreeSystemResources" (ByVal p1%) As Integer ' 1
Declare Function extfn0137 Lib "User" Alias "GetParent" (ByVal p1%) As Integer ' 1
Declare Function extfn0151 Lib "kernel" Alias "GetPrivateProfileInt" (ByVal p1$, ByVal p2$, ByVal p3%, ByVal p4$) As Integer ' 1
Declare Function extfn0169 Lib "kernel" Alias "GetPrivateProfileString" (ByVal p1$, ByVal p2$, ByVal p3$, ByVal p4$, ByVal p5%, ByVal p6$) As Integer ' 1
Declare Function extfn0211 Lib "GDI" Alias "GetStockObject" () As Integer ' 1
Declare Function extfn0086 Lib "User" Alias "GetSystemMenu" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Function extfn01D2 Lib "User" Alias "GetSystemMetrics" (ByVal p1%) As Integer ' 1
Declare Function extfn00D1 Lib "GDI" Alias "GetTextMetrics" (ByVal p1%, p2 As type) As Integer ' 1
Declare Function extfn01A1 Lib "kernel" Alias "GetWindowsDirectory" (ByVal p1$, ByVal p2%) As Integer ' 1
Declare Function extfn028E Lib "kernel" Alias "LoadLibrary" (ByVal p1$) As Integer ' 1
Declare Function extfn02AD Lib "kernel" Alias "LoadResource" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Function extfn02BD Lib "kernel" Alias "LockResource" (ByVal p1%) As Long ' 2
Declare Function extfn0231 Lib "User" Alias "OpenClipboard" () As Integer ' 1
Declare Function extfn0109 Lib "User" Alias "RealizePalette" (ByVal p1%) As Integer ' 1
Declare Function extfn0097 Lib "User" Alias "RemoveMenu" (ByVal p1%, ByVal p2%, ByVal p3%) As Integer ' 1
Declare Function extfn011B Lib "User" Alias "SelectPalette" (ByVal p1%, ByVal p2%, ByVal p3%) As Integer ' 1
Declare Function extfn0077 Lib "User" Alias "SendMessage" () As Long ' 2
Declare Function extfn0242 Lib "User" Alias "SetClipboardData" () As Integer ' 1
Declare Function extfn0144 Lib "User" Alias "SetParent" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Sub extsub00C1 Lib "User" Alias "SetWindowPos" ()
Declare Function extfn01C4 Lib "GDI" Alias "StretchBlt" (ByVal p1%, ByVal p2%, ByVal p3%, ByVal p4%, ByVal p5%, ByVal p6%, ByVal p7%, ByVal p8%, ByVal p9%, ByVal p10%, p11 As Any) As Integer ' 1
Declare Function extfn02EC Lib "kernel" Alias "GlobalUnlock" () As Integer ' 1
Declare Function extfn00F6 Lib "GDI" Alias "UnrealizeObject" () As Integer ' 1
Declare Function extfn0223 Lib "GDI" Alias "GetObject" () As Integer ' 1
Declare Function extfn00A5 Lib "kernel" Alias "WinExec" (ByVal p1$, ByVal p2%) As Integer ' 1
Declare Function extfn012C Lib "User" Alias "WinHelp" (ByVal p1%, ByVal p2$, ByVal p3%, ByVal p4&) As Integer ' 1
Declare Function extfn0184 Lib "kernel" Alias "WritePrivateProfileString" (ByVal p1$, ByVal p2$, ByVal p3$, ByVal p4$) As Integer ' 1
Const mc060E = 72 ' &H48%
Const mc0626 = 1 ' &H1%
Const mc0628 = 2 ' &H2%
Const mc062A = 3 ' &H3%
Const mc062C = 4 ' &H4%
Const mc062E = 5 ' &H5%
Const mc0630 = 6 ' &H6%
Const mc0632 = 7 ' &H7%
Const mc0634 = 8 ' &H8%
Const mc0636 = 9 ' &H9%
Const mc0638 = 10 ' &HA%
Const mc063A = 11 ' &HB%
Const mc063C = 12 ' &HC%
Const mc063E = 34 ' &H22%
Const mc0640 = 36 ' &H24%
Const mc0642 = 35 ' &H23%
Const mc0644 = 37 ' &H25%
Const mc0646 = 38 ' &H26%
Const mc0648 = 39 ' &H27%
Const mc064A = 40 ' &H28%
Const mc064C = 41 ' &H29%
Const mc064E = 15 ' &HF%
Const mc0650 = 13 ' &HD%
Const mc0652 = 14 ' &HE%
Const mc0654 = 16 ' &H10%
Const mc0656 = 18 ' &H12%
Const mc0658 = 19 ' &H13%
Const mc065A = 20 ' &H14%
Const mc065C = 21 ' &H15%
Const mc065E = 22 ' &H16%
Const mc0660 = 23 ' &H17%
Const mc0662 = 24 ' &H18%
Const mc0664 = 25 ' &H19%
Const mc0666 = 17 ' &H11%
Const mc0668 = 28 ' &H1C%
Const mc066A = 33 ' &H21%
Const mc066C = 29 ' &H1D%
Const mc066E = 30 ' &H1E%
Const mc0670 = 31 ' &H1F%
Const mc0672 = 32 ' &H20%
Const mc0674 = 26 ' &H1A%
Const mc0676 = 27 ' &H1B%
Const mc0678 = 42 ' &H2A%
Const mc067A = 43 ' &H2B%
Const mc067C = 44 ' &H2C%
Const mc067E = 45 ' &H2D%
Const mc0680 = 46 ' &H2E%
Const mc0682 = 47 ' &H2F%
Const mc0684 = 48 ' &H30%
Const mc0686 = 49 ' &H31%
Const mc0688 = 50 ' &H32%
Const mc068A = 51 ' &H33%
Const mc068C = 52 ' &H34%
Const mc068E = 53 ' &H35%
Const mc0690 = 54 ' &H36%
Const mc0692 = 55 ' &H37%
Const mc0694 = 56 ' &H38%
Const mc0696 = 57 ' &H39%
Const mc0698 = 58 ' &H3A%
Const mc069A = 59 ' &H3B%
Const mc069C = 60 ' &H3C%
Const mc069E = 61 ' &H3D%
Const mc06A0 = 62 ' &H3E%
Const mc06A2 = 63 ' &H3F%
Const mc06A4 = 64 ' &H40%
Const mc06A6 = 65 ' &H41%
Const mc06A8 = 66 ' &H42%
Const mc06AA = 67 ' &H43%
Const mc06AC = 68 ' &H44%
Const mc06AE = 69 ' &H45%
Const mc06B0 = 70 ' &H46%
Const mc06B2 = 71 ' &H47%
Const mc06E4 = 48 ' &H30%

Sub sub02FE (p05D4 As Form ' 49)
    p05D4.Left = (Screen.Width / 2) - (p05D4.Width / 2)
    p05D4.Top = (Screen.Height / 2) - (p05D4.Height / 2)
End Sub

Function fn030F (p05DC As Integer ' 41, p05DE As Integer ' 41) As Integer ' 1
Dim l05E0 As Single ' 83
Dim l05E2 As Integer ' 81
    l05E0 = gv145A(p05DE).M560D
    l05E2 = (l05E0 + l05E0 * 2.97#) * gv1426(p05DC).M560D
    If  l05E2 < 1 Then
        l05E2 = 1
    End If
    fn030F = l05E2
End Function

Function fn0326 (p05E6 As String ' 47) As Integer ' 1
    If  Left$(p05E6, 4) <> Left$(gc0186, 4) Then
        fn0326 = True
    End If
End Function

Function fn0339 (ByVal p05EA As String ' 47) As String ' 7
Dim l05EC ' 80
    fn0339$ = ""
    If  Len(p05EA$) Then
        For l05EC = Len(p05EA$) To 1 Step -1
            If  Mid$(p05EA$, l05EC, 1) = "\" Or Mid$(p05EA$, l05EC, 1) = ":" Or l05EC = 1 Then
                If  l05EC > 1 Then
                    fn0339$ = Right$(p05EA$, Len(p05EA$) - l05EC)
                Else
                    fn0339$ = Right$(p05EA$, Len(p05EA$))
                End If
                Exit For
            End If
        Next l05EC
    End If
End Function

Function fn034F (ByVal p05F0 As String ' 47) As Integer ' 1
Dim l05F2 As Integer ' 81
    If  InStr(p05F0$, Chr$(0)) Then
        p05F0$ = Left$(p05F0$, InStr(p05F0$, Chr$(0)) - 1)
    End If
    If  InStr(p05F0$, Chr$(32)) Then
        p05F0$ = Left$(p05F0$, InStr(p05F0$, Chr$(32)) - 1)
    End If
    If  Len(fn0339$(p05F0$)) > 12 Then
        fn034F% = False
        Exit Function
    End If
    On Error GoTo LFD4
    l05F2 = FreeFile
    Open p05F0$ For Input As #l05F2
    Close #l05F2
    fn034F% = True
    Exit Function
LFD4:
    Select Case Err
        Case 70
            fn034F% = True
        Case Else
            fn034F% = False
    End Select
    Resume L101A
L101A:
End Function

Function fn0360 (p05F6 As String ' 47) As String ' 7
    If  Right$(p05F6$, 1) <> "\" Then
        fn0360 = p05F6$ + "\"
    Else
        fn0360 = p05F6$
    End If
End Function

Function fn036D (p05FA As Currency ' 45, p05FC As Integer ' 41) As String ' 7
Dim l05FE As String ' 87
    On Error GoTo L1132
    Select Case p05FC
        Case gv015A
            If  p05FA <> 0 Then
                l05FE = Format$(p05FA, "###,###,###,###,###")
                If  Len(l05FE) = 0 Then l05FE = "0"
                fn036D = l05FE
            Else
                fn036D = "0"
            End If
        Case Else
    End Select
    Exit Function

L1132:
    Resume L113E
L113E:
End Function

Function fn0380 (ByVal pv0602 As Integer ' 81, ByVal pv0604 As Currency ' 85) As Integer ' 1
    If  (pv0604 And gv1B9E(pv0602)) Then
        fn0380 = True
    Else
        fn0380 = False
    End If
End Function

Sub sub038D ()
Dim l060C ' 80
' Const mc060E = 72 ' &H48%
Static m0624 As Integer ' 61
' Const mc0626 = 1 ' &H1%
' Const mc0628 = 2 ' &H2%
' Const mc062A = 3 ' &H3%
' Const mc062C = 4 ' &H4%
' Const mc062E = 5 ' &H5%
' Const mc0630 = 6 ' &H6%
' Const mc0632 = 7 ' &H7%
' Const mc0634 = 8 ' &H8%
' Const mc0636 = 9 ' &H9%
' Const mc0638 = 10 ' &HA%
' Const mc063A = 11 ' &HB%
' Const mc063C = 12 ' &HC%
' Const mc063E = 34 ' &H22%
' Const mc0640 = 36 ' &H24%
' Const mc0642 = 35 ' &H23%
' Const mc0644 = 37 ' &H25%
' Const mc0646 = 38 ' &H26%
' Const mc0648 = 39 ' &H27%
' Const mc064A = 40 ' &H28%
' Const mc064C = 41 ' &H29%
' Const mc064E = 15 ' &HF%
' Const mc0650 = 13 ' &HD%
' Const mc0652 = 14 ' &HE%
' Const mc0654 = 16 ' &H10%
' Const mc0656 = 18 ' &H12%
' Const mc0658 = 19 ' &H13%
' Const mc065A = 20 ' &H14%
' Const mc065C = 21 ' &H15%
' Const mc065E = 22 ' &H16%
' Const mc0660 = 23 ' &H17%
' Const mc0662 = 24 ' &H18%
' Const mc0664 = 25 ' &H19%
' Const mc0666 = 17 ' &H11%
' Const mc0668 = 28 ' &H1C%
' Const mc066A = 33 ' &H21%
' Const mc066C = 29 ' &H1D%
' Const mc066E = 30 ' &H1E%
' Const mc0670 = 31 ' &H1F%
' Const mc0672 = 32 ' &H20%
' Const mc0674 = 26 ' &H1A%
' Const mc0676 = 27 ' &H1B%
' Const mc0678 = 42 ' &H2A%
' Const mc067A = 43 ' &H2B%
' Const mc067C = 44 ' &H2C%
' Const mc067E = 45 ' &H2D%
' Const mc0680 = 46 ' &H2E%
' Const mc0682 = 47 ' &H2F%
' Const mc0684 = 48 ' &H30%
' Const mc0686 = 49 ' &H31%
' Const mc0688 = 50 ' &H32%
' Const mc068A = 51 ' &H33%
' Const mc068C = 52 ' &H34%
' Const mc068E = 53 ' &H35%
' Const mc0690 = 54 ' &H36%
' Const mc0692 = 55 ' &H37%
' Const mc0694 = 56 ' &H38%
' Const mc0696 = 57 ' &H39%
' Const mc0698 = 58 ' &H3A%
' Const mc069A = 59 ' &H3B%
' Const mc069C = 60 ' &H3C%
' Const mc069E = 61 ' &H3D%
' Const mc06A0 = 62 ' &H3E%
' Const mc06A2 = 63 ' &H3F%
' Const mc06A4 = 64 ' &H40%
' Const mc06A6 = 65 ' &H41%
' Const mc06A8 = 66 ' &H42%
' Const mc06AA = 67 ' &H43%
' Const mc06AC = 68 ' &H44%
' Const mc06AE = 69 ' &H45%
' Const mc06B0 = 70 ' &H46%
' Const mc06B2 = 71 ' &H47%
    ReDim gv1E7C(gc02D2)               As Integer
    ReDim gv1AEC(gc02D2)              As Integer
    gv1B9E(0) = 1
    For l060C = 1 To UBound(gv1B9E)
        gv1B9E(l060C) = gv1B9E(l060C - 1) * 2
    Next l060C
    gv19E8 = fn0360$(gv19E8)
    ReDim gv20CA(mc060E - 1)            As String
    ReDim gv20FE(mc060E - 1)       As T71F8
    ReDim gv2130(0)        As Integer
    gv20CA(m0624) = "FIGHT.WAV"
    gv20CA(mc0626) = "DIE.WAV"
    gv20CA(mc0628) = "HIT.WAV"
    gv20CA(mc062A) = "KILL.WAV"
    gv20CA(mc062C) = "MAGIC.WAV"
    gv20CA(mc062E) = "OPEN.WAV"
    gv20CA(mc0630) = "FALL.WAV"
    gv20CA(mc0632) = "BLACKOUT.WAV"
    gv20CA(mc0634) = "SCURRY.WAV"
    gv20CA(mc0636) = "MOAN.WAV"
    gv20CA(mc0638) = "DSTSLAM.WAV"
    gv20CA(mc063A) = "RAISE.WAV"
    gv20CA(mc063C) = "STEAL.WAV"
    gv20CA(mc063E) = "BYE.WAV"
    gv20CA(mc0640) = "SWING.WAV"
    gv20CA(mc0642) = "OUCH.WAV"
    gv20CA(mc0644) = "PARAL.WAV"
    gv20CA(mc0646) = "POISON.WAV"
    gv20CA(mc0648) = "DISEASE.WAV"
    gv20CA(mc064A) = "BETTER.WAV"
    gv20CA(mc064C) = "FOUND.WAV"
    gv20CA(mc064E) = "GOBLIN.WAV"
    gv20CA(mc0650) = "BUG.WAV"
    gv20CA(mc0652) = "SLIME.WAV"
    gv20CA(mc0654) = "DOG.WAV"
    gv20CA(mc0656) = "SNAKE.WAV"
    gv20CA(mc0658) = "UNDEAD.WAV"
    gv20CA(mc065A) = "WATERD.WAV"
    gv20CA(mc065C) = "GIANT.WAV"
    gv20CA(mc065E) = "MYTHIC.WAV"
    gv20CA(mc0660) = "LYCAN.WAV"
    gv20CA(mc0662) = "MAGE.WAV"
    gv20CA(mc0664) = "WARRIOR.WAV"
    gv20CA(mc0666) = "DEVIL.WAV"
    gv20CA(mc0668) = "FIRE.WAV"
    gv20CA(mc066A) = "SHOCK.WAV"
    gv20CA(mc066C) = "TELEPORT.WAV"
    gv20CA(mc066E) = "DI-DEMON.WAV"
    gv20CA(mc0670) = "DI-HUMAN.WAV"
    gv20CA(mc0672) = "DI-ANIM.WAV"
    gv20CA(mc0674) = "WATER.WAV"
    gv20CA(mc0676) = "WATER1.WAV"
    gv20CA(mc0678) = "COLD.WAV"
    gv20CA(mc067A) = "EXPLOS.WAV"
    gv20CA(mc067C) = "MAGIC2.WAV"
    gv20CA(mc067E) = "WADE.WAV"
    gv20CA(mc0680) = "SLICE.WAV"
    gv20CA(mc0682) = "DRAIN.WAV"
    gv20CA(mc0684) = "FEAR.WAV"
    gv20CA(mc0686) = "SLIMETR.WAV"
    gv20CA(mc0688) = "SPIT.WAV"
    gv20CA(mc068A) = "STONE.WAV"
    gv20CA(mc068C) = "WITHER.WAV"
    gv20CA(mc068E) = "MAKELEV.WAV"
    gv20CA(mc0690) = "BUGDIE.WAV"
    gv20CA(mc0692) = "RIP.WAV"
    gv20CA(mc0694) = "HELP.WAV"
    gv20CA(mc0696) = "DEMON.WAV"
    gv20CA(mc0698) = "DRAGON.WAV"
    gv20CA(mc069A) = "BIRD.WAV"
    gv20CA(mc069C) = "BIRDDIE.WAV"
    gv20CA(mc069E) = "EXTING.WAV"
    gv20CA(mc06A0) = "HELLO.WAV"
    gv20CA(mc06A2) = "YEECH.WAV"
    gv20CA(mc06A4) = "DI-UNDEA.WAV"
    gv20CA(mc06A6) = "FOG.WAV"
    gv20CA(mc06A8) = "MESSAGE.WAV"
    gv20CA(mc06AA) = "DROWN.WAV"
    gv20CA(mc06AC) = "ASMO.WAV"
    gv20CA(mc06AE) = "PLANTATT.WAV"
    gv20CA(mc06B0) = "BSTAB.WAV"
    gv20CA(mc06B2) = "CHIT.WAV"
    ReDim gv0972$(gc03FA - 1)
    gv0972$(0) = "Melted"
    gv0972$(1) = "Fried"
    gv0972$(2) = "Froze"
    gv0972$(3) = "Scared"
    gv0972$(4) = "Drained"
    gv0972$(5) = "Electrocuted"
    gv0972$(6) = "Dispelled"
    gv0972$(7) = "Banished"
    gv0972$(8) = "Dazzled"
    gv0972$(9) = "Immolated"
    gv0972$(10) = "Shocked"
    gv0972$(11) = "Slept"
    gv0972$(12) = "Choked"
    gv0972$(13) = "Killed"
    gv0972$(14) = "Rotted"
    gv0972$(15) = "Stoned"
    gv0972$(16) = "Teleported"
    ReDim gv0940$(gc03F4 - 1)
    gv0940$(0) = "1+ Level Below"
    gv0940$(1) = "Same Level and Below"
    gv0940$(2) = "Same Level"
    gv0940$(3) = "Same Type"
    gv0940$(4) = "Slaves"
    gv0940$(5) = "Disciples"
    gv0940$(6) = "Slaves or Disciples"
    gv0940$(7) = "Specific Monster"
    ReDim gv08AA$(gc03EE)
    gv08AA$(0) = "Not Trapped"
    gv08AA$(1) = "Poison Gas"
    gv08AA$(2) = "Disease Spores"
    gv08AA$(3) = "Exploding Trap"
    gv08AA$(4) = "Fire Trap"
    gv08AA$(5) = "Slime"
    gv08AA$(6) = "Fate"
    gv08AA$(7) = "Teleporter"
    gv08AA$(8) = "Blackout"
    gv08AA$(9) = "Fear"
    gv08AA$(10) = "Withering"
    ReDim gv058A$(gc03EC - 1)
    gv058A$(0) = "None"
    gv058A$(1) = "Fight"
    gv058A$(2) = "Defend"
    gv058A$(3) = "Spell"
    ReDim gv0878$(gc03EA - 1)
    gv0878$(0) = "Container"
    gv0878$(1) = "Box"
    gv0878$(2) = "Chest"
    ReDim gv0846$(gc03E8)
    gv0846$(0) = "Zero"
    gv0846$(1) = "One"
    gv0846$(2) = "Two"
    gv0846$(3) = "Three"
    gv0846$(4) = "Four"
    gv0846$(5) = "Five"
    gv0846$(6) = "Six"
    gv0846$(7) = "Seven"
    gv0846$(8) = "Eight"
    gv0846$(9) = "Nine"
    gv0846$(10) = "Ten"
    gv0846$(11) = "A Lot"
    ReDim gv07E2$(gc03E0)
    gv07E2$(0) = "Poisoned"
    gv07E2$(1) = "Diseased"
    gv07E2$(2) = "Paralyzed"
    gv07E2$(3) = "Levitating"
    gv07E2$(4) = "Invisible"
    gv07E2$(5) = "See Invisible"
    gv07E2$(6) = "Protected"
    ReDim gv0814$(gc03E2)
    gv0814$(0) = "Dead"
    gv0814$(1) = "Stoned"
    gv0814$(2) = "Destroyed"
    gv0814$(3) = "Immolated"
    gv0814$(4) = "Frozen"
    gv0814$(5) = "Annihalated"
    gv0814$(6) = "Melted"
    gv0814$(7) = "Rock"
    ReDim gv07B0$(gc03D8)
    gv07B0$(0) = "Fire"
    gv07B0$(1) = "Cold"
    gv07B0$(2) = "Electrical"
    gv07B0$(3) = "Mind"
    gv07B0$(4) = "Damage"
    gv07B0$(5) = "Element"
    gv07B0$(6) = "Kill"
    gv07B0$(7) = "Charm"
    gv07B0$(8) = "Bind"
    gv07B0$(9) = "Heal"
    gv07B0$(10) = "Movement"
    gv07B0$(11) = "Banish"
    gv07B0$(12) = "Dispell"
    gv07B0$(13) = "Resistant"
    gv07B0$(14) = "Visual"
    gv07B0$(15) = "Magical"
    gv07B0$(16) = "Location"
    gv07B0$(17) = "Protection"
    ReDim gv05BC$(gc03D6 - 1)
    gv05BC$(0) = "Very Small"
    gv05BC$(1) = "Small"
    gv05BC$(2) = "Normal"
    gv05BC$(3) = "Big"
    gv05BC$(4) = "Very Big"
    gv05BC$(5) = "Huge"
    ReDim gv05EE$(gc03CA - 1)
    gv05EE$(0) = "Strength"
    gv05EE$(1) = "Intelligence"
    gv05EE$(2) = "Wisdom"
    gv05EE$(3) = "Constitution"
    gv05EE$(4) = "Charisma"
    gv05EE$(5) = "Dexterity"
    ReDim gv0620$(gc03D0 - 1)
    gv0620$(0) = "Fire"
    gv0620$(1) = "Cold"
    gv0620$(2) = "Electrical"
    gv0620$(3) = "Mind"
    gv0620$(4) = "Disease"
    gv0620$(5) = "Poison"
    gv0620$(6) = "Magic"
    gv0620$(7) = "Stone"
    gv0620$(8) = "Paralysis"
    gv0620$(9) = "Drain"
    gv0620$(10) = "Acid"
    ReDim gv0652$(gc03CC - 1)
    gv0652$(0) = "Thieving"
    gv0652$(1) = "Backstabbing"
    gv0652$(2) = "Critical Hit"
    gv0652$(3) = "Multiple Swings"
    gv0652$(4) = "Fighting"
    gv0652$(5) = "Perception"
    ReDim gv08DC$(gc03F0 - 1)
    gv08DC$(0) = "See Invisible"
    gv08DC$(1) = "Invisible"
    gv08DC$(2) = "Resistant to All Magic"
    gv08DC$(3) = "Charm Resistant"
    gv08DC$(4) = "Weapon Resistance"
    gv08DC$(5) = "Complete Weapon Resistance"
    ReDim gv0684$(gc03CE - 1)
    gv0684$(0) = "Levitate"
    gv0684$(1) = "Invisible"
    gv0684$(2) = "Protect"
    gv0684$(3) = "See Invisible"
    gv0684$(4) = "Critical Hit"
    gv0684$(5) = "Backstab"
    ReDim gv090E$(gc03F2 - 1)
    gv090E$(0) = "Poison"
    gv090E$(1) = "Disease"
    gv090E$(2) = "Paralyze"
    gv090E$(3) = "Breathe Fire"
    gv090E$(4) = "Breathe Cold"
    gv090E$(5) = "Acid"
    gv090E$(6) = "Electrocute"
    gv090E$(7) = "Drain"
    gv090E$(8) = "Stone"
    gv090E$(9) = "Age"
    gv090E$(10) = "Critical Hit"
    gv090E$(11) = "Backstab"
    gv090E$(12) = "Destroy Item"
    gv090E$(13) = "Steal"
    ReDim gv06B6$(1)
    gv06B6$(0) = "Male"
    gv06B6$(1) = "Female"
    ReDim gv06E8$(gc03D2 - 1)
    gv06E8$(0) = "North"
    gv06E8$(1) = "East"
    gv06E8$(2) = "South"
    gv06E8$(3) = "West"
    ReDim gv074C$(gc03D4 - 1)
    gv074C$(0) = "Good"
    gv074C$(1) = "Neutral"
    gv074C$(2) = "Evil"
    ReDim gv077E$(gc03E6 - 1)
    gv077E$(0) = "(u)"
    gv077E$(1) = "(g)"
    gv077E$(2) = "(n)"
    gv077E$(3) = "(e)"
    ReDim gv194E(gc02CC)                 As String
    gv194E(0) = "Right Wall"
    gv194E(1) = "Upper Wall"
    gv194E(2) = "Right Door"
    gv194E(3) = "Upper Door"
    gv194E(4) = "Right SDoor"
    gv194E(5) = "Upper SDoor"
    gv194E(6) = "Face North"
    gv194E(7) = "Face East"
    gv194E(8) = "Face South"
    gv194E(9) = "Face West"
    gv194E(10) = "Extinguish"
    gv194E(11) = "Pit"
    gv194E(12) = "Stairs Up"
    gv194E(13) = "Stairs Down"
    gv194E(14) = "Teleporter"
    gv194E(15) = "Water"
    gv194E(16) = "Quicksand"
    gv194E(17) = "Rotator"
    gv194E(18) = "Anti-Magic"
    gv194E(19) = "Rock"
    gv194E(20) = "Fog"
    gv194E(21) = "Chute"
    gv194E(22) = "Stud"
    ReDim gv1BB6(gc02D6 - 1)       As T424C
    gv1BB6(0).M4216 = 11
    gv1BB6(0).M420C = 79
    gv1BB6(0).M425F = False
    gv1BB6(1).M4216 = 5
    gv1BB6(1).M420C = 53
    gv1BB6(1).M425F = gv1BB6(0).M425F + gv1BB6(0).M4216
    gv1BB6(2).M4216 = 40
    gv1BB6(2).M420C = 53
    gv1BB6(2).M425F = gv1BB6(1).M425F + gv1BB6(1).M4216
    gv1BB6(3).M4216 = 10
    gv1BB6(3).M420C = 28
    gv1BB6(3).M425F = gv1BB6(2).M425F + gv1BB6(2).M4216
    gv1BB6(4).M4216 = 7
    gv1BB6(4).M420C = 28
    gv1BB6(4).M425F = gv1BB6(3).M425F + gv1BB6(3).M4216
    gv1BB6(5).M4216 = 18
    gv1BB6(5).M420C = 28
    gv1BB6(5).M425F = gv1BB6(4).M425F + gv1BB6(4).M4216
    gv1BB6(6).M4216 = 9
    gv1BB6(6).M420C = 52
    gv1BB6(6).M425F = gv1BB6(5).M425F + gv1BB6(5).M4216
    gv1BB6(7).M4216 = 18
    gv1BB6(7).M420C = 28
    gv1BB6(7).M425F = gv1BB6(6).M425F + gv1BB6(6).M4216
    ReDim gv14C2(gv015C) As T5810
    gv14C2(gv015C).M548B = " "
    sub03A2
End Sub

Sub sub03A2 ()
    gv19C2(gv0518).M5E20 = 4110
    gv19C2(gv0518).M5E2D = 5520
    gv19C2(gv0518).M5E3B = 8.5#
    gv19C2(gc0526).M5E20 = 7320
    gv19C2(gc0526).M5E2D = 3450
    gv19C2(gc0526).M5E3B = 8.5#
    gv19C2(gc0530).M5E20 = 6315
    gv19C2(gc0530).M5E2D = 4350
    gv19C2(gc0530).M5E3B = 8.5#
    gv19C2(gc052A).M5E20 = 5340
    gv19C2(gc052A).M5E2D = 3825
    gv19C2(gc052A).M5E3B = 8.5#
    gv19C2(gc0528).M5E20 = 7290
    gv19C2(gc0528).M5E2D = 4785
    gv19C2(gc0528).M5E3B = 8.5#
    gv19C2(gc0522).M5E20 = 6630
    gv19C2(gc0522).M5E2D = 4485
    gv19C2(gc0522).M5E3B = 8.5#
    gv19C2(gc0532).M5E20 = 3600
    gv19C2(gc0532).M5E2D = 2310
    gv19C2(gc0532).M5E3B = 8.5#
    gv19C2(gc0538).M5E20 = 5145
    gv19C2(gc0538).M5E2D = 2160
    gv19C2(gc0538).M5E3B = 8.5#
    gv19C2(gc052C).M5E20 = 7320
    gv19C2(gc052C).M5E2D = 3450
    gv19C2(gc052C).M5E3B = 8.5#
    gv19C2(gc052E).M5E20 = 3900
    gv19C2(gc052E).M5E2D = 1875
    gv19C2(gc052E).M5E3B = 8.5#
    gv19C2(gc051C).M5E20 = 4185
    gv19C2(gc051C).M5E2D = 3510
    gv19C2(gc051C).M5E3B = 8.5#
    gv19C2(gc051E).M5E20 = 7125
    gv19C2(gc051E).M5E2D = 1560
    gv19C2(gc051E).M5E3B = 8.5#
    gv19C2(gc0534).M5E20 = 4485
    gv19C2(gc0534).M5E2D = 1890
    gv19C2(gc0534).M5E3B = 8.5#
    gv19C2(gc0536).M5E20 = 458
    gv19C2(gc0536).M5E2D = 493
    gv19C2(gc0536).M5E3B = 8.5#
End Sub

Function fn03BD (p06B8 As Form ' 49) As Integer ' 1
Dim l06BA ' 80
    For l06BA = False To Forms.Count - 1
        If  Forms(l06BA) Is p06B8 Then
            fn03BD = True
            Exit Function
        End If
    Next l06BA
End Function

Function fn03D0 (ByVal p06C2 As String ' 47) As Integer ' 1
Dim l06C4 ' 80
Dim l06C6 As Integer ' 81
Dim l06C8 As Integer ' 81
Dim l06CA ' 80
Dim l06CC As String ' 87
Dim l06CE ' 80
Dim l06D0 ' 80
Dim l06D2 ' 80
Dim l06D6() As T5755 ' 9A
    On Error GoTo L4834
    ReDim l06D6(gv1BEC)        As T5755
    Select Case p06C2$
        Case gc1C04
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C04 For Random As #l06C8 Len = gc1C5A
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_DATA versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            Get #l06C8, , gv1BE8
            Get #l06C8, , gv1BEA
            Get #l06C8, , gv1BEE
            Get #l06C8, , gv1BF0
            Get #l06C8, , gv1BF2
            Get #l06C8, , gv1BF4
            ReDim gv148E(gv1BE8) As T5524
            For l06C4 = 0 To gv1BE8 - 1
                Get #l06C8, , gv148E(l06C4)
            Next l06C4
            ReDim gv145A(gv1BEA)  As T5584
            For l06C4 = 0 To gv1BEA - 1
                Get #l06C8, , gv145A(l06C4)
            Next l06C4
            ReDim gv1592(gv1BEE)    As T54C8
            For l06C4 = 0 To gv1BEE - 1
                Get #l06C8, , gv1592(l06C4)
            Next l06C4
            ReDim gv15C6(gv1BF0)       As T54E1
            For l06C4 = 0 To gv1BF0 - 1
                Get #l06C8, , gv15C6(l06C4)
            Next l06C4
            ReDim gv1662(gv1BF2)  As T54FE
            For l06C4 = 0 To gv1BF2 - 1
                Get #l06C8, , gv1662(l06C4)
            Next l06C4
            ReDim gv1696(gv1BF4)     As T5515
            For l06C4 = 0 To gv1BF4 - 1
                Get #l06C8, , gv1696(l06C4)
            Next l06C4
            Close #l06C8
        Case gc1C0C
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C0C For Random As #l06C8 Len = gc1C6A
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_ITEMS versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            Get #l06C8, 2, gv19E0
            Get #l06C8, 3, gv1BEC
            If  gv1BEC > 0 Then
                ReDim gv1426(gv1BEC) As T567A
                For l06C4 = 0 To gv1BEC - 1
                    Get #l06C8, l06C4 + 4, gv1426(l06C4)
                Next l06C4
            Else
                ReDim gv1426(0) As T567A
            End If
            Close #l06C8
        Case gc1C08
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C08 For Random As #l06C8 Len = gc1C68
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_SPELLS versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            Get #l06C8, 2, gv1BF8
            If  gv1BF8 > 0 Then
                ReDim gv152A(gv1BF8)  As T5AFD
                For l06C4 = 0 To gv1BF8 - 1
                    Get #l06C8, l06C4 + 3, gv152A(l06C4)
                Next l06C4
            Else
                ReDim gv152A(0) As T5AFD
            End If
            Close #l06C8
        Case gc1C18
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C18 For Random As #l06C8 Len = gc1C66
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_STORE versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            Get #l06C8, 2, l06D0
            Get #l06C8, 3, l06D2
            ReDim gv15FA(gv1BEC)  As T5755
            If  gv1BEC > 0 Then
                For l06C4 = 0 To gv1BEC - 1
                    If  Not EOF(l06C8) Then
                        If  l06C4 > (l06D2 - 1) Then
                            gv15FA(l06C4).M5766 = 0
                            gv15FA(l06C4).M5467 = 0
                            For l06CA = 0 To gc03E6 - 1
                                gv15FA(l06C4).M5557(l06CA) = 0
                            Next l06CA
                            Put #l06C8, l06C4 + 4, l06D6(l06C4)
                        Else
                            Get #l06C8, l06C4 + 4, l06D6(l06C4)
                            If  l06D0 <> gv19E0 Then
                                For l06CE = 0 To gv1BEC - 1
                                    If  gv1426(l06CE).M5467 = l06D6(l06C4).M5467 Then
                                        gv15FA(l06CE) = l06D6(l06C4)
                                        gv15FA(l06CE).M5766 = l06CE
                                    End If
                                Next l06CE
                            Else
                                Get #l06C8, l06C4 + 4, gv15FA(l06C4)
                            End If
                        End If
                    Else
                        gv15FA(l06C4).M5766 = 0
                        gv15FA(l06C4).M5467 = 0
                        For l06CA = 0 To gc03E6 - 1
                            gv15FA(l06C4).M5557(l06CA) = 0
                        Next l06CA
                    End If
                Next l06C4
            Else
                ReDim gv15FA(0) As T5755
            End If
            l06D2 = gv1BEC
            Put #l06C8, 3, l06D2
            Close #l06C8
            If  l06D0 <> gv19E0 Then
                If  fn0425(gc1C18) = False Then
                    l06C4 = MsgBox("Error saving re-mapped store file!", 64, "ERROR!")
                    End
                End If
            End If
        Case gc1C44
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C44 For Random As #l06C8 Len = gc1C72
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_CSTORE versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            Get #l06C8, 2, l06D0
            Get #l06C8, 3, l06D2
            ReDim gv162E(gv1BF6)     As T5755
            ReDim l06D6(gv1BF6)           As T5755
            If  gv1BF6 > 0 Then
                For l06C4 = 0 To gv1BF6 - 1
                    If  Not EOF(l06C8) Then
                        If  l06C4 > (l06D2 - 1) Then
                            gv162E(l06C4).M5766 = 0
                            gv162E(l06C4).M5467 = 0
                            For l06CA = 0 To gc03E6 - 1
                                gv162E(l06C4).M5557(l06CA) = 0
                            Next l06CA
                            Put #l06C8, l06C4 + 4, l06D6(l06C4)
                        Else
                            Get #l06C8, l06C4 + 4, l06D6(l06C4)
                            If  l06D0 <> gv19E2 Then
                                For l06CE = 0 To gv1BF6 - 1
                                    If  gv14F6(l06CE).M5467 = l06D6(l06C4).M5467 Then
                                        gv162E(l06CE) = l06D6(l06C4)
                                        gv162E(l06CE).M5766 = l06CE
                                    End If
                                Next l06CE
                            Else
                                Get #l06C8, l06C4 + 4, gv162E(l06C4)
                            End If
                        End If
                    Else
                        gv162E(l06C4).M5766 = 0
                        gv162E(l06C4).M5467 = 0
                        For l06CA = 0 To gc03E6 - 1
                            gv162E(l06C4).M5557(l06CA) = 0
                        Next l06CA
                    End If
                Next l06C4
            Else
                ReDim gv162E(0) As T5755
            End If
            l06D2 = gv1BF6
            Put #l06C8, 3, l06D2
            Close #l06C8
            If  l06D0 <> gv19E2 Then
                If  fn0425(gc1C44) = False Then
                    l06C4 = MsgBox("Error saving re-mapped companion store file!", 64, "ERROR!")
                    End
                End If
            End If
        Case gc1C14
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C14 For Random As #l06C8 Len = gc1C5C
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_MONSTERS versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            Get #l06C8, 2, gv19E2
            Get #l06C8, 3, gv1BF6
            If  gv1BF6 > 0 Then
                ReDim gv14F6(gv1BF6)    As T59FF
                For l06C4 = 0 To gv1BF6 - 1
                    Get #l06C8, l06C4 + 4, gv14F6(l06C4)
                Next l06C4
            Else
                ReDim gv14F6(0) As T59FF
            End If
        Case gc1C1C
            l06C8 = FreeFile
            Open gv19E8 + gc1C74 + gc1C1C For Random As #l06C8 Len = gc1C62
            Get #l06C8, 1, l06CC
            If  fn0326(l06CC) = True And l06CC <> "" Then
                l06C6% = MsgBox("FILE_GUILDMASTERS versions are different!", 32, "ERROR!")
                Close #l06C8
                Exit Function
            End If
            ReDim gv16CA(gv1BEA - 1)   As T564C
            For l06CE = 0 To gv1BEA - 1
                Get #l06C8, , gv16CA(l06CE)
            Next l06CE
            Close #l06C8
        Case Else
            fn03D0 = False
            Exit Function
    End Select
    Close l06C8
    fn03D0 = True
    Exit Function

L4834:
    fn03D0 = False
    Resume L4848
L4848:
End Function

Sub sub03E3 (p06DC As Integer ' 41)
Dim l06DE As Integer ' 81
Dim l06E0 ' 80
Dim l06E2 As String ' 87
' Const mc06E4 = 48 ' &H30%
    gv19E4 = Space$(40)
    l06DE = extfn01A1(gv19E4, Len(gv19E4))
    For l06E0 = 1 To Len(gv19E4)
        If  Mid$(gv19E4, l06E0, 1) = Chr$(0) Then
            gv19E4 = Left$(gv19E4, l06E0 - 1)
            Exit For
        End If
    Next l06E0
    If  gv1C8E = "" Then gv1C8E = gc1C9C
    If  gv1C92 = "" Then gv1C92 = gc1CA0
    If  gv1C96 = "" Then gv1C96 = gc1CA4
    If  gv1C9A = "" Then gv1C9A = gc1CA8
    If  gv0180 Then
        If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "Limited"), "T") = False Then
            l06E2 = "NOTICE!" + Chr(13)
            l06E2 = l06E2 + "Because this is a PUBLIC BETA version of MORDOR, only " + CStr(gc0182) + " dungeon levels are currently available." + Chr(13)
            l06E2 = l06E2 + Chr(13)
            l06E2 = l06E2 + "This message will not appear again."
            MsgBox l06E2, mc06E4, "Limitation Notice"
            l06DE = extfn0184("Loading Information", "Limited", "True", fn0360$(gv19E4) + "MORDOR.INI")
        End If
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "No3D"), "T") <> False Then
        gv1A66.M5EE9 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoMusic"), "T") <> False Then
        gv1A66.M5EF1 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoFX"), "T") <> False Then
        gv1A66.M5EFC = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoPartyFX"), "T") <> False Then
        gv1A66.M5F48 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoStretch"), "T") <> False Then
        gv1A66.M5F04 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoDing"), "T") <> False Then
        gv1A66.M5F11 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoLoadAutomap"), "T") <> False Then
        gv1A66.M5F1B = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoHelpSound"), "T") <> False Then
        gv1A66.M5F71 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoAutoSave"), "T") <> False Then
        gv1A66.M5F80 = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoToolbar"), "T") <> False Then
        gv1A66.M5F2C = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "NoBlinkCursor"), "T") <> False Then
        gv1A66.M5F8E = True
    End If
    If  InStr(fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "SoundCanvas"), "T") <> False Then
        gv1A66.M5F39 = True
    End If
    l06E2 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "MusicVolume")
    If  l06E2 = "" Then
        l06E2 = "-65538"
    End If
    gv2196 = CLng(l06E2)
    l06E2 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "Loading Information", "FXVolume")
    If  l06E2 = "" Then
        l06E2 = "-65538"
    End If
    gv219A = CLng(l06E2)
    If  p06DC = True Then
        l06E2 = fn03F1(fn0360(gv19E4) + "MORDOR.INI", "File Information", "BasePath")
        If  Len(l06E2) Then
            gv19E8 = l06E2
        End If
    Else
        gv19E8 = fn0360$(CStr(App.Path))
    End If
    frmWelcome.Refresh
End Sub

Function fn03F1 (ByVal p06F4 As String ' 47, ByVal p06F6 As String ' 47, ByVal p06F8 As String ' 47) As String ' 7
Dim l06FA As Integer ' 81
Dim l06FC As String ' 87
    l06FC = Space$(255)
    l06FA = extfn0169(p06F6, p06F8, "", l06FC, 255, p06F4)
    If  Len(l06FC) > 1 Then
        For l06FA = 1 To Len(l06FC)
            If  Mid$(l06FC, l06FA, 1) = Chr$(0) Then
                l06FC = Left$(l06FC, l06FA - 1)
                Exit For
            End If
        Next l06FA
    End If
    fn03F1 = l06FC
End Function

Function fn0403 (ByVal p0700 As String ' 47, ByVal p0702 As String ' 47, ByVal p0704 As String ' 47, p0706 As Single ' 43) As Single ' 3
Dim l0708 As Single ' 83
    l0708 = extfn0151(p0702, p0704, p0706, p0700)
    fn0403 = l0708
End Function

Function fn0418 (ByVal pv070C As Integer ' 81, ByVal pv070E As Currency ' 85, ByVal pv0710 As Integer ' 81) As Long ' 2
    If  pv0710 <> False Then
        fn0418 = (pv070E Or gv1B9E(pv070C))
    Else
        If  fn0380(pv070C, pv070E) = True Then
            fn0418 = (pv070E Xor gv1B9E(pv070C))
            Else
            fn0418 = pv070E
        End If
    End If
End Function

Function fn0425 (ByVal p0714 As String ' 47) As Integer ' 1
Dim l0716 As String ' 87
Dim l0718 As Integer ' 81
Dim l071A As Integer ' 81
Dim l071C As Integer ' 81
    On Error GoTo L5A12
    Select Case p0714$
        Case gc1C18
            l071A = FreeFile
            Open gv19E8 + gc1C74 + gc1C18 For Random As #l071A Len = gc1C66
            Get #l071A, 1, l0716
            If  fn0326(l0716) = True And l0716 <> "" Then
                l071C = MsgBox("FILE_STORE versions are different!", 32, "ERROR!")
                Close #l071A
                Exit Function
            End If
            l0716 = gc0186$
            Put #l071A, 1, l0716
            Put #l071A, 2, gv19E0
            l0718 = gv1BEC
            Put #l071A, 3, l0718
            If  gv1BEC > 0 Then
                For l0718 = 0 To gv1BEC - 1
                    Put #l071A, l0718 + 4, gv15FA(l0718)
                Next l0718
            End If
            Close #l071A
        Case gc1C44
            l071A = FreeFile
            Open gv19E8 + gc1C74 + gc1C44 For Random As #l071A Len = gc1C72
            Get #l071A, 1, l0716
            If  fn0326(l0716) = True And l0716 <> "" Then
                l071C = MsgBox("FILE_CSTORE versions are different!", 32, "ERROR!")
                Close #l071A
                Exit Function
            End If
            l0716 = gc0186$
            Put #l071A, 1, l0716
            Put #l071A, 2, gv19E2
            l0718 = gv1BF6
            Put #l071A, 3, l0718
            If  gv1BF6 > 0 Then
                For l0718 = 0 To gv1BF6 - 1
                    Put #l071A, l0718 + 4, gv162E(l0718)
                Next l0718
            End If
            Close #l071A
        Case Else
    End Select
    fn0425 = True
    Exit Function

L5A12:
    fn0425 = False
    Resume L5A26
L5A26:
End Function
