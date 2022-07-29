#Include RandomBezier.ahk

;Inventory tags delay set to 500
;Set dropped items to: 0000FF
;Solid size 17

Dropper() {
	;Random number for click offsets in inventory
		Random, RanX, 3, 10
		Random, RanY, 3, 10
		
	;Random delay after mousemoves
		Random, Mdelay, 200, 250
		
	;Random mousespeed
		Random, Mspeed, 120, 170
	
Loop{
	PixelSearch, ItemDropX, ItemDropY, 557, 229, 737, 493, 0x0000FF, 0, Fast RGB
		If ErrorLevel = 0
		{
			Mousemove, ItemdropX+RanX, ItemdropY+RanY, 5
			Sleep, Mdelay
			Send {Shift Down} {Click}
			Sleep, Mdelay
		}
		If ErrorLevel = 1
		{
			Break
		}
	}
}