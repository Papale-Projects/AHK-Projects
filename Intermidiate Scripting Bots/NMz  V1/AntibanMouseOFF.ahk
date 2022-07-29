#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

AntibanMouseOFF()
{
	Random, Anti, 1, 1
	Random, AntiMX, 778, 1238
	Random, AntiMY, 6, 1037
	Random, AntiMSpeed, 0.50, 0.60
	Random, AntiSleep, 500, 2500
	If (Anti = 1)
	{
	MoveMouse(AntiMX, AntiMY, AntiMSpeed)
	WinActivate, OpenOSRS - 
	}
}
