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
MacroID=3583d0fb-a15a-43db-9b36-2092dd83a015
Description=自动御魂觉醒斗技
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

[UIPackage]
UEsDBBQAAgAIAAhtoUqfWzyPogQAAAg2AAAJABEAVUlQYWNrYWdlVVQNAAfUOgdZ1DoHWdQ6B1ntWktvk0cUPZ+dkGedRxMTCKXmEQiBEsIbWh4NAkHFS8SwQALJhLSgOA4yoUr+RH9CJdh00U0rQF20q25BatXuWCC66KY/AKkL4p75HnhiEjEvGExzo5ubOJ7vzL0zc++c66QRye+/dT27++Pqv1Ajh5HGfKUFK6TXglhD6QRS8e/zlUolebmyLHUlL6gN8RqKtW6kNlFbqM3UVuoH1DZqOzUTLT06qF3UD6nd1B5qltpLXUldRe2Lnzu/HOZ3Vi5gml8zyOE4SrRlzEFHstwxybOC17z32Tdzdw79+keQ5s9HM9FrF3EKO2AuzQiCBD/7GtzEyn87hjxOW8yglRkwwW80wM8z3rcwgbMoYIpWV7qRCv3vinOv6riG2Cbn833WZVlaTkyXpyyOH8T4EYvxAezEdrytPPjh8d82/msc2Tcy3jTvVPNfasGdT3XNklwpqk4B11A0nEOG+a8tvqeo4qek/HcJN3GbajqDTgP/0xL+BaIWcB3nGIeiZu1N8n97/ExV/AYJP0/8WdZ9i/UPdP1vlNb/GG8fRWrZcCY9BvgrJP+r+KNch3FM6uOH9+UOjfg31az/uGX8xf28WQO/GdEdXpYrPBTPUX/S5Bn/+eIxD8vSmbHcWKF0Ozc2Ub755RvCH/j+qtX4y8w8ZeafCX43EZF/e+Mzpbr/WqT9f5pnT//ULdz/nfHzVPFbFz3/Y5zHDcZBrxr28fwnHFgVv03C/5y3/1thDShTS5yDXhXK0v8WRLxcFb9dwj9B30t2+Ue7/ol89dlL/4usvl9xDiLuJZP8r42fWbD+BcZ/hnMQcRgN1yGpBNW9sbQMGtSfDgl/NHx+dP5U8BbZf0EPqn03lTGdEr5t/rC9f9rKyemZyYk58/G//HT/oQ1+vfOXPHf+THj3Ndl9Yf7RPn9d0v47T/xZohd5CzeRjAF+94LzL/o/5gyuFUEg+MRWRD3PxeRt9H90/Bf1Kunr++B/PVL8XfC/j2nXQr3+9cIv/8vCLf/LIeq5q+KvhF/+J39e5ID/ace/D275Xz/tBo34r4Jb/reOdo0G/mq8yv9Mxbb+DzMb3qP9jvapwXjf9TPtGd+Wf7rgfwPxnlLdf/1wy/82xmdaFX8N3PK/QdrNGvgfwS3/20S7XgN/LfzyP1GvE/53Mvz0cZJem13iTe5/Ocl/Gf8Mf76uiS/6j2I9hzTiv07CPxvuvSmufdGY/+n6v17Cn/Wcv2z559DDG1bj++/mvc7flr8+uvfnvz//Y4HP/fa1cfchyj9boNd/2FCTf8Zxh3fwt8c/N0r4p4guMqAZutn9cwC1/HOn8frJ/3+wfYn3vGv8U9Qrn/xzs4Tvgn/upt0F9fw/CL/8c4uEX+/9K1ux5S/iNH1L+0UKeGIwPuXZfxf9hz202zT2/xD+3/2HrXDbfxD/vbZfI/7b4Lb/sJd2RAP/E1T7Dy7450HaYQ387XDLPw/EPqniD8Mt/zyEiE+p4u+Q8Ou9fzHnef71zl9c9B8+pd2nsf9G4Lf/sBN++w+74Lb/IPw5ohH/3fDbf9hT478t/zwMPf65F3755z745Z/74e7z/2Wpb/kPUEsBAhcLFAACAAgACG2hSp9bPI+iBAAACDYAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAH1DoHWVBLBQYAAAAAAQABAEAAAADaBAAAAAA=


[Script]
//MainHwnd = Plugin.Window.Find(0, "阴阳师 - 网易MuMu")
MainHwnd = Plugin.Window.Find(0, "阴阳师 - MuMu模拟器")
Hwnd = Plugin.Window.FindEx(MainHwnd, 0,"Qt5QWindowIcon","")
Hwnd = Plugin.Window.FindEx(Hwnd, 0, "subWin", "sub")
sRect = Plugin.Window.GetClientRect(MainHwnd)
arr=Split(sRect,"|")
w = arr(2) - arr(0)
h = arr(3) - arr(1)
Call Plugin.Window.Size(MainHwnd, 410, 260)

count = 0
//TracePrint GetColorFocus 

x = 1
y = 29
While 1
    GetColor0 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 42+x, 82+y)
    If GetColor0 = "63B55A" Then 
        Call Plugin.Bkgnd.KeyPress(MainHwnd, 107)//+
    End If
    //检查是否有人进入房间 subWin窗口内坐标 175 91 颜色 949BA2 进入后颜色 BDC6CE
    //GetColor1 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 174+x, 96+y)
    //If GetColor1 = "BDC6CE" Then 
    //模式2 开始亮起来
    GetColor1 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 309+x, 190+y)
    If GetColor1 = "5FB2F4" Then 
        //Delay 1000
        Call Plugin.Bkgnd.KeyPress(MainHwnd, 90)//z
    Else 
        //是否继续邀请好友 subWin窗口内坐标 222 139 颜色 5AB2F7
        GetColor2 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 222+x, 139+y)
        If GetColor2 = "5FB2F4" Then
            Call Plugin.Bkgnd.KeyPress(MainHwnd, 67)//c
        Else 
            //是否可以准备 subWin窗口内坐标 366 214 颜色 7EBAE1
            //此处颜色异常 取色与debug输出不一致
            //  GetColor3 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 366+x, 214+y)
            //    If GetColor3 = "74AFDA" Then
            //r
            //       Call Plugin.Bkgnd.KeyPress(MainHwnd, 82)
            //     Else 
            //            End If  
        //点怪 subWin窗口内坐标 26 207 颜色 D5E8ED            
            GetColorFocus = Plugin.Bkgnd.GetPixelColor(MainHwnd,25+x,207+y)
          
            If GetColorFocus = "D5E8ED" Then
                Call Plugin.Bkgnd.KeyPress(MainHwnd, 70)//f
            Else
                Call Plugin.Bkgnd.KeyPress(MainHwnd, 32)//space
            End If
            Delay 500
            //如果不小心点到了副本 subWin窗口内坐标 336 45 颜色 D3D4FA
            GetColor4 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 336 + x, 46 + y)
            If GetColor4 = "D3D4FA" Then
                Call Plugin.Bkgnd.KeyPress(MainHwnd, 88)//x
                count=count+1
                If count = 3 Then  
                    ExitScript
                End If
            End If
            //手动->自动 subWin窗口内坐标 11 211 颜色 BDCED4
            GetColor5 = Plugin.Bkgnd.GetPixelColor(MainHwnd, 11+x, 211+y)
            If GetColor5 = "BDCED4" Then
                Call Plugin.Bkgnd.KeyPress(MainHwnd, 164)//alt
                Delay 1000
            End If
        End If
    End If
Wend
//End Event
Sub OnScriptExit()
    Call Plugin.Window.Size(MainHwnd, w, h)
End Sub
