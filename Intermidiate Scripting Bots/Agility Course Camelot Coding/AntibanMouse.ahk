#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

AntibanMouse()
{
	Global AntiMouseElapsed
	Random, Anti, 1, 65
	Random, AntiMX, 1075, 1913
	Random, AntiMY, 13, 1037
	Random, AntiMSpeed, 0.50, 0.65
	Random, AntiSleep, 800, 10000
	If (Anti = 1)
	{
	AntiMouseTimer := A_TickCount
	Random, LWaiting, 0, 200
	sleep, LWaiting
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, Antiban: Offscreen`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
	MoveMouse(AntiMX, AntiMY, AntiMSpeed)
	WinActivate, Untitled - Notepad
	Sleep, AntiSleep
	WinActivate, OpenOSRS - 
	AntiMouseElapsed := AntiMouseTimer - A_TickCount
	}
}
