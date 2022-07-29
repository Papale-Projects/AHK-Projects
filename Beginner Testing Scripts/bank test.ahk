#Include RandomBezier.ahk

1::
	;Random mousespeed
		Random, Mspeed, 350, 750

PixelSearch, BankX, BankY, 83, 56, 528, 474, 0x00FF00, 0, Fast RGB
MouseGetPos, MouseX, MouseY
RandomBezier(MouseX, MouseY, BankX, BankY, "T"MSpeed)
