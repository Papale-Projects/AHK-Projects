#Include RandomBezier.ahk
#Include WaitPixelColor.ahk
;Instructions
	;Zoom outer limit 80 on client
	;North on compass
	;Max up arrow
	;Coal bag in first inv slot

1::
Loop {

		;Block mousemovements for script start
			blockinput mousemove

		;Random stam cords
			Random, StamX, 362, 394
			Random, StamY, 146, 174
			Random, StamInvX, 614, 641
			Random, StamInvY, 243, 272

		;Random super energy pot cords
			Random, EnergyX, 364, 389
			Random, EnergyY, 183, 211
		
		;Random number between to decide if stam drink
			Random, Drink, 1, 4

		;Sleep while waiting to put coal on belt from bank
			Random, Beltwalk, 9000, 9500
		
		;Random cords for deposit all icon
			Random, DepositX, 430, 461
			Random, DepositY, 328, 359
		
		;Random cords for coal in bank
			Random, CoalX, 413, 439
			Random, CoalY, 110, 139
			
		;Random cords for coal bag in inventory
			Random, CoalBagX, 571, 598
			Random, CoalBagY, 244, 272
		
		;Random cords for iron in bank
			Random, IronX, 364, 394
			Random, IronY, 111, 137
		
		;Random cords for bank pixelsearch
			Random, BankaddX, 3, 8
			Random, BankaddY, 5, 11
		
		;Random cords for iron bank pixelsearch
			Random, BankIronaddX, 4, 13
			Random, BankIronaddY, 8, 17
			
		;Random cords for Belt pixelsearch
			Random, BeltaddX, 3, 11
			Random, BeltaddY, 5, 15
			
		;Random cords for at Belt pixelsearch
			Random, BeltAtaddX, 3, 10
			Random, BeltAtaddY,	5, 18
			
		;Random cords for bar dispenser
			Random, BarDisaddX,	5, 15
			Random, BarDisaddY, -15, -25
			
		;Random delay after mousemoves
			Random, Mdelay, 140, 350
		
		;Random mousespeed
			Random, Mspeed, 350, 750
			Random, Menumove, 50, 120
			
		;Antiban move out of client
			Random, AntibanX, 930, 786
			Random, AntibanY, 900, 10

		;Random cords for fill menu option
			Random, FillX, -50, 50
			Random, FillY, 38, 44

;Script start
		
		;Take coal out of bank and desposit into coal bag
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, CoalX, CoalY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Send {Escape Down}
		Sleep, Mdelay
		Send {Escape Up}
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		MouseGetPos, Mouse1X, Mouse1Y
		RandomBezier(Mouse1X, Mouse1Y, CoalBagX, CoalBagY, "T"MSpeed)
		Sleep, Mdelay
		Click, right
		Sleep, Mdelay
		MouseMove, CoalBagX+FillX, CoalBagY+FillY, Menumove
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		
	;Reopen bank to get more coal ore then close the interface
		PixelSearch, BankX, BankY, 357, 265, 417, 324, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse2X, Mouse2Y
		RandomBezier(Mouse2X, Mouse2Y, BankX+BankaddX, BankY+BankaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Sleep, Mdelay
		MouseGetPos, Mouse3X, Mouse3Y
		RandomBezier(Mouse3X, Mouse3Y, CoalX, CoalY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Send {Escape Down}
		Sleep, Mdelay
		Send {Escape Up}
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		
	;Click on converyer belt to deposit coal in inventory then deposit coal bag on belt
		PixelSearch, BeltX, BeltY, 297, 140, 355, 191, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BeltX+BeltaddX, BeltY+BeltaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Beltwalk
		MouseGetPos, Mouse1X, Mouse1Y
		RandomBezier(Mouse1X, Mouse1Y, CoalBagX, CoalBagY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		PixelSearch, BeltAtX, BeltAtY, 370, 259, 424, 304, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse5X, Mouse5Y
		RandomBezier(Mouse5X, Mouse5Y, BeltAtX+BeltAtaddX, BeltAtY+BeltAtaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		
	;Clicks on bank and grabs iron ore out then closes interface
		PixelSearch, BankIronX, BankIronY, 385, 383, 531, 504, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse5X, Mouse5Y
		RandomBezier(Mouse5X, Mouse5Y, BankIronX+BankIronaddX, BankIronY+BankIronaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		WaitPixelColor(0x000000, 441, 437)
		Sleep, Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, IronX, IronY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Send {Escape Down}
		Sleep, Mdelay
		Send {Escape Up}
		Sleep, Mdelay
		
	;Clicks back on converyer belt to place iron ore
		PixelSearch, BeltX, BeltY, 297, 140, 355, 191, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BeltX+BeltaddX, BeltY+BeltaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 493, 160)
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		
	;Click on bar dispenser to get steel bars
		PixelSearch, BarDisX, BarDisY, 324, 307, 389, 352, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BarDisX+BarDisaddX, BarDisX+BarDisaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 488, 398)
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}		

	;Click on bank to deposit bars
		PixelSearch, BankDisX, BankDisY, 455, 352, 535, 428, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BankDisX+BankaddX, BankDisY+BankaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		WaitPixelColor(0x000000, 441, 437)
		Sleep, Mdelay
		
	;Click on deposit all then grab more iron ore DepositX and close bank
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, DepositX, DepositY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, IronX, IronY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Send {Escape Down}
		Sleep, Mdelay
		Send {Escape Up}
		Sleep, Mdelay
		
	;Click back to converyer belt to place iron ore
		PixelSearch, BeltX, BeltY, 297, 140, 355, 191, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BeltX+BeltaddX, BeltY+BeltaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 493, 160)
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		
	;Click on bar dispenser to get steel bars
		PixelSearch, BarDisX, BarDisY, 324, 307, 389, 352, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BarDisX+BarDisaddX, BarDisX+BarDisaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 488, 398)
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}
		Send {Space Down}
		Sleep, Mdelay
		Send {Space Up}	
		
	;Click on bank to deposit bars
		PixelSearch, BankDisX, BankDisY, 455, 352, 535, 428, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, BankDisX+BankaddX, BankDisY+BankaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		WaitPixelColor(0x000000, 441, 437)
		Sleep, Mdelay
	
	;Click on deposit all
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, DepositX, DepositY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
	
	;Drink potions to recover run energy
	If(Drink = 1)
	{
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, StamX, StamY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Send {Escape Down}
		Sleep, Mdelay
		Send {Escape Up}
		Sleep, Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, StamInvX, StamInvY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		;Insert banking pixelsearch here and deposit all button
		PixelSearch, BankX, BankY, 357, 265, 417, 324, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse2X, Mouse2Y
		RandomBezier(Mouse2X, Mouse2Y, BankX+BankaddX, BankY+BankaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, DepositX, DepositY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		
	}
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, EnergyX, EnergyY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Send {Escape Down}
		Sleep, Mdelay
		Send {Escape Up}
		Sleep, Mdelay
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, StamInvX, StamInvY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		;Insert banking pixelsearch here and deposit all button
		PixelSearch, BankX, BankY, 357, 265, 417, 324, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse2X, Mouse2Y
		RandomBezier(Mouse2X, Mouse2Y, BankX+BankaddX, BankY+BankaddY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		MouseGetPos, Mouse4X, Mouse4Y
		RandomBezier(Mouse4X, Mouse4Y, DepositX, DepositY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
}
		
2::reload
3::exitapp
