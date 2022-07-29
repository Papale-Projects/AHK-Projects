#Include WindHumanMouse.ahk
#Include WaitPixelColor.ahk
#Include AntibanMouse.ahk
#Include CheckEXP.ahk
#Include Logout.ahk

F3::exitapp
F2::reload
F1::
loop {
;Random Variable Declarations
	
	;Maple Logs in Bank
		Random, mlogX1, 84, 98
		Random, mlogY1, 230, 241
		Random, mlogX2, 77, 110
		Random, mlogY2, 221, 250
		Random, mlogAnti, 1, 100
	
	;Knife
		Random, KnifeX1, 576, 590
		Random, KnifeY1, 250, 264
		Random, KnifeX11, 571, 597
		Random, KnifeY11, 273, 246
		Random, AntiKnifeUse, 1, 100
		Random, KnifeClickAnti, 1, 100
	
	;Maple Log in Inv
		Random, minvX1, 575, 591
		Random, minvY1, 288, 301
		Random, minvX11, 567, 598
		Random, minvY11, 281, 308
		Random, Inv1Anti, 1, 100
		Random, Inv1Anti2, 1, 100
		
		Random, minvX2, 576, 590
		Random, minvY2, 325, 336
		Random, minvX21, 567, 598
		Random, minvY21, 318, 345
		Random, Inv2Anti, 1, 100
		
		Random, minvX3, 574, 590
		Random, minvY3, 360, 372
		Random, minvX31, 568, 598
		Random, minvY31, 353, 381
		Random, Inv3Anti, 1, 100
		
		Random, minvX4, 620, 632
		Random, minvY4, 253, 265
		Random, minvX41, 609, 639
		Random, minvY41, 245, 273
		Random, Inv4Anti, 1, 100
	
	;Banking
		Random, BankClick, 1, 100
		If (BankClick >= 16){
		Random, BankX1, -10, 10
		Random, BankY1, -10, 10
		}
		If (BankClick < 15){
		Random, BankX1, -30, 30
		Random, BankY1, -30, 30
		}
		
		Random, DepositX1, 439, 456
		Random, DepositY1, 331, 347
		Random, DepositX11, 430, 463
		Random, DepositY11, 324, 358
		Random, DepositAnti, 1, 100
		Random, AntiBank, 1, 100
	
	;Sleeps
	
		;Random delay after mousemoves
		Random, Mdelay, 95, 500
		
		;Waiting to fletch
		Random, Fletchwait, 500, 5500
		
		;Random mousespeed
		Random, MSpeed, 0.50, 0.66
		
		;Random Interface open stall
		Random, IntStall, 300, 500

;Script Start
	
	;Get full inv of logs from bank
		blockinput mousemove
		Random, MSpeed, 0.50, 0.66
		If (mlogAnti >= 16){
		MoveMouse(mlogX1, mlogY1, MSpeed)
		}
		Random, MSpeed, 0.50, 0.66
		If (mlogAnti < 16){
		MoveMouse(mlogX2, mlogY2, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Send {Escape down}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Send {Escape up}
		Random, Mdelay, 95, 500
		Sleep Mdelay

	;use knife on logs
	If (AntiKnifeUse >= 50){
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
		If (KnifeClickAnti >= 16){
		MoveMouse(KnifeX1, KnifeY1, MSpeed)
		}
		Random, MSpeed, 0.50, 0.66
		If (KnifeClickAnti < 16){
		MoveMouse(KnifeX11, KnifeY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
		If (Inv1Anti >= 16){
		MoveMouse(minvX1, minvY1, MSpeed)
		}
		Random, MSpeed, 0.50, 0.66
		If (Inv1Anti < 16){
		MoveMouse(minvX11, minvY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		}
	If (AntiKnifeUse < 50 AND AntiKnifeUse > 35){
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
		If (Inv1Anti >= 16){
		MoveMouse(minvX1, minvY1, MSpeed)
		}
		Random, MSpeed, 0.50, 0.66
		If (Inv1Anti < 16){
		MoveMouse(minvX11, minvY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
		If (KnifeClickAnti >= 16){
		MoveMouse(KnifeX1, KnifeY1, MSpeed)
		}
		Random, MSpeed, 0.50, 0.66
		If (KnifeClickAnti < 16){
		MoveMouse(KnifeX11, KnifeY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		}
	If (AntiKnifeUse < 34 AND AntiKnifeUse > 20){
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
		If (KnifeClickAnti >= 16){
		MoveMouse(KnifeX1, KnifeY1, MSpeed)
		}
		Random, MSpeed, 0.50, 0.66
		If (KnifeClickAnti < 16){
		MoveMouse(KnifeX11, KnifeY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
		MoveMouse(minvX4, minvY4, MSpeed)
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		}
		Random, MSpeed, 0.50, 0.66
	If (AntiKnifeUse < 20){
		Random, Mdelay, 95, 500
		Sleep Mdelay
		MoveMouse(minvX4, minvY4, MSpeed)
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		If (KnifeClickAnti >= 16){
		MoveMouse(KnifeX1, KnifeY1, MSpeed)
		}
		If (KnifeClickAnti < 16){
		MoveMouse(KnifeX11, KnifeY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		}
		
	;Select cut longbow interface
		Random, IntStall, 300, 500
		Sleep, IntStall
		Random, IntStall, 300, 500
		Sleep, IntStall
		Send {Space down}
		Random, IntStall, 300, 500
		Sleep, IntStall
		Send {Space up}
		
	;Sleep while bows are being cut
		Sleep, Fletchwait
		AntibanMouse()
		Loop{
		PixelSearch, FoundX, FoundY, 12, 350, 39, 374, 0xFF0000, 0, Fast RGB
		If ErrorLevel = 0
		{
			Break
		}
		}
		Sleep, Fletchwait
		Logout()
		
	;Click bank and deposit
		PixelSearch, BankX, BankY, 12, 35, 517, 365, 0x00FD00, 1, RGB, Fast
		Random, MSpeed, 0.50, 0.66
		MoveMouse(BankX+BankX1, BankY+BankY1, MSpeed)
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Random, MSpeed, 0.50, 0.66
	If (AntiBank >= 50){
		If (DepositAnti >= 16){
		MoveMouse(DepositX1, DepositY1, MSpeed)
		}
		If (DepositAnti < 16){
		MoveMouse(DepositX11, DepositY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
		}
		Random, MSpeed, 0.50, 0.66
	If (AntiBank < 50 AND AntiBank > 35){
		If (Inv1Anti2 >= 16){
		MoveMouse(minvX1, minvY1, MSpeed)
		}
		If (Inv1Anti2 < 16){
		MoveMouse(minvX11, minvY11, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
	}
	Random, MSpeed, 0.50, 0.66
	If (AntiBank < 34 AND AntiBank > 20){
		If (Inv2Anti >= 16){
		MoveMouse(minvX2, minvY2, MSpeed)
		}
		If (Inv2Anti < 16){
		MoveMouse(minvX21, minvY21, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
	}
	Random, MSpeed, 0.50, 0.66
	If (AntiBank < 20 AND AntiBank > 10){
		If (Inv3Anti >= 16){
		MoveMouse(minvX3, minvY3, MSpeed)
		}
		If (Inv3Anti < 16){
		MoveMouse(minvX31, minvY31, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
	}
	Random, MSpeed, 0.50, 0.66
	If (AntiBank < 10){
		If (Inv4Anti >= 16){
		MoveMouse(minvX4, minvY4, MSpeed)
		}
		If (Inv4Anti < 16){
		MoveMouse(minvX41, minvY41, MSpeed)
		}
		Random, Mdelay, 95, 500
		Sleep Mdelay
		Click
		Random, Mdelay, 95, 500
		Sleep Mdelay
	}
}