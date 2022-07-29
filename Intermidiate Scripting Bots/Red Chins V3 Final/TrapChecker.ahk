#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include WaitPixelColor.ahk

;tile0darkblue colors: 64009B-broke trap 00649B-caught chin 64649B-idle trap
;tile1gray colors: D97575-broke trap 75D975-caught chin D9D975-idle trap
;tile2lightblue colors: 649B9B-broke trap 00FF9B-caught chin 64FF9B-idle trap
;tile3gold colors: FF7A00-broke trap 9BDE00-caught chin FFDE00-idle trap
;tile4pink colors: FF6A6A-broke trap 9BCE6A-caught chin FFCE6A-idle trap

TrapChecker()
{
Random, Ran, 1, 75
If (Ran = 1)
{
	;Variables
	CountColorIdle := 0
	CountColorCaught := 0
	CountColorBroke := 0

	Loop, 5
	{
	;If statement to assign color values per loop
	If (CountColorIdle = 0)
	{
		ColorSearchIdle := "0x64649B"
	}
	Else If (CountColorIdle = 1)
	{
		ColorSearchIdle := "0xD9D975"
	}
	Else If (CountColorIdle = 2)
	{
		ColorSearchIdle := "0x64FF9B"
	}
	Else If (CountColorIdle = 3)
	{
		ColorSearchIdle := "0xFFDE00"
	}
	Else If (CountColorIdle = 4)
	{
		ColorSearchIdle := "0xFFCE6A"
	}
	
	If (CountColorCaught = 0)
	{
		ColorSearchCaught := "0x00649B"
	}
	Else If (CountColorCaught = 1)
	{
		ColorSearchCaught := "0x75D975"
	}
	Else If (CountColorCaught = 2)
	{
		ColorSearchCaught := "0x00FF9B"
	}
	Else If (CountColorCaught = 3)
	{
		ColorSearchCaught := "0x9BDE00"
	}
	Else If (CountColorCaught = 4)
	{
		ColorSearchCaught := "0x9BCE6A"
	}
	
	If (CountColorBroke = 0)
	{
		ColorSearchBroke := "0x64009B"
	}
	Else If (CountColorBroke = 1)
	{
		ColorSearchBroke := "0xD97575"
	}
	Else If (CountColorBroke = 2)
	{
		ColorSearchBroke := "0x649B9B"
	}
	Else If (CountColorBroke = 3)
	{
		ColorSearchBroke := "0xFF7A00"
	}
	Else If (CountColorBroke = 4)
	{
		ColorSearchBroke := "0xFF6A6A"
	}
	
	If (CountColorIdle = 0)
	{
		ColorSearchTile := "0x0000FF"
	}
	Else If (CountColorIdle = 1)
	{
		ColorSearchTile := "0xC0C0C0"
	}
	Else If (CountColorIdle = 2)
	{
		ColorSearchTile := "0x00FFFF"
	}
	Else If (CountColorIdle = 3)
	{
		ColorSearchTile := "0xFFC800"
	}
	Else If (CountColorIdle = 4)
	{
		ColorSearchTile := "0xFFAFAF"
	}
	
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchIdle%, 0, Fast RGB
		If ErrorLevel = 1
		{
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchCaught%, 0, Fast RGB
			If ErrorLevel = 1
			{
				PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchBroke%, 0, Fast RGB
				If ErrorLevel = 1
				{
					Random, Sleeping, 1250, 1500
					Sleep, Sleeping
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchIdle%, 0, Fast RGB
						If ErrorLevel = 1
						{
							CountColorIdle += 1
							PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchCaught%, 0, Fast RGB
								If ErrorLevel = 1
								{
									CountColorCaught += 1
									PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchBroke%, 0, Fast RGB
									If ErrorLevel = 1
									{
										CountColorBroke += 1
										PixelSearch, FoundX, FoundY, 8, 32, 519, 366, %ColorSearchTile%, 0, Fast RGB
										If ErrorLevel = 0
										{
											Random, MouseSpeed, 0.50, 0.65
											Random, Delay, 85, 210
											Random, Indicate, 4500, 5500
											Random, Walking, 85, 450
											Random, Wait, 85, 450
											Random, Location, 680, 850
											Sleep, Wait
											MoveMouse(FoundX+RandomWeighted(3,10,15), FoundY+RandomWeighted(3,10,15), MouseSpeed)
											Sleep, Delay
											Click
											PixelSearch, FoundX, FoundY, 552, 234, 739, 417, 0xFF0000, 0, Fast RGB
												If ErrorLevel = 0
												{
													Random, Delay, 350, 500
													Sleep, Delay
													MoveMouse(FoundX+RandomWeighted(-6,0,6), FoundY+RandomWeighted(-6,0,6), MouseSpeed)
													Sleep, Location
													Click
													Random, Delay, 85, 210
													Sleep, Delay
													Sleep, Indicate
													WaitPixelColor(0xFFFFFF, 35, 355)
													Sleep, Walking
													Continue
												}
										}
									}
									If ErrorLevel = 0
									{
										CountColorBroke += 1
										Continue
									}
								}
								If ErrorLevel = 0
								{
									CountColorCaught += 1
									CountColorBroke += 1
									Continue
								}
						}
						If ErrorLevel = 0
						{
							CountColorIdle += 1
							CountColorCaught += 1
							CountColorBroke += 1
							Continue
						}
				}
				If ErrorLevel = 0
				{
					CountColorBroke += 1
					Continue
				}
			}
			If ErrorLevel = 0
			{
				CountColorCaught += 1
				CountColorBroke += 1
				Continue
			}
		}
		If ErrorLevel = 0
		{
			CountColorIdle += 1
			CountColorCaught += 1
			CountColorBroke += 1
			Continue
		}
	}
}
}