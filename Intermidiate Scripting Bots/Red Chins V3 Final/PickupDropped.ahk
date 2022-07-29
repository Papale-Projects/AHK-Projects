#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

PickupDropped()
{
PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, menuselectionY, 40, 44
		Random, menuselectionX, -57, 45
		Random, BoxX, -6, 6
		Random, BoxY, -6, 6
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, animation, 4500, 5500
		Sleep, Delay
		MoveMouse(FoundX+BoxX, FoundY+BoxY, MouseSpeed)
		Sleep, Delay
		Click, R
		Sleep, Delay
		MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
		Sleep, Delay
		Click
	}
}