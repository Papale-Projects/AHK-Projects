			;If there are no caught traps on the screen then reset one broken box trap and restart loop
			If (CountOne = 0 && CountTwo = 0 && CountThree = 0 && CountFour = 0 && CountFive = 0)
			{
				Loop, 1
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
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
						ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
						Sleep, Walking
						CheckEXP()
						AntibanMouse()
						AntiScreenMouse()
						AntiCameraSpin()
						TrapChecker()
						break
					}
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
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
						ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
						Sleep, Walking
						CheckEXP()
						AntibanMouse()
						AntiScreenMouse()
						AntiCameraSpin()
						TrapChecker()
						break
					}
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
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
						ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
						Sleep, Walking
						CheckEXP()
						AntibanMouse()
						AntiScreenMouse()
						AntiCameraSpin()
						TrapChecker()
						break
					}
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
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
						ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
						Sleep, Walking
						CheckEXP()
						AntibanMouse()
						AntiScreenMouse()
						AntiCameraSpin()
						TrapChecker()
						break
					}
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
						Sleep, Indicate
						WaitPixelColor(0xFFFFFF, 35, 355)
						ElapsedTime :=FormatSeconds((A_TickCount-StartTime)/1000)
						ControlSetText, Static1, Fixing Trap`nChins Caught: %CountCaught%`nRuntime: %ElapsedTime%, Red Chin Catcher v3
						Sleep, Walking
						CheckEXP()
						AntibanMouse()
						AntiScreenMouse()
						AntiCameraSpin()
						TrapChecker()
						break
					}
				}
			}