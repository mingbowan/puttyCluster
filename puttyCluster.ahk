Gui, Add, Text,, Windows Title Pattern (RegEx):
Gui, Add, Edit,  vtitle w200 , 
Gui, Add, Text,, found 0 window(s)
Gui, Add, Text,, Window transparency:
GUI, Add, Slider, Range120-255 w200 gAlpha, 255
Gui, Add, Text,, cluster input:
Gui, Add, Edit,readonly, 
Gui, +AlwaysOnTop
Gui, Add, button, X150 y155 gLocate, locate window(s)
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
		if (title=""){
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
		PostMessage, %msg%,%wParam%, %lParam%  , ,ahk_id %this_id%,
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

