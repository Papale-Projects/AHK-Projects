#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include ShinsOverlayClass.ahk
#include ShinsImageScanClass.ahk
#Include WindHumanMouse.ahk
rs_scan := new ShinsImageScanClass("RuneLite - BigTeddy")
rs_overlay := new ShinsOverlayClass("RuneLite - BigTeddy")

settimer,draw,10
return

draw:
Overlayscan := rs_scan.PixelRegion(0x0000FF,13,68,808,756,5,AMarkX,AMarkY)
rs_scan.PixelRegion(0x0000FF,13,68,808,756,5,BMarkX,BMarkY,"BTLR")
rs_scan.PixelRegion(0x0000FF,13,68,808,756,5,CMarkX,CMarkY,"BTRL")
rs_scan.PixelRegion(0x0000FF,13,68,808,756,5,DMarkX,DMarkY,"RLTB")
rs_scan.Image("MiningEXP.png",0,Picx,PicY)

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
		rs_overlay.DrawLine(BMarkX,BMarkY,AMarkX,AMarkY,0xDDFF00,2)
		;rs_overlay.DrawText("PointB",BMarkX,BMarkY)
		;rs_overlay.DrawText("PointA",AMarkX,AMarkY)
		;rs_overlay.DrawText("PointC",CMarkX,CMarkY)
		;rs_overlay.DrawText("PointD",DMarkX,DMarkY)
		rs_overlay.DrawLine(AMarkX,AMarkY,CMarkX,CMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(CMarkX,CMarkY,DMarkX,DMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(DMarkX,DMarkY,BMarkX,BMarkY,0xDDFF00,2)
		rs_overlay.DrawCircle(CalcX,CalcY,1,0xDDFF00,2)
		rs_overlay.DrawCircle(Picx,PicY,1,0xDDFF00,2)
	}
	
	rs_overlay.EndDraw()
}
return