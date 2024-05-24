; Created by Asger Juul Brunshøj
; Dirty hack for v2 by NVED

#SingleInstance

SetCapsLockState "AlwaysOff"


; Allow normal CapsLock functionality to be toggled by Alt+CapsLock:
!CapsLock::
{
    capsstate := GetKeyState('CapsLock', 'T') ;(T indicates a Toggle. capsstate is an arbitrary varible name)
    if capsstate = 0
        SetCapsLockState "AlwaysOn"
    else
        SetCapsLockState "AlwaysOff"
}

; GUI with CAPS LOCK

CapsLock & Space::
{
        myGUI := Gui()
        myGUI.MarginX := 16
        myGUI.MarginY := 16
        myGUI.BackColour := 0x000000
        MyGui.Opt("+AlwaysOnTop -SysMenu +Owner -Caption")  
        myGUI.SetFont("s10", "Segoe UI")
        myGUI.Add('Text', ,"¯\_(ツ)_/¯")
        editCtrl := myGUI.Add('Edit', 'vSkull r1 w220', "sharepoint")
        myGUI.OnEvent("Escape", GuiEscape)
        myGUI.OnEvent("Close", GuiEscape)
        editCtrl.OnEvent("Change",Findus)
        ;MyGui.Add("Button", "default", "OK").OnEvent("Click", Findus)
        myGUI.Show()

        ;-------------------------------------------------------------------------------
        ; GUI FUNCTIONS AND SUBROUTINES
        ;-------------------------------------------------------------------------------
        ; Automatically triggered on Escape key:
        GuiEscape(*)
        {
            gui_destroy()
        }

        ; The callback function when the text changes in the input field.
        Findus(*)
        {
            Saved := myGUI.Submit(false)
            your_keyword := Saved.Skull
            #Include %A_ScriptDir%\UserCommands.ahk
            ;MsgBox('Saved.Skull')
            ;gui_destroy()
        }

        ;
        ; gui_destroy: Destroy the GUI after use.
        ;
        #WinActivateForce
        gui_destroy() {
            global gui_state
            global gui_search_title
            ; Forget search title variable so the next search does not re-use it
            ; in case the next search does not set its own:
            gui_search_title :=

            ; Clear the tooltip
            ; Gosub gui_tooltip_clear

            ; Hide GUI
            myGUI.Destroy()

            ; Bring focus back to another window found on the desktop
            ;NVED TODO: this seem to give an error
            ;WinActivate
        }           
}
