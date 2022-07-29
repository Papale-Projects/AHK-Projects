#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Global ColorC
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

Running()
{
	MiningLoop()
}

Rockrotation()
{
	ColorC++
	If ColorC = 1
	{
		return 0xCA00D2
	}
	If ColorC = 2
	{
		return 0x00FF00
	}
	If ColorC = 3
	{
		ColorC := 0
		return 0x0000FF
	}
}

Rockrotationnext()
{
	NextColorC := ColorC+1
	If NextColorC = 1
	{
		return 0xCA00D2
	}
	If NextColorC = 2
	{
		return 0x00FF00
	}
	If NextColorC = 3
	{
		NextColorC := 0
		return 0x0000FF
	}
}

MiningLoop()
{
	full := InventoryFull()
	If (full = 0){
		DropperV2()
	}
	RockC := Rockrotation()
	NRockC := Rockrotationnext()
	Loop
	{
		full := InventoryFull()
		If (full = 0){
			DropperV2()
		}
		status("Finding Rock")
		Result := TarCenter(RockC, 0)
		VT := VerifyTarget()
		If (Result[1] > 1)
		{
			full := InventoryFull()
			If (full = 0){
				DropperV2()
			}
			BankingDelays()
			MyMouseMove(Result[1], Result[2])
			VT := VerifyTarget()
			If VT = 1
			{
				RockDetect()
				CraftDelays()
				MyClick(3, 0)
				status("Mining")
				NextMove := RandomWeight(0,1,3)
				If (NextMove = 1)
				{
					status("Hover Next")
					Result := TarCenter(NRockC, 0)
					MyMouseMove(Result[1], Result[2])
					RockDetect()
					CraftDelays()
				}
				WaitMined()
				full := InventoryFull()
				If (full = 0){
					DropperV2()
				}
				TotalFletched++
				FletchCount()
				CraftDelays()
				AntiBanLog()
				AntibanAny()
				break
			}
		} else if (VT = 1){
			BankingDelays()
			MyClick(3, 0)
			NextMove := RandomWeight(0,1,3)
			If (NextMove = 1)
			{
				full := InventoryFull()
				If (full = 0){
					DropperV2()
				}
				Result := TarCenter(NRockC, 0)
				MyMouseMove(Result[1], Result[2])
				RockDetect()
				CraftDelays()
			}
			WaitMined()
			full := InventoryFull()
			If (full = 0){
				DropperV2()
			}
			TotalFletched++
			FletchCount()
			CraftDelays()
			AntiBanLog()
			AntibanAny()
			break
		}
	}
}

WaitMined()
{
	status("Wait XP Drop")
	CurrentTime := counter
	Loop
	{
		full := InventoryFull()
		If (full = 0){
			DropperV2()
			break
		}
		If (rs_scan.ImageRegion("MiningEXP.png",780,200,50,50,10,Picx,PicY)){
			RockDelays()
			full := InventoryFull()
			If (full = 0){
				DropperV2()
				break
			}
			break
		} else If (rs_scan.ImageRegion("MiningEXP.png",780,200,-50,-50,10,Picx,PicY)){
			RockDelays()
			full := InventoryFull()
			If (full = 0){
				DropperV2()
				break
			}
			break
		} else If (rs_scan.ImageRegion("MiningEXP.png",780,200,50,-50,10,Picx,PicY)){
			RockDelays()
			full := InventoryFull()
			If (full = 0){
				DropperV2()
				break
			}
			break
		} else If (rs_scan.ImageRegion("MiningEXP.png",780,200,-50,50,10,Picx,PicY)){
			RockDelays()
			full := InventoryFull()
			If (full = 0){
				DropperV2()
				break
			}
			break
		} else if (counter-CurrentTime > 15){
			break
		}
	}
}

RockDetect(){
	MouseGetPos, Mx, My
	Loop
	{
		status("Detect rock")
		If (rs_scan.PixelRegion(0x54372A,Mx,My,40,40,14,Picx,PicY)){
			break
		} else if (rs_scan.PixelRegion(0x54372A,Mx,My,-40,-40,14,Picx,PicY)){
			break
		} else if (rs_scan.PixelRegion(0x54372A,Mx,My,40,-40,14,Picx,PicY)){
			break
		} else if (rs_scan.PixelRegion(0x54372A,Mx,My,-40,40,14,Picx,PicY)){
			break
		}
		full := InventoryFull()
		If (full = 0){
			DropperV2()
			break
		}
	}
}

BankingDelays()
{
	Delayaction := RandomWeight(100, 250, 750)
	Sleep, Delayaction
}

CraftDelays()
{
	Delayaction := RandomWeight(40, 60, 150)
	Sleep, Delayaction
}

RockDelays()
{
	Delayaction := RandomWeight(100, 250, 750)
	Sleep, Delayaction
}

InventoryFull()
{
	PixelSearch, FoundX, FoundY, 1018, 796, 1043, 817, 0x00FF00, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		return 0
	}
	PixelSearch, FoundX, FoundY, 1018, 796, 1043, 817, 0x00FF00, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		return 1
	}
}

LoopTimeout(){
	CurrentTime := counter
}