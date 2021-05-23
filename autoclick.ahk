Menu, Tray, Tip , AutoHotkey Auto Clicker - DPX

; header menu
Menu, Tray, Add, Show hotkeys list, showHotkeysList
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


; Hotkeys List GUI
Gui, Font, s13
Gui 1:Add, Text, ,
(
F1: Show this menu
F3: Toggle pause and suspend everyting (can only be re-activated from tray icon)
F5: Exit
)

Return

; Hotkeys

*F1::
    Gosub, showHotkeysList
    return
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
