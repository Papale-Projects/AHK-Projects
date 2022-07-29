#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include AntibanMouseON.ahk
#Include AntibanMouseOFF.ahk
#Include DetectRangePot.ahk
#Include DetectAbsorption.ahk

F2::reload
F1::
Loop{
Random, Order, 1, 2
Random, Wait, 540000, 750000

If(Order = 1){
	AntibanMouseOFF()
	DetectRangePot()
	DetectAbsorption()
	AntibanMouseON()
	Sleep, Wait
}
If(Order = 2){
	AntibanMouseOFF()
	DetectAbsorption()
	DetectRangePot()
	AntibanMouseON()
	Sleep, Wait
}
}