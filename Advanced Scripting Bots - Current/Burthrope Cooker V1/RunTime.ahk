#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include Antiban.ahk
#Include InterfaceCords.ahk
#Include WindHumanMouse.ahk
#Include GUITesting.ahk
#include CookingFuncs.ahk

;PLUGIN SETTINGS

;Set colors for NoMore Inventory Tags >> Log color: 0000FF >> Knife color: FF0000
;Set colors for NoMore NPC Markers >> Banker color: 00FFFF

;Settings for Player State Indicators
;>> IDLE
;>> Enable >> Animations >> Movement
;>> Idle time: 200ms
;>> indicator location: 800:610:5:5
;>> color: FF0000

;Settings for Inventory Indicatos
;>> Contains
;>> Inventory: *Knife,
;>> Display Indicator
;>> Location: 900:490:5:5
;>> Marker size: 4
F5::
DepositFish()
return

F4::
LogoutIn()
return

PrintScreen::
Logout()
Status("Stopped")
Pause
return

F3::reload
return

F1::
Status("Running")
SetTimer,Time,1000
BlockInput, MouseMove
VerifyInventoryOpen()
Loop
{
	Runner()
}
return