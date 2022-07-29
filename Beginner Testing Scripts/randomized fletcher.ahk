;Rules to run script
	;Turn off entities
	;Configure Bank x and y
	;Bank logs spot = scroll farthest down and two up from the bottom for logs

#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
loop {
	
;Random Variable Declarations
	
	;Maple Logs in Bank
		Random, mlogX1, 85, 100
		Random, mlogY1, 225, 235
	
	;Knife
		Random, KnifeX1, 571, 597
		Random, KnifeY1, 273, 246
	
	;Maple Log in Inv
		Random, minvX1, 575, 590
		Random, minvY1, 284, 295
	
	;Longbow Fletch interface
		Random, lbowX1, 218, 310
		Random, lbowY1, 489, 418
	
	;Banking
		Random, BankX1, -10, 25
		Random, BankY1, 50, 80
	
		Random, DepositX1, 430, 455
		Random, DepositY1, 330, 350
	
	;Sleeps
	
		;Random delay after mousemoves
		Random, Mdelay, 250, 350
		
		;Random delay between knife and log movement
		Random, Knifemove, 100, 250
		
		;Waiting to fletch
		Random, Fletchwait, 50000, 54000
		
		;Random mousespeed
		Random, Mspeed, 250, 350
		Random, Clickspeed, 5, 10
		
	;Antiban move out of client
		Random, AntibanX1, 930, 786
		Random, AntibanY1, 900, 10
		Random, MoveinX, 400, 757
		Random, MoveinY, 10, 515

;Script Start
	
	;Sets focus to runescape client
		WinActivate, OpenOSRS - 
	
	;Get full inv of logs from bank
		blockinput mousemove
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, mlogX1, mlogY1, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Mdelay
		Send {Escape}

	;use knife on logs
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, KnifeX1, KnifeY1, "T"MSpeed)		
		Sleep Mdelay
		Click
		Sleep Mdelay
		Mousemove, minvX1, minvY1, Clickspeed
		Sleep Mdelay
		Click
		Sleep Mspeed
		Sleep Mdelay
		
	;Select cut longbow interface
		Sleep Mspeed
		Send {Space}
		Sleep MSpeed
		
	;Sleep while bows are being cut
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, AntibanX1, AntibanY1, "T"MSpeed)
		Sleep Fletchwait
		
	;Sets focus back to runescape to loop
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, MoveinX, MoveinY, "T"MSpeed)
		Sleep Mdelay

;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 100
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
	}
		
	;Click bank and deposit
		PixelSearch, BankX, BankY, 13, 53, 516, 463, 0x00FF00, 1, RGB, Fast
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, BankX+BankX1, BankY+BankY1, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Mspeed
		Sleep Mspeed
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, DepositX1, DepositY1, "T"MSpeed)
		Sleep Mdelay
		Click
		Sleep Mdelay
}

2::reload
3::exitapp