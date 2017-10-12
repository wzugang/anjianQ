[General]
SyntaxVersion=2
BeginHotkey=120
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=121
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=af879504-7392-4ea1-878d-6b799375a9f3
Description=按键设置
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Hwnd=Plugin.Window.Find(0,"阴阳师 - MuMu模拟器")
If Hwnd=0 Then
    Hwnd=Plugin.Window.Find(0,"#1 阴阳师 - MuMu模拟器")
ElseIf Hwnd=0 Then
    Hwnd=Plugin.Window.Find(0,"#2 阴阳师 - MuMu模拟器")
ElseIf Hwnd=0 Then
    Hwnd=Plugin.Window.Find(0,"#3 阴阳师 - MuMu模拟器")
    MessageBox "没有找到窗口,请打开游戏"
    ExitScript
End If
//sRect = Plugin.Window.GetClientRect(Hwnd)
//arr = Split(sRect, "|")
//TracePrint sRect
//X = arr(0)
//Y = arr(1)
//hHwnd = arr(3) - arr(1)
//If arr(2) - arr(0)=1026 Then
//    //fullwindows
    Call Plugin.Window.Size(Hwnd, 1026, 652)
    Call Plugin.Window.Active(Hwnd)

//Else
//    MessageBox "不再支持mini窗口"
//    ExitScript
//End If
//

Call Plugin.SysEx.SetInputMethod(Hwnd, "US")

KeyDown 18, 1
KeyPress 49, 1
KeyUp 18, 1
Call Plugin.Window.Move(Hwnd, 0, 0)
Delay 500

MoveTo 111, 243
KeyPress "Num +", 1
Delay 100
MoveTo 258, 196
KeyPress "D", 1
Delay 100
MoveTo 496, 174
KeyPress "F", 1
Delay 100
MoveTo 748, 218
KeyPress "G", 1
Delay 100
MoveTo 48, 569
KeyPress "A", 1
Delay 100
MoveTo 605, 392
KeyPress "C", 1
Delay 100
MoveTo 496, 174
KeyPress "Y", 1
Delay 100
MoveTo 762, 444
KeyPress "T", 1
Delay 100
MoveTo 848, 157
KeyPress "X", 1
Delay 100
MoveTo 831, 519
KeyPress "S", 1
Delay 100
MoveTo 920, 477
KeyPress "Space", 1
Delay 100
MoveTo 762, 444
KeyPress "N", 1
Delay 100

MessageBox "键位设置完成，请手动检查保存"
