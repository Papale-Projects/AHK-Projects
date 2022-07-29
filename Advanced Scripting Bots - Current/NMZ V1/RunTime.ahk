#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include Antiban.ahk
#Include InterfaceCords.ahk
#Include WindHumanMouse.ahk
#Include GUITesting.ahk
#include NightmareFuncs.ahk

F5::
Absorption()
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
Running()
return