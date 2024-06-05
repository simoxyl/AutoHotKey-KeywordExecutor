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
        editCtrl := myGUI.Add('Edit', 'vSkull r1 w220', "")
        myGUI.OnEvent("Escape", GuiEscape)
        myGUI.OnEvent("Close", GuiEscape)
        editCtrl.OnEvent("Change",Findus)
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
            ; the following command will include and run
            #Include %A_ScriptDir%\UserCommands.ahk
        }

        ;
        ; gui_destroy: Destroy the GUI after use.
        ;
        #WinActivateForce
        gui_destroy() {
            myGUI.Destroy()
            ; Bring focus back to another window found on the desktop
            ;TODO: this seem to give an error
            ;WinActivate
        }           
}
