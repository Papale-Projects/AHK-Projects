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
		Levelup()
		equipcheck()
		Invfullcheck()
		Levelup()
		FindFish()
		AntibanClicks()
		AntibanAny()
		Levelup()
		equipcheck()
	}
}
return

FindFish()
{
	equipcheck()
	PixelSearch, FoundX, FoundY, 6, 30, 848, 799, 0x00FFFF, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		Movelocation()
	}
	;Look for a fishing spot that is the closest to the player
	;If no fishing spot is found, move to the MoveLocation function
	;Updates GUI with status information
	;Pixelsearch for player state indicator (Shows when trying to interact with NPC)
	PixelSearch, TargetX, TargetY, 805, 639, 805, 639, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Status("Finding fishing spot")
		Sleeper := RandomWeight(45, 100, 1500)
		Sleep, Sleeper
		;Sets the base distance to start searching  for enemies to attack
		Distance = 25
		Loop
		{
			PixelSearch, FoundX, FoundY, 6, 30, 848, 799, 0x00FFFF, 0, Fast RGB
			If (ErrorLevel = 1)
			{
				Movelocation()
			}
			Invfullcheck()
			;Searches for the player on screen and stores the location for reference
			MyPlayerX := 534
			MyPlayerY := 423
			
			;Searches for a target to attack within the set distance around the player
			PixelSearch, TargetX, TargetY, MyPlayerX - Distance, MyPlayerY - Distance, MyPlayerX + Distance, MyPlayerY + Distance, 0x00FFFF, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				;Uses a random weighted area around the found target to move the mouse towards
				Random, Mspeed, 0.7, 0.9
				MoveMouse(TargetX + RandomWeight(-10, 0, 10), TargetY + RandomWeight(-10, 0, 10), Mspeed)
				
				;Gets the current location of the mouse and if the mouse is close enough to the fishing spot it will click it
				MouseGetPos, CrosshairX, CrosshairY
				PixelSearch, TargetX, TargetY, CrosshairX + 12, CrosshairY + 12, CrosshairX - 12, CrosshairY - 12, 0x00FFFF, 0, Fast RGB
				If (ErrorLevel = 0)
				{
					Random, Delay, 50, 200
					Sleep, Delay
					;Custom click function that has a random hold to simulate humanized clicking
					MyClick()
					;Waits a delay between the click for a buffer for the indicator / moving towards the target
					Random, Delay, 5500, 8000
					Sleep, Delay
					;Searches for the player state indicator to validate that the click was register then break the loop
					PixelSearch, TargetX, TargetY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
					If (ErrorLevel = 1)
					{
						break
					}
					If (ErrorLevel = 0)
					{
						Continue
					}
				}
			}
			;If no targets where found in the first radius around the character then expand the radius out each cycle
			PixelSearch, TargetX, TargetY, MyPlayerX - Distance, MyPlayerY - Distance, MyPlayerX + Distance, MyPlayerY + Distance, 0x00FFFF, 0, Fast RGB
			If (ErrorLevel = 1)
			{
				Distance += 2
				Continue
				If (Distance > 2000)
				{
					Movelocation()
				}
			}
		}
	}
}
return

equipcheck()
{
	InvTagBugFix()
	;verify that you have feathers when starting the script and the inventory is open
	ImageSearch, FoundX, FoundY, 863, 528, 1061, 799, *150 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210525150722.png
	If (ErrorLevel = 1)
	{
		;Click on the inventory menu icon to open the inventory
		ImageSearch, FoundX, FoundY, 791, 481, 1065, 802, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210520152228.png
		If (ErrorLevel = 1)
		{
			Random, Mspeed, 0.5, 0.8
			MoveMouse(RandomWeight(728, 743, 758), RandomWeight(800, 817, 835), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			InvTagBugFix()
		}
	}
}
return

Invfullcheck()
{
	;color 0x00FF00
	;pixelsearch for inventory full indicator and then activate the dropper function
	PixelSearch, FoundX, FoundY, 805, 578, 805, 578, 0x0000FF, 0, Fast RGB
	If ErrorLevel = 0
	{
		equipcheck()
		Status("Clearing Inventory")
		random, sleeper, 200, 2000
		sleep, sleeper
		PixelSearch, FoundX, FoundY, 920, 754, 961, 790, 0x00FF00, 0, Fast RGB
		If ErrorLevel = 1
		{
			;Click on the inventory menu icon to open the inventory
			Random, Mspeed, 0.5, 0.8
			MoveMouse(RandomWeight(736, 750, 766), RandomWeight(800, 817, 835), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
		}
		If ErrorLevel = 0
		{
			Dropper()
			MouseAfterClickDelay()
			equipcheck()
			AntiBanLog()
		}
	}
}
return

Movelocation()
{
	;If fishing spot cannot be found on the screen, then click on the fishing spot on the minimap to move to it
	PixelSearch, FoundX, FoundY, 891, 31, 1054, 193, 0x00B2B2, 10, Fast RGB
	If (ErrorLevel = 0)
	{
		MinimapDis := 3
		Loop
		{
			PixelSearch, FoundX, FoundY, 891, 31, 1054, 193, 0xF805F5, 60, Fast RGB
			If (ErrorLevel = 0)
			{
				;center minimap = X 972, Y 113
				PixelSearch, TargetX, TargetY, FoundX - MinimapDis, FoundY - MinimapDis, FoundX + MinimapDis, FoundY + MinimapDis, 0x00B2B2, 0, Fast RGB
				If (ErrorLevel = 0)
				{
					;Uses a random weighted area around the found target to move the mouse towards
					Status("Moving Locations")
					Random, Mspeed, 0.7, 0.9
					MoveMouse(TargetX + RandomWeight(-3, 0, 3), TargetY + RandomWeight(-3, 0, 3), Mspeed)
					MouseClickDelay()
					MyClick()
					;Added buffer for character to move closer to the target
					Random, Delay, 3000, 5000
					Sleep, Delay
					break
				}
				If (ErrorLevel = 1)
				{
					MinimapDis += 1
					sleep, 10
					If (MinimapDis > 400)
					{
						break
					}
				}
			}
		}
	}
	If (ErrorLevel = 1)
	{
		;If there are no fishing spots on the minimap, then click on the purple marker
		PixelSearch, FoundX, FoundY, 891, 31, 1054, 193, 0xF805F5, 60, Fast RGB
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.7, 0.9
			MoveMouse(TargetX + RandomWeight(-3, 0, 3), TargetY + RandomWeight(-3, 0, 3), Mspeed)
			MouseClickDelay()
			MyClick()
			Random, Delay, 3000, 5000
			Sleep, Delay
		}
		;If you can't find a fishing spot or the purple marker then logout and pause the script
		If (ErrorLevel = 1)
		{
			Countingz++
			If countingz = 1
			{
				Random, Sleeper, 6000, 8000
				Sleep, Sleeper
				Movelocation()
			}
			If Countingz > 1
			{
				Logout()
				msgbox, "No marker found!"
			}
		}
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
		MouseAfterClickDelay()
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
		MouseAfterClickDelay()
		MouseAfterClickDelay()
	}
}
return