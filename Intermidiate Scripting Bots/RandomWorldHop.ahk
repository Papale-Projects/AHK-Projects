#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

RandomWorldHop() {
	Random, EqualsHop, 1, 60000
	Random, Hopping, 7000, 11000
	Random, Pause, 350, 600
	Random, CloseX, 720, 738
	Random, CloseY, 235, 255
	Random, MouseSpeed, 0.50, 0.65
	Random, InvX, 633, 662
	Random, InvY, 197, 232
	
	If(EqualsHop = 1)
	{
	Send {CTRL down} {Shift down} {Right down}
	Sleep, Pause
	Send {CTRL up} {Shift up} {Right up}
	Sleep, Hopping
	MoveMouse(CloseX, CloseY, MouseSpeed)
	Sleep, Pause
	Click
	Sleep, Pause
	MoveMouse(InvX, InvY, MouseSpeed)
	Sleep, Pause
	Click
	Sleep, Pause
	}
}