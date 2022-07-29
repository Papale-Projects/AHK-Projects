#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk
#Include InterfaceCords.ahk
#include WaitPixelColor.ahk
Global AlchX
Global AlchY

Alch()
{
	Clicker()
}
return

MagicTab()
{
	;Verifies that the spell book is open
	PixelSearch, FoundX, FoundY, 992, 658, 992, 658, 0x3DAC52, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		Status("Opening SpellBook")
		MenuCordz()
		MouseAfterClickDelay()
		Random, Mspeed, 0.6, 0.9
		MoveMouse(SpellTabX, SpellTabY, Mspeed)
		MouseClickDelay()
		MyClick()
		MouseClickDelay()
	} 
}
return

MouseLocStart()
{
	;Verifies that the mouse is over the alch item, and if it isn't, moves the mouse to the location.
	MouseGetPos, CurrentX, CurrentY
	If (CurrentX > 894 || CurrentX < 863 || CurrentY > 602 || CurrentY < 572)
	{
		Status("Adjusting Mouse")
		AlchSpot()
		MouseAfterClickDelay()
		Random, Mspeed, 0.6, 0.9
		MoveMouse(AlchX, AlchY, Mspeed)
		MouseClickDelay()
	}
	Random, MouseAdjusting, 1, 2000
	If (MouseAdjusting = 1)
	{
		Status("Adjusting Mouse Ran")
		AlchSpot()
		MouseAfterClickDelay()
		Random, Mspeed, 0.6, 0.9
		MoveMouse(AlchX, AlchY, Mspeed)
		AntibanCounter++
		AntibanCount()
		MouseClickDelay()
	}
}
return

AlchSpot()
{
	;randomly defines the mouse location over the alch items
	AlchX := RandomWeight(863, 878, 894)
	AlchY := RandomWeight(572, 587, 602)
}
return

Clicker()
{
	Random, Clicktotals, 10, 126
	Loop, %Clicktotals%
	{
		MouseLocStart()
		Status("Alching")
		VerifyInvSpell()
		DelaySpeed := RandomWeight(900, 1500, 2800)
		Sleep, DelaySpeed
		MyClick()
		MouseClickDelay()
		AntibanAny()
		AntiBanLog()
	 
	}	
}
return

IsIdle()
{
	PixelSearch, FoundX, FoundY, 806, 637, 806, 637, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		MouseClickDelay()
		MagicTab()
		MouseClickDelay()
	}
}
return

WaitSpell()
{
	Loop, 600
	{
		PixelSearch, FoundX, FoundY, 992, 658, 992, 658, 0x3DAC52, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			ClickingDelay := RandomWeight(400, 800, 1900)
			Sleep, ClickingDelay
			break
		}
		MouseClickDelay()
	}
	PixelSearch, FoundX, FoundY, 992, 658, 992, 658, 0x3DAC52, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		PixelSearch, FoundX, FoundY, 878, 585, 878, 585, 0x0000FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			ClickingDelay := RandomWeight(400, 800, 1900)
			Sleep, ClickingDelay
			MyClick()
		}
		PixelSearch, FoundX, FoundY, 878, 585, 878, 585, 0x0000FF, 0, Fast RGB
		If (ErrorLevel = 1)
		{
			ClickingDelay := RandomWeight(400, 800, 1900)
			Sleep, ClickingDelay
			MyClick()
		}
	}
}
return

VerifyInvSpell()
{
	Loop, 50
	{
		PixelSearch, FoundX, FoundY, 992, 658, 992, 658, 0x3DAC52, 0, Fast RGB
		If (ErrorLevel = 1)
		{
			PixelSearch, FoundX, FoundY, 878, 585, 878, 585, 0x0000FF, 0, Fast RGB
			If (ErrorLevel = 1)
			{
				Waitingverify := RandomWeight(20, 60, 200)
				sleep, Waitingverify
				VerifyCount++
				If (VerifyCount = 10)
				{
					MagicTab()
					break
				}
			}
		}
		PixelSearch, FoundX, FoundY, 992, 658, 992, 658, 0x3DAC52, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			break
		}
		PixelSearch, FoundX, FoundY, 878, 585, 878, 585, 0x0000FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			break
		}
	}
}
return

