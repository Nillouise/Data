; Old script drew four rectangles to create a box around controls; this
; modification changes it to show a single, transparent, click-through overlay

; Box_Init - Creates the necessary GUIs.
; C - The color of the box.
Var:=555
Box_Init(C="FF0000") {
  ; Added WS_EXTENDED_TRANSPARENT to make the overlay click-through
  Gui,+E0x20 +ToolWindow -Caption +AlwaysOnTop +LastFound
  ; Set window to 50% transparency
  WinSet,Transparent,128
  Gui,Color, % C
  Gui,font,s15w1000,Verdana
  Gui,Add, Text,X3Y3 vVar,000
}

; Box_Draw - Draws a box on the screen using 4 GUIs.
; X - The X coord.
; Y - The Y coord.
; W - The width of the box.
; H - The height of the box.
Box_Draw(X, Y, W, H, curtime, O="I") {
	;MsgBox, Value Is: %X% %Y%
  ; No longer adding to the height since using only a single rectangle
  If(W < 0)
    X += W, W *= -1
  If(H < 0)
    Y += H, H *= -1
  ; Removed the options and calculation for the border (T and O) since it no
  ; longer applies. Now the drawing dimensions are completely straight-forward.
  ttime:=curtime
  GuiControl,,Var,%ttime%
  Gui, Show, % "x" X " y" Y " w" W " h" H " NA"
}

; Box_Destroy - Destoyes the 4 GUIs.
Box_Destroy() {
  Gui,Destroy
}

; Box_Hide - Hides the GUI.
Box_Hide() {
  Gui,Hide
}

; Initialize the script and overlay
#SingleInstance,force
SetBatchLines, -1
SetWinDelay, -1
Box_Init("FF0000")
;自变量
IV := 105
;阿基米德的系数
a := 1.0
b := 5.0
;屏幕大小
height:=1080
width:=1920

; Track the mouse position and draw an overlay over the control being hovered over



elaspTime:=0
presec :=0
ON:=1

if(A_Sec!=presec)
{
	elaspTime:=elaspTime+1
	presec:=A_Sec
}
Loop {
if(ON==0)
{
Box_Hide()
  Sleep, 20
  continue
}

 ; MouseGetPos, , , Window, Control, 2
 ; WinGetPos, X1, Y1, , , ahk_id %Window%
 ; ControlGetPos, X, Y, W, H, , ahk_id %Control%
  TX := (a+b*IV)*cos(IV)
  TY := (a+b*IV)*sin(IV)

;  if (X)
 ; MsgBox, Value Is: %TX% %TY%
    Box_Draw( width/2 + TX,height/2+ TY, 50, 50,elaspTime)
	MID:=10.0
	Loop{
  NX := (a+b*IV)*cos(IV-MID)
  NY := (a+b*IV)*sin(IV-MID)
  if(abs(TX-NX)+abs(TY-NY)<0.5)
 ; if(1==1)
  {
	break
  }else
  {
  MID:=MID/2.0
  }
	}
  IV:=IV-MID
  if(A_Sec!=presec)
{
	elaspTime:=elaspTime+1
	presec:=A_Sec
}
  Sleep, 20
}
#WheelUp::
	ON:=1-ON
	elaspTime:=0
	IV := 105
	return
; Convenient way to quit (useful when not using transparency—oops)
;esc::exitapp
