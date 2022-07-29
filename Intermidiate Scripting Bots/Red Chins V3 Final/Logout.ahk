#Include RandomBezier.ahk
#Include WaitPixelColor.ahk
#Include PickupTraps.ahk
#Include LaydownTraps.ahk
#Include WindHumanMouse.ahk

Logout() {
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, %LInput%
	Random, Logoutsleep, %MinInput%, %MaxInput%
	Random, LogoutdoorX, 634, 659
	Random, LogoutdoorY, 496, 529
	Random, LogoutbuttonX, 577, 715
	Random, LogoutbuttonY, 444, 477
	Random, ExistingX, 403, 527
	Random, ExistingY, 306, 334
	Random, ClickplayX, 276, 487
	Random, ClickplayY, 388, 394
	Random, Downkey, 1500, 4500
	Random, ClickportalranX, 10, 25
	Random, ClickportalranY, 18, 26
	Random, Mdelay, 140, 450
	Random, Mspeed, 1000, 1500
	If(logoutnumber = 1)
	{
		LogoutTimeDisplay :=FormatSeconds((Logoutsleep)/1000)
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Logout`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
		PickupTraps()
		Random, Mdelay, 80, 850
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(LogoutdoorX, LogoutdoorY, MouseSpeed)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Click
		Random, Mdelay, 140, 450
		Sleep Mdelay
		MouseGetPos, MouseX, MouseY
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(LogoutbuttonX, LogoutbuttonY, MouseSpeed)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Click
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Logout for: %LogoutTimeDisplay%`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
		Sleep Logoutsleep
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Logging in Character`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
		MouseGetPos, MouseX, MouseY
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(ExistingX, ExistingY, MouseSpeed)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 280, 292)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Send z0
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Send {Enter}
		Random, Downkey, 1500, 4500
		Sleep Downkey
		Random, Downkey, 1500, 4500
		Sleep Downkey
		Random, Downkey, 1500, 4500
		Sleep Downkey
		Random, Downkey, 1500, 4500
		Sleep Downkey
		MouseGetPos, MouseX, MouseY
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(ClickplayX, ClickplayY, MouseSpeed)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Click
		Random, Downkey, 1500, 4500
		Sleep Downkey
		LaydownTraps()
	}
}