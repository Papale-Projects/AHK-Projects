#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

CheckEXP()
{
	Random, Check, 1, 40
	Random, SkilltabX, 567, 596
	Random, SkilltabY, 197, 229
	Random, SkillX, 615, 675		;Change to which skill you are training
	Random, SkillY, 395, 426		;Change to which skill you are training
	Random, InvX, 633, 662
	Random, InvY, 197, 232
	Random, MSpeed, 0.50, 0.60
	Random, SkillSleep, 650, 2000
	Random, Delay, 80, 400

If (Check = 1)
	{
	MoveMouse(SkilltabX, SkilltabY, MSpeed)
	Sleep, Delay
	Click
	Sleep, Delay
	MoveMouse(SkillX, SkillY, MSpeed)
	Sleep, SkillSleep
	MoveMouse(InvX, InvY, MSpeed)
	Sleep, Delay
	Click
	Sleep, Delay
	}
}