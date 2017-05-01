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
UEsDBBQAAgAIAB6noUpQkyXVpQQAAAg2AAAJABEAVUlQYWNrYWdlVVQNAAf/oAdZ/6AHWf+gB1ntWstv1FUU/n4zLX06fdAOhfIYHoVSkFLeiCKUSMAAAh1cmGgyliqk0ykZqmn9F/wfTGDjwo1ECQtZGHcGEw3sWBBcuPEPIGFBx+/+Hs7t0Ib7gstoT3N62unc33fPufeec78zTSOSP37venzj1po/USNHkcZ8pQUrpNeCWEPpBFLx7/OVSiV5ubIsdSXPqA3xGoq1bqQ2UVuozdRW6hvUNmo7NRMtPTqoXdSV1G5qDzVL7aWuoq6m9sXPnV8O82srFzHNrxnk8B5KtGXMQUey3DHJs4IXvPfnX7++8NUv94M0fz6WiV67hNPYDXNpRhAk+NkX4CZW/tsJ5HHGYgatzIAJfqMBfp7xvoYJnEMBU7S60o1U6H9XnHtVxzXENjmf/2VdlqXl5HR5yuL4QYwfsRgfwE5sx9vKj9//9peN/xpH9qWMN8071fyXWnDnU12zJFeKqlPApygaziHD/NcW31NU8VNS/vsQV3GdajqDTgP/0xL+RaIWcBkfMA5Fzdqb5P/2+Jmq+A0Sfp74s6z7Fusf6PrfKK3/Cd4+itSy4Ux6DPBXSP5X8Ue5DuOY1McP78sdGvFvqln/ccv4i/t5swZ+M6I7vCwf81A8Qf1Jk2f8J4vHPCxLZ8dyY4XS9dzYRPnqZy8Jf+C7T6zGf8TMU2b+meB3ExH5tzc+U6r7r0Xa/2d49vRP3cL93xk/TxW/ddHzP8Z5XGEc9KphH89/woFV8dsk/OO8/V8La0CZWuIc9KpQlv63IOLlqvjtEv5J+l6yyz/a9U/kq7f/9b/I6vs55yDiXjLJ/9r4mQXrX2D8ZzgHEYfRcB2SSlDdG0vLoEH96ZDwR8PnR+dPBW+R/Rf0oNp3UxnTKeHb5g/b+6etnJqemZyYMx9/984Pt23w652/5LnzZ8K7r8nuC/OP9vnrkvbfeeLPEr3IW7iJZAzwuxecf9H/MWdwrQgCwSd2IOp5Liavov+j47+oV0lf3wf/65Hi74L/baBdD/X61wu//C8Lt/wvh6jnroq/Cn75n/x5kQP+px3/Prjlf/20mzXivxpu+d9G2rUa+GvwPP8zFdv6P8xseJP2W9pHBuN918+0Z3xb/umC/w3Ee0p1//XDLf/bEp9pVfy1cMv/Bmm3aeCvg1v+t5V2kwb+evjlf6JeJ/zvVPjp4yS9NrvEm9z/cpL/Mv5Z/nxZE1/0H8V6DmnEf6OEfy7ce1Nc+6Ix/9P1f5OEP+s5f9nyz6HbV6zG99/Ie52/LX+9d/PB05/+tsDnfvvSuPsQ5Z/t0Os/bK7JP+P4gnfwV8c/t0j4p4kuMqAZutn9cwC1/HOP8frJ/3+wa4n3vG78U9Qrn/xzm4Tvgn/uo90L9fw/CL/8c7uEX+/9K1ux5S/iNH1D+34KeGgwPuXZfxf9h/20OzX2/xD+3/2HHXDbfxD/vXZII/474bb/cIB2RAP/TVT7Dy7451u0wxr4u+CWfx6OfVLFH4Zb/vkOIj6lir9bwq/3/sWc5/nXO39x0X84QntQY/+NwG//YQ/89h/2wm3/Qfjzrkb898Fv/2F/jf+2/PMo9PjnAfjlnwfhl38egrvP/5elvuUfUEsBAhcLFAACAAgAHqehSlCTJdWlBAAACDYAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAH/6AHWVBLBQYAAAAAAQABAEAAAADdBAAAAAA=


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
TracePrint PID 
x = 1
y = 29
While 1
    If Plugin.Web.Bind("TPHelper.exe") <> 0 Then 
        MessageBox("检测到腾讯反外挂平台，按键精灵自动关闭")
        ExitScript
    End If
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
