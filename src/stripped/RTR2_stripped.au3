Opt("MustDeclareVars", 1)
Opt("SendKeyDelay", 5)
Opt("SendKeyDownDelay", 1)
HotKeySet("{PAUSE}", "_6")
HotKeySet("{ESC}", "_5")
HotKeySet("{j}", "_1")
Global $0
Global $1 = 700
Global $2 = 25
Global $3 = 0
Global Const $4[1][3] = [[736, 594, 0x686868]]
Global Const $5[1][3] = [[$1, 625, 0x542900]]
Global Const $6[1][3] = [[$1, 630, 0xD1001C]]
Global Const $7[1][3] = [[$1, 625, 0xE7E2E2]]
Global Const $8[1][3] = [[$1, 721, 0x000B47]]
Global Const $9[1][3] = [[1267, 900, 0x7E3B04]]
Global Const $a[1][3] = [[508, 339, 0xFBD44B]]
While 42
If _2($5) Then _1()
If _2($6) Then _1()
If _2($7) Then _1()
If _2($8) Then _1()
If _2($4) Then _3()
If _2($9) And $3 Then _4()
If _2($a) And $3 Then _0()
WEnd
Func _0()
Local $b = 16
MouseClick('left', 280, 850, 1, $b)
_4()
EndFunc
Func _1($b = $2)
Send("{SPACE}")
Sleep($b)
Send("{SPACE}")
EndFunc
Func _2($c)
Local $d, $e, $f, $g = 0, $h = UBound($c)
For $i = 0 To $h - 1
$d = $c[$i][0]
$e = $c[$i][1]
$f = $c[$i][2]
If PixelGetColor($d, $e) == $f Then
$g += 1
EndIf
Next
Return $g == $h
EndFunc
Func _3()
ConsoleWrite(@CRLF & 'Restart Level')
MouseClick('left', 730, 600, 1, 0)
MouseMove(420, 420, 10)
Sleep(1e2)
EndFunc
Func _4()
Local $b = 16
MouseClick('left', 250, 200, 1, $b)
MouseClick('left', 830, 700, 1, $b)
MouseClick('left', 840, 540, 1, $b)
MouseClick('left', 840, 460, 1, $b)
MouseClick('left', 813, 673, 1, $b)
MouseClick('left', 840, 847, 1, $b)
EndFunc
Func _5()
Exit 0
EndFunc
Func _6()
$0 = Not $0
While $0
Sleep(100)
WEnd
EndFunc
