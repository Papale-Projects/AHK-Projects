#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk
#Include InterfaceCords.ahk
Global MinMissX
Global MinMissY
Global HoverActivate
Global RockCounter
Global Rock1X
Global Rock1Y
Global HoveredOver
Global RockPoint1X
Global RockPoint1Y
Global RockPoint2X
Global RockPoint2Y
Global RockPoint3X
Global RockPoint3Y

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

FineRock()
{
	FullInvCKC()
	Levelup()
	Skip := 0
	;If idle, continue
	PixelSearch, FoundX, FoundY, 806, 638, 806, 638, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;Search for iron rock number one (top rock) on screen and click it
		PixelSearch, Rock1X, Rock1Y, 89, 72, 859, 830, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			Levelup()
			Status("Clicking Rock")
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			;verify you arent hovering a rock then move the mouse to the new rock / click
			PixelSearch, FoundX, FoundY, 1005, 528, 1005, 528, 0x00FFFF, 0, Fast RGB
			If (ErrorLevel = 1)
			{
				Levelup()
				Random, Mspeed, 0.6, 0.9
				MoveMouse(Rock1X + RandomWeight(-65, 0, 65), Rock1Y + RandomWeight(-65, 0, 65), Mspeed)
				MouseClickDelay()
				MyClick()
				FullInvCKC()
				;loop until you no longer see the idle indicator
				Loop
				{
					PixelSearch, FoundX, FoundY, 772, 582, 837, 673, 0xFF0000, 0, Fast RGB
					If (ErrorLevel = 1)
					{
						Levelup()
						FullInvCKC()
						TotalFletched++
						FletchCount()
						break
					}
					Levelup()
				}
				Skip := 1
			}
			If (Skip = 0)
			{
				;If you are already hovering a rock, then just click it
				PixelSearch, FoundX, FoundY, 1005, 528, 1005, 528, 0x00FFFF, 0, Fast RGB
				If (ErrorLevel = 0)
				{
					Levelup()
					MouseClickDelay()
					MyClick()
					;loop until you no longer see the idle indicator
					Loop
					{
						PixelSearch, FoundX, FoundY, 772, 582, 837, 673, 0xFF0000, 0, Fast RGB
						If (ErrorLevel = 1)
						{
							Levelup()
							FullInvCKC()
							TotalFletched++
							FletchCount()
							break
						}
						Levelup()
					}
				}
			}
			Levelup()
			PlayerDetect()
			AntibanAny()
			;Assigns location of hovering for next rock based on the Y coord of the last rock clicked
			;If rock location is rock 1 then hover to rock 2
			If Rock1Y < 441
			{
				HoveredOver := 2
			}
			if Rock1Y > 441 && Rock1Y < 632
			{
				HoveredOver := 3
			}
			if Rock1Y > 632
			{
				HoveredOver := 1
			}
			;Move mouse to hover over the next rock to mine
			;1 in 60 chance it doesn't go to hover next rock
			random, nothover, 1, 60
			If nothover != 1
			{
				If HoveredOver = 1
				{
					WinActivate, OpenOSRS - 
					FullInvCKC()
					Status("Hovering to Rock 1")
					Levelup()
					MouseAfterClickDelay()
					Random, Mspeed, 0.6, 0.9
					MoveMouse(RockPoint1X + RandomWeight(-65, 0, 65), RockPoint1Y + RandomWeight(-65, 0, 65), Mspeed)
					FullInvCKC()
				}
				If HoveredOver = 2
				{
					WinActivate, OpenOSRS - 
					FullInvCKC()
					Status("Hovering to Rock 2")
					Levelup()
					MouseAfterClickDelay()
					Random, Mspeed, 0.6, 0.9
					MoveMouse(RockPoint2X + RandomWeight(-65, 0, 65), RockPoint2Y + RandomWeight(-65, 0, 65), Mspeed)
					FullInvCKC()
				}
				If HoveredOver = 3
				{
					WinActivate, OpenOSRS - 
					FullInvCKC()
					Status("Hovering to Rock 3")
					Levelup()
					MouseAfterClickDelay()
					Random, Mspeed, 0.6, 0.9
					MoveMouse(RockPoint3X + RandomWeight(-65, 0, 65), RockPoint3Y + RandomWeight(-65, 0, 65), Mspeed)
					FullInvCKC()
				}
			}
		}
	}
}
return

FullInvCKC()
{
	;Check for full inventory indicator on the Screen
	PixelSearch, FullInvX, FullInvY, 806, 579, 806, 579, 0x0000FF, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Status("Dropping")
		MouseAfterClickDelay()
		Dropper()
		AntiBanLog()
		InvTagBugFix()
	}
}
return

PlayerHop()
{
	;If player is detected, then hop worlds until no one is found
	PlayerDetect()
}
return

Levelup()
{
	;Close the levelup window if you see the fish in the chat box
	ImageSearch, FoundX, FoundY, 479, 678, 534, 738, *30 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20211215211002.png
	If (ErrorLevel = 0)
	{
		Status("Leveled up")
		Random, Delay, 300, 2000
		Sleep, Delay
		send, {Space}
		MouseAfterClickDelay()
	}
	;Close the dialouge window
	ImageSearch, FoundX, FoundY, 479, 678, 534, 738, *30 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20211215211002.png
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

SetRockPoints()
{
	PixelSearch, RockPoint1X, RockPoint1Y, 73, 93, 852, 829, 0x00FFFF, 0, Fast RGB
	PixelSearch, RockPoint2X, RockPoint2Y, 73, RockPoint1Y + 40, 852, 829, 0x00FFFF, 0, Fast RGB
	PixelSearch, RockPoint3X, RockPoint3Y, 73, RockPoint2Y + 40, 852, 829, 0x00FFFF, 0, Fast RGB
}
return