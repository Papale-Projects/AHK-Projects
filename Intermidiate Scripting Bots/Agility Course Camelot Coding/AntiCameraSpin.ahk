#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AntiCameraSpin()
{
Global AntiCameraElapsed
Random, Anti, 1, 6
If (Anti = 1)
{
	AntiCameraTimer := A_TickCount
	Random, LWaiting, 0, 200
	sleep, LWaiting
	ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
	ControlSetText, Static1, AntiBan:RandomCamera`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
	Random, Enable, 1, 4
	Random, SpinHold, 150, 750
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
	Random, Enable, 1, 4
	Random, SpinHold, 150, 750
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
	Random, Enable, 1, 4
	Random, SpinHold, 150, 750
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
	AntiCameraElapsed := AntiCameraTimer - A_TickCount
}
}