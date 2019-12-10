/*
======================================================================================

  | |     RebelScumHQ - Echo Base Evacuated. New HQ at Haven (rendezvous point)     | |

======================================================================================
*/

/*
======================================================================================
========== Includes Section.  All the things!! =========== start ┻━┻︵ \(°□°)/ ︵ ┻━┻
======================================================================================
*/


/*
======================================================================================
;;Other Header Stuff
======================================================================================
*/

;Reload only, no exitapps here.
LWin & F12::Reload



Gcoor( p_col, p_row )
{
return % "x" ( p_col - 1 ) * 122 + 2 " y" ( p_row - 1 ) * 22 + 2 " h20 w120 " 
}
return

/*
======================================================================================
;;GUI Box
======================================================================================
*/

LWIN & `::

gui, font, s8, Roboto
;;
gui, add, button, % Gcoor(1,1) "gIFERRORfill", IFERROR() fill  ;;when creating the subroutine remember to leave off the g.
gui, add, button, % Gcoor(2,1) "gRound2Fight", Round 2, FIGHT!
;;
gui, add, button, % Gcoor(1,2) "gbraveWinSize", brave
gui, add, button, % Gcoor(2,2) "gexcelWinSize", excel
;;
gui, add, button, % Gcoor(1,3) "gnotepadWinSize", notepad++
gui, add, button, % Gcoor(2,3) "gwebCaptionerSetup", webCaptionerSetup
;;

gui, show, x85 y100 w249, RebelScumHQ

return

;;-----------------------------------------------------------------------------------------
;;set Brave window size
;;-----------------------------------------------------------------------------------------

braveWinSize:

If WinExist("ahk_exe brave.exe")
{
	Winactivate, ahk_exe brave.exe
	WinMove, ahk_exe brave.exe, , 0, 0, 1080, 800
}
else
{
	Run, %A_WorkingDir%\shortcuts\Brave.lnk
	Winactivate, ahk_exe brave.exe
	WinMove, ahk_exe brave.exe, , 0, 0, 1080, 800
}

return


;;-----------------------------------------------------------------------------------------
;;set Excel window size
;;-----------------------------------------------------------------------------------------

excelWinSize:
If WinExist("ahk_class XLMAIN")
{
	Winactivate, ahk_class XLMAIN
	WinMove, ahk_class XLMAIN, , 0, 0, 1080, 800
}
else
{
	Run, %A_WorkingDir%\shortcuts\Excel.lnk
	Winactivate, ahk_class XLMAIN
	WinMove, ahk_class XLMAIN, , 0, 0, 1080, 800
}

return


;;-----------------------------------------------------------------------------------------
;;set notepad++ window size
;;-----------------------------------------------------------------------------------------

notepadWinSize:
If WinExist("ahk_class Notepad++")
{
	Winactivate, ahk_class Notepad++
	WinMove, ahk_class Notepad++, , 0, 0, 930, 800
}
else
{
	Run, %A_WorkingDir%\shortcuts\Notepad++.lnk
	Winactivate, ahk_class Notepad++
	WinMove, ahk_class Notepad++, , 0, 0, 930, 800
}

return


;;-----------------------------------------------------------------------------------------
;;setup webCaptioner 347 249 "Captions (Windowed) - Google Chrome"
;;-----------------------------------------------------------------------------------------

webCaptionerSetup:
If WinExist("Captions (Windowed) - Google Chrome")
{
	Winactivate, Captions (Windowed) - Google Chrome
	WinMove, Captions (Windowed) - Google Chrome, , -500, 100, 340, 249
}
else
{

}

return


;;-----------------------------------------------------------------------------------------
;;play Nicola and Bart
;;-----------------------------------------------------------------------------------------
NicolaAndBart:
{
run, https://youtu.be/b9DsWSgkLTc?t=50s
}
return


;;-----------------------------------------------------------------------------------------
;;play "everybody betray me, I'm fed up with this world"
;;-----------------------------------------------------------------------------------------
EverybodyBetrayMe:
{
SoundSet, 75
run, https://youtu.be/DxWkfJ4uvV0
}
return


;;-----------------------------------------------------------------------------------------
;;pull up Volume Control
;;-----------------------------------------------------------------------------------------
VolumeControl:
{
CoordMode, Menu, Screen
SetTitleMatchMode RegEx
run SndVol.exe
WinWait, Volume Mixer*
WinMove, Volume Mixer*,, 150, 80
CoordMode, Relative
}
return

;;-----------------------------------------------------------------------------------------
;;This is an automatic IFERROR(formulae,"") filler
;;-----------------------------------------------------------------------------------------
IFERRORfill:
{
	SetKeyDelay, 20
	WinActivate, ahk_class XLMAIN
	Send, {F2}
	Send, ^{home}
	Send, {right}
	Send, IFERROR(
	Send, ^{end}
	Send, ,"")
	Send, {enter}
	SetKeyDelay, 10
}
return


;;-----------------------------------------------------------------------------------------
;;This is an automatic ROUND(formulae,2) filler
;;-----------------------------------------------------------------------------------------
Round2Fight:
{
	SetKeyDelay, 20
	WinActivate, ahk_class XLMAIN
	Send, {F2}
	Send, ^{home}
	Send, {right}
	Send, ROUND(
	Send, ^{end}
	Send, ,2)
	Send, {enter}
	SetKeyDelay, 10
}
return



;;-----------------------------------------------------------------------------------------
;; Close Notepads
;;-----------------------------------------------------------------------------------------
CloseNotepad:
While WinExist("ahk_class Notepad")
{
WinClose
}
return


;;-----------------------------------------------------------------------------------------
;;EXIT
;;-----------------------------------------------------------------------------------------
exit:
{
	Gui, Destroy
}
return




;;==========================================================================================
;;========  Shortcuts ============== start
;;==========================================================================================


LWIN & V::
GoSub, VolumeControl
return

LWIN & W::
Winset, Alwaysontop, , A
return


;;==========================================================================================
;;========  Shortcuts ============== end
;;==========================================================================================
