GetRobloxPIDs() {
    PIDsString := ""
    PIDList := {}
    Process, Exist, RobloxPlayerBeta.exe
    if (ErrorLevel) {
        if !PIDList.HasKey(ErrorLevel) {
            PIDList[ErrorLevel] := true
            PIDsString .= ErrorLevel . ", "
        }
    }
    WinGet, winList, List, Roblox
    Loop, % winList
    {
        currentWindow := winList%A_Index%
        WinGet, pid, PID, ahk_id %currentWindow%
        WinGetTitle, title, ahk_id %currentWindow%
        if (title = "Roblox") {
            if (pid) {
                if !PIDList.HasKey(pid) {
                    PIDList[pid] := true
                    PIDsString .= pid . ", "
                }
            }
        }
    }
    Process, Exist, "Roblox Game Client"
    if (ErrorLevel) {
        if !PIDList.HasKey(ErrorLevel) {
            PIDList[ErrorLevel] := true
            PIDsString .= ErrorLevel . ", "
        }
    }
    if (PIDsString != "") {
        PIDsString := SubStr(PIDsString, 1, -2)
    } else {
        PIDsString := "No Roblox process found"
    }
    FileDelete, RobloxPID.log
    FileAppend, % PIDsString, RobloxPID.log, UTF-8
    return PIDsString
}

RunExtraConf() {
    if (FileExist("extra.ahk")) {
        #Include extra.ahk
    } else {
    }
}

RunAdjust() {
    if (FileExist("cfg.ahk")) {
        #Include cfg.ahk
    } else {
        MsgBox, File: "cfg.ahk" was not found. Make one and input AHK code
    }
}

ToggleRobloxPIDs() {
    PIDsString := GetRobloxPIDs()

    static msgBoxShown := false

    if (!FileExist("log.exe")) {
        if (!msgBoxShown) {
            MsgBox, % "PIDs: " . PIDsString
            msgBoxShown := true
        }
    }
	
    if (PIDsString != "No PIDs found!") {
        Loop, Parse, PIDsString, `,
        {
            pid := A_LoopField
            WinActivate, ahk_pid %pid%
            RunAdjust()
        }
    }
	else {
        MsgBox, No PIDs to toggle through!
    }
}

GetRobloxPIDs()


logTitle := "Log Viewer"
autoLog := "log.exe"
    If FileExist(autoLog)
    {
        Run, %autoLog%
    }
Else
{
        MsgBox, File: "log.exe" was not found. But that's okay as there's a built in log, it's bad tho :p
        MsgBox, F1 to activate `nF2 to terminate`nF5 to reload
}

FileDelete, RobloxPID.log
FileAppend, F1 to activate `nF2 to terminate`nF5 to reload, RobloxPID.log, UTF-8

F1::
    toggle := !toggle
    if (toggle) {
        SetTimer, ToggleRobloxPIDs, 10
    } else {
        SetTimer, ToggleRobloxPIDs, Off
    FileDelete, RobloxPID.log
    FileAppend, Process paused, RobloxPID.log, UTF-8
    }
return
F2::
Winkill, %logTitle%
FileDelete, RobloxPID.log
ExitApp

F3::
    boggle := !boggle
    if (boggle) {
        SetTimer, Spam_Extra, 10
    } else {
        SetTimer, Spam_Extra, Off
    }
return
Spam_Extra:
    RunExtraConf()
return

F5::
Winkill, %logTitle%
    Reload
return

XButton2::
RunExtraConf()
return
