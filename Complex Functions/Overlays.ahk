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

;Sets the path for the .ini file containing the pixel search coordinates / search colors
vinipath = %A_ScriptDir%\Variables.ini
;Includes the GDI+ classes and other function scripts
#include ShinsOverlayClass.ahk
#include ShinsImageScanClass.ahk
#Include WindHumanMouse.ahk
#include InterfaceCords.ahk
;Global variable for the GDI+ class to simplify code
rs_scan := new ShinsImageScanClass("RuneLite - BigTeddy")
rs_overlay := new ShinsOverlayClass("RuneLite - BigTeddy")

;Sets a label that will loop run ever 5ms (5ms was needed to closes track the mouse)
settimer,draw,5
return

;Label with looped code
draw:
;Read the ini file for current pixel locations / colors to search for
IniRead, vCA,C:\Users\WhoAmI\Desktop\My Scripts\API 2.0\Iron Miner V2\Variables.ini,ColorVars,ColorSearch
IniRead, vPX,C:\Users\WhoAmI\Desktop\My Scripts\API 2.0\Iron Miner V2\Variables.ini,ColorVars,TargetPaintX
IniRead, vPY,C:\Users\WhoAmI\Desktop\My Scripts\API 2.0\Iron Miner V2\Variables.ini,ColorVars,TargetPaintY
;Use the colors / locations to search for the outline
rs_scan.PixelRegion(vCA,13,68,808,756,5,AMarkX,AMarkY)
rs_scan.PixelRegion(vCA,13,68,808,756,5,BMarkX,BMarkY,"BTLR")
rs_scan.PixelRegion(vCA,13,68,808,756,5,CMarkX,CMarkY,"BTRL")
rs_scan.PixelRegion(vCA,13,68,808,756,5,DMarkX,DMarkY,"RLTB")
;Testing the image searching abilities
;rs_scan.ImageRegion("Inventory.png",770,300,500,500,0,Picx,PicY)

;Get mouse location to be used for the overlay around the mouse
MouseGetPos,Mx,My

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

;If statement to begin drawing all overlays
if (rs_overlay.BeginDraw()){
	
	If (Overlayscan){
		rs_overlay.DrawCircle(Mx+5,My+10,14,0x00FF00,2)
		;rs_overlay.DrawText(Picx "," PicY,0,100,18,0xFFFFFF)
		rs_overlay.DrawLine(BMarkX,BMarkY,AMarkX,AMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(AMarkX,AMarkY,CMarkX,CMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(CMarkX,CMarkY,DMarkX,DMarkY,0xDDFF00,2)
		rs_overlay.DrawLine(DMarkX,DMarkY,BMarkX,BMarkY,0xDDFF00,2)
		rs_overlay.DrawCircle(vPX,vPY,1,0xFF0000,4)
	}

	;Ends the overlay
	rs_overlay.EndDraw()
}
return