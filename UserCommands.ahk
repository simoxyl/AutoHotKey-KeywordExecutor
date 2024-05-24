; Created by Asger Juul Brunshøj
; Dirty hack for AHK V2 by NVED

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. 
; Take inspiration from the samples provided here.
; 
; What you enter in the text box is captured in your_keyword. 
; Always call gui_destroy() before doing something AHK.
; Because this search is done as you type in the box
; you may want to choose to terminate some substrings with a space or other characters. 
; For examples if you want to handle both 'doc' and 'docs' separately, then give a space for doc as in 'doc ', 
; otherwise execution below will never execute 'docs'

if your_keyword = 'note'
{
    gui_destroy()
    Run "Notepad"
}
else if your_keyword = 'maps' ; Google Maps focused on the Technical University of Denmark, DTU
{
    gui_destroy()
    Run "https://www.google.com/maps/place/Delft/@51.9995806,4.3224983,13z"
}
else if your_keyword = ':rel'
{
    gui_destroy()
    Reload
}
else
{
    ;DO NOTHING
    ;all unknown commands are run with firefox
    ; Run Format('firefox.exe "{1}"', your_keyword)
}

; A lot of functionality from original author is stripped. 
; Feel free to refer to https://github.com/plul/Public-AutoHotKey-Scripts