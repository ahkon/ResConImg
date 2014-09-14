#SingleInstance, Force
#NoEnv
SetBatchLines, -1
OnExit, Exit
; Uncomment if Gdip.ahk is not in your standard library
;#Include, Gdip.ahk
If (!pToken := Gdip_Startup()) {
    MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have Gdip.ahk on your system.
    ExitApp
}
FileSelectFolder, SelectedFolder, % A_Desktop, 3, Select a directory in which save the resized image(s).
if (ErrorLevel)
    ExitApp

Gui, Add, Text, , Drag and drop images to resize.
Gui, Show, H200 W200
return

GuiDropFiles:
Loop, parse, A_GuiEvent, `n
    ResConImg(A_LoopField, 800, 600, , , SelectedFolder)
return

Esc::
GuiClose:
Exit:
Gdip_Shutdown(pToken)
ExitApp