#Include RandomBezier.ahk

	centerX := A_ScreenWidth/2
	centerY := A_ScreenHeight/2

SetTargetCenter(){
	
	;Random number for click offsets in inventory
		Random, RanX, 1, 5
		Random, RanY, 1, 5

	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random mousespeed
		Random, Mspeed, 350, 750

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
}