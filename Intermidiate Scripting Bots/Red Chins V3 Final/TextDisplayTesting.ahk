#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include Graphics.ahk
#Include Gdip_All.ahk

2::reload
1::
SplashTextOn, 180, 60, Red Chin Catcher v3
WinMove, Red Chin Catcher v3, , 0, 0
StartTime := A_TickCount

FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
    time = 19990101  ; *Midnight* of an arbitrary date.
    time += %NumberOfSeconds%, seconds
    FormatTime, mmss, %time%, mm:ss
    SetFormat, float, 2.0
    return NumberOfSeconds//3600 ":" mmss  ; This method is used to support more than 24 hours worth of sections.
}

Loop
{
Count += 1
ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
ControlSetText, Static1, CatchingChin`nChins Caught: %Count%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
Sleep, 500
ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
ControlSetText, Static1, Idle`nChins Caught: %Count%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
Sleep, 500
ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
ControlSetText, Static1, Logging out`nChins Caught: %Count%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
}


