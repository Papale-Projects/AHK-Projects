![enter image description here](https://www.autohotkey.com/static/ahk_logo.svg)
## What is AutoHotKey?
>*AutoHotkey is a free and open-source custom scripting language for Microsoft Windows.*
>
**Initial release date:** November 10, 2003
**Developer(s):** Chris Mallett, Steve Gray
[Documentation - Usage and Syntax](https://www.autohotkey.com/docs)

## Credits
*First, I'd like to give credit to the creators of a few functions in my projects.*

[Spawnova/ShinsImageScanClass](https://github.com/Spawnova/ShinsImageScanClass)
>ShinsImageScanClass is an AutoHotKey class designed for user freindliness and performance in mind, capable of searching for images and pixels extremely fast and also with background window support it's versatile and lightweight, with no additional dependancies. It also supports 32 and 64 bit.

>**Youtube Tutorial Video**
>
>[![Video](https://camo.githubusercontent.com/e022ea1af736202a29bf9792403a37f28aa476c0cd4643b76ab6cc31fffab6e5/68747470733a2f2f696d672e796f75747562652e636f6d2f76692f7749646346364b554849452f64656661756c742e6a7067)](https://www.youtube.com/watch?v=wIdcF6KUHIE)

[MasterFocus/RandomBezier](https://github.com/MasterFocus/AutoHotkey/tree/master/Functions/RandomBezier)
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
