# MultiRoblox
A script meant for AFK farming on Roblox games using multiple instances
=====================================================

### Overview
MultiRoblox is a mini project developed by @WhatAVibe (Discord) for automating Roblox game farming using multiple instances. It's designed to work alongside Roblox Account Manager or other tools that manage multiple Roblox windows under the same name.

### Requirements
To run the script, you'll need the following files:
* `Multi.exe` (written in AutoHotkey)
* `log.exe` (written in Python)

You can remove the `log.exe` file if you don't want to display the log window. The script will still function without it.

### Features
* F1 to run the script and have it loop through the open Roblox windows with the name "Roblox" or "Roblox Game Client"
* File `cfg.ahk` is what will be executed on each window before switching to the next one
* Repeat scripts in the `extra.ahk` file by pressing F3 or using the Mouse3/Forward button.
* Close the script and log.exe by pressing F2.
* Reload the script entirely by pressing F5.

### Notes
* Your antivirus "may" flag the files as potential viruses due to their behavior, but this is known as a false positive. 
* The log file is larger than the actual script due to compiling extra libraries, allowing users to run the script without installing additional software.

### Support
If you have any questions or concerns, feel free to reach out to @WhatAVibe on Discord for assistance.
