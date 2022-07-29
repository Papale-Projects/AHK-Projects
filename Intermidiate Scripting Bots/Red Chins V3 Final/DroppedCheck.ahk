#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include PickupDropped.ahk

DroppedCheck()
{
	PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x64649B, 0, Fast RGB
	If ErrorLevel = 0
	{
		PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			
		}
	}
}