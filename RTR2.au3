#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=bin\RTR2.exe
#AutoIt3Wrapper_Res_Fileversion=0.0.0.3
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{t}", "Toggle")

While 42
    Sleep(Random(420, 1337))
    CheckGameOver()
WEnd

Func Toggle()
    Local $iColor = PixelGetColor(777, 595)
    ConsoleWrite(@CRLF & $iColor)
    ConsoleWrite(@CRLF & Hex($iColor))
EndFunc

Func CheckGameOver()
    Local $xyc[2][3] = [ _
    [736, 594, 0x686868], _
    [777, 595, 0x6C6C6C] _
    ]
    Local $x
    For $i = 0 To UBound($xyc) - 1
        $x = $xyc[$i][0]
        $y = $xyc[$i][1]
        $c = $xyc[$i][2]
        If PixelGetColor($x, $y) == $c Then
            ConsoleWrite(@CRLF & 'if')
        EndIf
    Next
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
