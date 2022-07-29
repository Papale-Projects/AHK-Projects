#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
	;Random delay after mousemoves
			Random, Mdelay, 140, 350
	;Random mousespeed
			Random, Mspeed, 350, 750
	;Random stam cords
			Random, StamX, 362, 394
			Random, StamY, 146, 174
			Random, StamInvX, 614, 641
			Random, StamInvY, 243, 272
			
	;Random super energy pot cords
			Random, EnergyX, 364, 389
			Random, EnergyY, 183, 211
	
	;Random number between to decide if stam drink
			Random, Drink, 1, 1
	
	;Random cords for bank pixelsearch
			Random, BankaddX, 3, 8
			Random, BankaddY, 5, 11
			
	;Random cords for deposit all icon
			Random, DepositX, 430, 461
			Random, DepositY, 328, 359
	
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
		
2::reload
3::exitapp
