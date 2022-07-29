#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

RandomWorldHop() {
	Random, EqualsHop, 1, 15000
	Random, Hopping, 7000, 11000
	Random, Pause, 350, 600
	CloseX = 728
	CloseY = 244
	Random, MouseSpeed, 0.50, 0.65
	InvX = 648
	InvY = 213
	
	If(EqualsHop = 1)
	{
	Send {CTRL down} {Shift down} {Right down}
	Sleep, Pause
	Send {CTRL up} {Shift up} {Right up}
	Sleep, Hopping
	MoveMouse(CloseX+RandomWeighted(-8,0,12), CloseY+RandomWeighted(-9,0,12), MouseSpeed)
	Sleep, Pause
	Click
	Sleep, Pause
	MoveMouse(InvX+RandomWeighted(-18,0,13), InvY+RandomWeighted(-16,0,18), MouseSpeed)
	Sleep, Pause
	Click
	Sleep, Pause
	}
}