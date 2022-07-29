#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

Logout() {
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 250
	Random, Logoutsleep, 200000, 1500000
	Random, LogoutdoorX, 634, 659
	Random, LogoutdoorY, 496, 529
	Random, LogoutbuttonX, 577, 715
	Random, LogoutbuttonY, 444, 477
	Random, ExistingX, 403, 527
	Random, ExistingY, 306, 334
	Random, ClickplayX, 276, 487
	Random, ClickplayY, 388, 394
	Random, CompassX, 591, 624
	Random, CompassY, 33, 67
	Random, Downkey, 1500, 4500
	Random, ClickportalranX, 10, 25
	Random, ClickportalranY, 18, 26
	Random, Mdelay, 140, 450
	Random, Mspeed, 250, 500
	Random, TellyTabX, 731, 763
	Random, TellyTabY, 198, 230
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
		
		;For my agility script
		;Move camera into spot
		;Send {Left down}
		;WaitPixelColor(0x00FD00, 172, 333)
		;Send {Left up}
		;Click on teleport tab
		;MouseGetPos, MouseX, MouseY
		;RandomBezier(MouseX, MouseY, TellyTabX, TellyTabY, "T"MSpeed)
		;Sleep Mdelay
		;Click
		;Sleep Mdelay
		
	}
}