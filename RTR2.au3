#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=bin\RTR2.exe
#AutoIt3Wrapper_Res_Fileversion=0.0.0.2
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{t}", "Toggle")

While 42
    Sleep(Random(420, 1337))
WEnd

Func Toggle()
    Local $iColor = PixelGetColor(736, 594)
    ConsoleWrite(@CRLF & Hex($iColor))
EndFunc

Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
    WEnd
EndFunc   ;==>TogglePause

Func Terminate()
    Exit 0
EndFunc   ;==>Terminate
