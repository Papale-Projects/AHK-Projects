;OPTIMIZATIONS START
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
vinipath = %A_ScriptDir%\Variables.ini
#include ShinsOverlayClass.ahk
#include ShinsImageScanClass.ahk
#Include WindHumanMouse.ahk
#include InterfaceCords.ahk
rs_scan := new ShinsImageScanClass("RuneLite")
rs_overlay := new ShinsOverlayClass("RuneLite")

settimer,draw,5
return

draw:
IniRead, vCA,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Variables.ini,ColorVars,ColorSearch
IniRead, vPX,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Variables.ini,ColorVars,TargetPaintX
IniRead, vPY,C:\Users\WhoAmI\Desktop\My Scripts\Advanced Scripting Bots - Current\Iron Miner V2\Variables.ini,ColorVars,TargetPaintY
rs_scan.PixelRegion(vCA,13,68,808,756,5,AMarkX,AMarkY)
rs_scan.PixelRegion(vCA,13,68,808,756,5,BMarkX,BMarkY,"BTLR")
rs_scan.PixelRegion(vCA,13,68,808,756,5,CMarkX,CMarkY,"BTRL")
rs_scan.PixelRegion(vCA,13,68,808,756,5,DMarkX,DMarkY,"RLTB")
rs_scan.PixelRegion(vCA,13,68,808,756,5,EMarkX,EMarkY,"LRBT")
rs_scan.PixelRegion(vCA,13,68,808,756,5,FMarkX,FMarkY,"TBLR")
rs_scan.PixelRegion(vCA,13,68,808,756,5,GMarkX,GMarkY,"TBRL")
rs_scan.PixelRegion(vCA,13,68,808,756,5,HMarkX,HMarkY,"RLBT")
rs_scan.ImageRegion("Inventory.png",770,300,500,500,0,Picx,PicY)
Overlayscan := rs_scan.PixelRegion(0x00FF00,868, 157, 20, 20,5,VerifyLx,VerifyLy,"RLTB")
;MouseGetPos,Mx,My

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
CalcX := ((BMarkX + CMarkX) / 2) + RandomWeight(-MarkWidth, 0, MarkWidth)
CalcY := ((DMarkY + AMarkY) / 2) + RandomWeight(-MarkLength, 0, MarkLength)

if (rs_overlay.BeginDraw()){
	
	If (Overlayscan){
		;rs_overlay.DrawCircle(Mx+5,My+10,14,0x00FF00,2)
		;rs_overlay.DrawText(Picx "," PicY,0,100,18,0xFFFFFF)
		rs_overlay.DrawLine(EMarkX,EMarkY,AMarkX,AMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(EMarkX,EMarkY,BMarkX,BMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(BMarkX,BMarkY,FMarkX,FMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(HMarkX,HMarkY,FMarkX,FMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(HMarkX,HMarkY,DMarkX,DMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(DMarkX,DMarkY,GMarkX,GMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(GMarkX,GMarkY,CMarkX,CMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(CMarkX,CMarkY,AMarkX,AMarkY,0xDDFF00,2)
		rs_overlay.DrawCircle(AMarkX,AMarkY,1,0x00FF00,4) ;green
		rs_overlay.DrawCircle(BMarkX,BMarkY,1,0xFFFFFF,4) ;white
		rs_overlay.DrawCircle(CMarkX,CMarkY,1,0xFF0000,4) ;red
		rs_overlay.DrawCircle(DMarkX,DMarkY,1,0xFF00FF,4) ;purple
		rs_overlay.DrawCircle(EMarkX,EMarkY,1,0xDDFF00,4) ;gold
		rs_overlay.DrawCircle(FMarkX,FMarkY,1,0x68D0FE,4) ;blue
		rs_overlay.DrawCircle(GMarkX,GMarkY,1,0x007ACC,4) ;darkblue
		rs_overlay.DrawCircle(HMarkX,HMarkY,1,0x4E2F2E,4) ;ghost
		;rs_overlay.DrawCircle(vPX,vPY,1,0xFF0000,4)
	}
	
	rs_overlay.EndDraw()
}
return