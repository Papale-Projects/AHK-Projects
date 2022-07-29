#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk

TrackingClicker()
{
	;This Function checks to make sure the character is standing on a marked tile and if not it logs out
	InAreaCheck()
	;Updates GUI with status information
	Status("Finding Target to Attack")
	;Pixelsearch for player state indicator (Shows when trying to interact with NPC)
	PixelSearch, TargetX, TargetY, 805, 631, 805, 631, 0x73FF00, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		;Sets the base distance to start searching  for enemies to attack
		Distance = 25
		Loop
		{
			;Searches for the player on screen and stores the location for reference
			PixelSearch, MyPlayerX, MyPlayerY, 16, 43, 839, 795, 0x05FF00, 0, Fast RGB
			
			;Searches for a target to attack within the set distance around the player
			PixelSearch, TargetX, TargetY, MyPlayerX - Distance, MyPlayerY - Distance, MyPlayerX + Distance, MyPlayerY + Distance, 0x00FFFF, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				;Uses a random weighted area around the found target to move the mouse towards
				Random, Mspeed, 0.6, 0.9
				MoveMouse(TargetX + RandomWeight(-10, 0, 10), TargetY + RandomWeight(-10, 0, 10), Mspeed)
				
				;Gets the current location of the mouse and if the mouse is close enough to the targetted monster it will click it
				MouseGetPos, CrosshairX, CrosshairY
				PixelSearch, TargetX, TargetY, CrosshairX + 9, CrosshairY + 9, CrosshairX - 9, CrosshairY - 9, 0x00FFFF, 0, Fast RGB
				If (ErrorLevel = 0)
				{
					Random, Delay, 50, 200
					Sleep, Delay
					;Custom click function that has a random hold to simulate humanized clicking
					MyClick()
					;Waits a delay between the click for a buffer for the indicator / moving towards the target
					Random, Delay, 1000, 1200
					Sleep, Delay
					;Searches for the player state indicator to validate that the it wasn't a misclick
					PixelSearch, TargetX, TargetY, 805, 631, 805, 631, 0x73FF00, 0, Fast RGB
					If (ErrorLevel = 0)
					{
						;Added buffer for character to move closer to the target
						Random, Delay, 2500, 3200
						Sleep, Delay
						;Searches play state indicator of animation (This should only display when not attacking a target)
						PixelSearch, TargetX, TargetY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							;Attempts this process twice and if the script has clicked on an NPC twice but was unsuccessful (Because of a door/wall/obstacle)
							Count += 1
							If (Count >= 2)
							{
								;Updates status / finds and clicks marked location on minimap to recenter character / restarts function
								Status("Moving back to center")
								PixelSearch, TargetX, TargetY, 902, 39, 1042, 189, 0xFEC700, 0, Fast RGB
								If (ErrorLevel = 0)
								{
									Random, Mspeed, 0.6, 0.9
									MoveMouse(TargetX + RandomWeight(-10, 0, 10), TargetY + RandomWeight(-10, 0, 10), Mspeed)
									Random, Delay, 250, 400
									Sleep, Delay
									MyClick()
									;Buffer to allow character to move
									Random, Delay, 2500, 6500
									Sleep, Delay
									Continue
								}
								If (ErrorLevel = 1)
								{
									;If the script can't find the marked area on the minimap then it will logout and send a error message
									Logout()
									Msgbox, "Starting area not found!"
								}
							}
							Continue
						}
						If (ErrorLevel = 1)
						{
							break
						}
					}
					If (ErrorLevel = 1)
					{
						Continue
					}
				}
			}
			;If no targets where found in the first radius around the character then expand the radius out each cycle
			If (ErrorLevel = 1)
			{
				Distance += 5
				Continue
			}
		}
	}
}
return