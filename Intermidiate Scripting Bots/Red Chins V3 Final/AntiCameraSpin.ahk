#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AntiCameraSpin()
{
Random, Anti, 1, 8
If (Anti = 1)
{
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:RandomCamera`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
	Random, Enable, 1, 5
	Random, SpinHold, 150, 1500
	Random, Direction, 1, 2
	If (Direction = 1)
	{
		Hotkey := "Right"
	}
	If (Direction = 2)
	{
		Hotkey := "Left"
	}
	If (Enable = 1)
	{
		Send {%Hotkey% down}
		Sleep, SpinHold
		Send {%Hotkey% up}
	}
	Random, Enable, 1, 5
	Random, SpinHold, 150, 1500
	Random, Direction, 1, 2
	If (Direction = 1)
	{
		Hotkey := "Right"
	}
	If (Direction = 2)
	{
		Hotkey := "Left"
	}
	If (Enable = 1)
	{
		Send {%Hotkey% down}
		Sleep, SpinHold
		Send {%Hotkey% up}
	}
	Random, Enable, 1, 5
	Random, SpinHold, 150, 1500
	Random, Direction, 1, 2
	If (Direction = 1)
	{
		Hotkey := "Right"
	}
	If (Direction = 2)
	{
		Hotkey := "Left"
	}
	If (Enable = 1)
	{
		Send {%Hotkey% down}
		Sleep, SpinHold
		Send {%Hotkey% up}
	}
}
}