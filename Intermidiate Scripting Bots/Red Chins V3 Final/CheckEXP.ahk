#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

CheckEXP()
{
	Random, Check, 1, 200
	Random, SkilltabX, 567, 596
	Random, SkilltabY, 197, 229
	Random, SkillX, 616, 677		;Change to which skill you are training
	Random, SkillY, 460, 490		;Change to which skill you are training
	Random, InvX, 633, 662
	Random, InvY, 197, 232
	Random, MSpeed, 0.50, 0.60
	Random, SkillSleep, 650, 2000
	Random, Delay, 80, 400

If (Check = 1)
	{
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:Checking EXP`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
	MoveMouse(SkilltabX, SkilltabY, MSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
	Random, MSpeed, 0.50, 0.60
	MoveMouse(SkillX, SkillY, MSpeed)
	Sleep, SkillSleep
	Random, MSpeed, 0.50, 0.60
	MoveMouse(InvX, InvY, MSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
	}
}