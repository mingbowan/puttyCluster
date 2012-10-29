Gui, Add, Text,, Windows Title Pattern (RegEx):
Gui, Add, Edit,  vtitle w200 , 
Gui, Add, Text,, found 0 window(s)
Gui, Add, button, X130 y50 gLocate -default, locate window(s)
Gui, Add, Text, x10, Window transparency:
GUI, Add, Slider, x10 Range120-255 w200 gAlpha, 255
Gui, Add, Text,x10 vignore w100, cluster input:
Gui, Add, Edit,x10 WantTab ReadOnly, 
Gui, +AlwaysOnTop

Gui, Show, h185 w250, Mingbo's cluster Putty
onMessage(0x100,"key")  ; key down
onMessage(0x101,"key")  ; key up


SetTimer, Find , 200
SetTitleMatchMode, RegEx 

key(wParam, lParam,msg, hwnd)
{ 
  GuiControlGet, currentInput, Focus
  
  if(currentInput="Edit2"){
	  ControlGet, title, Line,1, Edit1,
	  GuiControl,,Edit2, 
	  if (title=""){
		 return
	  } 		
	  SetTitleMatchMode, RegEx   
	  WinGet,id, list, %title%
	  Loop, %id%
	  {
		this_id := id%A_Index%
		WinGet, name, ProcessName, ahk_id %this_id%,
		if(name = "putty.exe"){
		  PostMessage, %msg%,%wParam%, %lParam%  , ,ahk_id %this_id%,
		}
		
	  } 
   }
}


return 


GuiClose:
ExitApp

Locate:
  gui, Submit, nohide
  if( title != "")
  {
     WinGet,id, list, %title%
     notPutty := 0
     Loop, %id%
     {
       this_id := id%A_Index%
		WinGet, name, ProcessName, ahk_id %this_id%,
		if(name == "putty.exe"){
		  PostMessage, 0x112, 0xF020,,, ahk_id %this_id%,
 		  PostMessage, 0x112, 0xF120,,, ahk_id %this_id%,
		}
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
		}
      }
     found := id - notPutty
     GuiControl, , Static2,  % "found " found " window(s)"
  }
  else
  {
   GuiControl, , Static2,   found 0 window(s)
  }


Alpha:
  GuiControlGet, alpha, ,msctls_trackbar321
  gui, Submit, nohide

  if (title =""){
     return
  }  
  SetTitleMatchMode, RegEx
  WinGet,id, list, %title%

  Loop, %id%
  {
    this_id := id%A_Index%
	WinGet, name, ProcessName, ahk_id %this_id%,
	if(name != "putty.exe"){
	  continue
	}
    WinSet, Transparent, %alpha%, ahk_id %this_id%
   }

