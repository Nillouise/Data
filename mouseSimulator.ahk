#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxHotkeysPerInterval 2000
#SingleInstance force
CoordMode, Mouse, Screen  ; Place ToolTips at absolute screen coordinates:
;MouseGetPos, X, Y
X:=0
Y:=0

defaultSpeedX:=3
defaultSpeedY:=3
SpeedX:=defaultSpeedX
SpeedY:=defaultSpeedY
SpeedX2 := 8
SpeedY2 := 8
TotalSpeedL1 := 5 
TotalSpeedL2 :=1
TotalSpeed := TotalSpeedL1
TotalSpeedCnt := 0

PreUp := 1
PreDown :=1
PreLeft :=1
PreRight :=1
PreUpD :=0
PreDownD :=0
PreLeftD :=0
PreRightD :=0

UpdateTme:=0
StartTime:=0
;ToolTip, %StartTime%;

Pos1 = q
Pos2 = w
Pos3 = e
Pos4 = a
Pos5 = s
Pos6 = d


ON := 0

Up = i
Down = k
Left = j
Right = l

interval := 200
gap := 1000

Hotkey ,%Up%,UpDown
Hotkey ,%Up% Up,UpUp
Hotkey ,%Down%,DownDown
Hotkey ,%Down% Up,DownUp
Hotkey ,%Left%,LeftDown
Hotkey ,%Left% Up,LeftUp
Hotkey ,%Right%,RightDown
Hotkey ,%Right% Up,RightUp

Hotkey ,%Pos1%,Area1
Hotkey ,%Pos2%,Area2
Hotkey ,%Pos3%,Area3
Hotkey ,%Pos4%,Area4
Hotkey ,%Pos5%,Area5
Hotkey ,%Pos6%,Area6




Suspend,On
loop
{
	sleep,1
	if((Abs(X)=SpeedX2||Abs(Y)=SpeedY2)&&ON=1)
	{
		MouseMove, X,Y,TotalSpeedL2,R
	}else{
		MouseMove, X,Y,TotalSpeedL1,R
	}
	
;	ToolTip, %StartTime%dfd
	;MsgBox, Text
	if(A_TickCount - StartTime<2000|| A_TickCount - UpdateTme<gap)
	{
		ON := 1
;		ToolTip, %StartTime%-%UpdateTme%-%A_TickCount%;
	}else{
		ON:=0
	}
	if(ON=0)
	{
		Suspend,On
;		ToolTip, %StartTime%-%UpdateTme% ;
	}
	
}
return
;MouseMove, 0,60,50,R
;MouseMove, 60,0,50,R


;一定要放在第一句
$end::
	Suspend,Off 
	ON:=1
;	ToolTip,%UpdateTme%-%ON%
	StartTime:=A_TickCount
	UpdateTme:=A_TickCount
;	ToolTip, %UpdateTme%
;	ToolTip,%UpdateTme%-%ON%
	
	return

UpDown:
	if(ON=1)
	{
		UpdateTme := A_TickCount
;		ToolTip, %A_TickCount%-%StartTime%-%UpdateTme%-%A_TickCount%;
		
	}else{
		
	}
	if(PreUpD>PreUp)
	{
		return
	}
	PreUpD := A_TickCount
	if(A_TickCount-PreUp<interval||Y=-SpeedY2||Abs(X)=SpeedX2)
	{
		Y:=-SpeedY2
		
	}else{
		Y:=-SpeedY
	}
;	ToolTip, %A_TickCount% ;
;	ToolTip,%A_TickCount%-%PreUp%;
	return
UpUp:

	
	if(Y<0)
	{
		Y:=0
	}
	PreUp := A_TickCount
	return

DownDown:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}

	if(PreDownD>PreDown)
	{
		return
	}
	PreDownD := A_TickCount


	if(A_TickCount-PreDown<interval||Y=SpeedY2|| Abs(X)=SpeedX2 )
	{
		Y:=SpeedY2
	}else{
		Y:=SpeedY
	}
	return
DownUp:

	if(Y>0)
	{
		Y:=0
	}
	PreDown := A_TickCount
	return
	
LeftDown:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}

	if(PreLeftD>PreLeft)
	{
		return
	}
	PreLeftD := A_TickCount
	
	if(A_TickCount-PreLeft<interval||X=-SpeedX2||Abs(Y)==SpeedY2)
	{
		X:=-SpeedX2
	}else{
		X:=-SpeedX
	}
	return
LeftUp:
	if(X<0)
	{
		X:=0
	}
	PreLeft := A_TickCount
	return

RightDown:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	if(PreRightD>PreRight)
	{
		return
	}
	PreRightD := A_TickCount

	if(A_TickCount-PreRight<interval||X=SpeedX2||Abs(Y)==SpeedY2)
	{
		X:=SpeedX2
	}else{
		X:=SpeedX
	}
	return
RightUp:
	if(X>0)
	{
		X:=0
	}
	PreRight := A_TickCount
	return

	
Area1:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	cx:=A_ScreenWidth/3 - A_ScreenWidth/6
	cy:= A_ScreenHeight/2 - A_ScreenHeight/4
	MouseMove, cx,cy,0
	return
	
	
Area2:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	cx:=A_ScreenWidth/3 + A_ScreenWidth/6
	cy:= A_ScreenHeight/2 - A_ScreenHeight/4
	MouseMove, cx,cy,0
	return
	

Area3:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	cx:=A_ScreenWidth/3+ A_ScreenWidth/3 + A_ScreenWidth/6
	cy:= A_ScreenHeight/2 - A_ScreenHeight/4
	MouseMove, cx,cy,0
	return
	
Area4:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	cx:=A_ScreenWidth/3 - A_ScreenWidth/6
	cy:= A_ScreenHeight/2 + A_ScreenHeight/4
	MouseMove, cx,cy,0
	return
	
	
Area5:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	cx:=A_ScreenWidth/3 + A_ScreenWidth/6
	cy:= A_ScreenHeight/2 + A_ScreenHeight/4
	MouseMove, cx,cy,0
	return
	
	
Area6:
	if(ON=1)
	{
		UpdateTme := A_TickCount
	}
	cx:=A_ScreenWidth/3 + A_ScreenWidth/3 + A_ScreenWidth/6
	cy:= A_ScreenHeight/2 + A_ScreenHeight/4
	MouseMove, cx,cy,0
	return
	
	
;x是左键，c是右键
x::
	if(ON=1)
	{
		UpdateTme := A_TickCount
;		ToolTip, %UpdateTme%;
	}
	Click

c::
	if(ON=1)
	{
		UpdateTme := A_TickCount
;		ToolTip, %UpdateTme%;
	}
	Click, right
	

	
	
	
	
	
	
	
	
	
