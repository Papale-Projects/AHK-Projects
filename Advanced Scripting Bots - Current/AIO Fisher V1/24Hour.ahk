#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
	time = 19990101  ; *Midnight* of an arbitrary date.
	time += %NumberOfSeconds%, seconds
	FormatTime, mmss, %time%, mm:ss
	SetFormat, float, 2.0
	return NumberOfSeconds//3600 ":" mmss  ; This method is used to support more than 24 hours worth of sections.
}