Menu, Tray, Tip , AutoHotkey Auto Clicker - DPX

; header menu
Menu, Tray, Add, Show hotkeys list, placeholder
Menu, Tray, Add

; Mode Submenu
Menu, ModeMenu, Add, toggle rapid click, placeholder
Menu, ModeMenu, check, toggle rapid click
Menu, ModeMenu, Add, Rapid click on click, placeholder

Menu, Tray, Add, Mode, :ModeMenu
Menu, Tray, Add

;footer menu
Menu, Tray, Add, Toggle Pause&Suspend everything, togglePauseAndSuspend
Menu, Tray, Add, Exit, exitAppSub

Menu, Tray, NoStandard

Return

; Hotkeys

*F3::
    Gosub, togglePauseAndSuspend
    return
*F5::
    Gosub, exitAppSub
    return

; Subs

placeholder:
    TrayTip placeholder, placeholder.
return

togglePauseAndSuspend:
    Suspend Toggle
    Pause Toggle, 1
    Menu, Tray, ToggleCheck, Toggle Pause&Suspend everything
    return

exitAppSub:
    ExitApp
    return
