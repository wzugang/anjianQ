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
Description=������Ѷ���
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
Option Explicit
//                      �Զ���������
/*************************************************************/
//Tips ��������Ϊtrueʱ ���ò�����������ʱ�ı� ��������ĸ�Ӳ�������
//     eg. M2��������� F2������м�Ĵ���
//֧�ֿ��ٸ��Ĳ���
member=2//ս������ 2��3����3�����־�����Ϊ��2
focus = 3//�Ƿ���,0:����� 123���ֱ�������ҵĹ�
//��֧�ֿ��ٸ��Ĳ���
expup=true
command = true//ture �������ٲ��� false�رտ��ٲ���
received = 0//Э������ 0��ȫ���ܾ� 1��ȫ������ 2������1Wȫ������ 3��ֻҪ���� 4��ֻҪ��
delayTime = 500 	//���Ƽ��Ƶ�ʣ����鴦��100��1000֮��
colorDelta = 10		//ɫ����󲻳���colorDelta,��ĳ��״̬�޷�ʶ��ʱ������ֵ���������������
/*************************************************************/
keyScanID = 0
Global member
Global focus
Global pause
Global Hwnd
pause = False
Hwnd=Plugin.Window.Find(0,"����ʦ - MuMuģ����")
If Hwnd=0 Then
    Hwnd=Plugin.Window.Find(0,"#1 ����ʦ - MuMuģ����")
ElseIf Hwnd=0 Then
    Hwnd=Plugin.Window.Find(0,"#2 ����ʦ - MuMuģ����")
ElseIf Hwnd=0 Then
    Hwnd=Plugin.Window.Find(0,"#3 ����ʦ - MuMuģ����")
    MessageBox "û���ҵ�����"
    ExitScript
End If
//������ݿ����߳�
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
    MessageBox "����֧��mini����"
    ExitScript
End If
Sub full()
    //*
    //Call Plugin.Window.Move(Hwnd, 0, 0)
    //*
    i=0//ս������
    count = 0//�������
    While 1
        While pause
            Delay delayTime
        Wend
        //TP���
        //�رպ���Ȼ�п��ܵ�����Ѷ��Ϸ�����
        If Plugin.Web.Bind("TPHelper.exe")<>0 Then
            MessageBox("��⵽��Ѷ�����ƽ̨�����������Զ��ر�")
            ExitScript
        End If
        //̰���������鸱��
        If BackgroundPointColor("5FB2F4", 720,430) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd, 84)//T
            i = i + 1
            Delay 500
            Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "���ڴ��" & i & "��      ","0000FF")
        End If
        Delay delayTime/10
        //��ʼս��
        If BackgroundPointColor("60B2F4", 780,500) Then //��ʼս������
            Select Case member
            Case 2
                If BackgroundPointColor("BDC6CE", 595,260) Then 
                    Call Plugin.Bkgnd.KeyPress(Hwnd, 83)//S
                    i = i + 1
                    Delay 500   
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "���ڴ��" & i & "��      ","0000FF")
                End If    
            Case 3
                If BackgroundPointColor("BDC6CE", 873,253) Then 
                    Call Plugin.Bkgnd.KeyPress(Hwnd, 83)//S
                    i = i + 1
                    Delay 500
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "���ڴ��" & i & "��      ","0000FF")
                End If
            End Select
        End If
        Delay delayTime/10
        //ս��״̬
        If BackgroundPointColor("A2C4D5", 149, 67) Then //���Ͻǳ����˳������ѡ�������
            Delay delayTime/10
            //׼��
            If BackgroundPointColor("8FC6E6", 930, 573) Then 
                Call Plugin.Bkgnd.KeyPress(Hwnd,32)//space
            End If
            Delay delayTime/10
            //�Ƿ���
            Select Case focus
            Case 1
                Call Plugin.Bkgnd.KeyPress(Hwnd, 68)//D
            Case 2
                Call Plugin.Bkgnd.KeyPress(Hwnd, 70)//F
            Case 3
                Call Plugin.Bkgnd.KeyPress(Hwnd, 71)//G
            Case Else
                //�����
            End Select
            Delay delayTime/10
            //�ֶ�-->�Զ�
            If BackgroundPointColor("C5D7DD", 45, 563) Then 
                Call Plugin.Bkgnd.KeyPress(Hwnd,65)//A
            End If
            Delay delayTime/10
            //�ж��ѷ���Ϣ
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
            Delay delayTime/10            
        End If
        //ս�������������
        If expup Then 
            If BackgroundPointColor("27E5F7", 141,569) Then 
                Call Plugin.Bkgnd.KeyPress(Hwnd,32)//space
            End If
        Else 
            If BackgroundPointColor("F1F2F5", 456, 588) Then 
                Call Plugin.Bkgnd.KeyPress(Hwnd, 32)//space      
            End If                  	
        End If
        Delay delayTime / 10
        //����
        If BackgroundPointColor("64B65B", 109, 242) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd,107)//+
        End If
        Delay delayTime/10
        //����
        If BackgroundPointColor("A5D7F0", 891,549) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd,32)//space
        End If
        Delay delayTime/10
        //�Ƿ��������
        If BackgroundPointColor("5FB2F4", 560, 378) Then 
            Call Plugin.Bkgnd.KeyPress(Hwnd,67)//C	
        End If
        Delay delayTime/10
        //�ⲿ����˽�� ����ɫ���ѡ�����  ����Ҳ����
        If BackgroundPointColor("3B3BFF", 46,137) Then 
            Call Plugin.Media.Beep(1976, 800)
        End If
        Delay delayTime/10
        //���ͷ�ӡ
        If BackgroundPointColor("63B55A", 682,370) Then //yes
            //If BackgroundPointColor("6171DC", 683, 446) Then //no
            Select Case received
            Case 0//ȫ���ܾ�
                Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
            Case 1//ȫ������
                Call Plugin.Bkgnd.KeyPress(Hwnd,89)//Y
            Case 2//����1W֮��ȫ������
                If BackgroundPointColor("EEEEEE", 538, 450) Then //1W
                    Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
                Else 
                    Call Plugin.Bkgnd.KeyPress(Hwnd,89)//Y
                End If
            Case 3//��Ҫ���Э��
                If BackgroundPointColor("1A6774", 549, 426) Then //���Э��
                    Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
                Else 
                    Call Plugin.Bkgnd.KeyPress(Hwnd,89)//Y
                End If
            Case 4
                MessageBox"����case4"
            Case 5
                MessageBox"����case5"
            Case Else
                Call Plugin.Bkgnd.KeyPress(Hwnd,78)//N
            End Select
            // End If
        End If
        Delay delayTime/10
        //���������������˾ܾ��������
//        If BackgroundPointColor("FCFBFC", 491, 231) Then 
//            Call Plugin.Media.Beep(1976, 800)
//            count = count + 1
//        End If
//        Delay delayTime/10
        // Delay delayTime
    Wend 
End Sub
Sub OnScriptExit()
    //�ر�ȫ���߳�
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
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  �ű���ͣ","0000FF")
                End If
                If nowKey = 97 or nowKey = 49 Then 
                    pause=False
                    Call Plugin.Msg.ShowScrTXT(0, 0, 100, 50, "  �ű�����=","0000FF")
                End If
            End If
            lastKey = nowKey
        End If
        Delay 30
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
