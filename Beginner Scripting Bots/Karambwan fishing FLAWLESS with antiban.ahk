;Rules to run script
	;Toggle compass
	;Up arrow to max
	;zoom out max (camera zoom limit 0)
	;turn on enitity hider plugin
	;start script in player house with teleports
	;put bait in 27th inventory slot
	;put vessel in 1st inventory slot
	;put rune pouch in 28th inventory slot
	;equip lunar staff / graceful / anglers
	
;Debug add
	;create gui for total number of logouts each session
	;create detection to start script from any location
	;randomly choose what bank booth to bank from each time
	;randomly choose which fish to bank with

#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
Loop {
;Random Variable Declarations

	;Block mousemovements for script start
		blockinput mousemove

	;Sleeps
	
		;Sleep for running to bank
			Random, Banksleep, 4000, 5000
			
		;Sleep for teleports
			Random, RingSleep, 6000, 7000
			Random, SleepTeleport, 3500, 4500
	
		;Random delay after mousemoves
			Random, Mdelay, 140, 350
		
		;Random mousespeed
			Random, Mspeed, 350, 750
			
		;Allow mouse movements sleep
			Random, AllowMouse, 80000, 100000
			
		;Inventory get pixel full sleep
			Random, PixelinvS, 180000, 200000
		
	;Banking
		Random, BankX1, 1, 3
		Random, BankY1, 2, 8
		Random, BankitemX, 611, 643
		Random, BankItemY, 243, 273
	
	;Random movement amount within color detection
		Random, RingranX, 5, 12
		Random, RingranY, 5, 12
		Random, FishranX, 3, 8
		Random, FishranY, 3, 6
		
	;Random open inventory and spellbook
		Random, InvX, 632, 664
		Random, InvY, 197, 231
		Random, SpellX, 735, 765
		Random, SpellY, 200, 231
		Random, CamelotX, 662, 734
		Random, CamelotY, 238, 329
		Random, HomeX, 560, 646
		
	;Antiban move out of client
		Random, AntibanX, 930, 786
		Random, AntibanY, 900, 10
	
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 40
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


;Script Start
		
		;Fail stop detection for lunar isle portal icon on minimap
			PixelSearch, FoundX, FoundY, 605, 29, 767, 190, 0x004090, 1, Fast RGB
				If ErrorLevel = 1
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
					}
				If ErrorLevel = 0
					{
					}
			
		;Color Detection
			PixelSearch, RingX, RingY, 370, 180, 420, 220, 0x00FF00, 1, RGB, Fast
		
		;Click on fairy ring in house
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, RingX+RingranX, RingY+RingranY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep RingSleep
			Sleep Mspeed
		
		;Fail stop detection for water color on minimap
			PixelSearch, FoundX, FoundY, 605, 29, 767, 190, 0x7D90B9, 1, Fast RGB
				If ErrorLevel = 1
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
					}
				If ErrorLevel = 0
					{
					}
					
		;Color Detection
			PixelSearch, FishX, FishY, 329, 169, 400, 217, 0x00FF00, 1, RGB, Fast
		
		;Click on fishing spot to begin fishing
			MouseGetPos, Mouse1X, Mouse1Y
			RandomBezier(Mouse1X, Mouse1Y, FishX+FishranX, FishY+FishranY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			
		;Click on inventory icon
			MouseGetPos, Mouse3X, Mouse3Y
			RandomBezier(Mouse3X, Mouse3Y, InvX, InvY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep Mdelay
			
		;Move mouse off client for antiban
			MouseGetPos, Mouse3X, Mouse3Y
			RandomBezier(Mouse3X, Mouse3Y, AntibanX, AntibanY, "T"MSpeed)
			Sleep Mdelay
			
		;Allow mouse movement while waiting for full inventory
			blockinput mousemoveoff
			Sleep, AllowMouse
		
		;Block mouse movement to prep for full inventory
			blockinput mousemove
			Sleep, Mdelay
			WinActivate, OpenOSRS - 
			Sleep, Mdelay
		
		;Find black pixel on inventory is full popout to verify full inv
			WaitPixelColor(0x000000, 395, 432, PixelinvS)
			
		;Move to spell book and teleport to camelot
			MouseGetPos, Mouse4X, Mouse4Y
			RandomBezier(Mouse4X, Mouse4Y, SpellX, SpellY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep Mdelay
			MouseGetPos, Mouse5X, Mouse5Y
			RandomBezier(Mouse5X, Mouse5Y, CamelotX, CamelotY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep SleepTeleport
			
		;Fail stop detection for bank area color on minimap
			PixelSearch, FoundX, FoundY, 605, 29, 767, 190, 0x7D7475, 1, Fast RGB
				If ErrorLevel = 1
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
					}
				If ErrorLevel = 0
					{
					}
					
		;Find bank and click on it
			PixelSearch, BankX, BankY, 13, 53, 516, 463, 0x00FF00, 1, RGB, Fast
			MouseGetPos, Mouse6X, Mouse6Y
			RandomBezier(Mouse6X, Mouse6Y, BankX+BankX1, BankY+BankY1, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep Banksleep
			
		;Click on items to bank them and hit escape to close bank
			MouseGetPos, Mouse7X, Mouse7Y
			RandomBezier(Mouse7X, Mouse7Y, BankitemX, BankItemY, "T"MSpeed)
			Sleep Mdelay
			Sleep Mdelay
			Click
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			Send {Escape down}
			Sleep Mdelay
			Send {Escape Up}
			Sleep Mdelay
			Sleep Mdelay
			Sleep Mdelay
			
		;Teleport bank to house to restart script
			MouseGetPos, Mouse8X, Mouse8Y
			RandomBezier(Mouse8X, Mouse8Y, HomeX, CamelotY, "T"MSpeed)
			Sleep Mdelay
			Click
			Sleep RingSleep
}
2::reload
3::exitapp