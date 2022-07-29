#Include RandomBezier.ahk
#Include WaitPixelColor.ahk

1::
Loop{
	;Block mousemovements for script start
		blockinput mousemove
		
	;Antiban move out of client
		Random, AntibanX, 930, 786
		Random, AntibanY, 900, 10
		
	;Random delay after mousemoves
		Random, Mdelay, 140, 350
		
	;Random mousespeed
		Random, Mspeed, 125, 200
		
	;Trap resetting sleep
		Random, Reset, 9500, 9800
		
	;Dropped Trap reset
		Random, Dropped, 5000, 5200
	
	;Move mouse into box trap clickbox
		Random, BoxtrapX, 4, 6
		Random, BoxtrapY, 7, 10
		Random, ResetboxX, -10, -12
		
	;Script start

		;Search for red pixel of broken box trap
			PixelSearch, EscapedX, EscapedY, 61, 91, 501, 461, 0xFF0000, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, Mouse1X, Mouse1Y
			RandomBezier(Mouse1X, Mouse1Y, EscapedX+BoxtrapX, EscapedY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Reset
			}
			
		;Search for green pixel of chin in box trap
			PixelSearch, CaughtX, CaughtY, 61, 91, 501, 461, 0x00FF00, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, CaughtX+BoxtrapX, CaughtY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Reset
			}
		
		;Search for green pixel of chin in box trap
			PixelSearch, CaughtX, CaughtY, 61, 91, 501, 461, 0x00FF00, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, CaughtX+BoxtrapX, CaughtY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Reset
			}
		
		;Search for green pixel of chin in box trap
			PixelSearch, CaughtX, CaughtY, 61, 91, 501, 461, 0x00FF00, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, CaughtX+BoxtrapX, CaughtY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Reset
			}

		;Search for green pixel of chin in box trap
			PixelSearch, CaughtX, CaughtY, 61, 91, 501, 461, 0x00FF00, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, MouseX, MouseY
			RandomBezier(MouseX, MouseY, CaughtX+BoxtrapX, CaughtY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Reset
			}

			
		;Search for pink pixel for box trap on floor
			PixelSearch, DropX, DropY, 61, 91, 501, 461, 0xFF00FF, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, Mouse2X, Mouse2Y
			RandomBezier(Mouse2X, Mouse2Y, DropX+ResetboxX, DropY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Dropped
			}
			
		;Search for pink pixel for box trap on floor
			PixelSearch, DropX, DropY, 61, 91, 501, 461, 0xFF00FF, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, Mouse2X, Mouse2Y
			RandomBezier(Mouse2X, Mouse2Y, DropX+ResetboxX, DropY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Dropped
			}
			
		;Search for pink pixel for box trap on floor
			PixelSearch, DropX, DropY, 61, 91, 501, 461, 0xFF00FF, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, Mouse2X, Mouse2Y
			RandomBezier(Mouse2X, Mouse2Y, DropX+ResetboxX, DropY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Dropped
			}
			
		;Search for pink pixel for box trap on floor
			PixelSearch, DropX, DropY, 61, 91, 501, 461, 0xFF00FF, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, Mouse2X, Mouse2Y
			RandomBezier(Mouse2X, Mouse2Y, DropX+ResetboxX, DropY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Dropped
			}
			
		;Search for pink pixel for box trap on floor
			PixelSearch, DropX, DropY, 61, 91, 501, 461, 0xFF00FF, 1, RGB, Fast
			If (errorlevel = 0)
			{
			MouseGetPos, Mouse2X, Mouse2Y
			RandomBezier(Mouse2X, Mouse2Y, DropX+ResetboxX, DropY+BoxtrapY, "T"MSpeed)
			Sleep, Mdelay
			Click
			Sleep, Dropped
			}
}	

2::reload
3::exitapp

