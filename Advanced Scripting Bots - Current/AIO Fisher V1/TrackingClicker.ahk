#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk

TrackingClicker()
{
	;This Function checks to make sure the character is standing on a marked tile and if not it logs out
	;InAreaCheck()
	;Updates GUI with status information
	;Pixelsearch for player state indicator (Shows when trying to interact with NPC)
	PixelSearch, TargetX, TargetY, 805, 631, 805, 631, 0x73FF00, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		Status("Finding Fishing Spot")
		Random, Sleeper, 500, 3500
		Sleep, Sleeper
		;Sets the base distance to start searching  for enemies to attack
		Distance = 30
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
					break
					Status("")
				}
			}
			;If no targets where found in the first radius around the character then expand the radius out each cycle
			If (ErrorLevel = 1)
			{
				Distance += 30
				Counter++
				If (Counter = 33)
				{
					Random, Direction, 1, 2
					Loop
					{
						Random, Enable, 1, 1
						Random, SpinHold, 150, 750
						If (Direction = 1)
						{
							Hotkey := "Right"
						}
						If (Direction = 2)
						{
							Hotkey := "Left"
						}
						If (Enable = 1)
						{
							AntibanCam2++
							AntibanCam()
							Status("Camera Antiban")
							Send {%Hotkey% down}
							Sleep, SpinHold
							Send {%Hotkey% up}
						}
						PixelSearch, FoundX, FoundY, 5, 29, 852, 800, 0x00FFFF, 0, Fast RGB
						If ErrorLevel = 0
						{
							break
						}
						
					}
				}
				Continue
			}
		}
	}
}
return