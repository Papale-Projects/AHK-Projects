7::
Random, spaced, 10, 35
loop{
	PixelSearch, PX, PY, 387, 261, 397, 274, 0x00FF00, 1, RGB, Fast
	if (errorlevel = 0){
        SendInput {Space Down}
		Sleep, spaced
	}
}
8::reload
9::exitapp
