#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include Antiban.ahk
#Include GUITesting.ahk
#Include InterfaceCords.ahk
Global ToggleAgy

Agility()
{
	Countingzzz++
	If (Countingzzz := 1)
	{
		Random, Delay, 6000, 10000
		Sleep, Delay	
	}
	Random, Delay, 300, 1000
	Sleep, Delay
	PixelSearch, FoundX, FoundY, 805, 640, 805, 640, 0xFF0000, 0, Fast RGB
	If (ErrorLevel = 0)
	{
		Random, Delay, 300, 1000
		Sleep, Delay
		AntibanAny()
		AntiBanLog()
		AntibanClicks()
		ToggleAgilityOn()
		Random, Delay, 2500, 6000
		Sleep, Delay
	}
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

Mark()
{
	PixelSearch, AObjectX, AObjectY, 7, 100, 833, 830, 0x20FF00, 20, Fast RGB
	If (ErrorLevel = 0)
	{
		Status("Picking up mark")
		;Get the top left of the blue mark
		PixelSearch, AMarkX, AMarkY, 7, 100, 833, 830, 0x20FF00, 20, Fast RGB
		;Get the bottom right of the blue mark
		PixelSearch, BMarkX, BMarkY, 833, 830, 7, 100, 0x20FF00, 20, Fast RGB
		
		;Calculates length and width
		MarkWidth := ((BMarkX - AMarkX) / 2)
		MarkLength := ((BMarkY - AMarkY) / 2)
		
		;Math to calculate the center of the mark and uses the width/length to get a randomly weighted point
		CalcX := ((AMarkX + BMarkX) / 2) + RandomWeight(-MarkWidth, 0, MarkWidth)
		CalcY := ((AMarkY + BMarkY) / 2) + RandomWeight(-MarkLength, 0, MarkLength)
		
		Delayaction := RandomWeight(500, 600, 1200)
		Sleep, Delayaction
		AntibanAny()
		AntibanClicks()
		Random, Mspeed, 0.6, 0.9
		MoveMouse(CalcX, CalcY, Mspeed)
		MouseClickDelay()
		MouseGetPos, MouseposX, MouseposY
		PixelSearch, CheckX, CheckY, MouseposX, MouseposY, MouseposX, MouseposY, 0x20FF00, 20, Fast RGB
		If (ErrorLevel = 0)
		{
			MissClick2++
			MissClickGui()
			MyClick()
			Waitidle := RandomWeight(1500, 2500, 3200)
			Sleep, Waitidle
			AntibanAny()
			AntibanClicks()
		}
		PixelSearch, CheckX, CheckY, MouseposX, MouseposY, MouseposX, MouseposY, 0x20FF00, 20, Fast RGB
		If (ErrorLevel = 1)
		{
			MouseGetPos, MouseposX, MouseposY
			PixelSearch, CheckX, CheckY, MouseposX, MouseposY, MouseposX, MouseposY, 0x020202, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				MissClick2++
				MissClickGui()
				MyClick()
				Waitidle := RandomWeight(1500, 2500, 3200)
				Sleep, Waitidle
				AntibanAny()
				AntibanClicks()
			}
		}
	}
}
return

ToggleAgilityOn()
{
	If (ToggleAgy != 1)
	{
		Status("Running Agility")
		Send, !z
		ToggleAgy := 0
	}
}
return