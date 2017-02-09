; This example will create a copy of "test.png" named "Resized_test.png".

If !pToken := Gdip_Startup() {  ; Start Gdip
    MsgBox, 16, Gdiplus Error, Gdiplus failed to start.
    ExitApp
}
FilePath := A_Desktop "\test.png"
if FileExist(FilePath)
    ResConImg(FilePath, 1366, 768,,,, false)
else
    MsgBox, 16, File Error, File not found.
Gdip_Shutdown(pToken)  ; Close Gdip
