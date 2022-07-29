#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
Loop {
		
	blockinput mousemove
	;Item locations
		Random, FishbankX, 317, 339
		Random, FishbankY, 190, 205
		Random, FishinvX, 570, 595
		Random, FishinvY, 248, 271
		Random, BankranX, 3, 11
		Random, BankranY, 3, 10
		
	;Antiban random spots for clicks
		Random, OvenspotX, 7, 10
		Random, OvenspotY, 7, 13

	;Antiban move out of client
		Random, AntibanX, 930, 786
		Random, AntibanY, 900, 10

		;Random delay after mousemoves
			Random, Mdelay, 140, 350
		
		;Random mousespeed
			Random, Mspeed, 350, 750
			
		;Random sleep for walking to oven
			Random, Swalk, 3000, 3700
		
		;Sleep between cooks
			Random, Cooking, 625, 670
		
		;Sleep to allow mouse movements while cooking
			Random, moving, 67000, 69000

		;Deposit fish into inventory and close interface
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, FishbankX, FishbankY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Mdelay
			Sleep, Mdelay
			Send {Escape down}
			Sleep, Mdelay
			Send {Escape up}
			Sleep, Mdelay
			Sleep, Mdelay
			
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 80
	Random, Logoutsleep, 300000, 900000
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
		Sleep Mdelay
		Sleep Mdelay
		Sleep Mdelay
		Sleep Mdelay
		Sleep Mdelay
		}
		
		;Click on the oven to move character in position 405, 192 cords
			PixelSearch, OvenX, OvenY, 361, 168, 419, 212, 0x00FF00, 1, RGB, Fast
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, OvenX+OvenspotX, OvenY+OvenspotY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep Swalk
			
		;Cooking process
			Send {space down}
			Sleep, Mdelay
			Send {space up}
			Sleep Mdelay
			Send {space down}
			Sleep, Mdelay
			Send {space up}
			Sleep, Mdelay
			
		;Antiban move out of screen then allow mouse movement
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, AntibanX, AntibanY, "T"MSpeed)
			blockinput mousemoveoff
			Sleep, moving
			blockinput mousemove
			
		;Wait for pixel of cooked fish in inventory to show fully cooked
			WaitPixelColor(0x00FF00, 702, 471, 70000)
			
		;If levelup menu pops up close the interface
			PixelSearch, LevelX, LevelY, 118, 409, 176, 424, 0x000080, 0, Fast RGB
			If ErrorLevel = 0
				{
				Send (space down)
				}
			
		;Locate bank chest and click on it
			Sleep, Mdelay
			PixelSearch, BankX, BankY, 311, 342, 398, 421, 0x00FF00, 1, RGB, Fast
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, BankX+BankranX, BankY+BankranY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Swalk
		
		;Bank cooked fish
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, FishinvX, FishinvY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Mdelay
}

3::reload
4::exitapp