#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
RandomWeighted(min,target,max) {
    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}

centerX := A_ScreenWidth/2
centerY := A_ScreenHeight/2

F2::
mousegetpos, centerX, centerY
return

F1::
CoordMode, Pixel, Window
distance := 55
PixelSearch, FoundX, FoundY, 5, 326, 46, 412, 0xFF0000, 0, Fast RGB
If ErrorLevel = 0
{
	PixelSearch, FoundX, FoundY, 614, 460, 642, 486, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 1
		{
			Loop, 80
				{
			PixelSearch, FoundX, FoundY, % centerX-distance, % centerY-distance, % centerX+distance, % centerY+distance, 0x00FD00, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, MouseSpeed, 0.50, 0.65
					Random, Delay, 85, 150
					Random, Walking, 800, 1250
					MoveMouse(FoundX+RandomWeighted(-5,0,5), FoundY+RandomWeighted(-5,0,5), MouseSpeed)
					Sleep, Delay
					Click
					Sleep, Walking
					break
				}
					distance += 90
				}
		}
}
