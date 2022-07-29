#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

DetectRangePot()
{
Random, MouseSpeed, 0.50, 0.65
Random, Mspeed, 80, 200
Random, MouseSpot, -10, 10
Random, PotReset, 600, 800

	PixelSearch, FoundX, FoundY, 755, 40, 768, 52, 0x00FF00, 0, Fast RGB
		If ErrorLevel = 0
		{
			PixelSearch, RPotX, RPotY, 558, 233, 734, 491, 0x00FF00, 0, Fast RGB
				If ErrorLevel = 0
				{
					MoveMouse(RPotX+MouseSpot, RPotY+MouseSpot, MouseSpeed)
					Sleep, Mspeed
					Click
					Sleep, PotReset
				}
		}
}