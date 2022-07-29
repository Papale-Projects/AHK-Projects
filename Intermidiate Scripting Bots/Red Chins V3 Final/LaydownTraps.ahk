#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include WaitPixelColor.ahk

LaydownTraps()
{
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, MouseSpeed, 0.50, 0.65
			Random, Delay, 85, 210
			Random, Indicate, 4500, 5500
			Random, Walking, 85, 450
			Random, Wait, 85, 450
			Random, Location, 680, 850
			Sleep, Wait
			MoveMouse(FoundX+RandomWeighted(3,10,15), FoundY+RandomWeighted(3,10,15), MouseSpeed)
			Sleep, Delay
			Click
			PixelSearch, FoundX, FoundY, 552, 234, 739, 417, 0xFF0000, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Delay, 350, 500
					Sleep, Delay
					MoveMouse(FoundX+RandomWeighted(-6,0,6), FoundY+RandomWeighted(-6,0,6), MouseSpeed)
					Sleep, Location
					Click
					Random, Delay, 85, 210
					Sleep, Delay
					Sleep, Indicate
					WaitPixelColor(0xFFFFFF, 35, 355)
					Sleep, Walking
				}
		}
		
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xC0C0C0, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, MouseSpeed, 0.50, 0.65
			Random, Delay, 85, 210
			Random, Indicate, 4500, 5500
			Random, Walking, 85, 450
			Random, Wait, 85, 450
			Random, Location, 680, 850
			Sleep, Wait
			MoveMouse(FoundX+RandomWeighted(3,10,15), FoundY+RandomWeighted(3,10,15), MouseSpeed)
			Sleep, Delay
			Click
			PixelSearch, FoundX, FoundY, 552, 234, 739, 417, 0xFF0000, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Delay, 350, 500
					Sleep, Delay
					MoveMouse(FoundX+RandomWeighted(-6,0,6), FoundY+RandomWeighted(-6,0,6), MouseSpeed)
					Sleep, Location
					Click
					Random, Delay, 85, 210
					Sleep, Delay
					Sleep, Indicate
					WaitPixelColor(0xFFFFFF, 35, 355)
					Sleep, Walking
				}
		}
		
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00FFFF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, MouseSpeed, 0.50, 0.65
			Random, Delay, 85, 210
			Random, Indicate, 4500, 5500
			Random, Walking, 85, 450
			Random, Wait, 85, 450
			Random, Location, 680, 850
			Sleep, Wait
			MoveMouse(FoundX+RandomWeighted(3,10,15), FoundY+RandomWeighted(3,10,15), MouseSpeed)
			Sleep, Delay
			Click
			PixelSearch, FoundX, FoundY, 552, 234, 739, 417, 0xFF0000, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Delay, 350, 500
					Sleep, Delay
					MoveMouse(FoundX+RandomWeighted(-6,0,6), FoundY+RandomWeighted(-6,0,6), MouseSpeed)
					Sleep, Location
					Click
					Random, Delay, 85, 210
					Sleep, Delay
					Sleep, Indicate
					WaitPixelColor(0xFFFFFF, 35, 355)
					Sleep, Walking
				}
		}
		
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFFC800, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, MouseSpeed, 0.50, 0.65
			Random, Delay, 85, 210
			Random, Indicate, 4500, 5500
			Random, Walking, 85, 450
			Random, Wait, 85, 450
			Random, Location, 680, 850
			Sleep, Wait
			MoveMouse(FoundX+RandomWeighted(3,10,15), FoundY+RandomWeighted(3,10,15), MouseSpeed)
			Sleep, Delay
			Click
			PixelSearch, FoundX, FoundY, 552, 234, 739, 417, 0xFF0000, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Delay, 350, 500
					Sleep, Delay
					MoveMouse(FoundX+RandomWeighted(-6,0,6), FoundY+RandomWeighted(-6,0,6), MouseSpeed)
					Sleep, Location
					Click
					Random, Delay, 85, 210
					Sleep, Delay
					Sleep, Indicate
					WaitPixelColor(0xFFFFFF, 35, 355)
					Sleep, Walking
				}
		}
		
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFFAFAF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, MouseSpeed, 0.50, 0.65
			Random, Delay, 85, 210
			Random, Indicate, 4500, 5500
			Random, Walking, 85, 450
			Random, Wait, 85, 450
			Random, Location, 680, 850
			Sleep, Wait
			MoveMouse(FoundX+RandomWeighted(3,10,15), FoundY+RandomWeighted(3,10,15), MouseSpeed)
			Sleep, Delay
			Click
			PixelSearch, FoundX, FoundY, 552, 234, 739, 417, 0xFF0000, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Delay, 350, 500
					Sleep, Delay
					MoveMouse(FoundX+RandomWeighted(-6,0,6), FoundY+RandomWeighted(-6,0,6), MouseSpeed)
					Sleep, Location
					Click
					Random, Delay, 85, 210
					Sleep, Delay
					Sleep, Indicate
					WaitPixelColor(0xFFFFFF, 35, 355)
					Sleep, Walking
				}
		}
}