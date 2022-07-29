1::

;Color Detection
Mousegetpos, MouseX, MouseY
Pixelgetcolor, c, %MouseX%, %MouseY%

Msgbox, The color is: %c%

2::reload
3::exitapp
