Menu, Tray, Tip , AutoHotkey Auto Clicker - DPX

#MaxThreadsPerHotkey 3

clickDelay := 10

; header menu
Menu, Tray, Add, Show hotkeys list, showHotkeysList
Menu, Tray, Add

; Mode Submenu
Menu, ModeMenu, Add, toggle rapid click, switchModeToggle
Menu, ModeMenu, check, toggle rapid click
Menu, ModeMenu, Add, Rapid click on click, switchModeOnClick

Menu, Tray, Add, Mode, :ModeMenu
Menu, Tray, Add

;footer menu
Menu, Tray, Add, Toggle Pause&Suspend everything, togglePauseAndSuspend
Menu, Tray, Add, Exit, exitAppSub

Menu, Tray, NoStandard


; Hotkeys List GUI
Gui, Font, s13
Gui 1:Add, Text, ,
(
F1: Show this menu
F2: Toggle Clicker
F3: Toggle pause and suspend everyting (can only be re-activated from tray icon)
F5: Exit

Ctrl + Shift + 1 : Show mode submenu
)

Return

; Hotkeys

*F1::
    Gosub, showHotkeysList
    return
*F2::
    Gosub, toggleAutoClicking
    return
*F3::
    Gosub, togglePauseAndSuspend
    return
*F5::
    Gosub, exitAppSub
    return

^+1::
    Menu, ModeMenu, Show
    return

; Subs

placeholder:
    TrayTip, placeholder, placeholder.
return

toggleAutoClicking:
    Toggle := !Toggle
    toggleString := Toggle ? "ON" : "OFF"
    TrayTip, Auto Clicking %toggleString%, F2 to toggle`, F5 to panic quit
    Loop
    {
        If (!Toggle)
            Break
        Click
        Sleep clickDelay
    }
return

switchModeOnClick:
    TrayTip, Mode Switched, Mode Switched to: Rapid Click On click.
    Gosub, uncheckAll
    Menu, ModeMenu, check, Rapid click on click
    return
switchModeToggle:
    TrayTip, Mode Switched, Mode Switched to: Toggle Rapid Click.
    Gosub, uncheckAll
    Menu, ModeMenu, check, toggle rapid click
    return

uncheckAll:
    Menu, ModeMenu, uncheck, toggle rapid click
    Menu, ModeMenu, uncheck, Rapid click on click
    return

showHotkeysList:
    Gui 1:Show, ,Hotkeys List
    return

togglePauseAndSuspend:
    Suspend Toggle
    Pause Toggle, 1
    Menu, Tray, ToggleCheck, Toggle Pause&Suspend everything
    return

exitAppSub:
    ExitApp
    return
