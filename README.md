# AutoHotKey-KeywordExecutor
Bare skeletal dirty hack of plul's ahk v1 scripts (https://github.com/plul/Public-AutoHotKey-Scripts) ported to AHK V2
Too lazy to write in my own words, so I copied README from original author (plul) and modified the following text.

### What it is
Plul: This is a small GUI that allows you to run any normal AutoHotkey command or a block of code by typing a name for the command you want to run. I (plul) wrote this script because I was creating more and more hotkeys for various things, but I (plul) ran out of keys on my keyboard to assign hotkeys to. It is designed to be as minimal as possible.

Simoxyl: This repo is a dirty hack (and a reduced functionality) of the original repo that is available at https://github.com/plul/Public-AutoHotKey-Scripts. This one is ported to V2.

### How to use it
Run the `Host.ahk` file.

This entire script is build around the `CapsLock` key.
The GUI is activated by `CapsLock`+`Space`.
Normal `CapsLock` functionality is preserved, and can be toggled by `Alt`+`CapsLock`.

When typing something in the GUI, whatever you type, as you type, is matched up against the commands in `UserCommands.ahk`. These are normal AutoHotkey commands so you can and should write your own. I have supplied some sample commands to show some ideas. But it only becomes truly powerful once you customize it with commands to suit your specific needs.

##### Trying it out yourself
1. Make sure `Host.ahk` is running.
* Open the GUI with `CapsLock`+`Space`.
* Type `maps` into the GUI to open maps.google.com.
* Open the GUI again. Type `note` into the GUI to open Notepad.
* 

`UserCommands.ahk` file is where you would want to customize your handlers.

##### How to write your own commands
The variable `your_keyword` contains your text from the input field.

The first thing to do is often to hide the GUI and reset the input field. Do this by calling `gui_destroy()`.

After that, you can run any normal AHK block of code. If for example you have some program you use all the time, you can create a shortcut to that program by

    else if your_keyword = 'prog'
    {
        gui_destroy()
        run "C:\Program Files\Company\That awesome program.exe"
    }

That's it! now you can launch your favourite program by typing `prog` into the input field.


### Credits
All credits go to original author's repo at https://github.com/plul/Public-AutoHotKey-Scripts.
I just did a dirty hack to get it working for V2 with all other wonderful functionality removed. Sorry about that. I will be improving it overtime.

