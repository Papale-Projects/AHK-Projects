#Include RandomBezier.ahk

1::InteractionAttacker()

InteractionAttacker() {
	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random mousespeed
		Random, Mspeed, 350, 750
		
	PixelSearch, InteractionX, InteractionY, 6, 55, 526, 473, 0x00FF00, 0, Fast RGB
		If ErrorLevel = 0
		{
		}
		If ErrorLevel = 1
		{
			PixelSearch, TargetX, TargetY, 6, 55, 526, 473, 0x00FFFF, 0, Fast RGB
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, TargetX, TargetY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Mdelay
			Sleep, Mspeed
			Sleep, Mspeed
			Sleep, Mspeed
		}
}
