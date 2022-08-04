![enter image description here](https://www.autohotkey.com/static/ahk_logo.svg)
## What is AutoHotKey?
>*AutoHotkey is a free and open-source custom scripting language for Microsoft Windows.*
>
**Initial release date:** November 10, 2003  
**Developer(s):** Chris Mallett, Steve Gray  
[Documentation - Usage and Syntax](https://www.autohotkey.com/docs)  

## My Code  
![enter image description here](https://i.gyazo.com/a3f5e70aae3c19e450a9e85b8c17440e.gif)  
 - [Antiban.ahk](https://github.com/Papale-Projects/AHK-Projects/blob/master/Complex%20Functions/Antiban.ahk) - Collection of functions referenced in all bots I produce. Primary use is for uniformity and to reduce redundancy. 
 - [InterfaceCords.ahk](https://github.com/Papale-Projects/AHK-Projects/blob/master/Complex%20Functions/InterfaceCords.ahk) - Recently updated, this function is used to calculate all tab locations from one given imagesearch.
 - [Overlays.ahk](https://github.com/Papale-Projects/AHK-Projects/blob/master/Complex%20Functions/Overlays.ahk) - This script is ran in conjunction with the main .ahk to provide a visual representation of pixel locations. Since AHK doesn't multithreading, I simulate that by read / writing to a .ini file to pass variables between scripts.  
  >This example shows a yellow border around the found object and the click location with a red marker. In this example the pixelsearch is looking for the dark blue colored border around the iron rock.    
 >![enter image description here](https://github.com/Papale-Projects/AHK-Projects/blob/master/Advanced%20Scripting%20Bots%20-%20Current/Iron%20Miner%20V2/Overlayexample.PNG?raw=true)  
 - [GuiTesting.ahk](https://github.com/Papale-Projects/AHK-Projects/blob/master/Complex%20Functions/GUITesting.ahk) - Gui used to debug code with status messages. Also displays total runtime and counting variables. Gui attaches to client screen and moves with it.  
 >![enter image description here](https://github.com/Papale-Projects/AHK-Projects/blob/master/Advanced%20Scripting%20Bots%20-%20Current/Iron%20Miner%20V2/Gui.PNG?raw=true)

## [Spawnova/ShinsImageScanClass](https://github.com/Spawnova/ShinsImageScanClass)

>ShinsImageScanClass is an AutoHotKey class designed for user friendliness and performance in mind, capable of searching for images and pixels extremely fast and also with background window support it's versatile and lightweight, with no additional dependencies. It also supports 32 and 64 bit.

>**Youtube Tutorial Video**  
>[![Video](https://camo.githubusercontent.com/e022ea1af736202a29bf9792403a37f28aa476c0cd4643b76ab6cc31fffab6e5/68747470733a2f2f696d672e796f75747562652e636f6d2f76692f7749646346364b554849452f64656661756c742e6a7067)](https://www.youtube.com/watch?v=wIdcF6KUHIE)

## [MasterFocus/RandomBezier](https://github.com/MasterFocus/AutoHotkey/tree/master/Functions/RandomBezier)

>Moves the mouse through a random Bézier path  
>*Note: I no longer use this function for mouse movement, but it was used earlier on in my scripts.  

    RandomBezier( X0, Y0, Xf, Yf, O="" ) {
	    Time := RegExMatch(O,"i)T(\d+)",M)&&(M1>0)? M1: 200
	    RO := InStr(O,"RO",0) , RD := InStr(O,"RD",0)
	    N:=!RegExMatch(O,"i)P(\d+)(-(\d+))?",M)||(M1<2)? 2: (M1>19)? 19: M1
	    If ((M:=(M3!="")? ((M3<2)? 2: ((M3>19)? 19: M3)): ((M1=="")? 5: ""))!="")
	        Random, N, %N%, %M%
	    OfT:=RegExMatch(O,"i)OT(-?\d+)",M)? M1: 100, OfB:=RegExMatch(O,"i)OB(-?\d+)",M)? M1: 100
	    OfL:=RegExMatch(O,"i)OL(-?\d+)",M)? M1: 100, OfR:=RegExMatch(O,"i)OR(-?\d+)",M)? M1: 100
	    MouseGetPos, XM, YM
	    If ( RO )
	        X0 += XM, Y0 += YM
	    If ( RD )
	        Xf += XM, Yf += YM
	    If ( X0 < Xf )
	        sX := X0-OfL, bX := Xf+OfR
	    Else
	        sX := Xf-OfL, bX := X0+OfR
	    If ( Y0 < Yf )
	        sY := Y0-OfT, bY := Yf+OfB
	    Else
	        sY := Yf-OfT, bY := Y0+OfB
	    Loop, % (--N)-1 {
	        Random, X%A_Index%, %sX%, %bX%
	        Random, Y%A_Index%, %sY%, %bY%
	    }
	    X%N% := Xf, Y%N% := Yf, E := ( I := A_TickCount ) + Time
	    While ( A_TickCount < E ) {
	        U := 1 - (T := (A_TickCount-I)/Time)
	        Loop, % N + 1 + (X := Y := 0) {
	            Loop, % Idx := A_Index - (F1 := F2 := F3 := 1)
	                F2 *= A_Index, F1 *= A_Index
	            Loop, % D := N-Idx
	                F3 *= A_Index, F1 *= A_Index+Idx
	            M:=(F1/(F2*F3))*((T+0.000001)**Idx)*((U-0.000001)**D), X+=M*X%Idx%, Y+=M*Y%Idx%
	        }
	        MouseMove, %X%, %Y%, 0
	        Sleep, 1
	    }
	    MouseMove, X%N%, Y%N%, 0
	    Return N+1
	 }

## [ HowDoIStayInDreams / WindHumanMouse ](https://github.com/HowDoIStayInDreams/WindHumanMouse/blob/master/WindHumanMouse.ahk)

>The original creator is [BenLand100](https://github.com/BenLand100), and he wrote this algorithm in Pascal. Since the original, it has been converted into Java, C#, and Python.  
HowDoIStayInDreams converted this code from C# in AHK.  

***Description***  
A simple linear interpolation that satisfied any human-mouse-speed assumptions would be easily identifiable as non-human when the angular distribution was observed, as it would have segments of discrete angles for each line. Replaying a finite set of real mouse movements would also be identifiable observing angular distributions. It is therefore critical to have some random algorithm that creates an acceptable angular distribution of steps, while still moving to a destination. The time distribution is relatively straightforward to satisfy, but the generation of paths with sufficiently human qualities is where WindMouse comes in.  
[Full Description Here](https://ben.land/post/2021/04/25/windmouse-human-mouse-movement/#windmouse)

    WindMouse(xs, ys, xe, ye, gravity, wind, minWait, maxWait, maxStep, targetArea, sleepsArray){
	windX:= 0, windY:= 0
	veloX:= 0, veloY:= 0
	newX:= Round(xs)
	newY:= Round(ys)
	waitDiff:= maxWait - minWait
	sqrt2:= Sqrt(2)
	sqrt3:= Sqrt(3)
	sqrt5:= Sqrt(5)
	dist:= Hypot(xe - xs, ye - ys)
	i:= 1
	stepVar:= maxStep
	Loop{
		wind:= Min(wind, dist)
		if(dist >= targetArea){
			windX:= windX / sqrt3 + (random(round(wind) * 2 + 1) - wind) / sqrt5
			windY:= windY / sqrt3 + (random(round(wind) * 2 + 1) - wind) / sqrt5
			maxStep:= RandomWeight(stepVar/2, (stepVar+(stepVar/2))/2, stepVar)
			}else{
				windX:= windX / sqrt2
				windY:= windY / sqrt2
				if(maxStep < 3){
					maxStep:= 1
				}else{
					maxStep:= maxStep / 3
				}
			}
			veloX += windX
			veloY += windY
			veloX:= veloX + gravity * ( xe - xs ) / dist
			veloY:= veloY + gravity * ( ye - ys ) / dist
			if(Hypot(veloX, veloY) > maxStep){
				randomDist:= maxStep / 2 + (Round(random(maxStep)) / 2)
				veloMag:= Hypot(veloX, veloY)
				veloX:= ( veloX / veloMag ) * randomDist
				veloY:= ( veloY / veloMag ) * randomDist
			}
			oldX:= Round(xs)
			oldY:= Round(ys)
			xs:= xs + veloX
			ys:= ys + veloY
			dist:= Hypot(xe - xs, ye - ys)
			if(dist <= 1){
				Break
			}
			newX:= Round(xs)
			newY:= Round(ys)
			if(oldX != newX) or (oldY != newY){
				MouseMove, newX, newY
			}
			step:= Hypot(xs - oldX, ys - oldY)
			c:= sleepsArray.Count()
			if(i > c){
				lastSleeps:= Round(sleepsArray[c])
				Random, w, lastSleeps, lastSleeps+1
				wait:= Max(Round(abs(w)),1)
				Sleep(wait)
			}else{
				waitSleep:= Round(sleepsArray[i])
				Random, w, waitSleep, waitSleep+1
				wait:= Max(Round(abs(w)),1)
				Sleep(wait)
				i++
			}
		}
	endX:= Round(xe)
	endY:= Round(ye)
		if(endX != newX) or (endY != newY){
			MouseMove, endX, endY
	    }
	i:= 1
	}

