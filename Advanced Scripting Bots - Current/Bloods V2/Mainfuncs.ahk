#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Color Menu
;Runerock1: 0xCA00D2
;Runerock2: 0xFF5AFF
;Denserock inventory: 0x00FF00
;verify target: 0xFF00FF
;Venerate alter: 0xDDFF00
;Fragments: 0x00FFFF
;ChiselX := RandomWeight(863, 880, 897)
;ChiselY := RandomWeight(571, 586, 602)
;Venerated blocks: 0x0000FF
;

Running()
{
	Mineblocks()
	WalkToAltar()
	Venerate()
}

Mineblocks()
{
	loop
	{
		InvFull := InventoryFull()
		If (InvFull = 0)
		{
			Status("Inventory Full")
			break
		}
		
		;If not idle
		PixelSearch, FoundX, FoundY, 806, 639, 806, 639, 0xFF0000, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			AntiBanLog()
			Result := TarCenter(0xCA00D2, 0, 5)
			If (Result[1] > 1)
			{
				Status("Runestone1")
				MyMouseMove(Result[1], Result[2])
				CraftDelays()
				Ct := VerifyTarget()
				If (Ct != 0)
				{
					MyClick(0,0)
					WebWalkerDelays()
					WebWalkerDelays()
					WebWalkerDelays()
				}
			}
			
			;If still idle 
			PixelSearch, FoundX, FoundY, 806, 639, 806, 639, 0xFF0000, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				AntiBanLog()
				Result := TarCenter(0xFF5AFF, 0, 5)
				If (Result[1] > 1)
				{
					Status("Runestone2")
					MyMouseMove(Result[1], Result[2])
					CraftDelays()
					Ct := VerifyTarget()
					If (Ct != 0)
					{
						MyClick(0,0)
						WebWalkerDelays()
						WebWalkerDelays()
						WebWalkerDelays()
					}
				}
			}
		}
		PixelSearch, FoundX, FoundY, 806, 639, 806, 639, 0xFF0000, 0, Fast RGB
		If (ErrorLevel = 1)
		{
			OffScreenMouse()
		}
		
		InvFull := InventoryFull()
		If (InvFull = 0)
		{
			Status("Inventory Full")
			break
		}
	}
}

WalkToAltar()
{
	Result := TarCenter(0x00FFFF, 1, 3)
	If (Result[1] < 1)
	{
		MinimapWalk(0xFF5AFF)
	}
	MinimapWalk(0x00FFFF)
	FirstAgy()
	MinimapWalk(0x00FF00)
	MinimapWalk(0xFF00FF)
}

WalkFromVAltar()
{
	MinimapWalk(0xFF00FF)
	MinimapWalk(0x00FF00)
	MinimapWalk(0xDDFF00)
	FirstAgy()
	MinimapWalk(0x0000FF)
}

WalktoBloods()
{
	MinimapWalk(0xFF5AFF)
	MinimapWalk(0x0000FF)
	MinimapWalk(0x7500FF)
	MinimapWalk(0xFF00FF)
	MinimapWalk(0x00FFFF)
	MinimapWalk(0x05FF00)
}

WalkFromBloods()
{
	MinimapWalk(0x00FFFF)
	SecondAgy()
	Result := TarCenter(0xCA00D2, 0, 5)
	If (Result[1] < 1)
	{
		MinimapWalk(0x0000FF)
	}
}

WebWalkerDelays()
{
	Delayaction := RandomWeight(800, 1200, 2000)
	Sleep, Delayaction
}

BankingDelays()
{
	Delayaction := RandomWeight(60, 200, 1200)
	Sleep, Delayaction
}

CraftDelays()
{
	Delayaction := RandomWeight(15, 20, 80)
	Sleep, Delayaction
}

FirstAgy()
{
	loop
	{
		Result := TarCenter(0x00FF00, 0, 3)
		If (Result[1] > 1)
		{
			Idlewait()
			BankingDelays()
			break
		}
		BankingDelays()
	}
	loop
	{
		Result := TarCenter(0x00FF00, 0, 3)
		If (Result[1] > 1)
		{
			CraftDelays()
			Status("Climb Rock1")
			MyMouseMove(Result[1], Result[2])
			CraftDelays()
			Ct := VerifyTarget()
			If (Ct != 0)
			{
				MyClick(0,0)
				BankingDelays()
				Idlewait()
				BankingDelays()
				break
			}
		}
	}
}

SecondAgy()
{
	loop
	{
		Result := TarCenter(0x05FF00, 0, 3)
		If (Result[1] > 1)
		{
			Idlewait()
			BankingDelays()
			break
		}
		BankingDelays()
	}
	loop
	{
		Result := TarCenter(0x05FF00, 0, 3)
		If (Result[1] > 1)
		{
			CraftDelays()
			Status("Climb Rock2")
			MyMouseMove(Result[1], Result[2])
			CraftDelays()
			Ct := VerifyTarget()
			If (Ct != 0)
			{
				MyClick(0,0)
				BankingDelays()
				Idlewait()
				BankingDelays()
				break
			}
		}
	}
}

Venerate()
{
	;Find altar
	loop
	{
		Result := TarCenter(0xDDFF00, 0, 3)
		If (Result[1] > 1)
		{
			Idlewait()
			BankingDelays()
			break
		}
		BankingDelays()
	}
	;click altar
	Loop
	{
		Result := TarCenter(0xDDFF00, 0, 3)
		If (Result[1] > 1)
		{
			Status("Click V Altar")
			MyMouseMove(Result[1], Result[2])
			CraftDelays()
			Ct := VerifyTarget()
			If (Ct != 0)
			{
				MyClick(0,0)
				BankingDelays()
				break
			}
		}
	}
	;chisel if no fragments are found
	PixelSearch, FoundX, FoundY, 964, 586, 964, 586, 0x00FFFF, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		;Chisel blocks into fragments
		ChiselX := RandomWeight(863, 880, 897)
		ChiselY := RandomWeight(571, 586, 602)
		MyMouseMove(ChiselX, ChiselY)
		CraftDelays()
		;loop until you can see venerated blocks
		Loop
		{
			PixelSearch, FoundX, FoundY, 1005, 804, 1005, 804, 0x0000FF, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				break
			}
		}
		;loop to chisel all blocks into fragments
		loop
		{
			PixelSearch, FoundX, FoundY, 1005, 804, 1005, 804, 0x0000FF, 0, Fast RGB
			If (ErrorLevel = 1)
			{
				break
			}
			CraftDelays()
			MyClick(2,0)
		}
		AntiBanLog()
		WalkFromVAltar()
		return
	}
	If (Errorlevel = 0)
	{
		;Walk to blood altar
		AntiBanLog()
		WalktoBloods()
		CraftBloods()
		WalkFromBloods()
	}
}

CraftBloods()
{
	;Find altar
	loop
	{
		Result := TarCenter(0xCA00D2, 0, 5)
		If (Result[1] > 1)
		{
			status("Looking for Altar")
			Idlewait()
			BankingDelays()
			break
		}
		BankingDelays()
	}
	;click altar
	Loop
	{
		Result := TarCenter(0xCA00D2, 0, 5)
		If (Result[1] > 1)
		{
			Status("Click V Altar")
			MyMouseMove(Result[1], Result[2])
			CraftDelays()
			Ct := VerifyTarget()
			If (Ct != 0)
			{
				MyClick(0,0)
				BankingDelays()
				break
			}
		}
	}
	Loop
	{
		;chisel if no fragments are found
		PixelSearch, FoundX, FoundY, 964, 586, 964, 586, 0x00FFFF, 0, Fast RGB
		If (ErrorLevel = 1)
		{
			;Chisel blocks into fragments
			ChiselX := RandomWeight(863, 880, 897)
			ChiselY := RandomWeight(571, 586, 602)
			MyMouseMove(ChiselX, ChiselY)
			CraftDelays()
			;loop to chisel all blocks into fragments
			loop
			{
				PixelSearch, FoundX, FoundY, 1005, 804, 1005, 804, 0x0000FF, 0, Fast RGB
				If (ErrorLevel = 1)
				{
					;Check if selected chisel after spam clicking
					AntibanMinimap()
					PixelSearch, FoundX, FoundY, 32, 28, 90, 48, 0xC06C30, 10, Fast RGB
					If (ErrorLevel = 0)
					{
						ChiselX := RandomWeight(863, 880, 897)
						ChiselY := RandomWeight(571, 586, 602)
						MyMouseMove(ChiselX, ChiselY)
						CraftDelays()
						MyClick(2,0)
					}
					break
				}
				CraftDelays()
				MyClick(2,0)
			}
			break
		}
	}
	;click altar
	Loop
	{
		Result := TarCenter(0xCA00D2, 0, 5)
		If (Result[1] > 1)
		{
			Status("Click V Altar")
			MyMouseMove(Result[1], Result[2])
			CraftDelays()
			Ct := VerifyTarget()
			If (Ct != 0)
			{
				MyClick(0,0)
				BankingDelays()
				AntiBanLog()
				break
			}
		}
	}
}

MinimapWalk(ColorMarker)
{
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
	Result := TarCenter(ColorMarker, 1, 0)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
	WebWalkerDelays()
	AntibanAny()
}

IdleCheck()
{
	PixelSearch, FoundX, FoundY, 806, 639, 806, 639, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		return 0
	} 
	PixelSearch, FoundX, FoundY, 806, 639, 806, 639, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		return 1
	}
}

NotIdle(Delayz:=0)
{
	loop
	{
		status("Not Idle")
		If !(rs_scan.PixelPosition(0xFF0000,806,639,0)){
			If (Delayz = 1)
			{
				BankingDelays()
			}
			break
		}
	}
}

InventoryFull()
{
	PixelSearch, FoundX, FoundY, 1006, 801, 1006, 801, 0x00FF00, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		return 0
	}
	PixelSearch, FoundX, FoundY, 1006, 801, 1006, 801, 0x00FF00, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		return 1
	}
}