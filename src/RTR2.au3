#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\..\..\..\Program Files (x86)\AutoIt3\Aut2Exe\Icons\AutoIt_Main_v10_256x256_RGB-A.ico
#AutoIt3Wrapper_Outfile=..\bin\RTR2_x64.exe
#AutoIt3Wrapper_Outfile_x64=..\bin\RTR2_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=Comment
#AutoIt3Wrapper_Res_Description=Running Through Russia 2 Bot
#AutoIt3Wrapper_Res_Fileversion=1.0.0.125
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=Running Through Russia 2 Bot
#AutoIt3Wrapper_Res_CompanyName=fkn0wned
#AutoIt3Wrapper_Res_LegalCopyright=Searinox
#AutoIt3Wrapper_Res_LegalTradeMarks=Akk
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Field=Made By|Searinox
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -v 1 -v 3
#AutoIt3Wrapper_Run_Before=call "..\compile\before.bat" %scriptdir% %scriptfile%
#AutoIt3Wrapper_Run_After=call "..\compile\after.bat" %scriptdir% %scriptfile%
#AutoIt3Wrapper_Run_Tidy=y
#Tidy_Parameters=/tc 4 /gd /reel /sci 9 /kv 0 /bdir "tidy\bdir\" /sf
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/tl /debug /pe /mi=99 /rm /rsln
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;~ Desktop resolution 1680 x 1050
;~ Game resolution 1280 x 768

Opt("MustDeclareVars", 1) ;0=no, 1=require pre-declaration
Opt("SendKeyDelay", 5) ;5 milliseconds
Opt("SendKeyDownDelay", 1) ;1 millisecond

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{j}", "Jump")

Global $Paused
Global $xPos = 700
Global $jumpDelay = 25
Global $farmKeys = 0
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
    If PixelCheckColor($xycEarth) And $farmKeys Then StartPoliceDepartment()
    If PixelCheckColor($xycStats) And $farmKeys Then Back()
WEnd

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

Func Terminate()
    Exit 0
EndFunc   ;==>Terminate

Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
    WEnd
EndFunc   ;==>TogglePause
