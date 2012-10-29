puttyCluster
============

putty cluster / multi-session / multi-window input

Simple AutoHotkey script to enable sending input to multiple putty window simultaneously.

<h3>Features:</h3>
<ol>
   <li>Send input to multiple putty window simultaneously, missing part in PuTTYCS (PuTTY Command Sender)</li> 
   
   <li>support sending special/function keys like "Control-C", "Escape" etc.</li>
   
   <li>Can adjust Window's transparency to make putty window looks a little bit fancy :)</li>
   
   <li>Can locate windows, you can find all your windows even some of them are minimized</li>

--------------------------

If you only need the fuction, download the exe version (64 bit, i don't have 32 bit Windows, sorry) --- single file no installation needed. it's a green software :) 

if you want source code, download puttyCluster.ahk. You need install AutoHotkey to run the script.

for regex syntax, here's reference: http://www.autohotkey.com/docs/misc/RegEx-QuickRef.htm

to select windows with different pattern, using (pattern1)|(patern2)|.... , example:

(.*myUser1.*)|(.*host2.*)