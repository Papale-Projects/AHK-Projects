#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include AntibanMouse.ahk
#Include CheckEXP.ahk
#Include Logout.ahk
#Include AntiScreenMouse.ahk
#Include AntiCameraSpin.ahk
#Include WaitPixelColor.ahk
#Include RandomBezier.ahk

;Set camera zoom to 128 / vertical camera on / max up arrow to full vertical camera
;resized mode
;Window deminsions w: 1060	h: 840
;Color of course objects = 00FF00 
;Mark of grace color = FF0000
;Entity hider = on
;Start at seers village teleport spot
;Have spellbook open on start

Global StartTime
Global ElapsedTime
Global Static1
Global Lapcount

StartTime := A_TickCount

RandomWeighted(min,target,max) {
    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}

FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
    time = 19990101  ; *Midnight* of an arbitrary date.
    time += %NumberOfSeconds%, seconds
    FormatTime, mmss, %time%, mm:ss
    SetFormat, float, 2.0
    return NumberOfSeconds//3600 ":" mmss  ; This method is used to support more than 24 hours worth of sections.
}

SplashTextOn, 200, 60, Camelot Agility V1
WinMove, Camelot Agility V1, , 0, 0
ControlSetText, Static1, Press F1 to start`nPress F2 to reload`nPress F3 to exit, Camelot Agility V1

F3::exitapp
F2::reload
F1::
WinActivate, OpenOSRS - 
;Blocks mouse movement
blockinput mousemove

PixelSearch, FoundX, FoundY, 846, 538, 1025, 795, 0x8F8EF3, 0, Fast RGB
If ErrorLevel = 1
{
	Random, SpellBX, 1020, 1051
	Random, SpellBY, 502, 536
	Random, MouseSpeed, 0.50, 0.65
	MoveMouse(SpellBX, SpellBY, MouseSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
}

PixelSearch, FoundX, FoundY, 9, 31, 814, 812, 0xFFAFAF, 0, Fast RGB
If ErrorLevel = 1
{
  Msgbox, "Please start at seers bank! Could not find start location."
  reload
}

Loop
{
If (Courseobject = 6)
	{
	PixelSearch, FoundX, FoundY, 9, 31, 814, 812, 0xFFC800, 0, Fast RGB
		If ErrorLevel = 0
		{
		Lapcount += 1
		Courseobject = 0
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Walking, 3000, 4500
		Random, Wait, 500, 1000
		Random, SpellX, 845, 1019
		Random, SpellY, 541, 719
		Random, Double, 1, 10
		Random, Doublesleep, 60, 200
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Teleporting to Start`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
		Sleep, Wait
		MoveMouse(SpellX, SpellY, MouseSpeed)
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Teleporting to Start`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
		Sleep, Delay
		Click
		If ( Double = 1)
			{
				Sleep, Doublesleep
				Click
			}
		CheckEXP()
		AntibanMouse()
		AntiScreenMouse()
		AntiCameraSpin()
		Walking += (AntiMouseElapsed + AntiScreenElapsed + AntiCameraElapsed + AntiCheckElapsed)
		Sleep, Walking
		CheckEXP()
		AntiScreenMouse()
		AntiCameraSpin()
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Teleporting to Start`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
		Logout()
		}
		If ErrorLevel = 1
		{
			Courseobject -= 1
		}
	}
If (Courseobject = 1)
	{
		PixelSearch, FoundX, FoundY, 11, 31, 814, 814, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 1
			{
				Courseobject = 0
			}
	}

PixelSearch, FoundX, FoundY, 9, 31, 814, 812, 0xFF0000, 0, Fast RGB
	If ErrorLevel = 0
	{
			Random, MouseSpeed, 0.50, 0.65
			Random, Delay, 85, 210
			Random, Walking, 4000, 5000
			Random, Wait, 500, 1000
			Random, Double, 1, 10
			Random, Doublesleep, 60, 200
			ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
			ControlSetText, Static1, Picking up Mark`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
			Sleep, Wait
			MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
			ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
			ControlSetText, Static1, Picking up Mark`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
			Sleep, Delay
			Click
			If (Double = 1)
				{
					Sleep, Doublesleep
					Click
				}
			CheckEXP()
			AntibanMouse()
			AntiScreenMouse()
			AntiCameraSpin()
			Walking += (AntiMouseElapsed + AntiScreenElapsed + AntiCameraElapsed + AntiCheckElapsed)
			Sleep, Walking
			CheckEXP()
			AntiScreenMouse()
			AntiCameraSpin()
			ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
			ControlSetText, Static1, Picking up Mark`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
	}
	If ErrorLevel = 1
	{
		PixelSearch, FoundX, FoundY, 9, 31, 814, 812, 0x00FF00, 0, Fast RGB
			If ErrorLevel = 0
			{
				Random, MouseSpeed, 0.50, 0.65
				Random, Delay, 85, 210
				Random, Walking, 6000, 7000
				Random, Wait, 500, 1000
				Random, Double, 1, 10
				Random, Doublesleep, 60, 200
				ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
				ControlSetText, Static1, Agility Obstacle`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
				Sleep, Wait
				ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
				ControlSetText, Static1, Agility Obstacle`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
				MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
				Sleep, Delay
				Click
				If (Double = 1)
					{
						Sleep, Doublesleep
						Click
					}
				CheckEXP()
				AntibanMouse()
				AntiScreenMouse()
				AntiCameraSpin()
				Walking += (AntiMouseElapsed + AntiScreenElapsed + AntiCameraElapsed + AntiCheckElapsed)
				Sleep, Walking
				If (Courseobject = 2)
					{
						Random, Addmore, 3300, 4500
						Sleep, Addmore
					}
				CheckEXP()
				AntiScreenMouse()
				AntiCameraSpin()
				ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
				ControlSetText, Static1, Agility Obstacle`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
				Courseobject += 1
			}
	}
}
