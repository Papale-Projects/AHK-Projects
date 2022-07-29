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
	Banking()
	PathingToAltar()
	RuneCraft()
	BankWalk()
}
return

Banking()
{
	BagChecker()
	loop
	{
		Status("Banking")
		Result := TargetCenter(7, 100, 833, 830, 0x7500FF, 12, 1)
		
		;Click on the banker
		MyMouseMove(Result[1], Result[2])
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 5, Fast RGB
		If (Errorlevel = 0)
		{
			MyClick(0,0)
			BankingDelays()
			break
		}
	}
	
	;Pause wait bank is opening, while looking for fire rune
	loop
	{
		PixelSearch, FoundX, FoundY, 274, 87, 274, 87, 0xB43020, 20, Fast RGB
		If (ErrorLevel = 0)
		{
			BankingDelays()
			break
		}
	}
	
	;Bank inventory
	MyMouseMove(RandomWeight(583, 593, 616), RandomWeight(659, 675, 694))
	MyClick(2,0)
	BankingDelays()
	HealthCheck()
	EnergyPotion()
	
	;Click on the pure ess in the banking screen
	MyMouseMove(RandomWeight(566, 582, 599), RandomWeight(540, 554, 569))
	MyClick(2,0)
	BankingDelays()
	
	;Click on both pouches to fill Them
	MyMouseMove(RandomWeight(863, 878, 894), RandomWeight(572, 587, 602))
	MyClick(2,0)
	MouseAfterClickDelay()
	;second pouch
	MyMouseMove(RandomWeight(863, 878, 894), RandomWeight(609, 624, 638))
	MyClick(2,0)
	MouseAfterClickDelay()
	
	;Click on the pure essence again
	MyMouseMove(RandomWeight(566, 582, 599), RandomWeight(540, 554, 569))
	MyClick(2,0)
	BankingDelays()
	
	;Close the banking Interface
	Send, {Escape}
	BankingDelays()
	AntibanAny()
	AntiBanLog()
}
return

PathingToAltar()
{
	FirstMarker()
	SecondMarker()
	ThirdMarker()
	FourthMarker()
	FifthMarker()
	SixthMarker()
}
return

FirstMarker()
{
	Status("First Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0x00FFFE, 10)
	
	;Click on the map marker
	BankingDelays()
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
}
return

SecondMarker()
{
	loop,
	{
		Status("Wait Second Marker")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0xFF00FF, 10, Fast RGB
		If errorlevel = 0
		{
			WebWalkerDelays()
			break
		}
	}
	Status("Second Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0xFF00FF, 10)
	
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
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0x00FF00, 20, Fast RGB
		If errorlevel = 0
		{
			WebWalkerDelays()
			break
		}
	}
	Status("Third Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0x00FF00, 20)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
	WebWalkerDelays()
}
return

FourthMarker()
{
	loop,
	{
		Status("Wait Fourth Marker")
		PixelSearch, AMarkX, AMarkY, 892, 50, 1011, 169, 0x00FFFF, 0, Fast RGB
		If errorlevel = 0
		{
			WebWalkerDelays()
			break
		}
	}
	Status("Fourth Marker")
	Result := TargetCenter(892, 50, 1011, 169, 0x00FFFF, 10)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
}
return

FifthMarker()
{
	loop,
	{
		Status("Wait Fifth Marker")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0xE512EA, 10, Fast RGB
		If errorlevel = 0
		{
			WebWalkerDelays()
			break
		}
	}
	Status("Fifth Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0xE512EA, 10)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
}
return

SixthMarker()
{
	loop,
	{
		Status("Wait Sixth Marker")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0x20FF00, 15, Fast RGB
		If errorlevel = 0
		{
			WebWalkerDelays()
			break
		}
	}
	Status("Sixth Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0x20FF00, 15)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
}
return

RuneCraft()
{
	Loop
	{
		PixelSearch, AMarkX, AMarkY, 7, 91, 1041, 829, 0xCA00D2, 15, Fast RGB
		If (ErrorLevel = 0)
		{
			Pleasewait()
			BankingDelays()
			BankingDelays()
			BankingDelays()
			BankingDelays()
			Status("Runecrafting")
			break
		}
	}
	
	Loop
	{
		Result := TargetCenter(7, 91, 1041, 829, 0xCA00D2, 15, 1)
		
		;Click on the alter
		MyMouseMove(Result[1], Result[2])
		MouseClickDelay()
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 5, Fast RGB
		If (ErrorLevel = 0)
		{
			MyClick(0,0)
			break
		}
	}
	
	;Loop until you no longer find the pure essence in the inventory and pause
	Loop
	{
		PixelSearch, FoundX, FoundY, 961, 803, 961, 803, 0x00FF00, 10, Fast RGB
		If (ErrorLevel = 1)
		{
			BankingDelays()
			break
		}
	}
	
	;Click on both pouches to empty Them
	MyMouseMove(RandomWeight(863, 878, 894), RandomWeight(572, 587, 602))
	MyClick(2,0)
	BankingDelays()
	;second pouch
	MyMouseMove(RandomWeight(863, 878, 894), RandomWeight(609, 624, 638))
	MyClick(2,0)
	BankingDelays()
	BankingDelays()
	BankingDelays()
	
	Loop
	{
		Result := TargetCenter(7, 91, 1041, 829, 0xCA00D2, 15, 1)
		
		;Click on the alter
		MyMouseMove(Result[1], Result[2])
		MouseClickDelay()
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 5, Fast RGB
		If (ErrorLevel = 0)
		{
			MyClick(0,0)
			BankingDelays()
			TotalFletched++
			FletchCount()
			break
		}
	}
	
	;Teleport back
	;Click on spell book
	MyMouseMove(RandomWeight(816, 832, 843), RandomWeight(831, 846, 865))
	MyClick(2,1)
	BankingDelays()
	;Click on teleport spell
	MyMouseMove(RandomWeight(945, 992, 1033), RandomWeight(564, 607, 652))
	MyClick(2,0)
	BankingDelays()
	;Click on inventory again
	MyMouseMove(RandomWeight(714, 730, 745), RandomWeight(831, 846, 866))
	MyClick(2,1)
	BankingDelays()
	AntibanAny()
}
return

HealthCheck()
{
	PixelSearch, FoundX, FoundY, 906, 559, 906, 559, 0xDD0E0E, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		;Click on sharks in bank
		MyMouseMove(RandomWeight(520, 535, 549), RandomWeight(538, 553, 569))
		MyClick(2,0)
		Delayaction := RandomWeight(1000, 1200, 5500)
		Sleep, Delayaction
		
		;Click on sharks in inventory
		MyMouseMove(RandomWeight(900, 917, 936), RandomWeight(571, 586, 602))
		MyClick(2,0)
		BankingDelays()
		
		;Bank inventory
		MyMouseMove(RandomWeight(583, 593, 616), RandomWeight(659, 675, 694))
		MyClick(2,0)
		BankingDelays()
	}
}
return

EnergyPotion()
{
	PixelSearch, FoundX, FoundY, 848, 155, 853, 166, 0x00FF00, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		;Click on potion in bank
		MyMouseMove(RandomWeight(565, 580, 596), RandomWeight(578, 590, 605))
		MyClick(2,0)
		Delayaction := RandomWeight(1000, 1200, 5500)
		Sleep, Delayaction
		
		;Click on potion in inventory
		MyMouseMove(RandomWeight(900, 917, 936), RandomWeight(571, 586, 602))
		MyClick(2,0)
		BankingDelays()
		
		;Bank inventory
		MyMouseMove(RandomWeight(583, 593, 616), RandomWeight(659, 675, 694))
		MyClick(2,0)
		BankingDelays()
	}
}
return

BankWalk()
{
	loop,
	{
		Status("Wait Ladder Marker")
		PixelSearch, AMarkX, AMarkY, 892, 30, 1038, 190, 0x00FFFF, 10, Fast RGB
		If errorlevel = 0
		{
			Delayaction := RandomWeight(400, 600, 15000)
			Sleep, Delayaction
			AntibanAny()
			AntiBanLog()
			break
		}
	}
	Status("Ladder Marker")
	Result := TargetCenter(892, 30, 1038, 190, 0x00FFFF, 10)
	
	;Click on the map marker
	MyMouseMove(Result[1], Result[2])
	MyClick(1,0)
	
	Delayaction := RandomWeight(1000, 1200, 2500)
	Sleep, Delayaction
	AntibanAny()
	
	Loop
	{
		PixelSearch, FoundX, FoundY, 12, 88, 832, 829, 0xCA00D2, 0, Fast RGB
		If errorlevel = 0
		{
			Delayaction := RandomWeight(1000, 1200, 15000)
			Sleep, Delayaction
			AntiBanLog()
			break
		}
	}
	
	Loop
	{
		Status("Climbing Ladder")
		Result := TargetCenter(12, 88, 832, 829, 0xCA00D2, 15)
		
		;Click on the map marker
		MyMouseMove(Result[1], Result[2])
		MouseGetPos, VerifyTargetX, VerifyTargetY
		PixelSearch, FoundX, FoundY, VerifyTargetX-100, VerifyTargetY-100, VerifyTargetX+100, VerifyTargetY+100, 0xFF00FF, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			MyClick(0,0)
			Delayaction := RandomWeight(1000, 1200, 2500)
			Sleep, Delayaction
			break
		}
	}
	
	;Wait until banker is seen
	loop
	{
		PixelSearch, AMarkX, AMarkY, 7, 100, 833, 830, 0x7500FF, 12, Fast RGB
		If errorlevel = 0
		{
			Delayaction := RandomWeight(400, 600, 15000)
			Sleep, Delayaction
			AntibanAny()
			AntiBanLog()
			break
		}
	}
}
return

BagChecker()
{
	;FFFFFF white, only search large pouch and if cant find white
	PixelSearch, FoundX, FoundY, 858, 591, 888, 605, 0xFFFFFF, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		Status("Fixing Pounch")
		;Click on spell book
		MyMouseMove(RandomWeight(816, 832, 843), RandomWeight(831, 846, 865))
		MyClick(2,1)
		BankingDelays()
		
		;Right click the contact spell
		MyMouseMove(RandomWeight(852, 895, 939), RandomWeight(565, 607, 649))
		MyRightClick(0)
		BankingDelays()
		MouseGetPos, MousesX, MousesY
		MyMouseMove(RandomWeight(MousesX-70, MousesX, MousesX+70), RandomWeight(MousesY+34, MousesY+41, MousesY+48),0)
		MyClick(2,1)
		BankingDelays()
		loop
		{
			PixelSearch, FoundX, FoundY, 79, 751, 79, 751, 0x201B1B, 22, Fast RGB
			If (ErrorLevel = 0)
			{
				BankingDelays()
				Send {Space down}
				MouseClickDelay()
				Send {Space up}
				BankingDelays()
				BankingDelays()
				BankingDelays()
				BankingDelays()
				BankingDelays()
				break
			}
		}
		Send {2 down}
		MouseClickDelay()
		Send {2 up}
		BankingDelays()
		loop
		{
			PixelSearch, FoundX, FoundY, 175, 729, 195, 739, 0x800000, 22, Fast RGB
			If (ErrorLevel = 0)
			{
				BankingDelays()
				Send {Space down}
				MouseClickDelay()
				Send {Space up}
				BankingDelays()
				PlayerSLevel2++
				PlayerSeenLevel()
				break
			}
		}
		;Click on inventory again
		MyMouseMove(RandomWeight(714, 730, 745), RandomWeight(831, 846, 866))
		MyClick(0,1)
		BankingDelays()
		AntibanAny()
	}
}
return

WebWalkerDelays()
{
	Delayaction := RandomWeight(1200, 1400, 4000)
	Sleep, Delayaction
}
return

BankingDelays()
{
	Delayaction := RandomWeight(300, 400, 2200)
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