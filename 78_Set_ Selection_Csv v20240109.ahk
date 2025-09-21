/*
20200630 - read selection file to mark on gui
20201110 - count selection
20210728 - amend for 12 races
20220425 - add monitor extra horse
20230327 - add download outsider from google sheet
*/

#SingleInstance, Force
#KeyHistory, 0
SetBatchLines, -1
ListLines, Off
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
SetWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptName, , , , thisscriptname
#MaxThreadsPerHotkey, 1 ; no re-entrant hotkey handling

set_date = dd||01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|
set_mth = %A_MM%||01|02|03|04|05|06|07|08|09|10|11|12|

; Gui Show coord ____________________________________________________________________________

gui_xpos = 0

gui_ypos = -980

; ____________________________________________________________________________


Gui, 78:Color, black, black
Gui, 78:Margin, 15, 15, 15, 15

; Gui, 78:Add, Text, x22 y0 h300 0x11   ;Vertical Line > Etched Gray
; Gui, 78:Add, Text, x633 y0 h300 0x11   ;Vertical Line > Etched Gray

;====================================================== 

; next_row_ypos   = 27
; loop, 10
; {
; Gui, 78:Add, Text, x1 yp+%next_row_ypos%    w200 0x10   ;Horizontal Line 
; }

;------------------------------------------------------ number row rc1_5

hs_box_width   = 35
hs_box_height  = 25

hs_row_xinit   = 2
hs_row_yinit   = 5
hs_row_xpos    = 285
hs_row_ypos    = 0

Gui, 78:Font, s15 bold, Arial
hnum := 1
Gui, 78:Add, Text, x%hs_row_xinit% y%hs_row_yinit% w%hs_box_width% h%hs_box_height% vnum%hnum% cwhite +Center, R%hnum%
Loop, 4
   {
   hnum += 1
   Gui, 78:Add, Text, xp+%hs_row_xpos% yp+%hs_row_ypos% wp+0 hp+0 vnum%hnum% cwhite +Center, R%hnum%
   }

;------------------------------------------------------ red number row rc1_5

hs_box_width   = 35
hs_box_height  = 25

hs_row_xinit   = 2
hs_row_yinit   = 30
hs_row_xpos    = 285
hs_row_ypos    = 0

Gui, 78:Font, s15 bold, Arial
hnum := 1
Gui, 78:Add, Text, x%hs_row_xinit% y%hs_row_yinit% w%hs_box_width% h%hs_box_height% vrednum%hnum% cred +Center, R%hnum%
Loop, 4
   {
   hnum += 1
   Gui, 78:Add, Text, xp+%hs_row_xpos% yp+%hs_row_ypos% wp+0 hp+0 vrednum%hnum% cred +Center, R%hnum%
   }

;------------------------------------------------------ selection row rc1_5

hs_box_width   = 240
hs_box_height  = 25

hs_row_xinit   = 40
hs_row_yinit   = 5
hs_row_xpos    = 285
hs_row_ypos    = -25

red_row_xinit   = 40
red_row_yinit   = 30
red_row_xpos    = 0
red_row_ypos    = 25

Gui, 78:Font, s15 bold, Arial
hnum := 1
Gui, 78:Add, Edit, x%hs_row_xinit% y%hs_row_yinit% w%hs_box_width% h%hs_box_height% vselection%hnum% caqua +Left, 
Gui, 78:Add, Edit, x%red_row_xinit% y%red_row_yinit% w%hs_box_width% h%hs_box_height% vredselection%hnum% cred +Left, 
Loop, 4
   {
   hnum += 1
   Gui, 78:Add, Edit, xp+%hs_row_xpos% yp%hs_row_ypos% wp+0 hp+0 vselection%hnum% caqua +Left, 
   Gui, 78:Add, Edit, xp+%red_row_xpos% yp+%red_row_ypos% wp+0 hp+0 vredselection%hnum% cred +Left,  
   }

;------------------------------------------------------ number column rc6

hs_box_width   = 35
hs_box_height  = 25

hs_row_xinit   = 2
hs_row_yinit   = 85
hs_row_xpos    = 285
hs_row_ypos    = 0

Gui, 78:Font, s15 bold, Arial
hnum := 6
Gui, 78:Add, Text, x%hs_row_xinit% y%hs_row_yinit% w%hs_box_width% h%hs_box_height% vnum%hnum% cwhite +Center, R%hnum%
Loop, 5
   {
   hnum += 1
   Gui, 78:Add, Text, xp+%hs_row_xpos% yp+%hs_row_ypos% wp+0 hp+0 vnum%hnum% cwhite +Center, R%hnum%
   }

;------------------------------------------------------ red number row rc6_11

hs_box_width   = 35
hs_box_height  = 25

hs_row_xinit   = 2
hs_row_yinit   = 110
hs_row_xpos    = 285
hs_row_ypos    = 0

Gui, 78:Font, s15 bold, Arial
hnum := 6
Gui, 78:Add, Text, x%hs_row_xinit% y%hs_row_yinit% w%hs_box_width% h%hs_box_height% vrednum%hnum% cred +Center, R%hnum%
Loop, 5
   {
   hnum += 1
   Gui, 78:Add, Text, xp+%hs_row_xpos% yp+%hs_row_ypos% wp+0 hp+0 vrednum%hnum% cred +Center, R%hnum%
   }

;------------------------------------------------------ selection row rc6_11

hs_box_width   = 240
hs_box_height  = 25

hs_row_xinit   = 40
hs_row_yinit   = 85
hs_row_xpos    = 285
hs_row_ypos    = -25

red_row_xinit   = 40
red_row_yinit   = 110
red_row_xpos    = 0
red_row_ypos    = 25

Gui, 78:Font, s15 bold, Arial
hnum := 6
Gui, 78:Add, Edit, x%hs_row_xinit% y%hs_row_yinit% w%hs_box_width% h%hs_box_height% vselection%hnum% caqua +Left, 
Gui, 78:Add, Edit, x%red_row_xinit% y%red_row_yinit% w%hs_box_width% h%hs_box_height% vredselection%hnum% cred +Left, 
Loop, 5
   {
   hnum += 1
   Gui, 78:Add, Edit, xp+%hs_row_xpos% yp%hs_row_ypos% wp+0 hp+0 vselection%hnum% caqua +Left, 
   Gui, 78:Add, Edit, xp+%red_row_xpos% yp+%red_row_ypos% wp+0 hp+0 vredselection%hnum% cred +Left,  
   }

;=========================================

Gui, 78:Add, Button, gauto_set +Center w130 h30 xp+260 yp-95, Auto Set
Gui, 78:Add, Button, ge_xit +Center w30 h30 xp+150 yp+0, X
Gui, 78:Add, ComboBox, vddd_set clime +Center w45 xp-150 yp+55, %set_date%
Gui, 78:Add, ComboBox, vmmm_set clime +Center w45 xp+55 yp+0, %set_mth%
Gui, 78:Add, ComboBox, vvne_set clime +Center w50 xp+60 yp+0, 3H||1S
Gui, 78:Add, Button, grerun78 +Center w50 h25 xp-115 yp+40, New
Gui, 78:Add, Button, gIns +Center w60 h25 xp+55 yp+0, Total
Gui, 78:Add, Edit, vselectionTotal clime +Center w50 hp+0 xp+65 yp+0, 

Gui, 78: +Caption
Gui, 78: Show, x%gui_xpos% y%gui_ypos%, Set_Selection

return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

auto_set:

; black_csv_78 := "https://docs.google.com/spreadsheets/d/e/2PACX-1vQUzYHuycnwsFix3k4v76cPIiNJQhlBvTVqj7LoHhsiq44KsEl4X4AQCEBxOGn2ibMp31D0fVLyjSDH/pub?gid=858004297&single=true&output=csv"
; whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
; whr.Open("GET", black_78_csv, true)
; whr.Send()
; whr.WaitForResponse()
; csv_78 := ""
; csv_78 := whr.ResponseText

; outsider_url := "https://docs.google.com/spreadsheets/d/e/2PACX-1vQUzYHuycnwsFix3k4v76cPIiNJQhlBvTVqj7LoHhsiq44KsEl4X4AQCEBxOGn2ibMp31D0fVLyjSDH/pub?gid=694473226&single=true&output=csv"
black_csv_78 := "https://docs.google.com/spreadsheets/d/e/2PACX-1vQUzYHuycnwsFix3k4v76cPIiNJQhlBvTVqj7LoHhsiq44KsEl4X4AQCEBxOGn2ibMp31D0fVLyjSDH/pub?gid=858004297&single=true&output=csv"
; outsiderListURL := black_csv_78

whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", black_csv_78, true)
whr.Send()
whr.WaitForResponse()
csv_78 := ""
csv_78 := whr.ResponseText

; MsgBox,,, % csv_78,

loop, 11
   {
   RegExMatch(csv_78, "r(" A_Index ")(.*)", hse_Data)
   ; msgbox % hse_Data
   StringSplit, hse_Data_field, hse_Data, `,
   StringReplace, hse_Data_field1, hse_Data_field1, r,
   ; msgbox % hse_Data_field1
   StringSplit, hse_field, hse_Data_field2, *,
   
   ; msgbox % hse_Data_field1 "`n" hse_field1 "`n" hse_field2

   GuiControl, 78:, selection%hse_Data_field1%, %hse_field1%
   GuiControl, 78:, redselection%hse_Data_field1%, %hse_field2%

   hse_Data_field1 := ""
   hse_field1 := ""
   hse_field2 := ""
   }

return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Ins::

selectCount := 0
totalSelection := 0

bluebox = 1
sleep, 1000
loop, 11
   {
   OutputVar%bluebox% := 0
   ControlGet, OutputVar%bluebox%, Line,1, Edit%bluebox%, Set_Selection
   countField_ := ""
   countField_ := StrSplit(OutputVar%bluebox%, ".")
   totalSelection += countField_.MaxIndex()
;    MsgBox, %  "bluebox`n" bluebox "`n" countField_.MaxIndex() "`n" totalSelection
   bluebox += 2
   }

GuiControl, 78:, selectionTotal, %totalSelection%  
return


;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

move_78gui: 
move_x := 0
move_y := 0
Gui, 78: Show, x%move_x% y%move_y%, Set_Selection
return

rerun78:
Reload
return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

78GuiClose:
e_xit:
ExitApp
return

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

RButton::Send,{Click,Right}
RButton & LButton::
;!LButton::

CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is Destroyled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return
