#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk

CheckEXP()
{
	Global AntiCheckElapsed
	Random, Check, 1, 85
	Random, SkilltabX, 856, 884
	Random, SkilltabY, 502, 534
	Random, SkillX, 905, 965		;Change to which skill you are training
	Random, SkillY, 571, 601		;Change to which skill you are training
	Random, InvX, 1020, 1051
	Random, InvY, 502, 536
	Random, MSpeed, 0.50, 0.65
	Random, SkillSleep, 650, 2000
	Random, Delay, 80, 400

If (Check = 1)
	{
	AntiCheckTimer := A_TickCount
	Random, LWaiting, 0, 200
	sleep, LWaiting
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:Checking EXP`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
	MoveMouse(SkilltabX, SkilltabY, MSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
	Random, MSpeed, 0.50, 0.65
	MoveMouse(SkillX, SkillY, MSpeed)
	Sleep, SkillSleep
	Random, MSpeed, 0.50, 0.65
	MoveMouse(InvX, InvY, MSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
	AntiCheckElapsed := AntiCheckTimer - A_TickCount
	}
If (Check = 2)
	{
	AntiCheckTimer := A_TickCount
	Random, Movement, 1, 5
	Random, InvtabX, 920, 951
	Random, InvtabY, 502, 536
	Random, RanmoveX, 847, 1026
	Random, RanmoveY, 539, 796
	Random, LWaiting, 0, 200
	sleep, LWaiting
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:Checking EXP`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
	Random, MSpeed, 0.50, 0.65
	MoveMouse(InvtabX, InvtabY, MSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
	Random, MSpeed, 0.50, 0.65
	If (Movement = 1)
		{
			MoveMouse(RanmoveX, RanmoveY, MSpeed)
		}
	Random, SkillSleep, 650, 2000
	Sleep, SkillSleep
	Random, MSpeed, 0.50, 0.65
	MoveMouse(InvX, InvY, MSpeed)
	Random, Delay, 80, 400
	Sleep, Delay
	Click
	Random, Delay, 80, 400
	Sleep, Delay
	AntiCheckElapsed := AntiCheckTimer - A_TickCount
	}
}