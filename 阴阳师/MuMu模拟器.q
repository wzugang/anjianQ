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
MacroID=9dd3f195-4d8b-46df-854c-29c488252c15
Description=MuMu模拟器
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
//                      自定义数据区
/*************************************************************/
//Tips 快速参数设置
//		P0 P1		暂停 开始
//		M2 M3 		更改组队人数为2人或者3人
//		F1 F2 F3 	更改标记目标为左中右
//warring: 当没有竂金币经验加成的时候战斗结束时退出很慢
/*************************************************************/
//支持快速更改参数
member=2			//战斗人数 2或3，非3的数字均会认为是2
focus = 0			//是否点怪,0:不点怪 123：分别点左中右的怪
//不支持快速更改参数
command = false		// ture 开启快速参数 false 关闭快速参数
received = 0		//协作接收 0：全部拒绝 1：全部接受 2：除下1W全部接受 3：只要勾体 4：只要勾
delayTime = 500 	//控制检测频率，建议处于100到1000之间
colorDelta = 10		//色差最大不超过colorDelta,当某个状态无法识别时增大数值，过大会造成误操作
/*************************************************************/
keyScanID = 0
Global member
Global focus
Global pause
Global Hwnd
pause = False
Hwnd = Plugin.Window.Find(0, "阴阳师 - MuMu模拟器")
Windowsname="阴阳师 - MuMu模拟器"
If Hwnd=0 Then
    Hwnd = Plugin.Window.Find(0, "#1 阴阳师 - MuMu模拟器")
    Windowsname="#1 阴阳师 - MuMu模拟器"
ElseIf Hwnd=0 Then
    Hwnd = Plugin.Window.Find(0, "#2 阴阳师 - MuMu模拟器")
    Windowsname="#2 阴阳师 - MuMu模拟器"
ElseIf Hwnd=0 Then
    MessageBox "没有找到窗口"
    ExitScript
End If
//开启快捷控制线程
If command Then 
    keyScanID=BeginThread(keyScan)
End If
miniHwnd = Plugin.Window.FindEx(Hwnd, 0, "Qt5QWindowIcon", "")
sRect = Plugin.Window.GetClientRect(Hwnd)
arr = Split(sRect, "|")
X = arr(0)
Y = arr(1)
hHwnd = arr(3) - arr(1)
sRect = Plugin.Window.GetClientRect(miniHwnd)
arr = Split(sRect, "|")
hmini = arr(3) - arr(1)
If hHwnd-hmini=76 Then
    //fullwindows
    Call Plugin.Window.Size(Hwnd,1026,652)
    Call full()
Else
    //miniwindows
    Call Plugin.Window.Size(Hwnd, 410, 260)
    MessageBox "不再支持mini窗口"
    ExitScript
End If
Sub full()
    //*
   // Call Plugin.Window.Move(Hwnd, 0, 0)
    //*
    i=0//战斗计数
    While 1
        //暂停
        While pause
            Delay delayTime
        Wend
        
       
        
        //游戏闪退检测
        If Windowsname <> Plugin.Window.GetTextEx(Hwnd, 0) Then 
            Call Plugin.Media.Beep(1976, 800)
        End If   
        //TP检测
        //脚本关闭后仍然有可能导致腾讯游戏被封号，最好退出按键精灵
        If Plugin.Web.Bind("TPHelper.exe")<>0 Then
            MessageBox("检测到腾讯反外挂平台，按键精灵自动关闭")
            ExitScript
        End If
        //贪嗔痴与御灵副本
        Delay delayTime/10
        If BackgroundPointColor("5FB2F4", 720,430) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd, 84)//T
            i = i + 1
            Delay 500
            Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "正在打第" & i & "轮      ","0000FF")
        End If
        //开始战斗
        Delay delayTime/10
        If BackgroundPointColor("60B2F4", 780, 500) Then //开始战斗亮起来
            Delay delayTime/10      
            Select Case member
            Case 2
                If BackgroundPointColor("BDC6CE", 595,260) Then 
                    Call Plugin.Bkgnd.KeyPress(Hwnd, 83)//S
                    i = i + 1
                    Delay 500   
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "正在打第" & i & "轮      ","0000FF")
                End If    
            Case 3
                If BackgroundPointColor("BDC6CE", 873,253) Then 
                    Call Plugin.Bkgnd.KeyPress(Hwnd, 83)//S
                    i = i + 1
                    Delay 500
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "正在打第" & i & "轮      ","0000FF")
                End If
            End Select
        End If
        //处于战斗状态
        Delay delayTime/10
        If BackgroundPointColor("A2C4D5", 40, 60) Then //左上角出现退出、好友、及聊天
            //准备
            Delay delayTime/10
            If BackgroundPointColor("8FC6E6", 930, 573) Then 
                Call Plugin.Bkgnd.KeyPress(Hwnd,32)//space
            End If
            //是否点怪
            Select Case focus
            Case 1
                Call Plugin.Bkgnd.KeyPress(Hwnd, 68)//D
            Case 2
                Call Plugin.Bkgnd.KeyPress(Hwnd, 70)//F
            Case 3
                Call Plugin.Bkgnd.KeyPress(Hwnd, 71)//G
            Case Else
                //不点怪
            End Select
            //手动-->自动
            Delay delayTime/10
            If BackgroundPointColor("C5D7DD", 45, 563) Then 
                Call Plugin.Bkgnd.KeyPress(Hwnd,65)//A
            End If
            //有队友发消息
            Delay delayTime/10
            If BackgroundPointColor("B7C8D8", 89, 120) Then 
                Call Plugin.Media.Beep(1976, 800)
            End If
            Delay delayTime/10
            If BackgroundPointColor("B7C8D8", 89, 215) Then 
                Call Plugin.Media.Beep(1976, 800)
            End If
            Delay delayTime/10
            If BackgroundPointColor("B7C8D8", 89, 300) Then 
                Call Plugin.Media.Beep(1976, 800)
            End If
        End If
        //战斗结束结算界面
        Delay delayTime / 10
        If BackgroundPointColor("27E5F7", 141,569) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd,32)//space
        End If
        Delay delayTime / 10
        If BackgroundPointColor("F1F2F5", 456, 588) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd, 32)//space      
        End If                  	
        //跟队
        Delay delayTime / 10        
        If BackgroundPointColor("64B65B", 109, 242) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd,107)//+
        End If
        //是否继续邀请
        Delay delayTime / 10        
        If BackgroundPointColor("5FB2F4", 560, 378) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd,67)//C	
        End If
        Delay delayTime/10
        //外部好友私聊 左侧红色“友”字样  邀请也会响
        Delay delayTime/10
        If BackgroundPointColor("3B3BFF", 46,137) Then 
            Call Plugin.Media.Beep(1976, 800)
        End If
        //悬赏封印
        Delay delayTime/10
        If BackgroundPointColor("63B55A", 682,370) Then //yes
            //If BackgroundPointColor("6171DC", 683, 446) Then //no
            Select Case received
            Case 0//全部拒绝
                Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
            Case 1//全部接受
                Call Plugin.Bkgnd.KeyPress(Hwnd,89)//Y
            Case 2//除下1W之外全部接受
                If BackgroundPointColor("EEEEEE", 538, 450) Then //1W
                    Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
                Else 
                    Call Plugin.Bkgnd.KeyPress(Hwnd,89)//Y
                End If
            Case 3//不要金币协助
                If BackgroundPointColor("1A6774", 549, 426) Then //金币协助
                    Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
                Else 
                    Call Plugin.Bkgnd.KeyPress(Hwnd,89)//Y
                End If
            Case 4
                MessageBox"悬赏case4"
            Case 5
                MessageBox"悬赏case5"
            Case Else
                Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
            End Select
            // End If
        End If
        //        //斗技结束或者有人拒绝加入队伍
        //        Delay delayTime/10
        //        If BackgroundPointColor("FCFBFC", 491, 231) Then 
        //            Call Plugin.Media.Beep(1976, 800)
        //        End If
          //          Call Plugin.Bkgnd.KeyPress(Hwnd,32)//space
    Wend 
End Sub
Sub OnScriptExit()
    //关闭全部线程
    If keyScanID = 0 Then 
    Else 
        StopThread keyScanID
    End If
End Sub
Sub keyScan()
    lastKey = 0
    nowKey=0
    While 1
        nowKey = GetLastKey 
        If nowKey>0 and lastKey<>nowKey Then
            If lastKey = 70 Then //F
                if  47<nowKey<52 Then
                    focus = nowKey - 48
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  focus=" & focus & "      ","0000FF")
                End If
                if 95<nowKey<100 Then
                    focus = nowKey - 96
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  focus=" & focus & "      ","0000FF")
                End If
            End If
            If lastKey = 77 Then //M
                if  nowKey=98 or nowKey=50 Then
                    member=2
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  member=" & member & "      ", "0000FF")
                End If
                if nowKey=99 or nowKey=51 Then
                    member = 3
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  member=" & member & "      ", "0000FF")
                End If
            End If
            If lastKey = 80 Then //P
                TracePrint nowKey
                If nowKey = 96 or nowKey = 48 Then 
                    pause=True
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  脚本暂停      ","0000FF")
                End If
                If nowKey = 97 or nowKey = 49 Then 
                    pause=False
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  脚本继续      ","0000FF")
                End If
            End If
            lastKey = nowKey
        End If
        Delay 50
    Wend
End Sub
Function BackgroundPointColor(stdcolor, x, y)
    Call Plugin.Color.ColorToRGB(stdcolor, R1, G1, B1)
    backgroundColor = Plugin.Bkgnd.GetPixelColor(Hwnd, x, y)
    Call Plugin.Color.ColorToRGB(backgroundColor, R2, G2, B2)
    R = R1 - R2
    G = G1 - G2
    B = B1 - B2
    If - colorDelta  < R < colorDelta and - colorDelta  < G < colorDelta and - colorDelta  < B < colorDelta Then 
        BackgroundPointColor = True
    Else 
        BackgroundPointColor = False
    End If
End Function
