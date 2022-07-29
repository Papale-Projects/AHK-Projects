#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

DetectAbsorption()
{
Random, MouseSpeed, 0.50, 0.65
Random, Mspeed, 80, 200
Random, MouseSpot, -10, 10
Random, PotReset, 600, 800

	Loop{
	PixelSearch, FoundX, FoundY, 756, 55, 767, 70, 0xBBC4C7, 0, Fast RGB
		If ErrorLevel = 0
			PixelSearch, APotX, APotY, 558, 233, 734, 491, 0xBBC4C7, 0, Fast RGB
				If ErrorLevel = 0
				{
					MoveMouse(APotX+MouseSpot, APotY+MouseSpot, MouseSpeed)
					Sleep, Mspeed
					Click
					Sleep, PotReset
				}
				If ErrorLeveL = 1
				{
					Break
				}
		If ErrorLeveL = 1
		{
			Break
		}
		}
}