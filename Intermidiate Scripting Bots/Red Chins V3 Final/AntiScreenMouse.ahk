#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

AntiScreenMouse()
{
	Global AntiMove
	Random, AntiMove, 1, 10
	Random, RightClicker, 1, 2
	Random, MouseSpeed, 0.50, 0.65
	Random, Waiting, 120, 650
	Random, RWait, 350, 650

If (AntiMove = 1){
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:RandomMouse`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
	Random, MouseSpeed, 0.50, 0.65
	MoveMouse(263+RandomWeighted(-252,0,252), 201+RandomWeighted(-167,0,163), MouseSpeed)
	Sleep, Waiting
	If (RightClicker = 1){
		Send {RButton}
		Sleep, RWait
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(263+RandomWeighted(-252,0,252), 201+RandomWeighted(-167,0,163), MouseSpeed)
		Random, Waiting, 120, 650
		Sleep, Waiting
	}
	}

}