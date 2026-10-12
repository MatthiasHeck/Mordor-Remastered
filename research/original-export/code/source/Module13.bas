' Module13
Option Explicit
Declare Sub extsub05E7 Lib "WAVMIX16.DLL" Alias "WaveMixPump" ()
Declare Function extfn1DCC Lib "WAVMIX16.DLL" Alias "WaveMixActivate" (ByVal p1%, ByVal p2%) As Integer ' 1
Declare Function extfn1E2E Lib "WAVMIX16.DLL" Alias "WaveMixCloseChannel" (ByVal p1%, ByVal p2%, ByVal p3&) As Integer ' 1
Declare Function extfn1E58 Lib "WAVMIX16.DLL" Alias "WaveMixCloseSession" (ByVal p1%) As Integer ' 1
Declare Function extfn1DB4 Lib "WAVMIX16.DLL" Alias "WaveMixConfigureInit" (p1 As type) As Integer ' 1
Declare Function extfn1E17 Lib "WAVMIX16.DLL" Alias "WaveMixFlushChannel" (ByVal p1%, ByVal p2%, ByVal p3&) As Integer ' 1
Declare Function extfn1E45 Lib "WAVMIX16.DLL" Alias "WaveMixFreeWave" (ByVal p1%, ByVal p2&) As Integer ' 1
Declare Function extfn1D93 Lib "WAVMIX16.DLL" Alias "WaveMixGetInfo" () As Integer ' 1
Declare Function extfn1DA5 Lib "WAVMIX16.DLL" Alias "WaveMixInit" () As Integer ' 1
Declare Function extfn1DF2 Lib "WAVMIX16.DLL" Alias "WaveMixOpenChannel" (ByVal p1%, ByVal p2%, ByVal p3&) As Integer ' 1
Declare Function extfn1DDF Lib "WAVMIX16.DLL" Alias "WaveMixOpenWave" (ByVal p1%, ByVal p2$, ByVal p3%, ByVal p4&) As Long ' 2
Declare Function extfn1E08 Lib "WAVMIX16.DLL" Alias "WaveMixPlay" (p1 As type) As Integer ' 1

Function fn1E6F (p006A As Integer ' 41) As Variant ' 6
Dim l006C As String ' 87
  Select Case p006A
    Case gc2CDC
      l006C = "An invalid channel (i.e. > 7) was specified."
    Case gc2CDE
      l006C = "Specified device ID is out of range."
    Case gc2CE0
      l006C = "Specified resource is already allocated or the channel has already been opened."
    Case gc2CE2
      l006C = "Unable to allocate or lock memory."
    Case gc2CE6
      l006C = "Attempted to open with an unsupported wave format."
    Case gc2CE8
      l006C = "Attempted to open a synchronous driver without specifying the WAVE_ALLOWSYNC flag."
    Case gc2CE4
      l006C = "An internal error has occured."
    Case Else
      l006C = "An unidentified error has occured."
  End Select
  fn1E6F = l006C
End Function
