#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;GAME SIZE = 1060 X 809
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk
Global MinMissX
Global MinMissY


Runner()
{
	Loop
	{
		DepositFish()
		GrabFish()
		StartCooking()
		LoopWhileCooking()
	}
}
return

GrabFish()
{
	WinActivate, OpenOSRS - 
	;Only grab fish if you can't currently find fish in my inventory
	PixelSearch, FoundX, FoundY, 806, 579, 806, 579, 0x0000D0, 0, Fast RGB
	If ErrorLevel = 0
	{
		VerifyInBank()
		Status("Grabbing Fish")
		;Move mouse to location of fish in bank and grab it
		MouseAfterClickDelay()
		Random, Mspeed, 0.5, 0.8
		MoveMouse(591 + RandomWeight(-11, 0, 11), 374 + RandomWeight(-11, 0, 11), Mspeed)
		MouseClickDelay()
		MyClick()
		MouseAfterClickDelay()
	}
	VerifyNotInBank()
	VerifyInventoryOpen()
}
return

CloseBank()
{
	;Press escape to exit the bank and pause
	WinActivate, OpenOSRS - 
	Status("Closing Bank")
	Send, {escape}
	Random, Delay, 800, 1400
	Sleep, Delay
}
return

VerifyInBank()
{
	;Do a imagesearch for the X button in the banking interface
	ImageSearch, FoundX, FoundY, 564, 25, 708, 160, *50 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
	;If you can't find it, then click on the banker NPC
	If ErrorLevel = 1
	{
		PixelSearch, FoundX, FoundY, 9, 32, 813, 799, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			WinActivate, OpenOSRS - 
			Random, Mspeed, 0.5, 0.8
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			sleep, RandomWeight(500, 800, 3000)
		}
	}
}
return

VerifyNotInBank()
{
	Loop,
	{
		;Do a imagesearch for the X button in the banking interface
		ImageSearch, FoundX, FoundY, 537, 30, 716, 141, *60 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210608223357.png
		If (ErrorLevel = 0)
		{
			CloseBank()
			break
		}
		;Do a imagesearch for the X button in the banking interface
		ImageSearch, FoundX, FoundY, 537, 30, 716, 141, *60 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210608223357.png
		If (ErrorLevel = 1)
		{
			break
		}
	}
}
return

VerifyInventoryOpen()
{
	Status("Checking InvOpen")
	WinActivate, OpenOSRS - 
	;Search for indicator that shows if you have any type of fish in the inventory
	PixelSearch, FoundX, FoundY, 806, 579, 806, 579, 0x0000D0, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		;If you can't find raw fish after verifying that you have one in the inventory
		PixelSearch, FoundX, FoundY, 857, 532, 1042, 792, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 1
		{
			;If you can't find burnt or cooked fish after verifying that you have one in the inventory
			PixelSearch, FoundX, FoundY, 857, 532, 1042, 792, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 1
			{
				;Click on the inventory menu icon to open the inventory
				Random, Mspeed, 0.5, 0.8
				MoveMouse(RandomWeight(739, 743, 765), RandomWeight(800, 817, 835), Mspeed)
				MouseClickDelay()
				MyClick()
				MouseAfterClickDelay()
			}
		}
	}
}
return

DepositFish()
{
	WinActivate, OpenOSRS - 
	VerifyInBank()
	;If you can't find burnt or cooked fish after verifying that you have one in the inventory
	PixelSearch, FoundX, FoundY, 331, 36, 531, 56, 0xFF981F, 100, Fast RGB
	If (ErrorLevel = 0)
	{
		PixelSearch, FoundX, FoundY, 806, 579, 806, 579, 0x0000D0, 0, Fast RGB
		If (ErrorLevel = 1)
		{
			sleep, RandomWeight(500, 800, 2000)
			Status("Depositing Fish")
			Random, Mspeed, 0.5, 0.8
			MoveMouse(609 + RandomWeight(-15, 0, 15), 646 + RandomWeight(-15, 0, 15), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
		}	
	}
}
return

LoopWhileCooking()
{
	Status("Looping Cooking")
	Loop
	{
		;Cycle through the antibans while waiting to complete the inventory
		Levelup()
		AntibanAny()
		AntibanClicks()
		;Verify that im currently idle, otherwise continue antiban activations and AFKing.
		PixelSearch, FoundX, FoundY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			;A short random delay after finishing the inventory.
			MouseAfterClickDelay()
			sleep, RandomWeight(200, 800, 8000)
			break
		}
		sleep, RandomWeight(30, 50, 100)
	}
}
return

StartCooking()
{
	;If you can't find uncooked food in the inventory then bank the items and grab uncooked first
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
	If ErrorLevel = 1
	{
		VerifyInBank()
		DepositFish()
		GrabFish()
	}
	;Check to make sure you're idle before starting to cook.
	PixelSearch, FoundX, FoundY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;Random roll to log out
		AntiBanLog()
		Status("Starting to Cook")
		;Find and click on the Fish in the inventory
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			;Calculate missclick and use the pixelsearch of the fish in the inventory
			Random, AntiMissClick, 1, 3
			If (AntiMissClick = 1)
			{
				;Add to total missclick gui variable
				MissClick2++
				MissClickGui()
				MissClick()
				Random, Mspeed, 0.5, 0.8
				MoveMouse(FoundX + MinMissX, FoundY + MinMissY, Mspeed)
				MouseClickDelay()
				MyClick()
				MouseAfterClickDelay()
				
			}
			;Click on the uncooked fish in the inventory
			Random, Mspeed, 0.5, 0.8
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
		}
		;Find and click on the Fire
		PixelSearch, FoundX, FoundY, 52, 65, 855, 792, 0xFF00FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{	
			Random, Mspeed, 0.5, 0.8
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
		}
		;Once the prompt for cookinhg pops up, then send the spacebar to start cooking
		Loop
		{
			ImageSearch, FoundX, FoundY, 159, 679, 322, 731, *255 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210609005956.png
			If (ErrorLevel = 0)
			{
				Random, Delay, 800, 1600
				Sleep, Delay
				send, {Space}
				Random, Delay, 1500, 3000
				Sleep, Delay
				break
			}
		}
	}
}
return

MissClick()
{
	Random, MinMissPickerX, 1, 2
	if (MinMissPickerX = 1)
	{
		Random, MinMissX, -20, -16
	}
	if (MinMissPickerX = 2)
	{
		Random, MinMissX, 16, 20
	}
	Random, MinMissPickerY, 1, 2
	if (MinMissPickerY = 1)
	{
		Random, MinMissY, -20, -16
	}
	if (MinMissPickerY = 2)
	{
		Random, MinMissY, 16, 20
	}
}
return

Levelup()
{
	;Close the levelup window if you see the fish in the chat box
	ImageSearch, FoundX, FoundY, 13, 675, 516, 806, *40 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210130193941.png
	If (ErrorLevel = 0)
	{
		Status("Leveled up")
		Random, Delay, 300, 2000
		Sleep, Delay
		send, {Space}
		MouseAfterClickDelay()
	}
	;Close the dialouge window
	ImageSearch, FoundX, FoundY, 11, 680, 516, 809, *40 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210201144854.png
	If (ErrorLevel = 0)	
	{
		Status("Leveled up")
		Random, Delay, 300, 2000
		Sleep, Delay
		send, {Space}
		MouseAfterClickDelay()
	}
}
return