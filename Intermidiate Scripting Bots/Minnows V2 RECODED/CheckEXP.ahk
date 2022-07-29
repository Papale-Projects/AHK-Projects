#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

CheckEXP()
{
	Random, Check, 1, 8500
	SkilltabX = 580
	SkilltabY = 215
	SkillX = 708 		;Change to which skill you are training
	SkillY = 312		;Change to which skill you are training
	InvX = 648
	InvY = 213
	Random, MSpeed, 0.50, 0.66
	Random, SkillSleep, 650, 2000
	Random, Delay, 80, 400

If (Check = 1){
	MoveMouse(SkilltabX+RandomWeighted(-15,0,16), SkilltabY+RandomWeighted(-18,0,17), MSpeed)
	Sleep, Delay
	Click
	Sleep, Delay
	MoveMouse(SkillX+RandomWeighted(-29,0,30), SkillY+RandomWeighted(-13,0,18), MSpeed)
	Sleep, SkillSleep
	MoveMouse(InvX+RandomWeighted(-18,0,13), InvY+RandomWeighted(-16,0,18), MSpeed)
	Sleep, Delay
	Click
	Sleep, Delay
	}
}