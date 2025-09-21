
; 20200630 - read selection file to mark on gui
; 20200910 - read from gui 76 edit
; 20210613 - setSpeed for looping
; 20210728 - amend for 12 racex
         ; - selection choice from gui
; 20210728 - amend for 12 racex
; 20210829 - add pause button
; %A_YYYY%0321 - add checkbox
; %A_YYYY%0425 - add follow checkbox
; %A_YYYY%0518 - lime to unselected value
; %A_YYYY%0625 - lime to checkbox

#SingleInstance, Force
#KeyHistory, 0
SetBatchLines, -1
ListLines, Off
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
SetWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptName, , , , thisscriptname
#MaxThreadsPerHotkey, 1 ; no re-entrant hotkey handling

;====================================================== 

set_date = |01|02|03|04|05|06|07|08|09|10||11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|
set_mth = |01||02|03|04|05|06|07|08|09|10|11|12|

tahun = 2025

threeOneNine = 319

; Gui Show coord ____________________________________________________________________________

gui_xpos = -1

gui_ypos = -800

; ____________________________________________________________________________

; gui_xpos = -1936

; gui_ypos = -800

guiId := 11

Gui, %guiId%:Color, black, black
Gui, %guiId%:Margin, 0, 0

Gui, %guiId%:Add, Text, x60 y0 h730 0x11   ;Vertical Line > Etched Gray ..... for right column line
Loop, 5
   {
   Gui, %guiId%:Add, Text, xp+%threeOneNine% yp+0 hp+0 0x11   ;Vertical Line > Etched Gray
   }

Gui, %guiId%:Add, Text, x310 y0 h730 0x11   ;Vertical Line > Etched Gray ..... for left column line
Loop, 4
   {
   Gui, %guiId%:Add, Text, xp+%threeOneNine% yp+0 hp+0 0x11   ;Vertical Line > Etched Gray
   }

;====================================================== 

Gui, %guiId%:Add, Text, x1 y45    w1918 0x10   ;Horizontal Line 
Gui, %guiId%:Add, Text, x1 y363   w1918 0x10   ;Horizontal Line 
Gui, %guiId%:Add, Text, x1 y411   w1918 0x10   ;Horizontal Line 
Gui, %guiId%:Add, Text, x1 y725   w1918 0x10   ;Horizontal Line 

;====================================================== 


;================================================================== Race Label R 1-5

w_barrier_box = 130
h_barrier_box = 40

xinit_barrier_box = 100
yinit_barrier_box = 5
xpos_barrier_box := threeOneNine
ypos_barrier_box = 0

Gui, %guiId%:Font, s30 bold, Arial
cntxt = 1
Gui, %guiId%:Add, Text, x%xinit_barrier_box% y%yinit_barrier_box% w%w_barrier_box% h%h_barrier_box% v1barrier cwhite +Center -E0x200 -VScroll, Rc %cntxt%
Loop, 4
   {
   cntxt += 1
   Gui, %guiId%:Add, Text, xp+%xpos_barrier_box% yp+%ypos_barrier_box% wp+0 hp+0 v%cntxt%barrier cwhite +Center -E0x200 -VScroll, Rc %cntxt%
   }

;------------------------------------------------------ check box rc1

w_chkbox = 35
h_chkbox = 14

xinit_chkbox = 2
yinit_chkbox = 55
xpos_spacing = 0
ypos_spacing = 22

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, x%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v1chkbx%cntt% cwhite +Center, %cntt%
rc1hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v1chkbx%cntt% cwhite +Center, %cntt%
   rc1hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ check box rc2

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v2chkbx%cntt% cwhite +Center, %cntt%
rc2hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v2chkbx%cntt% cwhite +Center, %cntt%
   rc2hs_num_chk%cntt% = 0
   }
   
;------------------------------------------------------ check box rc3

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v3chkbx%cntt% cwhite +Center, %cntt%
rc3hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v3chkbx%cntt% cwhite +Center, %cntt%
   rc3hs_num_chk%cntt% = 0
   } 

;------------------------------------------------------ check box rc4

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v4chkbx%cntt% cwhite +Center, %cntt%
rc4hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v4chkbx%cntt% cwhite +Center, %cntt%
   rc4hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ check box rc5

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v5chkbx%cntt% cwhite +Center, %cntt%
rc5hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v5chkbx%cntt% cwhite +Center, %cntt%
   rc5hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc1

w_chkbox = 20
h_chkbox = 14

xinit_chkbox = 40
yinit_chkbox = 55
xpos_spacing = 0
ypos_spacing = 22

cntt := 1
Gui, %guiId%:Add, Checkbox, x%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v1follow%cntt% cwhite +Center, 
rc1hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v1follow%cntt% cwhite +Center, 
   rc1hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc2

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v2follow%cntt% cwhite +Center, 
rc2hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v2follow%cntt% cwhite +Center, 
   rc2hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc3

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v3follow%cntt% cwhite +Center, 
rc3hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v3follow%cntt% cwhite +Center, 
   rc3hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc4

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v4follow%cntt% cwhite +Center, 
rc4hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v4follow%cntt% cwhite +Center, 
   rc4hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc5

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v5follow%cntt% cwhite +Center, 
rc5hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v5follow%cntt% cwhite +Center, 
   rc5hs_follow_chk%cntt% = 0
   }

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

;------------------------------------------------------ tkt box race 1-5

w_tkt_box  = 70   ; main width
h_tkt_box = 16   ; main height

xinit_wwtkt = 65  ; position for first xpos_wptkt
yinit_wwtkt = 52  ; position for first xpos_wptkt

next_xpos := threeOneNine   ; x position for next ww column
next_ypos = 432   ; x position for next ww column

space_col_xpos = 0     ; x position for column box 2,3,4,5,6,7
space_row_ypos = 22    ; y spacing between each row

; ........... Tkt column ww top 1-5

Gui, %guiId%:Font, s10 

rc_box = 0
loop, 5
   {
   rc_box += 1
   hs_box = 1
   if (rc_box = 1)
      {
      Gui, %guiId%:Add, Edit, x%xinit_wwtkt% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   else
      {
      Gui, %guiId%:Add, Edit, xp+%next_xpos% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   }

; ........... Tkt column wp top 1-5

xpos_wptkt = -1200  ; position for first xpos_wptkt

Gui, %guiId%:Font, s10 
rc_box = 0
loop, 5
   {
   rc_box += 1
   hs_box = 1
   if (rc_box = 1)
      {
      Gui, %guiId%:Add, Edit, xp%xpos_wptkt% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   else
      {
      Gui, %guiId%:Add, Edit, xp+%next_xpos% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   }

; ........... Tkt column pp top 1-5

xpos_pptkt = -1200  ; position for first xpos_wptkt

Gui, %guiId%:Font, s10 
rc_box = 0
loop, 5
   {
   rc_box += 1
   hs_box = 1
   if (rc_box = 1)
      {
      Gui, %guiId%:Add, Edit, xp%xpos_pptkt% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   else
      {
      Gui, %guiId%:Add, Edit, xp+%next_xpos% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   }

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

;================================================================== Race label 6-10

w_barrier_box = 130
h_barrier_box = 40

xinit_barrier_box = 100
yinit_barrier_box = 30
xpos_barrier_box := threeOneNine
ypos_barrier_box = 0

Gui, %guiId%:Font, s30 bold, Arial
cntxt = 6
Gui, %guiId%:Add, Text, x%xinit_barrier_box% yp+%yinit_barrier_box% w%w_barrier_box% h%h_barrier_box% v6barrier cwhite +Center -E0x200 -VScroll, Rc %cntxt%
Loop, 5
   {
    cntxt += 1
    Gui, %guiId%:Add, Text, xp+%xpos_barrier_box% yp+%ypos_barrier_box% wp+0 hp+0 v%cntxt%barrier cwhite +Center -E0x200 -VScroll, Rc %cntxt%
   }

;------------------------------------------------------ check box rc6

w_chkbox = 35
h_chkbox = 14

xinit_chkbox   = 2
yinit_chkbox   = 419
xpos_spacing    = 0
ypos_spacing    = 22

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, x%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v6chkbx%cntt% cwhite +Center, %cntt%
rc6hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v6chkbx%cntt% cwhite +Center, %cntt%
   rc6hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ check box rc7

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v7chkbx%cntt% cwhite +Center, %cntt%
rc7hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v7chkbx%cntt% cwhite +Center, %cntt%
   rc7hs_num_chk%cntt% = 0
   }
   
;------------------------------------------------------ check box rc8

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v8chkbx%cntt% cwhite +Center, %cntt%
rc8hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v8chkbx%cntt% cwhite +Center, %cntt%
   rc8hs_num_chk%cntt% = 0
   } 

;------------------------------------------------------ check box rc9

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v9chkbx%cntt% cwhite +Center, %cntt%
rc9hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v9chkbx%cntt% cwhite +Center, %cntt%
   rc9hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ check box rc10

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v10chkbx%cntt% cwhite +Center, %cntt%
rc10hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v10chkbx%cntt% cwhite +Center, %cntt%
   rc10hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ check box rc11

xinit_chkbox := threeOneNine

Gui, %guiId%:Font, s10 
cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v11chkbx%cntt% cwhite +Center, %cntt%
rc11hs_num_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v11chkbx%cntt% cwhite +Center, %cntt%
   rc11hs_num_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc6

w_chkbox = 20
h_chkbox = 14

xinit_chkbox = 40
yinit_chkbox = 419
xpos_spacing = 0
ypos_spacing = 22

cntt := 1
Gui, %guiId%:Add, Checkbox, x%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v6follow%cntt% cwhite +Center, 
rc6hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v6follow%cntt% cwhite +Center, 
   rc6hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc7

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v7follow%cntt% cwhite +Center, 
rc7hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v7follow%cntt% cwhite +Center, 
   rc7hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc8

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v8follow%cntt% cwhite +Center, 
rc8hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v8follow%cntt% cwhite +Center, 
   rc8hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc9

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v9follow%cntt% cwhite +Center, 
rc9hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v9follow%cntt% cwhite +Center, 
   rc9hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc10

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v10follow%cntt% cwhite +Center, 
rc10hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v10follow%cntt% cwhite +Center, 
   rc10hs_follow_chk%cntt% = 0
   }

;------------------------------------------------------ follow check box rc11

xinit_chkbox := threeOneNine

cntt := 1
Gui, %guiId%:Add, Checkbox, xp+%xinit_chkbox% y%yinit_chkbox% w%w_chkbox% h%h_chkbox% v11follow%cntt% cwhite +Center, 
rc11hs_follow_chk%cntt% = 0
Loop, 13
   {
   cntt += 1
   Gui, %guiId%:Add, Checkbox, xp+%xpos_spacing% yp+%ypos_spacing% wp+0 hp+0 v11follow%cntt% cwhite +Center, 
   rc11hs_follow_chk%cntt% = 0
   }

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

;===================================================== tkt box race 6-10

w_tkt_box = 70    ; main width
h_tkt_box = 16     ; main height

xinit_wwtkt = 65  ; position for first xpos_wptkt
yinit_wwtkt = 416  ; position for first xpos_wptkt

next_xpos := threeOneNine   ; x position for next ww column
next_ypos = 286   ; x position for next ww column

space_col_xpos = 0     ; x position for column box 2,3,4,5,6,7
space_row_ypos = 22    ; y spacing between each row

; ........... Tkt column ww 6-10

Gui, %guiId%:Font, s10 

rc_box = 5
loop, 6
   {
   rc_box += 1
   hs_box = 1
         ; msgbox % rc_box " "  hs_box
   if (rc_box = 6)
      {
      Gui, %guiId%:Add, Edit,  x%xinit_wwtkt% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   else
      {
      Gui, %guiId%:Add, Edit, xp+%next_xpos% yp-%next_ypos% w%w_tkt_box% h%h_tkt_box% v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wwrow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   }

; ........... Tkt column wp 6-10

xpos_wptkt = -1519  ; position for first xpos_wptkt

Gui, %guiId%:Font, s10 
rc_box = 5
loop, 6
   {
   rc_box += 1
   hs_box = 1
   if (rc_box = 6)
      {
      Gui, %guiId%:Add, Edit, xp%xpos_wptkt% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   else
      {
      Gui, %guiId%:Add, Edit, xp+%next_xpos% yp-%next_ypos% w%w_tkt_box% h%h_tkt_box% v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%wprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   }

; ........... Tkt column pp 6-10

xpos_pptkt = -1519  ; position for first xpos_wptkt

Gui, %guiId%:Font, s10 
rc_box = 5
loop, 6
   {
   rc_box += 1
   hs_box = 1
   if (rc_box = 6)
      {
      Gui, %guiId%:Add, Edit, xp%xpos_pptkt% y%yinit_wwtkt% w%w_tkt_box% h%h_tkt_box% v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   else
      {
      Gui, %guiId%:Add, Edit, xp+%next_xpos% yp-%next_ypos% w%w_tkt_box% h%h_tkt_box% v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
      Loop, 13
         {
         hs_box += 1
         Gui, %guiId%:Add, Edit, xp+%space_col_xpos% yp+%space_row_ypos% wp+0 hp+0 v%rc_box%pprow%hs_box% cwhite +Center -E0x200 -VScroll, 
         }
      }
   }

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;====================================================================== 
;====================================================================== 
;====================================================================== navigation

Gui, %guiId%:Font, s15 wbold, Arial

Gui, %guiId%:Add, Text, cwhite   +Left w50 h33 x20 y730, Day  
Gui, %guiId%:Add, Edit, cwhite  vsite_dddd +Center w40 hp+0 xp+50 yp+0, 
Gui, %guiId%:Add, Text, cwhite   +Left w70 hp+0 xp+65 yp+0, Month  
Gui, %guiId%:Add, Edit, cwhite  vsite_mmmm +Center w50 hp+0 xp+70 yp+0, 
; Gui, %guiId%:Add, ComboBox, cwhite  vsite_mmmm  +Center  w60 xp+80 yp+0, %set_mth%
Gui, %guiId%:Add, Text, cwhite   +Left w60 hp+0 xp+65 yp+0, Venue
Gui, %guiId%:Add, Edit, cwhite  vsite_venue +Center w60 hp+0 xp+70 yp+0, 
Gui, %guiId%:Add, ComboBox,  vprc w55 xp+65 yp+0, 78||86|87|88|89|92|93
Gui, %guiId%:Add, Button, cwhite gf1 +Center w75 hp+0 xp+65 yp+0 Default, Start

Gui, %guiId%:Add, Button, grerun +Center w70 hp+0 xp+85 yp+0, New
Gui, %guiId%:Add, Button, ge_xit +Center w60 hp+0 xp+80 yp+0, X

Gui, %guiId%:Add, ComboBox,  vsetSpeed w80 xp+65 yp+0, 5|8|||10|100|1000
Gui, %guiId%:Add, Progress, vprogressStatus BackgroundRed Range0-60 clime w100 hp+0 xp+92 yp+0,
Gui, %guiId%:Add, Button, gpause_gui +Center w60 hp+0 xp+120 yp+0, ||

Gui, %guiId%: +Caption
Gui, %guiId%: Show, x%gui_xpos% y%gui_ypos% w1920 , ShowTktBox

;====================================================== 

sleep, 250

ControlGet, var_ddd, Choice,, ComboBox1, Set_Selection
ControlGet, var_mmm, Choice,, ComboBox2, Set_Selection
ControlGet, var_vne, Choice,, ComboBox3, Set_Selection
; MsgBox % var_ddd " - " var_mmm
GuiControl, %guiId%:, site_mmmm, % var_mmm
GuiControl, %guiId%:, site_dddd, % var_ddd
GuiControl, %guiId%:, site_venue, % var_vne

rc1hs = 0
rc2hs = 14
rc3hs = 28
rc4hs = 42
rc5hs = 56
rc6hs = 70
rc7hs = 84
rc8hs = 98
rc9hs = 112
rc10hs = 126
rc11hs = 140
rc11hs = 154

ControlGet, OutputVar1, Line,1, Edit1, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar1, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 1chkbx%this_number%
      rc1hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar2, Line,1, Edit3, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar2, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 2chkbx%this_number%
      rc2hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar3, Line,1, Edit5, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar3, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 3chkbx%this_number%
      rc3hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar4, Line,1, Edit7, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar4, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 4chkbx%this_number%
      rc4hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }
      
ControlGet, OutputVar5, Line,1, Edit9, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar5, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 5chkbx%this_number%
      rc5hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar6, Line,1, Edit11, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar6, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 6chkbx%this_number%
      rc6hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar7, Line,1, Edit13, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar7, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 7chkbx%this_number%
      rc7hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar8, Line,1, Edit15, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar8, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 8chkbx%this_number%
      rc8hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar9, Line,1, Edit17, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar9, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 9chkbx%this_number%
      rc9hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar10, Line,1, Edit19, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar10, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 10chkbx%this_number%
      rc10hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

ControlGet, OutputVar11, Line,1, Edit21, Set_Selection
field_ := ""
field_ := StrSplit(OutputVar11, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 caqua
      GuiControl, %guiId%:Font, 11chkbx%this_number%
      rc11hs_num_chk%this_number% = 1
      ; MsgBox, %this_number%
      }

;====================================================== red selection

ControlGet, OutputVarRed1, Line,1, Edit2, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed1, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 1chkbx%this_number%
      GuiControl, %guiId%:, 1chkbx%this_number%, 1
      ; rc1hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed2, Line,1, Edit4, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed2, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 2chkbx%this_number%
      GuiControl, %guiId%:, 2chkbx%this_number%, 1
      ; rc2hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed3, Line,1, Edit6, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed3, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 3chkbx%this_number%
      GuiControl, %guiId%:, 3chkbx%this_number%, 1
      ; rc3hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed4, Line,1, Edit8, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed4, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 4chkbx%this_number%
      GuiControl, %guiId%:, 4chkbx%this_number%, 1
      ; rc4hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed5, Line,1, Edit10, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed5, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 5chkbx%this_number%
      GuiControl, %guiId%:, 5chkbx%this_number%, 1
      ; rc5hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed6, Line,1, Edit12, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed6, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 6chkbx%this_number%
      GuiControl, %guiId%:, 6chkbx%this_number%, 1
      ; rc6hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed7, Line,1, Edit14, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed7, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 7chkbx%this_number%
      GuiControl, %guiId%:, 7chkbx%this_number%, 1
      ; rc7hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed8, Line,1, Edit16, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed8, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 8chkbx%this_number%
      GuiControl, %guiId%:, 8chkbx%this_number%, 1
      ; rc8hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed9, Line,1, Edit18, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed9, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 9chkbx%this_number%
      GuiControl, %guiId%:, 9chkbx%this_number%, 1
      ; rc9hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed10, Line,1, Edit20, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed10, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 10chkbx%this_number%
      GuiControl, %guiId%:, 10chkbx%this_number%, 1
      ; rc10hs_num_chk%this_number% = 1
      }

ControlGet, OutputVarRed11, Line,1, Edit22, Set_Selection
field_ := ""
field_ := StrSplit(OutputVarRed11, ".")
Loop % field_.MaxIndex()
      {
      this_number := field_[A_Index]
      Gui, %guiId%:Font, s10 cred
      GuiControl, %guiId%:Font, 11chkbx%this_number%
      GuiControl, %guiId%:, 11chkbx%this_number%, 1
      ; rc11hs_num_chk%this_number% = 1
      }

return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

f1::
start_again:
GuiControl, %guiId%:, site_venue, 3H ;////////////////////////////////////////
Gui, %guiId%:Submit, nohide


   URLe :="https://datas.riding168.com/edata?race_date=@-~-!&race_type=#&rc=$&m=HK&c=2&lu=0"
         StringReplace, URLe, URLe, @ , %site_dddd%
         StringReplace, URLe, URLe, ~ , %site_mmmm%
         ; StringReplace, URLe, URLe, ! , %A_YYYY%
         StringReplace, URLe, URLe, ! , %tahun%
         StringReplace, URLe, URLe, # , %site_venue%
         StringReplace, URLe, URLe, $ , 0                         
         ; msgbox,,, %URLe%

   WinHttpRequest(URLe, EatData := "", InOutHeaders := Headers(), "Timeout: 1`nNO_AUTO_REDIRECT")
   eathtml := EatData

   if (EatData != "")
      {
      ; msgbox,,msg_1, % eathtml, 1
      goto run_loop
      }
    else     
      {
      ; msgbox,,msg_1, empty data, 0.5
      sleep, 250
      goto f1
      }


   run_loop:
   rcloop := 1
   loop_var := 0
   loop, 12
      {  
      hsenum := 1
      loop, 14
         {
         GuiControl, %guiId%:, %rcloop%wwrow%hsenum%,
         GuiControl, %guiId%:, %rcloop%wprow%hsenum%,
         GuiControl, %guiId%:, %rcloop%pprow%hsenum%,

         RegExMatch(eathtml, "s)\\n(" rcloop ")\\t(" hsenum ")\\t([^0]\d+)\\t([0])\\t(" prc ")\\t(300)/(0)", ww_tkt)
         if (ww_tkt3 = "")
               {
               ww_tkt3 = 0
               }
               
         RegExMatch(eathtml, "s)\\n(" rcloop ")\\t(" hsenum ")\\t([0])\\t([^0]\d+)\\t(" prc ")\\t(0)/(100)", pp_tkt)
         if (pp_tkt4 = "")
               {
               pp_tkt4 = 0
               }

         RegExMatch(eathtml, "s)\\n(" rcloop ")\\t(" hsenum ")\\t([^0]\d+)\\t([^0]\d+)\\t(" prc ")\\t(300)/(100)", wp_tkt)
         if (wp_tkt3 = "")
               {
               wp_tkt3 = 0
               }

         if (ww_tkt3 != 0 || wp_tkt3 != 0 || pp_tkt4 != 0)
               {
               GuiControl, %guiId%:, %ww_tkt1%wwrow%ww_tkt2%, %ww_tkt3%
               GuiControl, %guiId%:, %wp_tkt1%wprow%ww_tkt2%, %wp_tkt3%
               GuiControl, %guiId%:, %pp_tkt1%pprow%ww_tkt2%, %pp_tkt4%
               if (rc%ww_tkt1%hs_num_chk%ww_tkt2% = 1) 
                  {
                  Gui, %guiId%:Font, s10 caqua
                  GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                  GuiControl, %guiId%:Font, %wp_tkt1%wprow%wp_tkt2%
                  GuiControl, %guiId%:Font, %pp_tkt1%pprow%pp_tkt2%
                  }                                     
               else if (%ww_tkt1%chkbx%ww_tkt2% = 0 && %ww_tkt1%follow%ww_tkt2% = 0)
                  {
                  Gui, %guiId%:Font, s10 cwhite
                  GuiControl, %guiId%:Font, %ww_tkt1%chkbx%ww_tkt2%
                  Gui, %guiId%:Font, s10 cGray
                  ; GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                  ; GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                  ; GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%

                     if (ww_tkt3 >= 1 && ww_tkt3 <= 14999)
                        {
                        ; Gui, %guiId%:Font, s10 cgray
                        Gui, %guiId%:Font, s10 ca9a9a9
                        GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                        GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                        GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%
                        }
                     else if (ww_tkt3 >= 15000)
                        {
                        Gui, %guiId%:Font, s10 clime
                        GuiControl, %guiId%:Font, %ww_tkt1%chkbx%ww_tkt2%
                        GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                        GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                        GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%
                        }
                  }                                      
               else if (%ww_tkt1%chkbx%ww_tkt2% = 1 && %ww_tkt1%follow%ww_tkt2% = 0)
                  {
                  Gui, %guiId%:Font, s10 cred
                  if (ww_tkt3 >= 1 && ww_tkt3 <= 14999)
                     {
                     Gui, %guiId%:Font, s10 ca9a9a9
                     GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                     GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                     GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%
                     }
                  else if (ww_tkt3 >= 15000)
                     {
                     GuiControl, %guiId%:Font, %ww_tkt1%chkbx%ww_tkt2%
                     GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                     GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                     GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%
                     }   
                  }                                   
               else if (%ww_tkt1%chkbx%ww_tkt2% = 0 && %ww_tkt1%follow%ww_tkt2% = 1)
                  {
                  Gui, %guiId%:Font, s10 cyellow
                  ; GuiControl, %guiId%:Font, %ww_tkt1%chkbx%ww_tkt2%
                  GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                  GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                  GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%
                  }                                   
               else if (%ww_tkt1%chkbx%ww_tkt2% = 1 && %ww_tkt1%follow%ww_tkt2% = 1)
                  {
                  Gui, %guiId%:Font, s10 cyellow
                  GuiControl, %guiId%:Font, %ww_tkt1%wwrow%ww_tkt2%
                  GuiControl, %guiId%:Font, %ww_tkt1%wprow%ww_tkt2%
                  GuiControl, %guiId%:Font, %ww_tkt1%pprow%ww_tkt2%
                  ; msgbox checkeddd
                  }
               loop_var++
               }
         hsenum++
         } 
      rcloop++
      }

val := 0
loop, 60
   {
   val := A_Index
   GuiControl, %guiId%:, progressStatus, % val   
   Gui, %guiId%:Submit, nohide
   sleep, %setSpeed%
   }

goto start_again

return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

reset:

rcloop = 0
loop, 12
   {
   rcloop ++
   hsloop = 0
   loop, 14
      {
      hsloop ++ 
      GuiControl, %guiId%:, %rcloop%wwrow%hsloop%,
      GuiControl, %guiId%:, %rcloop%wprow%hsloop%, 
      GuiControl, %guiId%:, %rcloop%pprow%hsloop%,
      }
   }

goto, start_again
return

;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

rerun:
Reload
return

pause_gui:
; Pause, Toggle, 1
Pause,,1 ;Pause script including all timer
return

GuiClose:
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
