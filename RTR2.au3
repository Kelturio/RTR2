#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=bin\RTR2.exe
#AutoIt3Wrapper_Res_Fileversion=0.0.0.7
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Opt("MustDeclareVars", 1) ;0=no, 1=require pre-declaration

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{t}", "Toggle")

Global $Paused
Global Const $xycConsulters[1][3] = [[700, 625, 0x542900]]
Global Const $xycPolicemen[1][3] = [[700, 630, 0xD1001C]]
Global Const $xycDoctors[1][3] = [[700, 625, 0xE7E2E2]]
Global Const $xycBears[1][3] = [[700, 721, 0x000B47]]

Global $xOffset = 50

While 42
	If IsEnemy($xycConsulters) Then Jump()
	If IsEnemy($xycPolicemen) Then Jump()
	If IsEnemy($xycDoctors) Then Jump()
	If IsEnemy($xycBears) Then Jump()
	If IsGameOver() Then
		ConsoleWrite(@CRLF & 'Game Over')
		RestartLevel()
	EndIf
;~ 	Sleep(42)
WEnd

Func Toggle()
	Send("{SPACE}")
	Sleep(100)
	Send("{SPACE}")
EndFunc   ;==>Toggle

Func IsGameOver()
	Local $x, $y, $c, $l, $m = 0
	Local Const $xyc[2][3] = [ _
			[736, 594, 0x686868], _
			[777, 595, 0x6C6C6C]]
	$l = UBound($xyc)
	For $i = 0 To $l - 1
		$x = $xyc[$i][0]
		$y = $xyc[$i][1]
		$c = $xyc[$i][2]
		If PixelGetColor($x, $y) == $c Then
			$m += 1
		EndIf
	Next
	Return $m == $l
EndFunc   ;==>IsGameOver

Func RestartLevel()
	ConsoleWrite(@CRLF & 'Restart Level')
	MouseClick('left', 736, 594, 1, 0)
	MouseMove(420, 420, 10)
	Sleep(1e3)
EndFunc   ;==>RestartLevel

Func Jump()
	Send("{SPACE}")
	Sleep(20)
	Send("{SPACE}")
EndFunc   ;==>Jump

Func IsEnemy($xyc)
	Local $x, $y, $c, $m = 0, $l = UBound($xyc)
	For $i = 0 To $l - 1
		$x = $xyc[$i][0]
		$y = $xyc[$i][1]
		$c = $xyc[$i][2]
		If PixelGetColor($x + $xOffset, $y) == $c Then
			$m += 1
		EndIf
	Next
	Return $m == $l
EndFunc   ;==>IsEnemy

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
	WEnd
EndFunc   ;==>TogglePause

Func Terminate()
	Exit 0
EndFunc   ;==>Terminate
