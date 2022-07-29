;Rules to run script

#Include RandomBezier.ahk

1::
loop {
;Color Detection
	PixelSearch, PX, PY, 14, 56, 524, 476, 0x71A774 [, Variation, Fast]
	
	if (ErrorLevel = 0) {
		Mousemove, PX, PY, 3

;Random Variable Declarations
	
	;Sleeps
	
		;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
		;Random mousespeed
		Random, Mspeed, 350, 750
		
	;Antiban move out of client
		Random, AntibanX1, 930, 786
		Random, AntibanY1, 900, 10

;Script Start
	
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, mlogX1, mlogY1, "T"MSpeed)

}

2::reload
3::exitapp