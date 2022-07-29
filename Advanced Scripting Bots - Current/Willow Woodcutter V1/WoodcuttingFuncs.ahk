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
		AntibanClicks()
		MenuCordz()
		Levelup()
		SpecFull()
		Invfullcheck()
		Levelup()
		MenuCordz()
		FindTreeNew()
		AntibanClicks()
		AntibanAny()
		Levelup()
		MenuCordz()
		AntibanClicks()
	}
}
return

FindTreeNew()
{
	PixelSearch, TargetX, TargetY, 805, 639, 805, 639, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		PixelSearch, FoundX, FoundY, 140, 67, 848, 628, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			Sleeper := RandomWeight(45, 100, 800)
			Sleep, Sleeper
			Random, Mspeed, 0.7, 0.9
			MoveMouse(FoundX + RandomWeight(20, 70, 137), FoundY + RandomWeight(0, 176, 350), Mspeed)
			Random, Delay, 50, 200
			Sleep, Delay
			;Custom click function that has a random hold to simulate humanized clicking
			MyClick()
			Sleeper := RandomWeight(1500, 3000, 8000)
			Sleep, Sleeper
		}
	}
}

FindTree()
{
	;Look for a fishing spot that is the closest to the player
	;If no fishing spot is found, move to the MoveLocation function
	;Updates GUI with status information
	;Pixelsearch for player state indicator (Shows when trying to interact with NPC)
	PixelSearch, TargetX, TargetY, 805, 639, 805, 639, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Status("Finding willow tree")
		Sleeper := RandomWeight(45, 100, 1500)
		Sleep, Sleeper
		;Sets the base distance to start searching  for enemies to attack
		Distance = 25
		Loop
		{
			Invfullcheck()
			;Searches for the player on screen and stores the location for reference
			MyPlayerX := 542
			MyPlayerY := 448
			
			;Searches for a target to attack within the set distance around the player
			PixelSearch, TargetX, TargetY, MyPlayerX - Distance, MyPlayerY - Distance, MyPlayerX + Distance, MyPlayerY + Distance, 0x00FFFF, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				;Uses a random weighted area around the found target to move the mouse towards
				Random, Mspeed, 0.7, 0.9
				MoveMouse(TargetX + RandomWeight(-21, 0, 21), TargetY + RandomWeight(-50, 0, 50), Mspeed)
				
				;Gets the current location of the mouse and if the mouse is close enough to the fishing spot it will click it
				MouseGetPos, CrosshairX, CrosshairY
				PixelSearch, TargetX, TargetY, CrosshairX + 21, CrosshairY + 50, CrosshairX - 21, CrosshairY - 50, 0x00FFFF, 0, Fast RGB
				If (ErrorLevel = 0)
				{
					;verify that you are hovered over the object
					PixelSearch, FoundX, FoundY, 1005, 528, 1005, 528, 0x00FFFF, 0, Fast RGB
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
					Logout()
					exitapp
				}
			}
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
		Status("Clearing Inventory")
		random, sleeper, 200, 2000
		sleep, sleeper
		PixelSearch, FoundX, FoundY, 920, 754, 961, 790, 0x00FF00, 0, Fast RGB
		If ErrorLevel = 1
		{
			InvTagBugFix()
		}
		If ErrorLevel = 0
		{
			Dropper()
			MouseAfterClickDelay()
			AntiBanLog()
		}
	}
}
return

Levelup()
{
	;Close the levelup window if you see the fish in the chat box
	ImageSearch, FoundX, FoundY, 10, 707, 516, 837, *40 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210130193941.png
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
	ImageSearch, FoundX, FoundY, 10, 707, 516, 837, *40 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210201144854.png
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

SpecFull()
{
	Random, activates, 1, 6
	If (activates = 1)
	{
		Random, Delay, 300, 2000
		Sleep, Delay
		ImageSearch, FoundX, FoundY, 871, 157, 946, 207, *35 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210625212427.png
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.5, 0.8
			MoveMouse(RandomWeight(915, 926, 937), RandomWeight(171, 182, 194), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
		}
	}
}
return