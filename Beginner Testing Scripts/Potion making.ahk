#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
Loop {
	blockinput mousemove
	;Antiban move out of client
		Random, AntibanX, 930, 786
		Random, AntibanY, 900, 10
		
	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random mousespeed
		Random, Mspeed, 350, 750
	
	;Random sleep while potions are being made
		Random, potmake, 17000, 17500
		
	;Random location for unf potions
		Random, potranX, 411, 439
		Random, potranY, 174, 205
		
	;Random location for ingredients
		Random, IngranX, 411, 439
		Random, IngranY, 143, 166
		
	;Color search random spots
		Random, ColorranX, 3, 6
		Random, ColorranY, 3, 6
	
	;Random spot click on bank
		Random, BankspotX, -15, -40
		Random, BankspotY, -15, -100
	
	;Random spot click on deposit
		Random, DepositX, 435, 455
		Random, DepositY, 335, 350
		
;Start script

	;Take potion out
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, potranX, potranY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		
	;Take Ing out
		MouseGetPos, Mouse1X, Mouse1Y
		RandomBezier(Mouse1X, Mouse1Y, IngranX, IngranY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		
	;Close the banking interface
		Send {Escape down}
		Sleep, Mdelay
		Send {Escape up}
		Sleep, Mdelay
		
	;Use the items on each other
		PixelSearch, PotinvX, PotinvY, 608, 349, 645, 385, 0x00FF00, 0, Fast RGB
		MouseGetPos, Mouse2X, Mouse2Y
		RandomBezier(Mouse2X, Mouse2Y, PotinvX+ColorranX, PotinvY+ColorranX, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		PixelSearch, InginvX, InginvY, 655, 352, 681, 381, 0xFF0000, 0, Fast RGB
		MouseGetPos, Mouse3X, Mouse3Y
		RandomBezier(Mouse3X, Mouse3Y, InginvX+ColorranX, InginvY+ColorranX, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		
	;Antiban move out of screen
		MouseGetPos, Mouse9X, Mouse9Y
		RandomBezier(Mouse9X, Mouse9Y, AntibanX, AntibanY, "T"MSpeed)
		
	;Sleep while waiting for the potions to be made
		Send {Space Down}
		Sleep, Mdelay
		Send {Space up}
		Sleep, Mdelay
		Send {Space Down}
		Sleep, Mdelay
		Send {Space up}
		Sleep, potmake
		
	;If levelup menu pops up close the interface
		PixelSearch, LevelX, LevelY, 118, 409, 176, 424, 0x000080, 0, Fast RGB
		If ErrorLevel = 0
			{
			Send (space down)
			}	
			
	;Click on bank stall to bank items
		PixelSearch, BankX, BankY, 83, 56, 528, 474, 0x00FF00, 0, Fast RGB
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, BankX+BankspotX, BankY+BankspotY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
		
	;Click the deposit all icon
		MouseGetPos, MouseX, MouseY
		RandomBezier(MouseX, MouseY, DepositX, DepositY, "T"MSpeed)
		Sleep, Mdelay
		Click
		Sleep, Mdelay
}
	
2::reload
3::exitapp