;_________________________________________________________
;________________________________________________________|
;                                                        |
; Created by: GlitchedSoul#5555                          |
;             https://github.com/GlitchedSouls           |
;                                                        |
;________________________________________________________|
;________________________________________________________|


;;Simple Weighted Random;;
RandomWeighted(min,target,max) {
    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}

;;This MUST be put at the start of your hotkey (outside any loop so it only runs once) if you want to use FRandom or FSleep;;
FRandSetup() {
    path:= A_ScriptDir
    name:= A_UserName " AHK Fatigue"
    IniWrite, %A_TickCount%, %path% %name%, Fatigue, Time
        If (ErrorLevel) {
            MsgBox,,ERROR in writing setup file! FRandSetup, Check the function parameters or delete them.
        }
}

;;Simple Weighted Random with Simulated Fatigue;;
;;steps is how much the target should increase for each amount of time passed;;
;;time is how long between each target increase in minutes;;
FRandom(min,target,max,steps:=1,time:=1) {

    If (steps<=0) OR (time<=0) {
        RVal:=Random(min,target,max)
        return,%Rval%
    }
    IniRead, OutputVar, %A_ScriptDir% %A_UserName% AHK Fatigue, Fatigue, Time , 0
    If (OutputVar=0){
        MsgBox,,ERROR in reading setup file!, Ensure the FRandSetup Function is at the very begining of your script
        RVal:=Random(min,target,max)
        return,%Rval%
    }
    time:=Round(time*60000)
    fatigue:=Round((A_TickCount-OutputVar)/time)
    target+=fatigue*steps
    If (target>=Round(max*0.9)) {
        target:=Round(max*0.9)
    }

    Random,lower,min,target
    Random,upper,target,max
    Random,weighted,lower,upper
    return,%weighted%
}




;;Simple Weighted Sleep
Sleep(min,target,max){
    sleeptime:=Random(min,target,max)
    Sleep, sleeptime
}


;;Simple Weighted Sleep with Simulated Fatigue;;
;;steps is how much the target should increase for each amount of time passed;;
;;time is how long between each target increase in minutes;;
FSleep(min,target,max,steps:=1,time:=1) {
    sleeptime:=FRandom(min,target,max,steps,time)
    Sleep, sleeptime
}
