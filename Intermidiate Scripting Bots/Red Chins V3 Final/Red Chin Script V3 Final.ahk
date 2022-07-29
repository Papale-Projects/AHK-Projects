#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include WindHumanMouse.ahk
#Include AntibanMouse.ahk
#Include CheckEXP.ahk
#Include Logout.ahk
#Include AntiScreenMouse.ahk
#Include AntiCameraSpin.ahk
#Include WaitPixelColor.ahk
#Include TrapChecker.ahk
#Include RandomBezier.ahk

;Set camera zoom to 560 / vertical camera on / max up arrow to full vertical camera
;Fixed mode
;Entity hider on
;tile0darkblue colors: 64009B-broke trap 00649B-caught chin 64649B-idle trap
;tile1gray colors: D97575-broke trap 75D975-caught chin D9D975-idle trap
;tile2lightblue colors: 649B9B-broke trap 00FF9B-caught chin 64FF9B-idle trap
;tile3gold colors: FF7A00-broke trap 9BDE00-caught chin FFDE00-idle trap
;tile4pink colors: FF6A6A-broke trap 9BCE6A-caught chin FFCE6A-idle trap
Menu Tray, Icon, C:\Users\WhoAmI\Downloads\Red_chinchompa_detail.ico

Gui -MinimizeBox -MaximizeBox
Gui Color, 0xC46200
Gui Font, s9, Trebuchet MS
Gui Add, Text, x8 y24 w152 h23 +0x200, Average Caught to Logout:
Gui Font
Gui Add, Edit, vLogoutRandomInput x160 y24 w54 h21 +Number, 350
Gui Font, s9, Trebuchet MS
Gui Add, Text, x8 y48 w242 h23 +0x200, Minutes to spend logged out: (Min to Max)
Gui Font
Gui Add, Edit, vMinLogoutTimeInput x248 y48 w28 h22 +Number, 5
Gui Font, s9, Trebuchet MS
Gui Add, Text, x280 y48 w11 h22 +0x200 +Center, to
Gui Font
Gui Add, Edit, vMaxLogoutTimeInput x296 y48 w28 h22 +Number, 30
Gui Font, s12 Italic, Trebuchet MS
Gui Add, Text, x8 y0 w120 h23 +0x200, Logout Settings
Gui Font
Gui Add, Button, x8 y80 w108 h28 gStartScript, Start
Gui Add, Button, x216 y80 w108 h28 gCancelScript, Exit
Gui Show, w332 h116, Red Chin Catcher V3
Return

GuiClose:
    ExitApp
	return

CancelScript:
	ExitApp
	return
	
StartScript:
	GUI, Submit
	Gui, Destroy
	Msgbox, "Lay down traps before starting!"

RandomWeighted(min,target,max) {
    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}

FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
    time = 19990101  ; *Midnight* of an arbitrary date.
    time += %NumberOfSeconds%, seconds
    FormatTime, mmss, %time%, mm:ss
    SetFormat, float, 2.0
    return NumberOfSeconds//3600 ":" mmss  ; This method is used to support more than 24 hours worth of sections.
}

SplashTextOn, 200, 60, Red Chin Catcher v3
WinMove, Red Chin Catcher v3, , 0, 0
ControlSetText, Static1, Press F1 to start`nPress F2 to reload`nPress F3 to exit, Red Chin Catcher v3

F3::exitapp
F2::reload
F1::
;Blocks mouse movement
blockinput mousemove
WinActivate, OpenOSRS - 
Global StartTime
Global ElapsedTime
Global Static1
Global CountCaught
Global LInput
Global MinInput
Global MaxInput
LInput = %LogoutRandomInput%
MinInput = %MinLogoutTimeInput%
MaxInput = %MaxLogoutTimeInput%
LInput *= 60000
MinInput *= 60000
MaxInput *= 60000

StartTime := A_TickCount

Loop
{
;At the beginning of every loop check for a dropped box trap
PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF00FF, 0, Fast RGB
	If ErrorLevel = 0
	{
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Resetting Dropped Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
		Random, MouseSpeed, 0.50, 0.65
		Random, Delay, 85, 210
		Random, Indicate, 4500, 5500
		Random, Walking, 85, 450
		Random, Wait, 85, 450
		Sleep, Wait
		MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
		Sleep, Delay
		Click
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Resetting Dropped Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
		Sleep, Indicate
		WaitPixelColor(0xFFFFFF, 35, 355)
		ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
		ControlSetText, Static1, Resetting Dropped Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
		Sleep, Walking
		CheckEXP()
		AntibanMouse()
		AntiScreenMouse()
		AntiCameraSpin()
		continue
	}
	If ErrorLevel = 1
	{	
		;pixelsearch for the each tile and count to add priority levels to GREEN traps
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00649B, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 50
					CountOne += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					CountOne = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x75D975, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 50
					CountTwo += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					CountTwo = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00FF9B, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 50
					CountThree += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					CountThree = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x9BDE00, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 50
					CountFour += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					CountFour = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x9BCE6A, 0, Fast RGB
			If ErrorLevel = 0
				{
					Random, Roll, 1, 50
					CountFive += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					CountFive = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				
		;pixelsearch for the each tile and count to add priority levels to RED traps
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x64009B, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 9
					RedCountOne += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					RedCountOne = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xD97575, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 9
					RedCountTwo += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					RedCountTwo = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x649B9B, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 9
					RedCountThree += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					RedCountThree = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF7A00, 0, Fast RGB
				If ErrorLevel = 0
				{
					Random, Roll, 1, 9
					RedCountFour += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					RedCountFour = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF6A6A, 0, Fast RGB
			If ErrorLevel = 0
				{
					Random, Roll, 1, 9
					RedCountFive += Roll
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
				If ErrorLevel = 1
				{
					RedCountFive = 0
					ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
					ControlSetText, Static1, Assigning Priority`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
				}
			
			;Execute the if statement when any of the count values are greater than one (finds a caught chin)
			;Execute each pixelsearch in priority of the highest number (oldest chin caught)
			If (CountOne > 1 || CountTwo > 1 || CountThree > 1 || CountFour > 1 || CountFive > 1)
			{
				If (CountOne > CountTwo && CountOne > CountThree && CountOne > CountFour && CountOne > CountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00649B, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							CountCaught += 1
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Logout()
						}
				}
				Else If (CountTwo > CountOne && CountTwo > CountThree && CountTwo > CountFour && CountTwo > CountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x75D975, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							CountCaught += 1
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Logout()
						}
				}
				Else If (CountThree > CountOne && CountThree > CountTwo && CountThree > CountFour && CountThree > CountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x00FF9B, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							CountCaught += 1
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Logout()
						}
				}
				Else If (CountFour > CountOne && CountFour > CountTwo && CountFour > CountThree && CountFour > CountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x9BDE00, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							CountCaught += 1
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Logout()
						}
				}
				Else If (CountFive > CountOne && CountFive > CountTwo && CountFive > CountThree && CountFive > CountFour)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x9BCE6A, 0, Fast RGB
						If (ErrorLevel = 0)
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							CountCaught += 1
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Catching Chin`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Logout()
						}
				}
			}
			
			;If there are no caught traps on the screen then reset one broken box trap and restart loop
			If (RedCountOne > 10 || RedCountTwo > 10 || RedCountThree > 10 || RedCountFour > 10 || RedCountFive > 10)
			{
				Loop, 1
				{
				If (RedCountOne > RedCountTwo && RedCountOne > RedCountThree && RedCountOne > RedCountFour && RedCountOne > RedCountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x64009B, 0, Fast RGB
						If ErrorLevel = 0
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							break
						}
				}
				
				Else If (RedCountTwo > RedCountOne && RedCountTwo > RedCountThree && RedCountTwo > RedCountFour && RedCountTwo > RedCountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xD97575, 0, Fast RGB
						If ErrorLevel = 0
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							break
						}
				}
				
				Else If (RedCountThree > RedCountOne && RedCountThree > RedCountTwo && RedCountThree > RedCountFour && RedCountThree > RedCountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0x649B9B, 0, Fast RGB
						If ErrorLevel = 0
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							break
						}
				}
				
				Else If (RedCountFour > RedCountOne && RedCountFour > RedCountTwo && RedCountFour > RedCountThree && RedCountFour > RedCountFive)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF7A00, 0, Fast RGB
						If ErrorLevel = 0
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							break
						}
				}
				
				Else If (RedCountFive > RedCountOne && RedCountFive > RedCountTwo && RedCountFive > RedCountThree && RedCountFive > RedCountFour)
				{
					PixelSearch, FoundX, FoundY, 8, 32, 519, 366, 0xFF6A6A, 0, Fast RGB
						If ErrorLevel = 0
						{
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Random, MouseSpeed, 0.50, 0.65
							Random, Delay, 85, 210
							Random, Indicate, 4500, 5500
							Random, Walking, 85, 450
							Random, Wait, 85, 450
							Sleep, Wait
							MoveMouse(FoundX+RandomWeighted(3,6,10), FoundY+RandomWeighted(3,6,10), MouseSpeed)
							Sleep, Delay
							Click
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							Sleep, Indicate
							WaitPixelColor(0xFFFFFF, 35, 355)
							ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
							ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
							Sleep, Walking
							CheckEXP()
							AntibanMouse()
							AntiScreenMouse()
							AntiCameraSpin()
							break
						}
				}
				}
			}
	}
}