#puttyCluster
putty cluster / multi-session / multi-window input

Simple AutoHotkey script to enable sending input to multiple putty window simultaneously.

### Features

* Send input to multiple putty windows simultaneously, missing part in PuTTYCS (PuTTY Command Sender)
* select windows by Putty Window title, support regular expression 
* support sending special/function keys like "Control-C", "Escape" etc.
* Adjust Window's transparency to make putty window looks a little bit fancy :)   
* Locate windows, you can find all your windows even some of them are minimized
* paste to mulitple windows
* tile or cascade selected windows

### install

* Download the exe version (64 bit, i don't have 32 bit Windows, sorry) --- single file no installation needed. it's a green software :) 
* If you prefer source code (using autohotkey), download puttyCluster.ahk. You need install AutoHotkey (http://www.autohotkey.com/) to run the script.

### Usage
(https://raw.github.com/mingbowan/puttyCluster/master/screenshot.PNG)
* run the executable or the script if you installed autohotkey 
* at "Windows Title Pattern (RegEx)", input the common pattern for the windows you want cluster input. eg: ec2   -- this will match all windows title contain ec2. and you can tell how many windows matches
* focus at "cluster input", then hit keyboard, you will find all windows have same input, at same time
* if you cannot find all you matched window, click on "locate window(s)", and if you want to see through you window (make them transparent), try the slider
* when you have data in clipboard, you can click on "paste clipboard" to paste to all selected windows one by one --- before paste finished, no input available and please wait
* you can tile or cascade selected windows by clicking on "tile" or "cascade" button, you can specify windows size before doing so
   
### Misc./Other info

* for regex syntax, here's reference: http://www.autohotkey.com/docs/misc/RegEx-QuickRef.htm
* in most cases, you only need a common string shared by putty windows title to select them
* to select windows with different pattern, using (pattern1)|(patern2)|.... , for example:  (.*myUser1.*)|(.*host2.*)

### license
* free as in free beer and free as in free speech
* use at your own risk