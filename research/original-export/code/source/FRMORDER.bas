' FRMORDER.FRM
Option Explicit
Dim m001A As Integer ' 61

Sub cmdCommand_Click (Index%)
    Unload Me
End Sub

Sub Form_Load ()
Dim l001E As String ' 87
    m001A = True
    l001E = "Whether you’re ordering MORDOR for yourself or as a gift, this first of a kind Windows FRP game designed to be played for months and even longer is guaranteed to put a smile on most any avid FRPer’s face!!  "
    l001E = l001E + "The full commercial version of MORDOR has so many more Monsters, Items and Dungeon Levels than the PUBLIC version that we can’t even begin to get into detail.  Find out for yourself!" + Chr(13) + Chr(13)
    l001E = l001E + "  You can now pre-order the full version of MORDOR at any time for only $39.99 + S&&H!  Feel free to use your VISA, MASTERCARD, Check, or Money Order to have MORDOR: the Depths of Dejenol, sent directly to your doorstep!" + Chr(13) + Chr(13)
    lblInfo.Caption = l001E
    l001E = "To order, call TDA! at (800) 624-2101 between 9AM and 4PM PST Monday through Friday and ask to order MORDOR!  Be sure to specify either 3.5" + Chr(34) + " disks or CD-ROM." + Chr(13) + Chr(13)
    l001E = l001E + "You can also contact the company at the following EMail addresses:" + Chr(13)
    l001E = l001E + "Internet: 102033.242@compuserve.com" + Chr(13)
    l001E = l001E + "CompuServe: 102033,242" + Chr(13)
    l001E = l001E + "(Remember to include the proper Address && Credit Card information if you order via EMail!!)" + Chr(13) + Chr(13)
    l001E = l001E + "Street address:" + Chr(13)
    l001E = l001E + "TDA!" + Chr(13)
    l001E = l001E + "720 132nd St SW #202" + Chr(13)
    l001E = l001E + "Everett, WA 98204" + Chr(13)
    l001E = l001E + "(206) 742-4145" + Chr(13) + Chr(13)
    l001E = l001E + "Order the full version of MORDOR now && see just how far you can take adventure!"
    lblOrderInfo.Caption = l001E
    cmdCommand(0).Left = (Me.Width / 2) - (cmdCommand(0).Width / 2)
    sub0802 Me
    m001A = False
End Sub

Sub Form_Resize ()
    If  m001A = False Then
        sub07B3 Me, elaElastic(0)
    End If
End Sub
