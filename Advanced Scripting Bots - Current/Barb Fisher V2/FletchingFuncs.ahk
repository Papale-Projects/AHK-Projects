#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk
Global MinMissX
Global MinMissY

Grablogs()
{
	;Only grab logs if you can't currently find logs in my inventory
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
	If ErrorLevel = 1
	{
		VerifyInBank()
		VerifyInvKnife()
		VerifyBowsNotInv()
		Status("Grabbing Logs")
		;Move mouse to top left slot in bank to grab logs
		Random, Mspeed, 0.5, 0.8
		MoveMouse(250 + RandomWeight(-11, 0, 11), 124 + RandomWeight(-11, 0, 11), Mspeed)
		MouseClickDelay()
		MyClick()
		MouseAfterClickDelay()
		MouseAfterClickDelay()
	}
	ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
	if errorlevel = 0
	{
		CloseBank()
		AntiBanLog()
	}
	VerifyInventoryOpen()
}

;Never activate on this function, use the verify function
GrabKnife()
{
	Status("Grabbing Knife")
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
	If ErrorLevel = 1
	{
		Random, Mspeed, 0.5, 0.8
		MoveMouse(296 + RandomWeight(-11, 0, 11), 122 + RandomWeight(-11, 0, 11), Mspeed)
		MouseClickDelay()
		MyClick()
		MouseAfterClickDelay()
	}
}

CloseBank()
{
	Status("Closing Bank")
	Send, {escape}
	Random, Delay, 800, 1400
	Sleep, Delay
}

DepositBows()
{
	Status("Depositing Bows")
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;Calculate missclick and use the pixelsearch of the bow in the inventory
		Random, AntiMissClick, 1, 11
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
		Random, Mspeed, 0.5, 0.8
		MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
		MouseClickDelay()
		MyClick()
		MouseAfterClickDelay()
		;Add to total amount fletched after depositing the bows
		TotalFletched += 27
		FletchCount()
	}
}

VerifyBowsNotInv()
{
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		VerifyInBank()
		DepositBows()
	}
}

VerifyInvKnife()
{
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
	If ErrorLevel = 1
	{
		VerifyInBank()
		GrabKnife()
	}
}

VerifyInvLogs()
{
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
	If ErrorLevel = 1
	{
		;Verify that the banking interface is open and if it isn't, then open it. Afterwards grab the logs out of the bank.
		VerifyInBank()
		Grablogs()
	}
}

VerifyInBank()
{
	;Do a imagesearch for the X button in the banking interface
	ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
	;If you can't find it, then click on the banker NPC
	If ErrorLevel = 1
	{
		PixelSearch, FoundX, FoundY, 9, 32, 813, 799, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.5, 0.8
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
		}
	}
}

VerifyNotInBank()
{
	;Do a imagesearch for the X button in the banking interface
	ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
	;If you can find it, then activate the closebank function
	If ErrorLevel = 0
	{
		CloseBank()
	}
}

VerifyInventoryOpen()
{
	Status("Checking InvOpen")
	;Search for indicator that shows if you have a knife or logs in the inventory
	PixelSearch, FoundX, FoundY, 890, 505, 927, 532, 0x00FFFF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;If you can't find the knife after verifying that you have one in the inventory, then click on the inventory icon
		PixelSearch, FoundX, FoundY, 857, 532, 1042, 792, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 1
		{
			;Click on the inventory menu icon to open the inventory
			Random, Mspeed, 0.5, 0.8
			MoveMouse(RandomWeight(728, 743, 758), RandomWeight(800, 817, 835), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
		}
	}
}

LoopWhileFletching()
{
	Status("Looping Fletching")
	Loop
	{
		AntibanAny()
		AntibanClicks()
		;Verify that im currently idle, otherwise continue antiban activations and AFKing.
		PixelSearch, FoundX, FoundY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 0
			{
				break
			}
			;A short random delay after finishing the inventory.
			MouseAfterClickDelay()
			;After I've finished fletching then continue on with the banking process and break the loop
			Grablogs()
			break
		}
	}
}

StartFletching()
{
	;Check for: Knife, Logs, not in bank, and no bows left in inventory.
	VerifyBowsNotInv()
	VerifyInvKnife()
	VerifyInvLogs()
	;VerifyNotInBank()
	Status("Starting to Fletch")
	;Find and click on the knife in the inventory
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
	If ErrorLevel = 0
	{
		;Calculate missclick and use the pixelsearch of the knife in the inventory
		Random, AntiMissClick, 1, 11
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
		Random, Mspeed, 0.5, 0.8
		MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
		MouseClickDelay()
		MyClick()
		MouseAfterClickDelay()
	}
	;Find and click on the logs in the inventory
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
	If ErrorLevel = 0
	{
		;Calculate missclick and use the pixelsearch of the logs in the inventory
		Random, AntiMissClick, 1, 11
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
		Random, Mspeed, 0.5, 0.8
		MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
		MouseClickDelay()
		MyClick()
		MouseAfterClickDelay()
		If (AntiMissClick = 1)
		{
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
			If ErrorLevel = 0
			{
				Random, Mspeed, 0.5, 0.8
				MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
				MouseClickDelay()
				MyClick()
				MouseAfterClickDelay()
			}
		}
		
	}
	AntibanClicks()
	;Once the prompt for fletching pops up, then send the spacebar to start fletching
	Random, Delay, 300, 600
	Sleep, Delay
	send, {Space}
	;Pause for verfiybowfletched function, start the loop to do antibans while waiting for the fletching process
	Random, Delay, 5000, 8000
	Sleep, Delay
	VerifyBowFletched()
	LoopWhileFletching()
}

MoveAfterBank()
{
	Random, Mspeed, 0.5, 0.8
	MoveMouse(883 + RandomWeight(-60, 0, 60), 551 + RandomWeight(-60, 0, 60), Mspeed)
	MouseClickDelay()
}

VerifyBowFletched()
{
	PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		StartFletching()
	}
}


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