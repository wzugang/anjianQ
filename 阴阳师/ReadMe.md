阴阳师脚本
===
# 包含功能
* 御魂
* 御灵
* 觉醒
* 斗技送人头
* 结界突破

# 变量
### 文件：御魂觉醒斗技
<br>//可以在运行时修改的参数
<br>Int member=2//战斗人数 2或3，非3的数字均会认为是2
<br>Int focus = 3//是否点怪,0:不点怪 123：分别点左中右的怪
<br>//不支持快速更改参数
<br>bool expup=true
<br>bool command = true//ture 开启快速参数 false关闭快速参数
<br>Int received = 0//协作接收 0：全部拒绝 1：全部接受 2：除下1W全部接受 3：只要勾体 4：只要勾（后两种暂不支持）
<br>Int delayTime = 500 	//控制检测频率，建议处于100到1000之间
<br>Int colorDelta = 10		//色差最大不超过colorDelta,当某个状态无法识别时增大数值，过大会造成误操作
### 文件：结界突破
<br>Int gold=1
