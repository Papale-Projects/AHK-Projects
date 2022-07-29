#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk
#Include InterfaceCords.ahk
#include WaitPixelColor.ahk

Running()
{
	MiningBlocks()
	PathingToAltar()
}
return

MiningBlocks()
{
	Loop
	{
		;Full inventory Check
		FullInv := TargetCenter(1007, 803, 1007, 803, 0x00FF00, 0, 0)
		If FullInv[1] > 0
		{
			Status("Inv Full")
			break
		}
		
		IdleRock := TargetCenter(804, 638, 804, 638, 0xFF0000, 0, 0)
		If IdleRock[1] > 0
		{
			;Find dense rock to mine and mine until inventory is full
			;If idle, find another rock
			loop
			{
				Status("Finding Runestone")
				Result := TargetCenter(7, 100, 833, 830, 0xCA00D2, 12, 1)
				If Result[1] > 0
				{
					;Click on the dense runestone 1
					MyMouseMove(Result[1], Result[2])
					MouseGetPos, VerifyTargetX, VerifyTargetY
					PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
					If (Errorlevel = 0)
					{
						;break loop once rock has been found and you are mining
						MyClick(0,0)
						Status("Mining Runestone")
						BankingDelays()
						break
					}
				}
				
				;If runestone 1 wasn't found, then find 2
				Result := TargetCenter(7, 100, 833, 830, 0xFF5AFF, 12, 1)
				If Result[1] > 0
				{
					;Click on the dense runestone 2
					MyMouseMove(Result[1], Result[2])
					MouseGetPos, VerifyTargetX, VerifyTargetY
					PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
					If (Errorlevel = 0)
					{
						;break loop once rock has been found and you are mining
						MyClick(0,0)
						Status("Mining Runestone")
						BankingDelays()
						break
					}
				}
			}
		}
		
		;Full inventory Check
		FullInv := TargetCenter(1007, 803, 1007, 803, 0x00FF00, 0, 0)
		If FullInv[1] > 0
		{
			Status("Inv Full")
			break
		}
		
		;If not idle and inventory isn't full then go offscreen
		OffScreenMouse()
	}
}
return

Venerate()
{
	WebWalkerDelays()
	Status("Venerate")
	loop
	{
		PixelSearch, FoundX, FoundY, 15, 71, 825, 820, 0xDDFF00, 0, Fast RGB
		If (Errorlevel = 0)
		{
			BankingDelays()
			Idlewait()
			break
		}
	}
	Result := TargetCenter(15, 71, 825, 820, 0xDDFF00, 0)
	If Result[1] > 0
	{
		loop
		{
			BankingDelays()
			;Click on the altar
			Result := TargetCenter(15, 71, 825, 820, 0xDDFF00, 0)
			MyMouseMove(Result[1], Result[2])
			MouseGetPos, VerifyTargetX, VerifyTargetY
			PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
			If (Errorlevel = 0)
			{
				MyClick(0,0)
				BankingDelays()
				break
			}
		}
	}
	
	;If you cant find the mine markers
	Result1map := TargetCenter(892, 30, 1038, 190, 0x0000FF, 0)
	If Resultfrag[1] < 1
	{
		;If you can't find fragments, then click to chisel blocks, otherwise exit function naturally
		Resultfrag := TargetCenter(853, 568, 1029, 822, 0x00FFFF, 0)
		If Resultfrag[1] < 1
		{
			Status("Creating Fragments")
			ChiselX := RandomWeight(863, 880, 897)
			ChiselY := RandomWeight(571, 586, 602)
			MyMouseMove(ChiselX, ChiselY)
			loop
			{
				;Wait for the blocks to be venerated
				FullInv := TargetCenter(1007, 803, 1007, 803, 0x0000FF, 0, 0)
				If FullInv[1] > 0
				{
					BankingDelays()
					break
				}
			}
			
			loop
			{
				;continuously click until there is no more blocks
				MyClick(2,0)
				DelayDrops()
				;Empty inventory Check
				FullInv := TargetCenter(1007, 803, 1007, 803, 0x0000FF, 0, 0)
				If FullInv[1] < 1
				{
					AntiBanLog()
					Status("Inv clear")
					PathingToMineFromAlter()
					AntiBanLog()
					break
				}
			}
		}
	}
	
	;If you can't find mine map markers
	Result1map := TargetCenter(892, 30, 1038, 190, 0x0000FF, 0)
	If Result1map[1] < 1
	{
		;If you can find fragements
		Resultfrags := TargetCenter(853, 568, 1029, 822, 0x00FFFF, 0)
		If Resultfrags[1] > 1
		{
			loop
			{
				;Wait for the blocks to be venerated
				FullInv := TargetCenter(1007, 803, 1007, 803, 0x0000FF, 0, 0)
				If FullInv[1] > 0
				{
					AntiBanLog()
					BankingDelays()
					PathtoBloodAltar()
					CraftBloods()
					AntiBanLog()
					break
				}
			}
		}
	}
}
return

CraftBloods()
{
	Status("Crafting Bloods")
	Loop
	{
		;Loop until you have hovered / clicked on altar
		PixelSearch, FoundX, FoundY, 825, 820, 15, 71, 0xCA00D2, 0, Fast RGB
		If (Errorlevel = 0)
		{
			WebWalkerDelays()
			Idlewait()
			loop
			{
				DelayDrops()
				PixelSearch, FoundX, FoundY, 825, 820, 15, 71, 0xCA00D2, 0, Fast RGB
				;Click on the altar
				MyMouseMove(FoundX + RandomWeight(-5, -30, -70), FoundY + RandomWeight(-5, -40, -55))
				MouseGetPos, VerifyTargetX, VerifyTargetY
				PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
				If (Errorlevel = 0)
				{
					MyClick(0,0)
					BankingDelays()
					break
				}
			}
			break
		}
	}
	
	;If you can't find fragments, then click to chisel blocks, otherwise exit function naturally
	;Loop until you can not find the fragments in your inventory
	loop
	{
		PixelSearch, FoundX, FoundY, 853, 568, 1029, 822, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 1)
		{
			BankingDelays()
			Status("Creating Fragments")
			ChiselX := RandomWeight(863, 880, 897)
			ChiselY := RandomWeight(571, 586, 602)
			MyMouseMove(ChiselX, ChiselY)
			loop
			{
				;continuously click until there is no more blocks
				MyClick(2,0)
				DelayDrops()
				;Wait for the blocks to be venerated
				PixelSearch, FoundX, FoundY, 1007, 803, 1007, 803, 0x0000FF, 0, Fast RGB
				If (ErrorLevel = 1)
				{
					BankingDelays()
					break
				}
			}
			
			loop
			{
				;inventory check to make sure that there aren't any blocks Left
				;Then click on the altar again to craft the rest
				PixelSearch, FoundX, FoundY, 1007, 803, 1007, 803, 0x0000FF, 0, Fast RGB
				If (ErrorLevel = 1)
				{
					AfterClickMove()
					PixelSearch, FoundX, FoundY, 6, 28, 102, 45, 0xE2813C, 25, Fast RGB
					If (ErrorLevel = 0)
					{
						ChiselX := RandomWeight(863, 880, 897)
						ChiselY := RandomWeight(571, 586, 602)
						MyMouseMove(ChiselX, ChiselY)
						DelayDrops()
						MyClick(2,0)
						MouseAfterClickDelay()
					}
					Status("Crafting Bloods")
					Loop
					{
						;Loop until you have hovered / clicked on altar
						Result := TargetCenter(15, 71, 825, 820, 0xCA00D2, 0)
						If Result[1] > 0
						{
							Idlewait()
							MouseAfterClickDelay()
							;Click on the altar
							PixelSearch, FoundX, FoundY, 825, 820, 15, 71, 0xCA00D2, 0, Fast RGB
							;Click on the altar
							MyMouseMove(FoundX + RandomWeight(-5, -30, -70), FoundY + RandomWeight(-5, -40, -55))
							MouseAfterClickDelay()
							MouseGetPos, VerifyTargetX, VerifyTargetY
							PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
							If (Errorlevel = 0)
							{
								MyClick(0,0)
								BankingDelays()
								Status("Done Crafting")
								TotalFletched++
								FletchCount()
								AntiBanLog()
								PathtoMineFromBlood()
								break
							}
						}
					}
					break
				}
			}
			break
		}
	}
}
return

PathingToAltar()
{
	FirstMarker()
	FirstAgilityOb()
	MinimapWalk(0x00FF00)
	MinimapWalk(0xFF00FF)
	Venerate()
}
return

PathingToMineFromAlter()
{
	MinimapWalk(0xFF00FF)
	MinimapWalk(0x00FF00)
	FirstAgilityObback()
	PathtoMine()
	AntiBanLog()
}
return

PathtoBloodAltar()
{
	MinimapWalk(0xFF5AFF)
	MinimapWalk(0x0000FF)
	MinimapWalk(0x7500FF)
	MinimapWalk(0xFF00FF)
	MinimapWalk(0x00FFFF)
	MinimapWalk(0x05FF00)
}
return

PathtoMineFromBlood()
{
	MinimapWalk(0x00FFFF)
	SecondAgilityOb()
	PathtoMine()
	AntiBanLog()
}
return

PathtoMine()
{
	loop,
	{
		Status("Back to Mine")
		PixelSearch, FoundX, FoundY, 825, 820, 15, 71, 0xCA00D2, 0, Fast RGB
		If (Errorlevel = 0)
		{
			AntibanAny()
			Idlewait()
			BankingDelays()
			break
		}
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0x0000FF, 0, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			Idlewait()
			BankingDelays()
			Status("Mine marker")
			Result := TargetCenter(892, 30, 1038, 190, 0x0000FF, 0)
			
			;Click on the map marker
			MyMouseMove(Result[1], Result[2])
			MyClick(1,0)
			WebWalkerDelays()
			break
		}
	}
}
return

FirstMarker()
{
	Status("First Marker")
	Result1map := TargetCenter(892, 30, 1038, 190, 0x00FFFF, 0)
	If Result1map[1] < 1
	{
		BankingDelays()
		PinkOptional := TargetCenter(892, 30, 1038, 190, 0xFF5AFF, 5)
		;Click on the map marker
		MyMouseMove(PinkOptional[1], PinkOptional[2])
		MyClick(1,0)
		Status("Pink marker")
		loop,
		{
			PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0x00FFFF, 0, Fast RGB
			If errorlevel = 0
			{
				WebWalkerDelays()
				Status("Redo First Marker")
				;Click on the map marker
				Result := TargetCenter(892, 30, 1038, 190, 0x00FFFF, 0)
				MyMouseMove(Result[1], Result[2])
				MyClick(1,0)
				break
			}
		}
	}
	If Result1map[1] > 0
	{
		;Click on the map marker
		BankingDelays()
		MyMouseMove(Result1map[1], Result1map[2])
		MyClick(1,0)	
	}
}
return

FirstAgilityOb()
{
	Status("Agility1")
	loop,
	{
		Status("Wait crystal")
		PixelSearch, AMarkX, AMarkY, 15, 71, 825, 820, 0x7500FF, 2, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			WebWalkerDelays()
			Idlewait()
			break
		}
	}
	Loop
	{
		Result := TargetCenter(15, 71, 825, 820, 0x00FF00, 0)
		;Click on the first agility obstacle
		MyMouseMove(Result[1], Result[2])
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			MyClick(1,0)
			WebWalkerDelays()
			break
		}
		Idlewait()
		CraftDelays()
	}
}
return

SecondAgilityOb()
{
	Status("Agility2")
	loop,
	{
		Status("Wait Second Agy")
		PixelSearch, AMarkX, AMarkY, 15, 71, 825, 820, 0x05FF00, 0, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			WebWalkerDelays()
			WebWalkerDelays()
			break
		}
	}
	Loop
	{
		Result := TargetCenter(15, 71, 825, 820, 0x05FF00, 0)
		;Click on the first agility obstacle
		MyMouseMove(Result[1], Result[2])
		CraftDelays()
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-30, VerifyTargetY-30, VerifyTargetX+30, VerifyTargetY+30, 0xFF00FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			MyClick(1,0)
			WebWalkerDelays()
			WebWalkerDelays()
			WebWalkerDelays()
			WebWalkerDelays()
			Idlewait()
			break
		}
		CraftDelays()
	}
}
return

FirstAgilityObback()
{
	Status("Agility1back")
	loop,
	{
		Status("Wait rock")
		PixelSearch, AMarkX, AMarkY, 6, 198, 1038, 832, 0x00FF00, 2, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			WebWalkerDelays()
			WebWalkerDelays()
			break
		}
	}
	Loop
	{
		Result := TargetCenter(6, 198, 1038, 832, 0x00FF00, 0)
		;Click on the first agility obstacle
		MyMouseMove(Result[1], Result[2])
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-30, VerifyTargetY-30, VerifyTargetX+30, VerifyTargetY+30, 0xFF00FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			MyClick(1,0)
			WebWalkerDelays()
			WebWalkerDelays()
			break
		}
		CraftDelays()
	}
}
return

SecondMarker()
{
	loop,
	{
		Status("Wait Second Marker")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0x00FF00, 0, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			WebWalkerDelays()
			WebWalkerDelays()
			break
		}
	}
	Status("Second Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0x00FF00, 0)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
}
return

ThirdMarker()
{
	loop,
	{
		Status("Wait Third Marker")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0xFF00FF, 0, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			WebWalkerDelays()
			break
		}
	}
	Status("Third Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0xFF00FF, 0)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
	WebWalkerDelays()
}
return

WebWalkerDelays()
{
	Delayaction := RandomWeight(800, 1200, 2000)
	Sleep, Delayaction
}
return

BankingDelays()
{
	Delayaction := RandomWeight(60, 200, 1200)
	Sleep, Delayaction
}
return

CraftDelays()
{
	Delayaction := RandomWeight(15, 20, 80)
	Sleep, Delayaction
}
return

Pleasewait()
{
	Loop
	{
		ImageSearch, FoundX, FoundY, 5, 29, 167, 79, *20 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20220529125148.png
		If (Errorlevel = 0)
		{
			loop
			{
				ImageSearch, FoundX, FoundY, 5, 29, 167, 79, *20 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20220529125148.png
				If (Errorlevel = 1)
				{
					break
				}
			}
			break
		}
	}
}
return

MinimapWalk(ColorMarker)
{
	MapMarkX := 0
	MapMarkY := 0
	loop,
	{
		Status("Searching Minimap")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, ColorMarker, 0, Fast RGB
		If errorlevel = 0
		{
			AntibanAny()
			WebWalkerDelays()
			Idlewait()
			BankingDelays()
			break
		}
	}
	Status("Clicking Minimap")
	Result := TargetCenter(892, 30, 1038, 190, ColorMarker, 0)
	
	;If X cord is less that 909 increase it over by 10 pixels
	If Result[1] < 903
	{
		MapMarkX := RandomWeight(2, 3, 5)
	}
	If Result[1] > 1024
	{
		MapMarkX := RandomWeight(-2, -3, -5)
	}
	If Result[2] < 52
	{
		MapMarkY := RandomWeight(2, 3, 5)
	}
	If Result[2] > 170
	{
		MapMarkY := RandomWeight(-2, -3, -5)
	}
	
	;Click on the map marker
	MyMouseMove(Result[1]+MapMarkX, Result[2]+MapMarkY)
	MyClick(1,0)
	AntibanAny()
}
return