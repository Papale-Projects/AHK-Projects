#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Logout.ahk
#Include AntibanMouse.ahk

F4::reload
F1::
Loop
{
Random, MouseSpeed, 0.50, 0.60
Random, ClickSpot, 0, 5
Random, CamelotTellyX, 665, 737
Random, CamelotTellyY, 237, 332
Random, SleepTeleport, 3500, 4500
Random, MovingWait, 2000, 2800
Random, BufferTight, 900, 1250
blockinput mousemove

PixelSearch, MarkX, MarkY, 10, 35, 519, 367, 0xFF0000, 0, Fast RGB
If ErrorLevel = 0
{
AntibanMouse()
PixelSearch, MarkX, MarkY, 10, 35, 519, 367, 0xFF00FF, 0, Fast RGB
If ErrorLevel = 0
{
	MoveMouse(MarkX+ClickSpot, MarkY+ClickSpot, MouseSpeed)
		Sleep, Mdelay
		Click
		Sleep, MovingWait
		Sleep, MovingWait
		AntibanMouse()
}
If ErrorLevel = 1
{
PixelSearch, FoundX, FoundY, 10, 35, 519, 367, 0x00FD00, 0, Fast RGB
	If ErrorLevel = 0
	{
		AntibanMouse()
		MoveMouse(FoundX+ClickSpot, FoundY+ClickSpot, MouseSpeed)
		Sleep, Mdelay
		Click
		Sleep, MovingWait
		AntibanMouse()
		Sleep, MovingWait
		AntibanMouse()
		Sleep, MovingWait
		Sleep, BufferTight
	}
	If ErrorLevel = 1
	{
		MoveMouse(CamelotTellyX, CamelotTellyY, MouseSpeed)
		Sleep, Mdelay
		Click
		Sleep, SleepTeleport
		AntibanMouse()
		AntibanMouse()
		AntibanMouse()
		Logout()
	}
}
}
If ErrorLevel = 1
	{
	AntibanMouse()
	AntibanMouse()
	AntibanMouse()
	}
}