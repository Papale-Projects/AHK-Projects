#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include ShinsImageScanClass.ahk
#Include WindHumanMouse.ahk

global rs_scan := new ShinsImageScanClass("OpenOSRS - ") ;this is created just once at the start

F1::
Loop
{
	Result := GameCenter(0xCA00D2, 5)
	MoveMouse(Result[1], Result[2],.7)
	BankingDelays()
	MiniMapAfterClickMove()
	BankingDelays()
}
return

F3::
Reload
return

GameCenter(ColorID, ColorVariation:=0, Misclickable:=0)
{
	rs_scan.PixelRegion(ColorID,13,68,808,756,ColorVariation,AMarkX,AMarkY)
	rs_scan.PixelRegion(ColorID,13,68,808,756,ColorVariation,BMarkX,BMarkY,"BTLR")
	rs_scan.PixelRegion(ColorID,13,68,808,756,ColorVariation,CMarkX,CMarkY,"BTRL")
	rs_scan.PixelRegion(ColorID,13,68,808,756,ColorVariation,DMarkX,DMarkY,"RLTB")
	
	;Calculates length and width
	If (BMarkX > CMarkX){
		MarkWidth := (BMarkX - CMarkX) / 2 - (BMarkX - CMarkX) / 10
	}
	if (CMarkX > BMarkX){
		MarkWidth := (CMarkX - BMarkX) / 2 - (CMarkX - BMarkX) / 10
	}
	If (AMarkY > DMarkY){
		MarkLength := (AMarkY - DMarkY) / 2 - (AMarkY - DMarkY) / 10
	}
	If (DMarkY > AMarkY){
		MarkLength := (DMarkY - DMarkY) / 2 - (DMarkY - DMarkY) / 10
	}
	
	;Math to calculate the center of the target and uses the width/length to get a randomly weighted point
	CalcX := ((DMarkX + AMarkX) / 2) + RandomWeight(-MarkWidth, 0, MarkWidth)
	CalcY := ((DMarkY + AMarkY) / 2) + RandomWeight(-MarkLength, 0, MarkLength)
	
	return [CalcX, CalcY]
}

BankingDelays()
{
	Delayaction := RandomWeight(60, 200, 1200)
	Sleep, Delayaction
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

MiniMapAfterClickMove()
{
	Delay := RandomWeight(20, 100, 200)
	Sleep, Delay
	MoveMouse(RandomWeight(884, 987, 1039), RandomWeight(32, 151, 193),.7)
}

MouseClickDelay()
{
	Delay := RandomWeight(60, 70, 230)
	Sleep, Delay
}