Gui, Add, Text,, Windows Title Pattern (RegEx):
Gui, Add, Edit,  vtitle w200, 
Gui, Add, Text,, found 0 window(s)
Gui, Add, button, X130 y50 gLocate -default, locate window(s)
Gui, Add, Text, x10, Window transparency:
GUI, Add, Slider, x10 Range100-255 w200 gFind, 255
Gui, Add, Text,x10 vignore w100, cluster input:
Gui, Add, Edit,x10 WantTab ReadOnly, 
Gui, Add, button, X140 y155 gGoPaste -default, paste clipboard
Gui, Add, button, X10 y185 gTile -default, Tile
Gui, Add, button, X40 y185 gCascade -default, Cascade
Gui, Add, Edit, x100 y187 vwidth w30 Number, 800
Gui, Add, Text,x138 y189, X
Gui, Add, Edit, x150 y187 vheight w30 Number, 400
;Gui, Add, Checkbox, x190 y190 vauto, auto
Gui, +AlwaysOnTop
Gui, Show, h215 w250, Mingbo's cluster Putty

onMessage(0x100,"key")  ; key down
onMessage(0x101,"key")  ; key up
onMessage(0x104,"key")  ; alt key down
onMessage(0x105,"key")  ; alt key down

SetTimer, Find , 1000
SetTitleMatchMode, RegEx 
#WinActivateForce


xstep := 50
ystep := 40

key(wParam, lParam,msg, hwnd)
{ 
  global paste
  if (paste ==1) {
	return
}
  GuiControlGet, currentInput, Focus  
  if(currentInput="Edit2"){

	  global id
	  Loop, %id%
	  {
		this_id := id%A_Index%		
		if(this_id >0){
		  PostMessage, %msg%,%wParam%, %lParam%  , ,ahk_id %this_id%,
		}		
	  } 
	GuiControl,,Edit2, 
   }
}
return 

GuiClose:
ExitApp

Tile:
	Gosub, Find 
	x:=0
	y:=0
	Loop, %id%
	  {
		this_id := id%A_Index%		
		if( this_id > 0){
				;WinActivate, ahk_id %this_id%,				
				WinMove, ahk_id %this_id%,, x,y,width,height
				x:=x+width
				if( (x+width) >= A_ScreenWidth){
					x:=0
					y:=y+height
				}
		}
	  }
	return
	
Cascade:
	Gosub, Find 
	x:=0
	y:=0
	Loop, %id%
	  {
		this_id := id%A_Index%		
		if( this_id > 0){
				WinMove, ahk_id %this_id%,, x,y,width,height				
				x:=x+xstep
				y:=y+ystep
		}
	  }
	return
	
GoPaste:
    Gosub, Find 
	ControlSetText, Edit2, no input while pasting....
	paste=1
	clipboard=%clipboard%
	Loop, %id%
	  {
		this_id := id%A_Index%		
		if( this_id >0 ){
			WinActivate, ahk_id %this_id%			
			SendRaw, %clipboard%		
		}
	  }  
	paste=0
	ControlSetText, Edit2, 

return

Locate:  
     Gosub, Find 
     Loop, %id%
     {
       this_id := id%A_Index%
	   if( this_id >0){
		WinActivate, ahk_id %this_id%,
		 ; PostMessage, 0x112, 0xF020,,, ahk_id %this_id%,
 		 ; PostMessage, 0x112, 0xF120,,, ahk_id %this_id%,
		}
      }  
return 

Find:
  gui, Submit, nohide
  if( title != "")
  {
     WinGet,id, list, %title%
     notPutty := 0
     Loop, %id%
     {
       this_id := id%A_Index%
		WinGet, name, ProcessName, ahk_id %this_id%,
		if(name != "putty.exe"){
		  notPutty++
		  id%A_Index%=""
		}
      }
     found := id - notPutty
     GuiControl, , Static2,  % "found " found " window(s)"
  }
  else
  {
   id=""
   GuiControl, , Static2,   found 0 window(s)
  }


Alpha:
  GuiControlGet, alpha, ,msctls_trackbar321
  Loop, %id%
  {
    this_id := id%A_Index%	
	if(id%A_Index% >0){
	  WinSet, Transparent, %alpha%, ahk_id %this_id%
	}   
   }
 return
