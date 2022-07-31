#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Global RandoTime
Global iX
Global iY
Global PlayerSeen
Global OverlayX
Global OverlayY
Global rs_scan := new ShinsImageScanClass("RuneLite")
Global rs_overlay := new ShinsOverlayClass("RuneLite")

;0 is On/Ingame, 1 is Off/Minimap, 2 is for no area
MyClick(Area, DoubleClicks)
{
	Click, down
	MouseClickDelay()
	Click, up
	MouseClickDelay()
	If (DoubleClicks = 0)
	{
		Random, Doubleclick, 1, 150
		If (Doubleclick = 1)
		{
			MouseClickDelay()
			Click, down
			MouseClickDelay()
			Click, up
			MouseClickDelay()
		}
	}
	If (Area = 0)
	{
		AntibanClicks()
	}
	If (Area = 1)
	{
		AntibanMinimap()
	}
}


MyRightClick(AfterMove:=1)
{
	MouseClickDelay()
	Click, right, down
	MouseClickDelay()
	Click, right, up
	If AfterMove = 1
	{
		AfterClickMove()
	}
}


RandomRightClicker()
{
	Random, picker, 1, 3
	If (Picker = 1)
	{
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, Mspeed, 0.6, 0.9
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyRightClick()
		}
	}
	If (Picker = 2)
	{
		PixelSearch, FoundX, FoundY, 824, 530, 1015, 793, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, Mspeed, 0.6, 0.9
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyRightClick()
		}
	}
	If (Picker = 3)
	{
		PixelSearch, FoundX, FoundY, 9, 32, 813, 799, 0x00FFFF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Random, Mspeed, 0.6, 0.9
			MoveMouse(FoundX + RandomWeight(-11, 0, 11), FoundY + RandomWeight(-11, 0, 11), Mspeed)
			MouseClickDelay()
			MyRightClick()
		}
	}
}


AntibanAny()
{
	Random, Anti, 1, 2016
	If (Anti = 1)
	{
		CheckEXP()
	}
	;Random, Anti, 1, 1200
	;If (Anti = 1)
	;{
	;	AntiTabBrowser()
	;}
	;Random, Anti, 1, 1200
	;If (Anti = 1)
	;{
	;	CameraSpinArrows()
	;}
	Random, Anti, 1, 100
	If (Anti = 1)
	{
		OffScreenMouse()
	}
	Random, Anti, 1, 1800
	If (Anti = 1)
	{
		IdleInGame()
	}
}


AntibanBankwindow()
{
	Random, Anti, 1, 21
	If (Anti = 1)
	{
		OffScreenMouse()
	}
	Random, Anti, 1, 150
	If (Anti = 1)
	{
		IdleInGame()
	}
}


AntiBanLog()
{
	Random, LogSleep, 1, 900
	If (LogSleep = 1)
	{
		Logout()
		LogoutTimer()
		LogoutIn()
	}
}


AntibanClicks()
{
	Random, Anti3, 1, 6
	If (Anti3 = 1)
	{
		AfterClickMove()
	}
}


AntibanMinimap()
{
	Random, Anti3, 1, 3
	If (Anti3 = 1)
	{
		MiniMapAfterClickMove()
	}
}


CameraSpinArrows()
{
	Random, LWaiting, 0, 200
	sleep, LWaiting
	Random, Enable, 1, 10
	Random, SpinHold, 150, 750
	Random, Direction, 1, 2
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
		Status("Camera Antiban")
		Send {%Hotkey% down}
		Sleep, SpinHold
		Send {%Hotkey% up}
	}
	Random, Enable, 1, 10
	Random, SpinHold, 150, 750
	Random, Direction, 1, 2
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
		Status("Camera Antiban")
		Send {%Hotkey% down}
		Sleep, SpinHold
		Send {%Hotkey% up}
	}
	Random, Enable, 1, 10
	Random, SpinHold, 150, 750
	Random, Direction, 1, 2
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
		Status("Camera Antiban")
		Send {%Hotkey% down}
		Sleep, SpinHold
		Send {%Hotkey% up}
	}
	AntibanAny()
}


OffScreenMouse()
{
	AntibanOffS2++
	AntibanOffS()
	Status("Off Screen Antiban")
	Random, AntiMX, 1066, 1678
	Random, AntiMY, 5, 1038
	Random, LWaiting, 0, 200
	sleep, LWaiting
	MyMouseMove(AntiMX, AntiMY)
	WinActivate, Untitled - Notepad
	Sleep, RandomWeight(500, 2000, 30000)
	Status("Focusing OSRS")
	WinActivate, ahk_class SunAwtFrame
	WinWaitActive, ahk_class SunAwtFrame,, 2
}


OffScreenMouseLong()
{
	AntibanOffS2++
	AntibanOffS()
	Status("Off Screen Antiban")
	Random, AntiMX, 1066, 1678
	Random, AntiMY, 5, 1038
	Random, LWaiting, 0, 200
	sleep, LWaiting
	MyMouseMove(AntiMX, AntiMY)
	WinActivate, Untitled - Notepad
	;min:10secs targ:1mins max:2mins
	Sleep, RandomWeight(10000, 60000, 120000)
	Status("Focusing OSRS")
	WinActivate, ahk_class SunAwtFrame
	WinWaitActive, ahk_class SunAwtFrame,, 2
}


Logout()
{
	AntibanLog2++
	AntibanLogDis()
	Status("Logging out")
	;If idle search
	Loop, 300
	{
		MenuCordz()
		MyMouseMove(ExitButtonX, ExitButtonY)
		MyClick(2,1)
		Sleep, RandomWeight(100, 1000, 5000)
		MenuCordz()
		MyMouseMove(LogoutButtonX, LogoutButtonY)
		MyClick(2,0)
		Random, Delay, 10000, 20000
		Sleep, Delay
		ImageSearch, FoundX, FoundY, 152, 27, 919, 530, *50 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210516142400.png
		If (ErrorLevel = 0)
		{
			break
		}
		If (Errorlevel = 1)
		{
			Sleep, RandomWeight(1000, 1500, 2000)
		}
	}
}


LogoutIn()
{
	Status("Logging back in")
	IniRead, vPass,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Password.ini,Passvar,Password
	ImageSearch, FoundX, FoundY, 152, 27, 919, 530, *50 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210516142400.png
	If (ErrorLevel = 0)
	{
		MyMouseMove(FoundX, FoundY)
		MyClick(2,1)
		MouseAfterClickDelay()
		Send %vPass%
		MouseAfterClickDelay()
		Send, {Enter}
		Loop{
			;wait for the click to play button and click on it
			ImageSearch, FoundX, FoundY, 162, 34, 926, 600, *50 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210516142718.png
			If (ErrorLevel = 0)
			{
				Random, sleeper, 50, 1000
				Sleep, sleeper
				Random, Mspeed, 0.6, 0.9
				MoveMouse(FoundX, FoundY, Mspeed)
				MouseClickDelay()
				MyClick(2,1)
				MouseAfterClickDelay()
				Loop
				{
					;once logged in, open the inventory
					If (rs_scan.image("swords.PNG",25,combax,combay))
					{
						Random, Delay, 600, 1500
						Sleep, Delay
						result := TestingCoords(3)
						MyMouseMove(result[1], result[2])
						MyClick(0,1)
						MouseAfterClickDelay()
						break
					}
				}
				break
			}
			If (Errorlevel = 1)
			{
				continue
			}
		}
	}
}


AfterClickMove()
{
	Delay := RandomWeight(20, 100, 200)
	Sleep, Delay
	MyMouseMove(RandomWeight(0, 530, 1060), RandomWeight(0, 420, 840))
	Random, Rz, 1, 50
	If Rz = 1
	{
		MyRightClick()
	}
}


MiniMapAfterClickMove()
{
	Delay := RandomWeight(20, 100, 200)
	Sleep, Delay
	MyMouseMove(RandomWeight(884, 987, 1039), RandomWeight(32, 151, 193))
}


DriftingMouse()
{
	AntibanCounter++
	AntibanCount()
	Status("Mouse Drifting")
	Random, MovePickZ, 1, 4
	If (MovePickZ = 1)
	{
		Random, Delay, 50, 350
		Sleep, Delay
		Random, Mspeed, 0.3, 0.5
		MouseGetPos, MouseX, MouseY
		MoveMouse(MouseX + RandomWeight(2, 5, 9), MouseY + RandomWeight(2, 5, 9), Mspeed)
		Random, Delay, 50, 350
		Sleep, Delay
	}
	If (MovePickZ = 2)
	{
		Random, Delay, 50, 350
		Sleep, Delay
		Random, Mspeed, 0.3, 0.5
		MouseGetPos, MouseX, MouseY
		MoveMouse(MouseX + RandomWeight(-2, -5, -9), MouseY + RandomWeight(-2, -5, -9), Mspeed)
		Random, Delay, 50, 350
		Sleep, Delay
	}
	If (MovePickZ = 3)
	{
		Random, Delay, 50, 350
		Sleep, Delay
		Random, Mspeed, 0.3, 0.5
		MouseGetPos, MouseX, MouseY
		MoveMouse(MouseX + RandomWeight(2, 5, 9), MouseY + RandomWeight(-2, -5, -9), Mspeed)
		Random, Delay, 50, 350
		Sleep, Delay
	}
	If (MovePickZ = 4)
	{
		Random, Delay, 50, 350
		Sleep, Delay
		Random, Mspeed, 0.3, 0.5
		MouseGetPos, MouseX, MouseY
		MoveMouse(MouseX + RandomWeight(-2, -5, -9), MouseY + RandomWeight(2, 5, 9), Mspeed)
		Random, Delay, 50, 350
		Sleep, Delay
	}
}


IdleInGame()
{
	AntibanIdle2++
	AntibanIdle()
	Status("Ingame Idling")
	Random, Idle, 15000, 60000
	Sleep, Idle
}


CheckEXP()
{
	AntibanEXP2++
	AntibanEXP()
	Status("Checking EXP")
	MenuCordz()
	Random, Delay, 0, 350
	Sleep, Delay
	result := TestingCoords(1)
	MyMouseMove(result[1],result[2])
	MyClick(0,1)
	MouseAfterClickDelay()
	Examineexp := RandomWeight(200, 2500, 13000)
	Sleep, Examineexp
	result := TestingCoords(3)
	MyMouseMove(result[1],result[2])
	MyClick(0,1)
	MouseAfterClickDelay()
}

LogoutTimer()
{
	LoggedOutFor()
}

AntiTabBrowser()
{
	Random, TabPicker, 2, 2
	If (TabPicker = 1)
	{
		AntibanBrowse2++
		AntibanBrowse()
		Status("Random Tabs Antiban")
		Random, Mspeed, 0.6, 0.9
		MoveMouse(RandomWeight(630, 644, 658), RandomWeight(800, 817, 835), Mspeed)
		MouseClickDelay()
		MyClick(2,1)
		MouseAfterClickDelay()
		Random, Ran, 1, 1
		If (Ran = 1)
		{
			Random, Mspeed, 0.6, 0.9
			MoveMouse(RandomWeight(728, 743, 758), RandomWeight(800, 817, 835), Mspeed)
			MouseClickDelay()
			MyClick(2,1)
			MouseAfterClickDelay()
		}
	}
	If (TabPicker = 2)
	{
		AntibanBrowse2++
		AntibanBrowse()
		Status("Random Tabs Antiban")
		MenuCordz()
		MyMouseMove(QuestTabX, QuestTabY)
		MyClick(2,1)
		MouseAfterClickDelay()
		MyMouseMove(RandomWeight(874, 947, 1034), RandomWeight(611, 720, 815))
		Random, Delay, 100, 450
		Sleep, Delay
		Random, Scrolls, 5, 20
		Loop, %Scrolls%
		{
			Ran := RandomWeight(1, 1, 4)
			Wheels := RandomWeight(1, 3, 4)
			If (Ran = 1){
				loop, %Wheels%{
					Send, {WheelDown}
					Random, Delay, 80, 180
					Sleep, Delay
				}
			}
			If (Ran = 2){
				loop, %Wheels%{
					Send, {WheelUp}
					Random, Delay, 80, 180
					Sleep, Delay
				}
			}
			If (Ran = 3)
			{
				Random, Delay, 80, 180
				Sleep, Delay
			}
			If (Ran = 4)
			{
				Random, Delay, 200, 650
				Sleep, Delay
			}
		}
		Random, Delay, 100, 450
		Sleep, Delay
		Random, Ran, 1, 1
		If (Ran = 1)
		{
			MenuCordz()
			MyMouseMove(InventoryTabX, InventoryTabY)
			Sleep, Delay
			MyClick(2,1)
			MouseAfterClickDelay()
		}
	}
}

MouseClickDelay()
{
	Delay := RandomWeight(60, 70, 230)
	Sleep, Delay
}


MouseAfterClickDelay()
{
	Delay := RandomWeight(90, 120, 300)
	Sleep, Delay
}


DelayDrops()
{
	Delay := RandomWeight(15, 30, 380)
	Sleep, Delay
}

DelayDrops1()
{
	Delay := RandomWeight(3, 3, 35)
	Sleep, Delay
}


Dropper()
{
	;MouseAfterClickDelay()
	loop
	{
		countingX++
		countingz++
		If (countingX = 5 || countingX = 9 || countingX = 13 || countingX = 17)
		{
			countingz := 1
			AddY := iY + 68
		}
		If (countingz > 1)
		{
			AddX := iX + 42
		}
		If (countingz = 1)
		{
			AddX := 838
		}
		if (countingX < 5)
		{
			AddY := 565
		}
		PixelSearch, DropperX, DropperY, AddX, AddY, 1018, 823, 0x00FF00, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			;Chance to misclick the item above it
			Random, Misclicker, 1, 35
			If (Misclicker = 1)
			{
				Random, Mspeed, 0.6, 0.9
				MoveMouse(DropperX + RandomWeight(-10, 3, 23), DropperY + RandomWeight(-5, -6, -9), Mspeed)
				DelayDrops1()
				MyClick(2,1)
				DelayDrops1()
				Status("Dropping")
			}
			iX := DropperX
			iY := DropperY
			Random, Mspeed, 0.6, 0.9
			MoveMouse(DropperX + RandomWeight(-10, 3, 23), DropperY + RandomWeight(0, 16, 30), Mspeed)
			DelayDrops1()
			MyClick(2,1)
			DelayDrops1()
			PixelSearch, pX, pY, DropperX-5, DropperY+34, DropperX+10, DropperY+60, 0x00FF00, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				;Chance to misclick the item above it
				Random, Misclicker, 1, 35
				If (Misclicker = 1)
				{
					Random, Mspeed, 0.6, 0.9
					MoveMouse(pX + RandomWeight(-10, 3, 23), pY + RandomWeight(-5, -6, -9), Mspeed)
					DelayDrops1()
					MyClick(2,1)
					DelayDrops1()
					Status("Dropping")
				}
				Random, Mspeed, 0.6, 0.9
				MoveMouse(pX + RandomWeight(-10, 3, 23), pY + RandomWeight(0, 16, 30), Mspeed)
				DelayDrops1()
				MyClick(2,1)
				DelayDrops1()
			}
			If (ErrorLevel = 1)
			{
				Continue
			}
		}
		If (ErrorLevel = 1)
		{
			break
		}
	}
}


InvTagBugFix()
{
	PixelSearch, FoundX, FoundY, 17, 44, 57, 64, 0x00FF00, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 865, 560, 926, 607, *25 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20211215141910.png
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.6, 0.9
			MoveMouse(FoundX + RandomWeight(4, 12, 19), FoundY + RandomWeight(4, 12, 19), Mspeed)
			MouseClickDelay()
			MyClick(2,1)
			MouseAfterClickDelay()
		}
	}
}

DisconnectedFix()
{
	Loop, 10
	{
		ImageSearch, FoundX, FoundY, 460, 307, 607, 349, *55 C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20210611144452.png
		If (ErrorLevel = 0)
		{
			Random, Mspeed, 0.6, 0.9
			MoveMouse(533 + RandomWeight(0, 3, 10), 327 + RandomWeight(0, 3, 10), Mspeed)
			MouseClickDelay()
			MyClick(2,1)
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
			MouseAfterClickDelay()
		}
	}
}

PlayerDetect()
{
	;Search for player in the center of the screen / under player
	PixelSearch, PlayerX, PlayerY, 449, 380, 604, 536, 0xE512EA, 0, Fast RGB
	if (ErrorLevel = 0)
	{
		;Mine 20 iron ore before hopping to another world
		PlayerSeen++
		PlayerSLevel2++
		PlayerSeenLevel()
		If (PlayerSeen > 20)
		{
			Status("Hopping Worlds")
			Worldhopper()
		}
	}
	;Reset counter back to zero if player is no longer seen
	PixelSearch, PlayerX, PlayerY, 449, 380, 604, 536, 0xE512EA, 0, Fast RGB
	if (ErrorLevel = 1)
	{
		PlayerSeen := 0
	}
}

Worldhopper()
{
	Status("Hopping world")
	Send {Control down}{Shift down}{Right down}
	MouseAfterClickDelay()
	Send {Control up}{Shift up}{Right up}
	loop
	{
		Random, Delay, 5000, 10000
		;Look for the X button in the world hopper window
		ImageSearch, FoundX, FoundY, 1024, 555, 1064, 592, C:\Users\WhoAmI\AppData\Roaming\MacroCreator\Screenshots\Screen_20211209151143.png
		If ErrorLevel = 0
		{
			MouseAfterClickDelay()
			break
		}
	}	
	MouseAfterClickDelay()
	Random, Mspeed, 0.6, 0.9
	MoveMouse( RandomWeight(1035, 1045, 1056), RandomWeight(563, 574, 585), Mspeed)
	MouseClickDelay()
	MyClick(2,1)
	MouseAfterClickDelay()
	MouseAfterClickDelay()
	MouseAfterClickDelay()
	MenuCordz()
	Random, Mspeed, 0.6, 0.9
	MoveMouse(InventoryTabX , InventoryTabY, Mspeed)
	MouseClickDelay()
	MyClick(2,1)
	MouseAfterClickDelay()
}

;Pixelsearches for desired color and calculates a random point on the target
TargetCenter(X1Coord, Y1Coord, X2Coord, Y2Coord, ColorID, ColorVariation, Misclickable:=0)
{
	;Get the top left of the target
	PixelSearch, AMarkX, AMarkY, X1Coord, Y1Coord, X2Coord, Y2Coord, ColorID, ColorVariation, Fast RGB
	;Get the bottom right of the target
	PixelSearch, BMarkX, BMarkY, X2Coord, Y2Coord, X1Coord, Y1Coord, ColorID, ColorVariation, Fast RGB
	
	;Calculates length and width
	MarkWidth := ((BMarkX - AMarkX) / 2)-5 ;subtract 5 pixels for the border
	MarkLength := ((BMarkY - AMarkY) / 2)-5 ;subtract 5 pixels for the border
	
	;Math to calculate the center of the target and uses the width/length to get a randomly weighted point
	CalcX := ((AMarkX + BMarkX) / 2) + RandomWeight(-MarkWidth, 0, MarkWidth)
	CalcY := ((AMarkY + BMarkY) / 2) + RandomWeight(-MarkLength, 0, MarkLength)
	
	If Misclickable > 0
	{
		Random, Rz, 1, 32
		If Rz = 1
		{
			;Math to calculate the center of the target and uses the width/length to get a randomly weighted point
			CalcX1 := ((AMarkX + BMarkX) / 2) + RandomWeight(-MarkWidth-25, -MarkWidth-15, -MarkWidth-14)
			CalcX2 := ((AMarkX + BMarkX) / 2) + RandomWeight(MarkWidth+25, MarkWidth+15, MarkWidth+14)
			CalcY1 := ((AMarkY + BMarkY) / 2) + RandomWeight(-MarkLength-25, -MarkLength-15, -MarkLength-14)
			CalcY2 := ((AMarkY + BMarkY) / 2) + RandomWeight(MarkLength+25, MarkLength+15, MarkLength+14)
			
			Random, MisX, 1, 2
			If MisX = 1
			{
				MisClicX := CalcX1
			}
			If MisX = 2
			{
				MisClicX := CalcX2
			}
			Random, MisY, 1, 2
			If MisY = 1
			{
				MisClicY := CalcY1
			}
			If MisY = 2
			{
				MisClicY := CalcY2
			}
			MyMouseMove(MisClicX, MisClicY)
			MyClick(2, 1)
			MissClick2++
			MissClickGui()
			MouseAfterClickDelay()
		}
	}
	
	return [CalcX, CalcY]
	;Example code of how to use
	;Result := TargetCenter(21, 67, 784, 645, 0x7500FF, 10)
	;MyMoveMouse(Result[1], Result[2])
}

MyMouseMove(XLocation, YLocation, Overshoot:=1)
{
	If Overshoot = 1
	{
		Random, Re, 1, 3
		If Re = 1
		{
			Random, which, 1, 2
			if which = 1
			{
				Random, Xchange, 0, 60
			}
			if which = 2
			{
				Random, Xchange, 0, -60
			}
			Random, which, 1, 2
			if which = 1
			{
				Random, Ychange, 0, 60
			}
			if which = 2
			{
				Random, Ychange, 0, -60
			}
			
			speed := RandomWeight(.6, .7, 1)
			MoveMouse(XLocation+Xchange, YLocation+Ychange, speed)
			MouseClickDelay()
		}
	}
	speed := RandomWeight(.6, .7, 1)
	MoveMouse(XLocation, YLocation, speed)
	MouseClickDelay()
}

Idlewait()
{
	loop
	{
		PixelSearch, FoundX, FoundY, 805, 638, 805, 638, 0xFF0000, 0, Fast RGB
		If (ErrorLevel = 0)
		{
			break
		}
	}
}

VerifyTarget(TarColor:=0xFF00FF,TarVariance:=0)
{
	MouseGetPos, VerifyTargetX, VerifyTargetY
	If (rs_scan.PixelRegion(TarColor,VerifyTargetX,VerifyTargetY,100,100,TarVariance,x,y)){
		return 1 ; return 1 if found
	} else If (rs_scan.PixelRegion(TarColor,VerifyTargetX,VerifyTargetY,-100,-100,TarVariance,x,y)) {
		return 1 ; return 1 if found
	} else {
		return 0 ; return 0 if not found
	}
}

;Pixelsearches for desired color and calculates a random point on the target
TarCenter(ColorID, Area, Misclickable:=0)
{
	If (Area = 0)
	{
		Xcord := 13
		Ycord := 68
		wd := 808
		Lt := 756
		ColorVariation := 5
	}
	If (Area > 0)
	{
		Xcord := 892
		Ycord := 50
		wd := 146
		Lt := 140
		ColorVariation := 25
	}
	IniWrite,%ColorID%,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Variables.ini,ColorVars,ColorSearch
	
	;minimap 892,30,146,160
	rs_scan.PixelRegion(ColorID,Xcord,Ycord,wd,Lt,ColorVariation,AMarkX,AMarkY)
	rs_scan.PixelRegion(ColorID,Xcord,Ycord,wd,Lt,ColorVariation,BMarkX,BMarkY,"BTLR")
	rs_scan.PixelRegion(ColorID,Xcord,Ycord,wd,Lt,ColorVariation,CMarkX,CMarkY,"BTRL")
	rs_scan.PixelRegion(ColorID,Xcord,Ycord,wd,Lt,ColorVariation,DMarkX,DMarkY,"RLTB")
	
	;Calculates length and width
	If (BMarkX > CMarkX){
		MarkWidth := (BMarkX - CMarkX) / 2
	} else if (CMarkX > BMarkX){
		MarkWidth := (CMarkX - BMarkX) / 2
	}
	
	If (DMarkY > AMarkY){
		MarkLength := (DMarkY - AMarkY) / 2
	} else if (AMarkY > DMarkY){
		MarkLength := (AMarkY - DMarkY) / 2
	}
	
	;Math to calculate the center of the target and uses the width/length to get a randomly weighted point
	CalcX := ((BMarkX + CMarkX) / 2) + nrand(-MarkWidth, MarkWidth)
	CalcY := ((DMarkY + AMarkY) / 2) + nrand(-MarkLength, MarkLength)
	IniWrite,%CalcX%,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Variables.ini,ColorVars,TargetPaintX
	IniWrite,%CalcY%,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Variables.ini,ColorVars,TargetPaintY
	
	return [CalcX, CalcY]
}

DropperV2(){
    ;Place search at top of function
	rs_scan.ImageRegion("Inventory.png",770,300,500,500,0,Picx,PicY)
	
    ;Declare variables
	CentX := ((Picx + 20) + (Picx + 55)) / 2 ;Calculated cneter X pos
	CentY := ((PicY + 5) + (PicY + 36)) / 2  ;Caculated center Y pos
	GapX := 7 ;Gap between items on the X axis
	GapY := 5 ;Gap between items on the Y axis
	RanW := 15 ;Randomized clicking
	XTimes := 0 ;Start at 1 and used to move location over the X axis
	YTimes := 0 ;Start at 1 and used to move location over the Y axis
	GapXTimes := 0 ;Start at 0 and used to compensate for the gap on the X axis
	GapYTimes := 0 ;Start at 0 and used to compensate for the gap on the Y axis
	Dropped := 0 ;Count the number of items dropped and stop of 28
	YChange := 31
	XChange := 35
	
    ;Begin looping for each inventory slot to be dropped
	Loop{
		LocX := (XChange * XTimes) + (GapX * GapXTimes) + CentX
		LocY := (YChange * YTimes) + (GapY * GapYTimes) + CentY
		;Insert mouse move here, with randomweighted x and y vars
		MyMouseMove(RandomWeight(-RanW+LocX,LocX,RanW+LocX),RandomWeight(-RanW+LocY,LocY,RanW+LocY),0)
		DelayDrops1()
		MyClick(3, 0)
		DelayDrops1()
		
		YTimes++
		GapYTimes++
		Dropped++
		LocX := (XChange * XTimes) + (GapX * GapXTimes) + CentX
		LocY := (YChange * YTimes) + (GapY * GapYTimes) + CentY
		;Insert mouse move here, with randomweighted x and y vars
		MyMouseMove(RandomWeight(-RanW+LocX,LocX,RanW+LocX),RandomWeight(-RanW+LocY,LocY,RanW+LocY),0)
		DelayDrops1()
		MyClick(3, 0)
		DelayDrops1()
		
		;Reset the Y Cords to move back to the starting row
		YTimes--
		GapYTimes--
		
		;Change X cords after click 2 items
		XTimes++
		GapXTimes++
		
		If (XTimes > 3){
			XTimes := 0
			GapXTimes := 0
			YTimes += 2
			GapYTimes += 2
			C++
			If (C = 3){
				loop,4{
					LocX := (XChange * XTimes) + (GapX * GapXTimes) + CentX
					LocY := (YChange * YTimes) + (GapY * GapYTimes) + CentY
					;Insert mouse move here, with randomweighted x and y vars
					MyMouseMove(RandomWeight(-RanW+LocX,LocX,RanW+LocX),RandomWeight(-RanW+LocY,LocY,RanW+LocY),0)
					DelayDrops1()
					MyClick(3, 0)
					DelayDrops1()
					XTimes++
					GapXTimes++
				}
				loop{
					PixelSearch, FoundX, FoundY, 1018, 796, 1043, 817, 0x00FF00, 0, Fast RGB
					If (ErrorLevel = 1)
					{
						MouseAfterClickDelay()
						break
					}
				}
				return
			}
		}
	}
}