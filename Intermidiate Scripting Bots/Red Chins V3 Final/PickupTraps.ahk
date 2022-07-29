#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include WaitPixelColor.ahk

PickupTraps()
{
Loop, 10
	{
;Searches for box trap (TILE ONE) for current state then preforms pickup action
PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x64649B, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Indicate, 4500, 5500
		Random, Walking, 85, 450
		Random, Wait, 85, 450
		Sleep, Wait
		MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
		Sleep, Delay
		Click
		Sleep, Indicate
		WaitPixelColor(0xFFFFFF, 35, 355)
		Sleep, Walking
	}
	If (ErrorLevel = 1)
	{
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x64009B, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, menuselectionY, 42, 44
				Random, menuselectionX, -57, 45
				Random, MouseSpeed, 0.50, 0.65
				Random, Delay, 85, 210
				Random, Indicate, 4500, 5500
				Random, Walking, 85, 450
				Random, Wait, 85, 450
				Sleep, Wait
				MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
				Sleep, Delay
				Click, R
				Random, Delay, 85, 210
				Sleep, Delay
				MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
				Random, Delay, 85, 210
				Sleep, Delay
				Click
				Sleep, Indicate
				WaitPixelColor(0xFFFFFF, 35, 355)
				Sleep, Walking
			}
			If (ErrorLevel = 1)
			{
				PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00649B, 0, Fast RGB
					If (ErrorLevel = 0)
					{
						Random, menuselectionY, 42, 44
						Random, menuselectionX, -57, 45
						Random, MouseSpeed, 0.50, 0.65
						Random, Delay, 85, 210
						Random, Indicate, 4500, 5500
						Random, Walking, 85, 450
						Random, Wait, 85, 450
						Sleep, Wait
						MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
						Sleep, Delay
						Click, R
						Random, Delay, 85, 210
						Sleep, Delay
						MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
						Random, Delay, 85, 210
						Sleep, Delay
						Click
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						Sleep, Walking
					}
					If (ErrorLevel = 1)
					{
						PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
							If (ErrorLevel = 0)
							{
								Random, menuselectionY, 42, 44
								Random, menuselectionX, -57, 45
								Random, BoxX, -6, 6
								Random, BoxY, -6, 6
								Random, MouseSpeed, 0.50, 0.65
								Random, Delay, 85, 210
								Random, animation, 4500, 5500
								Sleep, Delay
								MoveMouse(FoundX+BoxX, FoundY+BoxY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click, R
								Random, Delay, 85, 210
								Sleep, Delay
								MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click
							}
					}
			}
	}
	
	;Searches for box trap (TILE TWO) for current state then preforms pickup action
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xD9D975, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Indicate, 4500, 5500
		Random, Walking, 85, 450
		Random, Wait, 85, 450
		Sleep, Wait
		MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
		Sleep, Delay
		Click
		Sleep, Indicate
		WaitPixelColor(0xFFFFFF, 35, 355)
		Sleep, Walking
	}
	If (ErrorLevel = 1)
	{
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xD97575, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, menuselectionY, 42, 44
				Random, menuselectionX, -57, 45
				Random, MouseSpeed, 0.50, 0.65
				Random, Delay, 85, 210
				Random, Indicate, 4500, 5500
				Random, Walking, 85, 450
				Random, Wait, 85, 450
				Sleep, Wait
				MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
				Sleep, Delay
				Click, R
				Sleep, Delay
				Random, Delay, 85, 210
				MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
				Random, Delay, 85, 210
				Sleep, Delay
				Click
				Sleep, Indicate
				WaitPixelColor(0xFFFFFF, 35, 355)
				Sleep, Walking
			}
			If (ErrorLevel = 1)
			{
				PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x75D975, 0, Fast RGB
					If (ErrorLevel = 0)
					{
						Random, menuselectionY, 42, 44
						Random, menuselectionX, -57, 45
						Random, MouseSpeed, 0.50, 0.65
						Random, Delay, 85, 210
						Random, Indicate, 4500, 5500
						Random, Walking, 85, 450
						Random, Wait, 85, 450
						Sleep, Wait
						MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
						Sleep, Delay
						Click, R
						Random, Delay, 85, 210
						Sleep, Delay
						MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
						Random, Delay, 85, 210
						Sleep, Delay
						Click
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						Sleep, Walking
					}
					If (ErrorLevel = 1)
					{
						PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
							If (ErrorLevel = 0)
							{
								Random, menuselectionY, 42, 44
								Random, menuselectionX, -57, 45
								Random, BoxX, -6, 6
								Random, BoxY, -6, 6
								Random, MouseSpeed, 0.50, 0.65
								Random, Delay, 85, 210
								Random, animation, 4500, 5500
								Sleep, Delay
								MoveMouse(FoundX+BoxX, FoundY+BoxY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click, R
								Random, Delay, 85, 210
								Sleep, Delay
								MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click
							}
					}
			}
	}
	
	
	;Searches for box trap (TILE THREE) for current state then preforms pickup action
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x64FF9B, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Indicate, 4500, 5500
		Random, Walking, 85, 450
		Random, Wait, 85, 450
		Sleep, Wait
		MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
		Sleep, Delay
		Click
		Sleep, Indicate
		WaitPixelColor(0xFFFFFF, 35, 355)
		Sleep, Walking
	}
	If (ErrorLevel = 1)
	{
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x649B9B, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, menuselectionY, 42, 44
				Random, menuselectionX, -57, 45
				Random, MouseSpeed, 0.50, 0.65
				Random, Delay, 85, 210
				Random, Indicate, 4500, 5500
				Random, Walking, 85, 450
				Random, Wait, 85, 450
				Sleep, Wait
				MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
				Random, Delay, 85, 210
				Sleep, Delay
				Click, R
				Random, Delay, 85, 210
				Sleep, Delay
				MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
				Random, Delay, 85, 210
				Sleep, Delay
				Click
				Sleep, Indicate
				WaitPixelColor(0xFFFFFF, 35, 355)
				Sleep, Walking
			}
			If (ErrorLevel = 1)
			{
				PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00FF9B, 0, Fast RGB
					If (ErrorLevel = 0)
					{
						Random, menuselectionY, 42, 44
						Random, menuselectionX, -57, 45
						Random, MouseSpeed, 0.50, 0.65
						Random, Delay, 85, 210
						Random, Indicate, 4500, 5500
						Random, Walking, 85, 450
						Random, Wait, 85, 450
						Sleep, Wait
						MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
						Random, Delay, 85, 210
						Sleep, Delay
						Click, R
						Random, Delay, 85, 210
						Sleep, Delay
						MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
						Random, Delay, 85, 210
						Sleep, Delay
						Click
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						Sleep, Walking
					}
					If (ErrorLevel = 1)
					{
						PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
							If (ErrorLevel = 0)
							{
								Random, menuselectionY, 42, 44
								Random, menuselectionX, -57, 45
								Random, BoxX, -6, 6
								Random, BoxY, -6, 6
								Random, MouseSpeed, 0.50, 0.65
								Random, Delay, 85, 210
								Random, animation, 4500, 5500
								Sleep, Delay
								MoveMouse(FoundX+BoxX, FoundY+BoxY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click, R
								Random, Delay, 85, 210
								Sleep, Delay
								MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click
							}
					}
			}
	}
	
	;Searches for box trap (TILE FOUR) for current state then preforms pickup action
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFFDE00, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Indicate, 4500, 5500
		Random, Walking, 85, 450
		Random, Wait, 85, 450
		Sleep, Wait
		MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
		Sleep, Delay
		Click
		Sleep, Indicate
		WaitPixelColor(0xFFFFFF, 35, 355)
		Sleep, Walking
	}
	If (ErrorLevel = 1)
	{
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF7A00, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, menuselectionY, 42, 44
				Random, menuselectionX, -57, 45
				Random, MouseSpeed, 0.50, 0.65
				Random, Delay, 85, 210
				Random, Indicate, 4500, 5500
				Random, Walking, 85, 450
				Random, Wait, 85, 450
				Sleep, Wait
				MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
				Sleep, Delay
				Click, R
				Random, Delay, 85, 210
				Sleep, Delay
				MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
				Random, Delay, 85, 210
				Sleep, Delay
				Click
				Sleep, Indicate
				WaitPixelColor(0xFFFFFF, 35, 355)
				Sleep, Walking
			}
			If (ErrorLevel = 1)
			{
				PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x9BDE00, 0, Fast RGB
					If (ErrorLevel = 0)
					{
						Random, menuselectionY, 42, 44
						Random, menuselectionX, -57, 45
						Random, MouseSpeed, 0.50, 0.65
						Random, Delay, 85, 210
						Random, Indicate, 4500, 5500
						Random, Walking, 85, 450
						Random, Wait, 85, 450
						Sleep, Wait
						MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
						Sleep, Delay
						Click, R
						Random, Delay, 85, 210
						Sleep, Delay
						MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
						Random, Delay, 85, 210
						Sleep, Delay
						Click
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						Sleep, Walking
					}
					If (ErrorLevel = 1)
					{
						PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
							If (ErrorLevel = 0)
							{
								Random, menuselectionY, 42, 44
								Random, menuselectionX, -57, 45
								Random, BoxX, -6, 6
								Random, BoxY, -6, 6
								Random, MouseSpeed, 0.50, 0.65
								Random, Delay, 85, 210
								Random, animation, 4500, 5500
								Sleep, Delay
								MoveMouse(FoundX+BoxX, FoundY+BoxY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click, R
								Random, Delay, 85, 210
								Sleep, Delay
								MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click
							}
					}
			}
	}
	
	;Searches for box trap (TILE FIVE) for current state then preforms pickup action
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFFCE6A, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Indicate, 4500, 5500
		Random, Walking, 85, 450
		Random, Wait, 85, 450
		Sleep, Wait
		MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
		Sleep, Delay
		Click
		Sleep, Indicate
		WaitPixelColor(0xFFFFFF, 35, 355)
		Sleep, Walking
	}
	If (ErrorLevel = 1)
	{
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF6A6A, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, menuselectionY, 42, 44
				Random, menuselectionX, -57, 45
				Random, MouseSpeed, 0.50, 0.65
				Random, Delay, 85, 210
				Random, Indicate, 4500, 5500
				Random, Walking, 85, 450
				Random, Wait, 85, 450
				Sleep, Wait
				MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
				Sleep, Delay
				Click, R
				Random, Delay, 85, 210
				Sleep, Delay
				MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
				Random, Delay, 85, 210
				Sleep, Delay
				Click
				Sleep, Indicate
				WaitPixelColor(0xFFFFFF, 35, 355)
				Sleep, Walking
			}
			If (ErrorLevel = 1)
			{
				PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x9BCE6A, 0, Fast RGB
					If (ErrorLevel = 0)
					{
						Random, menuselectionY, 42, 44
						Random, menuselectionX, -57, 45
						Random, MouseSpeed, 0.50, 0.65
						Random, Delay, 85, 210
						Random, Indicate, 4500, 5500
						Random, Walking, 85, 450
						Random, Wait, 85, 450
						Sleep, Wait
						MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
						Sleep, Delay
						Click, R
						Random, Delay, 85, 210
						Sleep, Delay
						MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
						Random, Delay, 85, 210
						Sleep, Delay
						Click
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						Sleep, Walking
					}
					If (ErrorLevel = 1)
					{
						PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
							If (ErrorLevel = 0)
							{
								Random, menuselectionY, 42, 44
								Random, menuselectionX, -57, 45
								Random, BoxX, -6, 6
								Random, BoxY, -6, 6
								Random, MouseSpeed, 0.50, 0.65
								Random, Delay, 85, 210
								Random, animation, 4500, 5500
								Sleep, Delay
								MoveMouse(FoundX+BoxX, FoundY+BoxY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click, R
								Random, Delay, 85, 210
								Sleep, Delay
								MoveMouse(FoundX+menuselectionX, FoundY+menuselectionY, MouseSpeed)
								Random, Delay, 85, 210
								Sleep, Delay
								Click
							}
					}
			}
	}
	}
}