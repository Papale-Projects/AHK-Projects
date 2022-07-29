#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

AntiScreenMouse()
{
	Global AntiMove
	Global AntiScreenElapsed
	Random, AntiMove, 1, 4
	Random, RightClicker, 1, 8
	Random, MouseSpeed, 0.50, 0.65
	Random, Waiting, 0, 350
	Random, RWait, 350, 650

If (AntiMove = 1)
	{
	AntiScreenTimer := A_TickCount
	Random, LWaiting, 0, 200
	sleep, LWaiting
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:RandomMouse`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
	Random, MouseSpeed, 0.50, 0.65
	MoveMouse(528+RandomWeighted(-252,0,252), 429+RandomWeighted(-167,0,163), MouseSpeed)
	Sleep, Waiting
	If (RightClicker = 1)
		{
		Send {RButton}
		Sleep, RWait
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(528+RandomWeighted(-252,0,252), 429+RandomWeighted(-167,0,163), MouseSpeed)
		Random, Waiting, 0, 300
		Sleep, Waiting
		}
	AntiScreenElapsed := AntiScreenTimer - A_TickCount
	}
}