#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Logout.ahk
#Include AntibanMouse.ahk
#Include RandomWorldHop.ahk
#Include CheckEXP.ahk
#Include AntiScreenMouse.ahk

centerX := A_ScreenWidth/2
centerY := A_ScreenHeight/2

F4::reload
F1::
mousegetpos, centerX, centerY
return

F2::
Loop
{
RandomWeighted(min,target,max) {
    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}

Random, MouseSpeed, 0.50, 0.65
Random, MovingWait, 2100, 3500
Random, SpotMove, 900, 1300
Random, PauseMove, 1000, 4500
Random, RandCord, -4, 14
Random, Mspeed, 150, 450
Random, REvent, 80, 250

blockinput mousemove
CoordMode, Pixel, Window
distance := 55
PixelSearch, FoundX, FoundY, % centerX-distance, % centerY-distance, % centerX+distance, % centerY+distance, 0xFF0000, 0, Fast RGB
	If ErrorLevel = 0
	{
		Sleep, REvent
		Loop, 80
		{
		PixelSearch, FoundX, FoundY, % centerX-distance, % centerY-distance, % centerX+distance, % centerY+distance, 0xFFFFFF, 0, Fast RGB
		If (ErrorLevel = 0) {
		MoveMouse(FoundX+RandomWeighted(-4,0,14), FoundY+RandomWeighted(-4,0,14), MouseSpeed)
		Sleep, Mspeed
		Click
		Sleep, MovingWait
		break
		}
		distance += 90
		}
	}
PixelSearch, FoundX, FoundY, 19, 351, 29, 358, 0x00FF00, 0, Fast RGB
	If ErrorLevel = 1
	{
		Sleep, SpotMove
		Sleep, Mspeed
		Loop, 80
		{
		Sleep, Mspeed
		Sleep, Mspeed
		PixelSearch, FoundX, FoundY, % centerX-distance, % centerY-distance, % centerX+distance, % centerY+distance, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 0) {
		MoveMouse(FoundX+RandomWeighted(-20,0,20), FoundY+RandomWeighted(-20,0,20), MouseSpeed)
		Sleep, Mspeed
		Click
		Sleep, MovingWait
		break
		}
		distance += 45
		}	
	}
AntiScreenMouse()
CheckEXP()
AntibanMouse()
AntiScreenMouse()
CheckEXP()
RandomWorldHop()
AntibanMouse()
AntiScreenMouse()
CheckEXP()
Logout()
CheckEXP()
}