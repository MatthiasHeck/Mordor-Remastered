' FRMCREDI.FRM
Option Explicit
Dim m001A As Integer ' 61
Dim m001C As Integer ' 61
Const mc0046 = 9 ' &H9%
Const mc0048 = 2 ' &H2%

Sub cmdOK_Click ()
    Unload Me
End Sub

Sub Form_Load ()
Dim l001E As String ' 87
' Const mc0046 = 9 ' &H9%
' Const mc0048 = 2 ' &H2%
' Const mc004A = 72 ' &H48%
    sub02FE Me
    m001A = -1
    Me.Caption = "Mordor " + gc0186 + " Credits"
    lblMusic.Caption = "Tim Melton" + Chr$(13) + "David Allen (FX)"
    lblArt.Caption = "Meg Ross" + Chr(13) + "Tareh Kryger" + Chr(13) + "Toshie Yamaguchi"
    l001E = "Terry Brown" + Chr$(13)
    l001E = l001E + "Douglas Chinn" + Chr$(13)
    l001E = l001E + "Dale Cutler" + Chr$(13)
    l001E = l001E + "Tim Dransfield" + Chr$(13)
    l001E = l001E + "Lloyd Duhon" + Chr$(13)
    l001E = l001E + "Leland F. Dumas" + Chr$(13)
    l001E = l001E + "Bob Foley" + Chr$(13)
    l001E = l001E + "Brent Goodpaster" + Chr$(13)
    l001E = l001E + "Erik Johnson" + Chr$(13)
    l001E = l001E + "Todd Levi" + Chr$(13)
    l001E = l001E + "Ariana Mandel" + Chr$(13)
    l001E = l001E + "Paul Morash" + Chr$(13)
    l001E = l001E + "Thomas Nehring" + Chr$(13)
    l001E = l001E + "Peter Perchansky" + Chr$(13)
    l001E = l001E + "Keith E. Petersen" + Chr$(13)
    l001E = l001E + "Greg Beaty" + Chr$(13)
    l001E = l001E + "Barry Schlossberg" + Chr$(13)
    l001E = l001E + "Rick Sylander" + Chr$(13)
    l001E = l001E + "Mike Vos" + Chr$(13)
    l001E = l001E + "Jochen Walder" + Chr$(13)
    l001E = l001E + "Steve Watkins" + Chr$(13)
    l001E = l001E + "Brent Williams" + Chr$(13)
    l001E = l001E + "Brad Williamson" + Chr$(13)
    l001E = l001E + "Marv Heston" + Chr$(13)
    lblTesters(0).Caption = l001E
    l001E = "Roe R. Adams" + Chr(13)
    l001E = l001E + "David Cooley" + Chr(13)
    l001E = l001E + "Rip Loomis" + Chr(13)
    l001E = l001E + "Angelo Montesinos" + Chr(13)
    l001E = l001E + "Jennifer Schlickbernd" + Chr(13)
    l001E = l001E + "Richard Sun" + Chr(13)
    l001E = l001E + "Mike Engle" + Chr(13)
    lblTesters(1).Caption = l001E
    l001E = "Marv Heston" + Chr$(13)
    l001E = l001E + "Larry Allen" + Chr$(13)
    l001E = l001E + "Mike Vos" + Chr$(13)
    l001E = l001E + "Erik Johnson" + Chr$(13)
    l001E = l001E + "Tim DransField" + Chr$(13)
    l001E = l001E + "Tom Upchurch" + Chr$(13)
    l001E = l001E + "Greg Beaty" + Chr$(13)
    l001E = l001E + Chr(13) + "...and especially Paul Morash and Meg Ross for helping make the game what it is!"
    lblThanks.Caption = l001E
    l001E = "David Allen" + Chr$(13)
    l001E = l001E + "Carsten Pedersen" + Chr$(13)
    l001E = l001E + "Shannon McConnell" + Chr$(13)
    lblHelp.Caption = l001E
End Sub

Sub Form_Unload (Cancel As Integer)
' Const mc004A = 72 ' &H48%
    Set frmCredits = Nothing
End Sub

Sub timAnimate_Timer ()
' Const mc004A = 72 ' &H48%
    Do
        m001C = m001C - 1
        If  m001C < False Then
            m001C = Me.Controls.Count - 1
        End If
        If  Me.Controls(m001C).Tag = "C" Then
            If  m001A > -1 Then
                Me.Controls(m001A).ForeColor = mc0046
            End If
            Me.Controls(m001C).ForeColor = QBColor(mc0048)
            m001A = m001C
            sub086D Int(Rnd * (mc004A - 1))
            Exit Do
        End If
    Loop
End Sub
