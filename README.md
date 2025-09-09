# MultiRoblox
A script meant for afk farming on Roblox games using multiple instances
This is a mini project developed by @WhatAVibe (Discord)
All you need to run is the Multi.exe(everything except the log and the extra.ahk file are required)
If you don't want the log window or just simply don't trust it you can simply remove it and it will work fine
It's just a little something extra I cooked for display purposes
The Multi.exe is written in AutoHotkey and the log.exe is written in Python for those curious
The whole thing is straight forward when ran
The script is meant to be used along side Roblox Account Manager or anything else that uses multiple roblox windows under the same name
It looks for open windows with the name "Roblox" or "Roblox Game Client"
It then waits for you to press the hotkey (F1) and will cycle between the applications activating whatever script you've put inside the cfg.ahk
There's an extra feature I made where you can press F3 to repeat whatever's in the extra.ahk and Mouse3/Forward on mouse to run that script once
You can just leave the extra.ahk blank if you don't want to use that feature or delete the file entirely.
Pressing F2 will close the log.exe(If present) and the script itself.
Pressing F5 will reload the script entirely for if you've changed anything inside any of the files
Though your antivirus might not flag the files they might come up as a potential virus, this is what's known as a false positive. 
This tends to happen due to how some files might work
In my case it might be the fact when ran the files are looking for something (A log file that the scripts use to communicate(display info on UI/show Roblox IDs))
Or maybe the fact it does read open applications but only targets Roblox itself.
if you have any questions please feel free to ask me on discord and I will try to reach back whenever I can.
The reasoning for the log file being significantly bigger than the actual script itself (Even though the AHK is 3,013 characters and the Python is 2,922 characters(currently)) 
Is due to the fact it's compiling extra libraries so users won't have to have Python or anything else installed to ran
