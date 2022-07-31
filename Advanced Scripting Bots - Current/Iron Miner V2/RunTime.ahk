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
#Include Antiban.ahk
#Include InterfaceCords.ahk
#Include WindHumanMouse.ahk
#Include GUITesting.ahk
#include Mainfuncs.ahk
#include WaitPixelColor.ahk
#include ShinsImageScanClass.ahk
#include ShinsOverlayClass.ahk

F6::
LogoutIn()
return

F4::

return

F3::reload
return

F1::
Status("Running")
SetTimer,Time,1000
BlockInput, MouseMove
Loop
{
	Running()
}
return