#Include RandomBezier.ahk

;Set food color to:00FF00 with inventory tags
;Set a screen marker over prayer orb with color:FF0000
;Set screen marker max for prayer to 53
;Prayer potion inventory tags set to color:00FF00 size:17

1::PrayerPotionCheck()

PrayerPotionCheck() {
	;Random number for click offsets in inventory
		Random, RanX, 3, 10
		Random, RanY, 3, 10
		
	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random mousespeed
		Random, Mspeed, 350, 750
	
	PixelSearch, PrayerLowX, PrayerLowY, 562, 113, 609, 137, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			PixelSearch, PotionInvX, PotionInvY, 558, 232, 741, 493, 0x00FF00, 0, Fast RGB
				If ErrorLevel = 0
				{
					MouseGetPos, MouseX, MouseY
					RandomBezier(MouseX, MouseY, PotionInvX+RanX, PotionInvY+RanY, "T"MSpeed)
					Sleep, Mdelay
					Click
					Sleep, Mdelay
					Sleep, Mdelay
					Sleep, Mdelay
					Sleep, Mdelay
				}
		}
}