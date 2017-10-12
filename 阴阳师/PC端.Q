[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=212df094-a522-4325-9206-2a2a59b0e99d
Description=PC端
Enable=1
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
Hwnd = Plugin.Window.Find(0, "阴阳师-网易游戏")
sRect = Plugin.Window.GetWindowRect(Hwnd)
dim MyArray   
MyArray = Split(sRect, "|")
W1 = Clng(MyArray(0)): H1 = Clng(MyArray(1))   
W2 = Clng(MyArray(2)) : H2 = Clng(MyArray(3))
Call Plugin.Window.Move(Hwnd, 0, 0)
While 1
    //开始战斗3人
//    IfColor W1+955, H1+301, "C2CDD7",2 Then
//        IfColor W1 + 862, H1 + 572, "5EB2F3", 0 Then
//            MoveTo W1+862, H1+572
//            LeftClick 1
//            Delay 500
//        Else
//        End If
//    Else
//    End If
    //    //开始战斗2人
        IfColor W1 + 862, H1 + 572, "5EB2F3", 0 Then
            MoveTo W1+862, H1+572
            LeftClick 1
            Delay 500
        Else
        End If
    准备
    IfColor W1+1040, H1+640, "5B90C4", 0 Then
        MoveTo W1+1040, H1+640
        LeftClick 1
        Delay 2000
    Else
    End If
    //结束战斗，识别经验加成  左右差值130
    IfColor W1+164, H1+625, "25E5F7", 0 Then
        MoveTo W1+294, H1+525
        LeftClick 1
        Delay 500
    Else
    End If
    Delay 100
Wend
