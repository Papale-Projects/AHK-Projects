#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

;Run settings
	;Zoom setting to -27
	;Start script outside of house in rimminington
	
	
1::
Loop{
	;Block mousemovements for script start
		blockinput mousemove
		
	;Antiban move out of client
		Random, AntibanX, 930, 786
		Random, AntibanY, 900, 10
		Random, Antiban, 1, 15

		;Random delay after mousemoves
			Random, Mdelay, 140, 350
		
		;Random mousespeed
			Random, Mspeed, 350, 750
			
		;Random movement
			Random, Treerespawning, 13000, 13500
			Random, Moving, 1500, 1800
			Random, SleepTeleport, 3500, 4500
			
		;Random spots for menu clicking
			Random, OptionsX, 665, 693
			Random, OptionsY, 497, 530
			Random, HousemenuX, 653, 686
			Random, HousemenuY, 458, 492
			Random, CallServX, 568, 726
			Random, CallServY, 442, 472
			Random, InvIconX, 645, 655
			Random, InvIconY, 210, 225
			Random, SawmillchatX, 144, 385
			Random, SawmillchatY, 420, 442
			Random, ContinueX, 217, 397
			Random, ContinueY, 474, 485
			Random, YesX, 213, 372
			Random, YesY, 423, 440
		
		;Random spots for object pixelsearches
			Random, OakranX, 12, 30
			Random, OakranY, 10, 40
			Random, OutportranX, 1, 5
			Random, OutportranY, 8, 20
			Random, GoldtileX, -4, -15
			Random, GoldtileY, 3, 10
			
;Start script
			PixelSearch, NotchoppingX, NotchoppingY, 15, 54, 140, 78, 0xFF0000, 0, Fast RGB
			If ErrorLevel = 0
			{
				PixelSearch, OakX, OakY, 154, 46, 521, 344, 0x00FF00, 1, RGB, Fast
				If ErrorLevel = 0
				{
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, OakX+OakranX, OakY+OakranY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Moving
				Sleep, Moving
				Sleep, Moving
				}
				If ErrorLevel = 1
				{
				Sleep Treerespawning
				}
				If(Antiban = 1)
				{
					;Move mouse off client for antiban
						MouseGetPos, Mouse3X, Mouse3Y
						RandomBezier(Mouse3X, Mouse3Y, AntibanX, AntibanY, "T"MSpeed)
						Sleep Mdelay
						Sleep Mdelay
						Sleep Mdelay
						Sleep Mdelay
				}
				
			}
			If ErrorLevel = 1
			{
			}
			
			PixelSearch, FullinvX, FullinvY, 693, 426, 726, 452, 0x00FF00, 0, Fast RGB
			If ErrorLevel = 0
			{
				PixelSearch, InPortalX, InPortalY, 7, 111, 519, 367, 0xFF0000, 1, RGB, Fast
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, InPortalX+OutportranX, InPortalY+OutportranY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, SleepTeleport
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, OptionsX, OptionsY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, HousemenuX, HousemenuY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, CallServX, CallServY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Moving
				PixelSearch, DemonCheckX, DemonCheckY, 178, 384, 346, 414, 0x800000, 1, RGB, Fast
				If ErrorLevel = 0
				{
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, SawmillchatX, SawmillchatY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, ContinueX, ContinueY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, YesX, YesY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, ContinueX, ContinueY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				PixelSearch, OutPortalX, OutPortalY, 222, 177, 321, 253, 0x00FF00, 1, RGB, Fast
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, OutPortalX+OutportranX, OutPortalY+OutportranY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, InvIconX, InvIconY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Click
				Sleep, Mdelay
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 60
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
	}
				PixelSearch, OakX, OakY, 154, 46, 521, 344, 0x00FF00, 1, RGB, Fast
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, OakX+OakranX, OakY+OakranY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Moving
				Sleep, Moving
				Sleep, Moving
				}
				If ErrorLevel = 1
				{
				PixelSearch, MoveTileX, MoveTileY, 222, 177, 321, 253, 0xFFFF00, 1, RGB, Fast
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, MoveTileX+GoldtileX, MoveTileY+GoldtileY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, SawmillchatX, SawmillchatY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, ContinueX, ContinueY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, YesX, YesY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, ContinueX, ContinueY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				PixelSearch, OutPortalX, OutPortalY, 222, 177, 321, 253, 0x00FF00, 1, RGB, Fast
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, OutPortalX+OutportranX, OutPortalY+OutportranY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, InvIconX, InvIconY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Mdelay
				Sleep, Mdelay
				Sleep, Mdelay		
				PixelSearch, OakX, OakY, 154, 46, 521, 344, 0x00FF00, 1, RGB, Fast
				MouseGetPos, MouseX, MouseY
				RandomBezier(MouseX, MouseY, OakX+OakranX, OakY+OakranY, "T"MSpeed)
				Sleep, Mdelay
				Click
				Sleep, Moving
				Sleep, Moving
				Sleep, Moving
				}
			}
			If ErrorLevel = 1
			{
			}
}
2::reload
3::exitapp