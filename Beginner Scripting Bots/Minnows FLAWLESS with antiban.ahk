#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

;Rules to run script
	;Toggle compass
	;Up arrow to max
	;fixed screen mode
	;bubble size of fishing spot for zoom
	
;Start script
1::
Loop{
	;Block mousemovements for script start
		blockinput mousemove
		
	;Antiban move out of client
		Random, AntibanX, 930, 786
		Random, AntibanY, 900, 10
		
	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random pause for fishing spot to rotate
		Random, Spotmove, 1500, 2000
		
	;Random mousespeed
		Random, Mspeed, 125, 200
		
	;Random sleep for moving to the fishing spot
		Random, Moving, 3500, 4000
	
	;Fishing spot click random area
		Random, FishspotX, 5, 13
		Random, FishspotY, 5, 13
	
	;Click on fishing spot to start and wait till not fishing
		PixelSearch, NotFishingX, NotFishingY, 15, 54, 140, 78, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			Sleep, Spotmove
			PixelSearch, ClickFishX, ClickFishY, 67, 158, 328, 283, 0x00FF00, 0, Fast RGB
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, ClickFishX+FishspotX, ClickFishY+FishspotY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Moving
		}
		If ErrorLevel = 1
		{
		}
	
	;Click another fishing spot if random event happens
		PixelSearch, EventX, EventY, 67, 158, 328, 283, 0xFF00FF, 0, Fast RGB
		If Errorlevel = 0
		{
			PixelSearch, ClickFishX, ClickFishY, 67, 158, 328, 283, 0x00FF00, 0, Fast RGB
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, ClickFishX+FishspotX, ClickFishY+FishspotY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Moving
		}
		If ErrorLevel = 1
		{
		}

;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 60000
	Random, Logoutsleep, 300000, 900000
	Random, LogoutdoorX, 635, 650
	Random, LogoutdoorY, 496, 526
	Random, LogoutbuttonX, 577, 715
	Random, LogoutbuttonY, 444, 477
	Random, ExistingX, 403, 527
	Random, ExistingY, 306, 334
	Random, ClickplayX, 276, 487
	Random, ClickplayY, 388, 394
	Random, Downkey, 1500, 2500
	If(logoutnumber = 1)
	{
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, LogoutdoorX, LogoutdoorY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, LogoutbuttonX, LogoutbuttonY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Logoutsleep
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, ExistingX, ExistingY, "T"MSpeed)
		Sleep Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 280, 292)
		Sleep Mdelay
		Sleep Mdelay
		Sleep Mdelay
		Sleep Mdelay
		Send 
		Sleep Mdelay
		Send {Enter}
		Sleep Downkey
		Sleep Downkey
		Sleep Downkey
		Sleep Downkey
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, ClickplayX, ClickplayY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Downkey
		PixelSearch, ClickFishX, ClickFishY, 67, 158, 328, 283, 0x00FF00, 0, Fast RGB
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, ClickFishX+FishspotX, ClickFishY+FishspotY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Moving
	}

		;Move mouse off client for antiban
			Random, MouseAnti, 1, 1000
			If(MouseAnti = 1)
			{
			MouseGetPos, Mouse3X, Mouse3Y
			RandomBezier(Mouse3X, Mouse3Y, AntibanX, AntibanY, "T"MSpeed)
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			}
}
2::reload
3::exitapp