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
;Set camera zoom to -133 and vertical camera on
;Resized mode with chat hidden
;North facing compass to start

RandomWeighted(min,target,max) {
    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}

centerX := A_ScreenWidth/2
centerY := A_ScreenHeight/2

F3::reload
F2::
mousegetpos, centerX, centerY
return

F1::
Loop{
CoordMode, Pixel, Window
distance := 5
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
					Random, Walking, 5000, 8000
					MoveMouse(FoundX+RandomWeighted(-5,0,5), FoundY+RandomWeighted(-5,0,5), MouseSpeed)
					Sleep, Delay
					Click
					Sleep, Walking
					break
				}
					distance += 5
				}
		}
	PixelSearch, FoundX, FoundY, 614, 460, 642, 486, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, Keypress, 150, 1500
			Random, Delay, 200, 350
			Sleep, Keypress
			Send {Space Down}
			Sleep, Delay
			Send {Space Up}
			PixelSearch, FoundX, FoundY, 5, 32, 525, 505, 0x00FE00, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, MouseSpeed, 0.50, 0.65
					Random, Delay, 85, 150
					Random, Walking, 4000, 6000
					MoveMouse(FoundX+RandomWeighted(-5,0,5), FoundY+RandomWeighted(-5,0,5), MouseSpeed)
					Sleep, Delay
					Click
					Sleep, Walking
					PixelSearch, FoundX, FoundY, 5, 32, 525, 505, 0x00FF1A, 0, Fast RGB
					If ErrorLevel = 0
					{
						Random, MouseSpeed, 0.50, 0.65
						Random, Delay, 85, 150
						Random, Walking, 8000, 9500
						MoveMouse(FoundX+RandomWeighted(-5,0,5), FoundY+RandomWeighted(-5,0,5), MouseSpeed)
						Sleep, Delay
						Click
						Sleep, Walking
						
						PixelSearch, FoundX, FoundY, 5, 32, 525, 505, 0x00FFCA, 0, Fast RGB
						If ErrorLevel = 0
						{
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 150
							Random, Walking, 5000, 6000
							MoveMouse(FoundX+RandomWeighted(-5,0,5), FoundY+RandomWeighted(-5,0,5), MouseSpeed)
							Sleep, Delay
							Click
							Sleep, Walking
						}
					}
				}

		}
}
}