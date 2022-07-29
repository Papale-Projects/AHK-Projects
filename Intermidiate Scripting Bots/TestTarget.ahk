#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

centerX := A_ScreenWidth/2
centerY := A_ScreenHeight/2

F1::
mousegetpos, centerX, centerY
return

F2::
CoordMode, Pixel, Window
distance := 50
Loop, 10
{
 PixelSearch, FoundX, FoundY, % centerX-distance, % centerY-distance, % centerX+distance, % centerY+distance, 0x00FFFF, 0, Fast RGB
 Random, rand, 1, 10
 FoundX += %rand%
 Random, rand, 1, 10
 FoundY += %rand%
 If (ErrorLevel = 0) {
  Click, %FoundX%, %FoundY% Left, 0
  Sleep, 120
  Click, %FoundX%, %FoundY% Left, 1
  return
 }
 distance += 50
}
return