#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk

Running()
{
	loop
	{
		DefencePotion()
		RangePotion()
		OffScreenMouse()
		OutsideNMZ()
	}
}
return

DefencePotion()
{
	;Only pot back up if the boost info is no longer in the green
	PixelSearch, FoundX, FoundY, 606, 40, 606, 40, 0xFF00FF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;Find the super defence potion in the inventory
		PixelSearch, FoundX, FoundY, 848, 563, 1033, 823, 0x0000FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.5, 0.8
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			Absorption()
		}
	}
}
return

RangePotion()
{
	;Only pot back up if the boost info is no longer in the green
	PixelSearch, FoundX, FoundY, 707, 41, 707, 41, 0x0000FF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;Find the super defence potion in the inventory
		PixelSearch, FoundX, FoundY, 848, 563, 1033, 823, 0x00FF00, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.5, 0.8
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
		}
	}
}
return

Absorption()
{
	;search for absorption potion in inventory
	PixelSearch, FoundX, FoundY, 848, 563, 1033, 823, 0xFF0000, 20, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, Mspeed, 0.5, 0.8
		MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
		;random amount of spam clicks to preform
		RandomClickAmount := RandomWeight(10, 20, 30)
		Loop, %RandomClickAmount%
		{
			;Only continue clicking the same spot if the potion is still there
			PixelSearch, potX, potY, FoundX, FoundY, FoundX, FoundY, 0xFF0000, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				MouseAfterClickDelay()
				MouseAfterClickDelay()
				MouseAfterClickDelay()
				MyClick()
			}
			;Otherwise find a new potion to click
			If (ErrorLevel = 1)
			{
				PixelSearch, FoundX, FoundY, 848, 563, 1033, 823, 0xFF0000, 0, Fast RGB
				Random, Mspeed, 0.5, 0.8
				MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			}
		}
	}
}
return

OutsideNMZ()
{
	;If the ground marker is seen (ON DEATH) then log out and pause the script
	PixelSearch, FoundX, FoundY, 233, 205, 728, 610, 0xDDFF00, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Logout()
		pause
	}
}
return