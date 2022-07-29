#Include RandomBezier.ahk

1::
		;Color Detection
			PixelSearch, RingX, RingY, 370, 180, 420, 220, 0x00FF00, 1, RGB, Fast
		
		;Click on fairy ring in house
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, RingX, RingY, "T"MSpeed)
2::reload
3::exitapp

;378, 185
;x403
;y209