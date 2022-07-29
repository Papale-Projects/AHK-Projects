#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 1
	Random, Logoutsleep, 800, 900
	Random, LogoutdoorX, 633, 664
	Random, LogoutdoorY, 496, 526
	Random, LogoutbuttonX, 577, 715
	Random, LogoutbuttonY, 444, 477
	Random, ExistingX, 403, 527
	Random, ExistingY, 306, 334
	Random, ClickplayX, 276, 487
	Random, ClickplayY, 388, 394
	Random, CompassX, 591, 624
	Random, CompassY, 33, 67
	Random, Downkey, 1500, 2500
	Random, ClickportalranX, 10, 25
	Random, ClickportalranY, 18, 26
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
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, CompassX, CompassY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Mdelay
		Send {up down}
		Sleep Downkey
		Send {up up}
		Sleep Mdelay
		
	;When logging in from outside the house, this will return player inside house
		PixelSearch, ClickportalX, ClickportalY, 282, 181, 502, 331, 0x00FF00, 1, RGB, Fast
		MouseGetPos, PortalX, PortalY
		RandomBezier(PortalX, PortalY, ClickportalX+ClickportalranX, ClickportalY+ClickportalranY, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep RingSleep 
	}

2::reload
3::exitapp