#Include RandomBezier.ahk
#Include WaitPixelColor.ahk
#Include WindHumanMouse.ahk

Logout() {
;Antiban random logouts
;Random logout sleeps
	Random, Logoutnumber, 1, 70
	Random, Logoutsleep, 300000, 1200000
	Random, LogoutdoorX, 920, 950
	Random, LogoutdoorY, 799, 833
	Random, LogoutbuttonX, 863, 1006
	Random, LogoutbuttonY, 747, 781
	Random, ExistingX, 540, 679
	Random, ExistingY, 304, 337
	Random, ClickplayX, 416, 641
	Random, ClickplayY, 323, 408
	Random, Downkey, 1500, 4500
	Random, ClickportalranX, 10, 25
	Random, ClickportalranY, 18, 26
	Random, Mdelay, 140, 450
	Random, Mspeed, 1000, 1500
	Random, SpelltabX, 1020, 1051
	Random, SpelltabY, 502, 536
	If(logoutnumber = 1)
	{
		LogoutTimeDisplay :=FormatSeconds((Logoutsleep)/1000)
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Logout`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
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
		ControlSetText, Static1, Logout for: %LogoutTimeDisplay%`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
		Sleep Logoutsleep
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Logging in Character`nLaps Completed: %Lapcount%`nRuntime: %ElapsedTime%, Camelot Agility V1
		MouseGetPos, MouseX, MouseY
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(ExistingX, ExistingY, MouseSpeed)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Click
		WaitPixelColor(0xFFFFFF, 421, 276)
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
		Random, Downkey, 3000, 5500
		Sleep Downkey
		Random, MouseSpeed, 0.50, 0.65
		MoveMouse(SpelltabX, SpelltabY, MouseSpeed)
		Random, Mdelay, 140, 450
		Sleep Mdelay
		Click
		Random, Mdelay, 140, 450
		Sleep Mdelay
	}
}