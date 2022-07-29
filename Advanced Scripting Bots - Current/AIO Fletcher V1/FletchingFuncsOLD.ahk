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
	ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
	If ErrorLevel = 0
	{
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 1
		{
			Random, Mspeed, 0.5, 0.8
			MoveMouse(296 + RandomWeight(-11, 0, 11), 122 + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
			If ErrorLevel = 1
			{
				Grablogs()
			}
		}
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 1
		{
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, AntiMissClick, 1, 11
				If (AntiMissClick = 1)
				{
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
				TotalFletched += 27
				FletchCount()
			}
			Random, AntiMissClick, 1, 11
			If (AntiMissClick = 1)
			{
				MissClick2++
				MissClickGui()
				MissClick()
				Random, Mspeed, 0.5, 0.8
				MoveMouse(250 + MinMissX, 124 + MinMissY, Mspeed)
				MouseClickDelay()
				MyClick()
				MouseAfterClickDelay()
			}	
			Random, Mspeed, 0.5, 0.8
			MoveMouse(250 + RandomWeight(-11, 0, 11), 124 + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 1
			{
				Grablogs()
			}
		}
		Send, {escape}
		Random, Delay, 300, 800
		Sleep, Delay
		Loop
		{
			PixelSearch, FoundX, FoundY, 317, 37, 516, 61, 0xFF981F, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				MouseAfterClickDelay()
				Send, {escape}
				MouseAfterClickDelay()
			}
			If (ErrorLevel = 1)
			{
				break
			}
		}
		Random, Delay, 650, 1200
		Sleep, Delay
	}
}
	
	StartFletch()
	{
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
		If (ErrorLevel = 0)
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
				PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
				If (ErrorLevel = 0)
				{
					Random, AntiMissClick, 1, 11
					If (AntiMissClick = 1)
					{
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
					TotalFletched += 27
					FletchCount()
					Grablogs()
					StartFletch()
				}
			}
		}
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 0
			{
				PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, AntiMissClick, 1, 11
					If (AntiMissClick = 1)
					{
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
			}
		}
		If ErrorLevel = 1
		{
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 0
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
				Grablogs()
				StartFletch()
			}
			Random, Mspeed, 0.5, 0.8
			MoveMouse(RandomWeight(728, 743, 758), RandomWeight(800, 817, 835), Mspeed)
			MouseClickDelay()
			MyClick()
			MouseAfterClickDelay()
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
			If ErrorLevel = 0
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
				If Errorlevel = 1
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
					Grablogs()
					StartFletch()
				}
			}
		}
		ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
		If (ErrorLevel = 1)
		{
			PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
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
					Grablogs()
					StartFletch()
				}
			}
		}
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, AntiMissClick, 1, 11
			If (AntiMissClick = 1)
			{
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
		Random, Delay, 300, 600
		Sleep, Delay
		send, {Space}
		Random, Delay, 5000, 8000
		Sleep, Delay
		PixelSearch, FoundX, FoundY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			AfterClickMove()
			RandomRightClicker()
			StartFletch()
		}
		loop
		{
			AntibanAny()
			AntibanClicks()
			PixelSearch, FoundX, FoundY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Random, Delay, 550, 2500
				Sleep, Delay
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
					ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
					If (ErrorLevel = 0)
					{
						PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							Random, AntiMissClick, 1, 11
							If (AntiMissClick = 1)
							{
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
							TotalFletched += 27
							FletchCount()
							Grablogs()
							continue
						}
						If (ErrorLevel = 1)
						{
							PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
							If (ErrorLevel = 0)
							{
								break
							}
							If (ErrorLevel = 1)
							{
								Random, Mspeed, 0.5, 0.8
								MoveMouse(296 + RandomWeight(-11, 0, 11), 122 + RandomWeight(-11, 0, 11), Mspeed)
								MouseClickDelay()
								MyClick()
								MouseAfterClickDelay()
								continue
							}
						}
					}
					If (ErrorLevel = 1)
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
							StartFletch()
						}
					}
				}
				PixelSearch, FoundX, FoundY, 9, 32, 813, 799, 0x00FFFF, 0, Fast RGB
				If (ErrorLevel = 1)
				{
					ImageSearch, FoundX, FoundY, 564, 25, 708, 160, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20201230134726.png
					If (ErrorLevel = 0)
					{
						PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							Random, Mspeed, 0.5, 0.8
							MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
							MouseClickDelay()
							MyClick()
							MouseAfterClickDelay()
							TotalFletched += 27
							FletchCount()
							PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
							If (ErrorLevel = 1)
							{
								Random, Mspeed, 0.5, 0.8
								MoveMouse(296 + RandomWeight(-11, 0, 11), 122 + RandomWeight(-11, 0, 11), Mspeed)
								MouseClickDelay()
								MyClick()
								MouseAfterClickDelay()
								break
							}
							break
						}
						PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF00FF, 0, Fast RGB
						If (ErrorLevel = 1)
						{
							PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
							If (ErrorLevel = 1)
							{
								Random, Mspeed, 0.5, 0.8
								MoveMouse(296 + RandomWeight(-11, 0, 11), 122 + RandomWeight(-11, 0, 11), Mspeed)
								MouseClickDelay()
								MyClick()
								MouseAfterClickDelay()
								break
							}
							If (ErrorLevel = 0)
							{
								break
							}
						}
					}
					If (ErrorLevel = 1)
					{
						AfterClickMove()
						StartFletch()
						break
					}
				}
			}
			
		}
	}
	
	StartFletchTester()
	{
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, AntiMissClick, 1, 11
			If (AntiMissClick = 1)
			{
				MissClick()
				Random, Mspeed, 0.5, 0.8
				MoveMouse(FoundX + MinMissX, FoundY + MinMissY, Mspeed)
				MouseClickDelay()
				MyClick()
				MouseAfterClickDelay()
			}		
		;Random, Mspeed, 0.5, 0.8
		;MoveMouse(FoundX + RandomWeight(-15, 0, 15), FoundY + RandomWeight(-15, 0, 15), Mspeed)
		;MouseClickDelay()
		;MyClick()
		;MouseAfterClickDelay()
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