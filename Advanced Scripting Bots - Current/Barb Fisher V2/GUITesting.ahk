﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include Antiban.ahk
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

Status := "Status: Waiting!"
g := "%"
;creating the gui
Home:
SetTimer,Gui,100
return

HomeGuiClose:


;Status("Running")
;SetTimer,Time,1000

Time:
{
	counter++
	hour := Floor(counter / 3600)
	min := Floor(Mod(counter, 3600) / 60)
	sec := Mod(Mod(counter, 3600), 60)
	GuiControl, Text, TimeRan, % Format("Run Time: {1:02i}:{2:02i}:{3:02i}", hour, min, sec)
}
return

F5::
DisplayVar()
return

GuiMove:
PostMessage, 0xA1, 2,,, A 
Return

Gui:
SetTimer,Gui,Off
WinGetPos, GuiX, GuiY,GuiW,GuiH, ahk_class SunAwtFrame
upY := GuiH-150
hParent := WinExist("ahk_class SunAwtFrame")
Gui,Margin, 0, 0
Gui, Font, s13 q4, FixedSys
Gui, Add, Text, cYellow x40 y5 w900 h20 vTimeRan +BackgroundTrans, % "Run Time: 00:00:00"
Gui, Add, Text, cYellow x40 y35 w900 h20 vStatus1 +BackgroundTrans,%Status%
Gui, Add, Text, cYellow x40 y70 w900 h20 vLoggedout +BackgroundTrans,
Gui, Add, Text, cYellow x250 y5 w900 h20 vABA +BackgroundTrans,Antiban Activations
Gui, Font, s9 q4, FixedSys
Gui, Add, Text, cYellow x270 y25 w900 h20 vAntibanCam1 +BackgroundTrans,CameraSpins: 0
Gui, Add, Text, cYellow x270 y40 w900 h20 vAntibanMove1 +BackgroundTrans,MouseMoves: 0
Gui, Add, Text, cYellow x270 y55 w900 h20 vAntibanIdle1 +BackgroundTrans,Ingame Idles: 0
Gui, Add, Text, cYellow x270 y70 w900 h20 vAntibanOffS1 +BackgroundTrans,OffScreen: 0
Gui, Add, Text, cYellow x270 y85 w900 h20 vAntibanLog1 +BackgroundTrans,Logouts: 0
Gui, Add, Text, cYellow x270 y100 w900 h20 vAntibanEXP1 +BackgroundTrans,EXP Checks: 0
Gui, Add, Text, cYellow x270 y115 w900 h20 vAntibanBrowse1 +BackgroundTrans,Tabs: 0
Gui, Add, Text, cYellow x270 y130 w900 h20 vMissClick1 +BackgroundTrans,MissClicks: 0
Gui,  +toolWindow +AlwaysOnTop -caption -dpiScale +lastFound HWNDhChild ;*[GUITesting]
DllCall("SetParent", Ptr, hChild, Ptr, hParent)
Gui,Show, x5 y%upY% w500 h135 NoActivate
SetTimer,UpdateOSD,600
Gosub, UpdateOSD
Gui, Color, 808080
WinSet, TransColor, 808080
Return

Status(Status)
{
	GuiControl,,Status1,Status: %Status%
}
return

AntibanCount()
{
	GuiControl,,AntibanMove1,MouseMoves: %AntibanCounter%
}
return

FletchCount()
{
	GuiControl,,FletchCount1,Bows Fletched: %TotalFletched%
}
return

AntibanIdle()
{
	GuiControl,,AntibanIdle1,Ingame Idles: %AntibanIdle2%
}
return

AntibanCam()
{
	GuiControl,,AntibanCam1,CameraSpins: %AntibanCam2%
}
return

AntibanOffS()
{
	GuiControl,,AntibanOffS1,OffScreen: %AntibanOffS2%
}
return

AntibanLogDis()
{
	GuiControl,,AntibanLog1,Logouts: %AntibanLog2%
}
return

AntibanEXP()
{
	GuiControl,,AntibanEXP1,EXP Checks: %AntibanEXP2%
}
return

AntibanBrowse()
{
	GuiControl,,AntibanBrowse1,Tabs: %AntibanBrowse2%
}
return

MissClickGui()
{
	GuiControl,,MissClick1,MissClicks: %MissClick2%
}
return

ToDigital(currentTime) {
	s  := Mod(Floor(currentTime / 1000), 60)
	m  := Mod(Floor(currentTime / (1000 * 60)), 60)
	h  := Floor(currentTime / (1000 * 60 * 60))
	return Format("{:02d}:{:02d}:{:02d}", h, m, s)
}

LoggedOutFor()
{
	If (counter >= 28800)
	{
		LogoutFor := RandomWeight(60000, 1200000, 1800000)
		Random, Rando, 1, 2
		If (Rando = 1)
		{
			Logout()
			MsgBox, "You have reached the daily limit of 8H"
			Exitapp
		}
	}
	If (counter >= 21600 && counter < 28800)
	{
		LogoutFor := RandomWeight(60000, 1200000, 1800000)
		Random, Rando, 1, 4
		If (Rando = 1)
		{
			Logout()
			MsgBox, "You have reached the daily limit of 6H"
			Exitapp
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
return

DisplayVar()
{
	TotalRuntime := ToDigital(counter)
	msgbox, %TotalRuntime%
}
return


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

updateOSD:
WinGetPos, GuiX, GuiY,GuiW,GuiH, ahk_class SunAwtFrame
upY := GuiH-150
Gui, Show, x255 y620 w450 h143 NoActivate
return