;Rules to run script

;Debug change random values for screen location instead of creating a new pixelsearch

#Include RandomBezier.ahk	
		
1::
Loop {
;Script Start

	;Sleeps
		;Random waiting to over object
			Random, Sleepclimb, 7000, 8000
			Random, Sleepmost, 6000, 6500
			Random, SleepTight, 9000, 11000
			Random, SleepTeleport, 3500, 4500
	
		;Random delay after mousemoves
			Random, Mdelay, 140, 350
		
		;Random mousespeed
			Random, Mspeed, 350, 750
		
		;Antiban move out of client
			Random, AntibanX1, 930, 786
			Random, AntibanY1, 900, 10

	;Random movement amount within color detection
		Random, Climbrandom, 3, 10
		Random, GaprandomX, 3, 10
		Random, GaprandomY, 2, 50
		Random, TightrandomX, 1, 9
		Random, TightrandomY, 1, 9
		Random, GaprandomtwoX, 3, 88
		Random, GaprandomtwoY, 3, 23
		Random, GaprandomthreeX, 3, 70
		Random, GaprandomthreeY, 3, 20
		Random, EdgeX, 3, 17
		Random, EdgeY, 3, 84
	
	;Random movement for spellbook
		Random, TeleportrandomX, 708, 724
		Random, TeleportrandomY, 247, 270

	;Color Detection
		PixelSearch, PX, PY, 14, 183, 470, 387, 0x00FF00, 1, RGB, Fast

	;Climb wall after teleporting to seers village
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, PX+Climbrandom, PY+Climbrandom, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Sleepclimb
		
	;Pick up marks of grace during script
		PixelSearch, MarkX, MarkY, 284, 206, 414, 304, 0xFF0000, 1, RGB, Fast
		if(Errorlevel = 0)	{
			MouseGetPos, MouserX, MouserY
			RandomBezier(MouserX, MouserY, MarkX+TightrandomX, MarkY+TightrandomX, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep SleepTeleport
		}

	;Color Detection
		PixelSearch, PX, PY, 14, 183, 470, 387, 0x00FF00, 1, RGB, Fast
		
	;Jump gap after climbing wall
		MouseGetPos, Mouse1X, Mouse1Y
		RandomBezier(Mouse1X, Mouse1Y, PX+GaprandomX, PY+GaprandomY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Sleepclimb
		
	;Pick up marks of grace during script
		PixelSearch, MarkX, MarkY, 221, 211, 406, 345, 0xFF0000, 1, RGB, Fast
		if(Errorlevel = 0)	{
			MouseGetPos, MouserX, MouserY
			RandomBezier(MouserX, MouserY, MarkX+TightrandomX, MarkY+TightrandomX, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep SleepTeleport
		}
		
	;Color Detection
		PixelSearch, PX, PY, 14, 183, 470, 387, 0x00FF00, 1, RGB, Fast
		
	;Cross the tight rope
		MouseGetPos, Mouse2X, Mouse2Y
		RandomBezier(Mouse2X, Mouse2Y, PX+TightrandomX, PY+TightrandomY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep SleepTight
		
	;Pick up marks of grace during script
		PixelSearch, MarkX, MarkY, 344, 246, 488, 324, 0xFF0000, 1, RGB, Fast
		if(Errorlevel = 0)	{
			MouseGetPos, MouserX, MouserY
			RandomBezier(MouserX, MouserY, MarkX+TightrandomX, MarkY+TightrandomX, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep SleepTeleport
		}
		
	;Color Detection
		PixelSearch, PX, PY, 344, 311, 503, 377, 0x00FF00, 1, RGB, Fast
		
	;Jump the second gap
		MouseGetPos, Mouse3X, Mouse3Y
		RandomBezier(Mouse3X, Mouse3Y, PX+GaprandomtwoX, PY+GaprandomtwoY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Sleepmost
		
	;Pick up marks of grace during script
		PixelSearch, MarkX, MarkY, 180, 180, 475, 310, 0xFF0000, 1, RGB, Fast
		if(Errorlevel = 0)	{
			MouseGetPos, MouserX, MouserY
			RandomBezier(MouserX, MouserY, MarkX+TightrandomX, MarkY+TightrandomX, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep SleepTeleport
		}

	;Color Detection
		PixelSearch, PX, PY, 14, 183, 470, 387, 0x00FF00, 1, RGB, Fast

	;Jump the third gap
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, PX+GaprandomthreeX, PY+GaprandomthreeY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Sleepmost
		
	;Pick up marks of grace during script
		PixelSearch, MarkX, MarkY, 240, 264, 377, 373, 0xFF0000, 1, RGB, Fast
		if(Errorlevel = 0)	{
			MouseGetPos, MouserX, MouserY
			RandomBezier(MouserX, MouserY, MarkX+TightrandomX, MarkY+TightrandomX, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep SleepTeleport
		}
		
	;Color Detection
		PixelSearch, PX, PY, 14, 183, 470, 387, 0x00FF00, 1, RGB, Fast
	
	;Jump over the edge to finish the course
		MouseGetPos, Mouse5X, Mouse5Y
		RandomBezier(Mouse5X, Mouse5Y, PX+EdgeX, PY+EdgeY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Sleepmost
		
	
	;Use spellbook to teleport to seers village
		MouseGetPos, Mouse6X, Mouse6Y
		RandomBezier(Mouse6X, Mouse6Y, TeleportrandomX, TeleportrandomY, "T"MSpeed)		
		Sleep Mdelay
		Click
		Sleep SleepTeleport
}
2::reload
3::pause
4::exitapp