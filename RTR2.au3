#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=bin\RTR2.exe
#AutoIt3Wrapper_Res_Fileversion=0.0.0.10
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;~ Desktop resolution 1680 x 1050
;~ Game resolution 1280 x 768

Opt("MustDeclareVars", 1) ;0=no, 1=require pre-declaration
Opt("SendKeyDelay", 5) ;5 milliseconds
Opt("SendKeyDownDelay", 1) ;1 millisecond

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{t}", "Toggle")
HotKeySet("{j}", "Jump")

Global $Paused
Global $xPos = 700
Global $jumpDelay = 25
Global Const $xycGameOver[1][3] = [[736, 594, 0x686868]]
Global Const $xycConsulters[1][3] = [[$xPos, 625, 0x542900]]
Global Const $xycPolicemen[1][3] = [[$xPos, 630, 0xD1001C]]
Global Const $xycDoctors[1][3] = [[$xPos, 625, 0xE7E2E2]]
Global Const $xycBears[1][3] = [[$xPos, 721, 0x000B47]]
Global Const $xycEarth[1][3] = [[1267, 900, 0x7E3B04]]
Global Const $xycStats[1][3] = [[508, 339, 0xFBD44B]]

While 42
	If PixelCheckColor($xycConsulters) Then Jump()
	If PixelCheckColor($xycPolicemen) Then Jump()
	If PixelCheckColor($xycDoctors) Then Jump()
	If PixelCheckColor($xycBears) Then Jump()
	If PixelCheckColor($xycGameOver) Then RestartLevel()
;~ 	If PixelCheckColor($xycEarth) Then StartPoliceDepartment()
;~ 	If PixelCheckColor($xycStats) Then Back()
WEnd

Func Toggle()
	Jump(42)
EndFunc   ;==>Toggle

Func RestartLevel()
	ConsoleWrite(@CRLF & 'Restart Level')
	MouseClick('left', 730, 600, 1, 0)
	MouseMove(420, 420, 10)
	Sleep(1e2)
EndFunc   ;==>RestartLevel

Func StartPoliceDepartment()
	Local $ms = 16
	MouseClick('left', 250, 200, 1, $ms)
	MouseClick('left', 830, 700, 1, $ms)
	MouseClick('left', 840, 540, 1, $ms)
	MouseClick('left', 840, 460, 1, $ms)
	MouseClick('left', 813, 673, 1, $ms)
	MouseClick('left', 840, 847, 1, $ms)
EndFunc   ;==>StartPoliceDepartment

Func Back()
	Local $ms = 16
	MouseClick('left', 280, 850, 1, $ms)
	StartPoliceDepartment()
EndFunc   ;==>Back

Func Jump($ms = $jumpDelay)
	Send("{SPACE}")
	Sleep($ms)
	Send("{SPACE}")
EndFunc   ;==>Jump

Func PixelCheckColor($xyc)
	Local $x, $y, $c, $m = 0, $l = UBound($xyc)
	For $i = 0 To $l - 1
		$x = $xyc[$i][0]
		$y = $xyc[$i][1]
		$c = $xyc[$i][2]
		If PixelGetColor($x, $y) == $c Then
			$m += 1
		EndIf
	Next
	Return $m == $l
EndFunc   ;==>PixelCheckColor

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
	WEnd
EndFunc   ;==>TogglePause

Func Terminate()
	Exit 0
EndFunc   ;==>Terminate
