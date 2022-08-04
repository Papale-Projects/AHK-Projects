#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
;set color of target, max height, max width, and starting distance around you character. REMEMBER! this searches 50 pixels in all directions or a perimeter of 100 pixels.
SearchClosest(Color, MaxH, MaxW, StartDistance:=50){
    CenterX := 0 ;characters location on the screen
    CenterY := 0
    StepY := StartDistance
    StepX := StartDistance
    loop{
        ;search in each direction
        PixelSearch, FoundX, FoundY, CenterX, CenterY, CenterX+StepX, CenterY+StepY, Color, 0, Fast RGB
        If ErrorLevel = 0{
            PixelSearch, NextX, NextY, FoundX+MaxW, FoundY+MaxH, FoundX, FoundY, Color, 0, Fast RGB
            If ErrorLevel = 0{
                ;Then go to function that calculates the center and randomly clicks
                break
            }
        }
        ;If nothing found then add 1 to counter
        if (countz := 0){
            StepY := -StepY
        } else if (countz := 1){
            StepX := -StepX
            StepY := abs(StepY)
        } else if (countz := 2){
            StepX := -StepX
            StepY := -StepY
        } else if (countz := 3){
            ;if nothing is found, add 25 to distance
            StartDistance += 25
            StepY := StartDistance
            StepX := StartDistance
            countz := -1
        }
        countz += 1
    }
}