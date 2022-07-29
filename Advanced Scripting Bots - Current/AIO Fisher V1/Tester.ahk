#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GuiOptions()
{
	Menu Tray, Icon, shell32.dll, 42
	Gui Main: New, +LabelMain +hWndhMainWnd -MinimizeBox -MaximizeBox +AlwaysOnTop
	Gui Main:Add, Button, x79 y56 w116 h32 gMainStartScript, Save Options
	Gui Main:Add, DropDownList, x8 y24 w120 AltSubmit vHealingType, Food||Guthans|Foodless
	Gui Main:Font, s10 q4, Calibri
	Gui Main:Add, Text, x8 y0 w120 h23 +0x200, Select Healing Type
	Gui Main:Font
	Gui Main:Add, CheckBox, x144 y0 w121 h23 vPotions, Enable Potions
	Gui Main:Add, CheckBox, x144 y24 w121 h23 vPickDrops, Enable Drop Pickup
	
	Gui Main:Show, w274 h98, AIO Fighter Options
	return
	
	MainStartScript:
	GUI, Main:Submit
	Gui, Main:Destroy
	Return
}

#Include Antiban.ahk
#Include InterfaceCords.ahk
#Include WindHumanMouse.ahk
#Include TrackingClicker.ahk
#Include GUITesting.ahk

F4::
ToBankPathv2()
return

F5::
FromBankPathv2()
return

F3::reload
return

F1::
Status("Running")
SetTimer,Time,1000
BlockInput, MouseMove
Loop{
	IsInvFull()
	AntibanAny()
	AntibanClicks()
	PixelSearch, TargetX, TargetY, 805, 631, 805, 631, 0x73FF00, 0, Fast RGB
	If (ErrorLevel = 1)
	{
		IsInvFull()
		AntibanClicks()
		AntibanAny()
		AntiBanLog()
		TrackingClicker()
	}
	If (ErrorLevel = 0)
	{
		;If the script is menu stalled, send a space bar to remove menu stall
		Loop,
		{
			PixelSearch, TargetX, TargetY, 805, 641, 805, 641, 0xFF0000, 0, Fast RGB
			If (ErrorLevel = 0)
			{
				Status("Level Up Window")
				Send, {Space down}
				Random, Sleeper, 200, 500
				Sleep, Sleeper
				Send, {Space up}
				PixelSearch, TargetX, TargetY, 805, 631, 805, 631, 0x73FF00, 0, Fast RGB
				If (ErrorLevel = 1)
				{
					break
				}
			}
			If (ErrorLevel = 1)
			{
				break
			}
		}
	}
}
return