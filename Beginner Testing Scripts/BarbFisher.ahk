#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include RandomBezier.ahk
#Include Dropper.ahk
#Include Logout.ahk

Random, MovingWait, 2000, 3500
Random, PauseMove, 1000, 4500

centerX := A_ScreenWidth/2
centerY := A_ScreenHeight/2

F4::reload
F1::
mousegetpos, centerX, centerY
return

F2::
Loop{
PixelSearch, FoundX, FoundY, 592, 33, 625, 65, 0x00FF00, 0, Fast RGB
If ErrorLevel = 0
{
	Dropper()
}
If ErrorLevel = 1
{
}

CoordMode, Pixel, Window
distance := 10
Loop, 80
{
 PixelSearch, FoundX, FoundY, % centerX-distance, % centerY-distance, % centerX+distance, % centerY+distance, 0x00FFFF, 0, Fast RGB
 Random, rand, 1, 5
 FoundX += %rand%
 Random, rand, 1, 5
 FoundY += %rand%
 If (ErrorLevel = 0) {
  Sleep, PauseMove
  Click, %FoundX%, %FoundY% Left, 0
  Sleep, Mdelay
  Click, %FoundX%, %FoundY% Left, 1
  Sleep, MovingWait
  break
 }
 distance += 10
}
}

PixelSearch, MiniMapX, MiniMapY, 600, 29, 768, 193, 0xFF00FF, 0, Fast RGB
If ErrorLevel = 0
{
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, MiniMapX+1, MiniMapY+1, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, MovingWait
			Sleep, MovingWait
			Sleep, MovingWait
}
If ErrorLevel = 1
{
	MsgBox, MiniMap Tile Marker not found! Closing Script and logging out character!
	Logout()
	Reload
}