#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Global variables for updating gui text
Global AntibanCounter
Global AntibanIdle2
Global AntibanCam2
Global AntibanOffS2
Global AntibanLog2
Global AntibanEXP2
Global AntibanBrowse2
Global Worldhop2
Global LogoutFor
Global counter
Global TotalFletched
Global MissClick2
Global PlayerSLevel2

Status := "Status: Waiting!"
g := "%"
;creating the gui using a label to refresh every 100ms
Home:
SetTimer,Gui,100
return

HomeGuiClose:
ExitApp

;Label for calculating total runtime
Time:
{
	counter++
	hour := Floor(counter / 3600)
	min := Floor(Mod(counter, 3600) / 60)
	sec := Mod(Mod(counter, 3600), 60)
	;Updates GUI time variable
	GuiControl, Text, TimeRan, % Format("Run Time: {1:02i}:{2:02i}:{3:02i}", hour, min, sec)
}
return

;Detects if the user has clicked on the windows title bar area to move the client
;Uses window message codes for detection
GuiMove:
PostMessage, 0xA1, 2,,, A
Return

Gui:
SetTimer,Gui,Off
;Gets the position of the runescape client window
WinGetPos, GuiX, GuiY,GuiW,GuiH, ahk_class SunAwtFrame
upY := GuiH-200
;Checks for the runescape client class name
hParent := WinExist("ahk_class SunAwtFrame")
Gui,Margin, 0, 0
Gui, Font, s13 q4, FixedSys
;Currently unused code for setting a background image
;Gui, Add, Picture, x0 y0 w450 h143 gGuiMove, %A_WorkingDir%\testing.jpg
;This section is for creating text and variables
Gui, Add, Text, cYellow x40 y5 w900 h20 vTimeRan +BackgroundTrans, % "Run Time: 00:00:00"
Gui, Add, Text, cYellow x40 y35 w900 h20 vStatus1 +BackgroundTrans,%Status%
Gui, Add, Text, cYellow x40 y55 w900 h20 vFletchCount1 +BackgroundTrans,Iron Mined: 0
Gui, Add, Text, cYellow x40 y70 w900 h20 vLoggedout +BackgroundTrans,
Gui, Add, Text, cYellow x250 y5 w900 h20 vABA +BackgroundTrans,Antiban Info and Stats
Gui, Font, s9 q4, FixedSys
Gui, Add, Text, cYellow x270 y35 w900 h20 vAntibanIdle1 +BackgroundTrans,Ingame Idles: 0
Gui, Add, Text, cYellow x270 y55 w900 h20 vAntibanOffS1 +BackgroundTrans,OffScreen: 0
Gui, Add, Text, cYellow x270 y75 w900 h20 vAntibanLog1 +BackgroundTrans,Logouts: 0
Gui, Add, Text, cYellow x270 y95 w900 h20 vAntibanMove1 +BackgroundTrans,EXP Checks: 0
Gui, Add, Text, cYellow x270 y115 w900 h20 vMissClick1 +BackgroundTrans,
Gui, Add, Text, cYellow x270 y135 w900 h20 vPlayerSLevel1 +BackgroundTrans,
;Sets the properties of the GUI
Gui,  +E0x20 +toolWindow -caption -dpiScale +lastFound HWNDhChild ;*[GUITesting]
DllCall("SetParent", Ptr, hChild, Ptr, hParent)
Gui,Show, x5 y%upY% w500 h135 NoActivate
;Creates a label for moving the overlay with the client window
SetTimer,UpdateOSD,600
Gosub, UpdateOSD
Gui, Color, 808080
WinSet, TransColor, 808080
Return

;Creates a function that can be called to display text for debugging
Status(Status)
{
	GuiControl,,Status1,Status: %Status%
}

;Functions for sending updated variable values to the gui
AntibanCount()
{
	GuiControl,,AntibanMove1,MouseMoves: %AntibanCounter%
}

FletchCount()
{
	GuiControl,,FletchCount1,Iron Mined: %TotalFletched%
}

AntibanIdle()
{
	GuiControl,,AntibanIdle1,Ingame Idles: %AntibanIdle2%
}

AntibanCam()
{
	GuiControl,,AntibanCam1,CameraSpins: %AntibanCam2%
}

AntibanOffS()
{
	GuiControl,,AntibanOffS1,OffScreen: %AntibanOffS2%
}

AntibanLogDis()
{
	GuiControl,,AntibanLog1,Logouts: %AntibanLog2%
}

AntibanEXP()
{
	GuiControl,,AntibanMove1,EXP Checks: %AntibanEXP2%
}

AntibanBrowse()
{
	GuiControl,,AntibanBrowse1,Tabs: %AntibanBrowse2%
}

MissClickGui()
{
	GuiControl,,MissClick1,Target Misclicks: %MissClick2%
}

PlayerSeenLevel()
{
	GuiControl,,PlayerSLevel1,BagFix: %PlayerSLevel2%
}

;Seperate functions for calculating currenttime
ToDigital(currentTime) {
	s  := Mod(Floor(currentTime / 1000), 60)
	m  := Mod(Floor(currentTime / (1000 * 60)), 60)
	h  := Floor(currentTime / (1000 * 60 * 60))
	return Format("{:02d}:{:02d}:{:02d}", h, m, s)
}

ToDigitalsecond(currentTimesec) {
	s  := Mod(Floor(currentTimesec / 1), 60)
	m  := Mod(Floor(currentTimesec / (1 * 60)), 60)
	h  := Floor(currentTimesec / (1 * 60 * 60))
	return Format("{:02d}:{:02d}:{:02d}", h, m, s)
}

;Logout time randomizer that increasingly becomes more common / longer with total runtime
;After 6 hours of runtime there is a 1/5 chance to logout and send msgbox with total runtime
;After 8 hours of runtime there is a 1/2 chance to logout and send msgbox with total runtime
LoggedOutFor()
{
	If (counter >= 28800)
	{
		LogoutFor := RandomWeight(60000, 1200000, 1800000)
		Random, Rando, 1, 2
		If (Rando = 1)
		{
			Logout()
			Cruntime := ToDigitalsecond(counter)
			BlockInput, Off
			MsgBox, 48, Daily Limit, You have reached the daily limit. Runtime: %Cruntime%
		}
	}
	If (counter >= 21600 && counter < 28800)
	{
		LogoutFor := RandomWeight(60000, 1200000, 1800000)
		Random, Rando, 1, 5
		If (Rando = 1)
		{
			Logout()
			Cruntime := ToDigitalsecond(counter)
			BlockInput, Off
			MsgBox, 48, Daily Limit,  You have reached the daily limit. Runtime: %Cruntime%
		}
	}
	If (counter >= 14400 && counter < 21600)
	{
		LogoutFor := RandomWeight(60000, 600000, 1800000)
	}
	If (counter < 14400)
	{
		LogoutFor := RandomWeight(60000, 60000, 1800000)
	}
	LogDisplayed := ToDigital(LogoutFor)
	GuiControl,,Loggedout,Logout for: %LogDisplayed%
	Sleep, LogoutFor
	GuiControl,,Loggedout,
}

;Hotkey to pause the script
#MaxThreadsPerHotkey 2
F2::
{
	BlockInput, Off
	Status("Paused")
	Pause
	Status("Running")
}
Status("Running")
return

;Updates the overlay if the client has been moved
updateOSD:
WinGetPos, GuiX, GuiY,GuiW,GuiH, ahk_class SunAwtFrame
upY := GuiH-150
Gui, Show, x0 y650 w450 h160 NoActivate
return