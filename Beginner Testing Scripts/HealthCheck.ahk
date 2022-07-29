#Include RandomBezier.ahk

;Set food color to:FF00FF with inventory tags

Healthcheck() {

	;Random number for click offsets in inventory
		Random, RanX, 3, 15
		Random, RanY, 3, 15
		
	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random mousespeed
		Random, Mspeed, 350, 750
	
	PixelSearch, HPLowX, HPLowY, 559, 236, 736, 493, 0xFF00FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, HPLowX+RanX, HPLowY+RanY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Mdelay
			Sleep, Mdelay
			Sleep, Mdelay
		}
}