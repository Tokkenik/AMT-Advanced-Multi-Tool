echo off
color 0B
setlocal ENABLEDELAYEDEXPANSION
title AMT - Advanced Multi Tool
start /b curl -s -o nul https://api.countapi.xyz/hit/tokken/keystartA9C5ABC900

:killprocess
    cls
    :skipcls
    echo ===================================
    echo          Welcome to AMT
    echo ===================================
    echo.
    echo [1] Show all running processes
    echo [2] Restart Windows Explorer
    echo [3] Clean your computer
    echo [4] Send a request to an API
    echo [5] Install Spotify without ads
    echo [6] Disable Windows 11 context menu
    echo [7] Track your packages
    echo.
    echo [] The following options require administrator access []
    echo.
    echo [A1] Stop Windows updates
    echo [A2] Activate Windows 10/11
    echo.
    echo ===================================
    echo Enter the name of the process to kill or select a option:
    set /p process_name=
    if !process_name! == 1 (
        goto tasks
    ) else if !process_name! == 2 (
        goto restartexplorer
    ) else if !process_name! == 3 (
        goto cleanpc
    ) else if !process_name! == 4 (
        goto sendreq
    ) else if !process_name! == 5 (
        goto installspotx
    ) else if !process_name! == 6 (
        goto win11shitmenu
    ) else if !process_name! == 7 (
        goto parceltracking
    ) else if !process_name! == a1 (
        goto stopwindowsupdates
    ) else if !process_name! == a2 (
        goto activationwin
    ) else (
        goto killtask
    )


:killtask
    cls
    taskkill /f /im !process_name! 2>nul>nul
    if !errorlevel! == 0 (
        cls
        color 02
        echo !process_name! Has been terminated.
        timeout 3 2>nul>nul
        color 0B
    ) else (
        cls
        color 04
        echo !process_name! Didn't get terminated or doesn't exist.
        timeout 3 2>nul>nul
        color 0B
    )
    goto killprocess

:tasks
    cls
    tasklist /svc
    echo.
    echo.
    echo.
    goto skipcls

:restartexplorer
    cls
    taskkill /f /im explorer.exe 2>nul>nul
    start /im explorer.exe 2>nul>nul
    tasklist | find explorer.exe 2>nul>nul
    if !errorlevel! == 0 (
        cls
        color 04
        echo Explorer failed to restart.
        timeout 3 2>nul>nul
        color 0B
    ) else (
        cls
        color 02
        echo Explorer successfully restarted.
        timeout 3 2>nul>nul
        color 0B
    )
    goto killprocess

:cleanpc
    cls
    color 0E
    echo Please wait...
    del C:\Windows\Prefetch\ /s /q
    del !USERPROFILE!\Downloads\ /s /q
    powershell Clear-RecycleBin -Force
    cls
    cleanmgr.exe /sagerun:n
    cls
    color 02
    echo Your system has been cleared of useless stuff.
    timeout 3 2>nul>nul
    color 0B
    goto killprocess

:sendreq
    cls
    color 0E
    echo Please type in the request link:
    set /p apilink=
    curl -s -o nul !apilink!
    echo Sent request to !apilink!
    timeout 3 2>nul>nul
    color 0B
    goto killprocess

:installspotx
    !SYSTEMROOT!\System32\WindowsPowerShell\v1.0\powershell.exe -Command "&{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12}; """"& { $((Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1').Content)} -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify """" | Invoke-Expression"
    if !errorlevel! == 0 (
        cls
        color 02
        echo Successfully installed!
        timeout 3 2>nul>nul
        color 0B
    ) else (
        cls
        color 04
        echo Failed to install.
        timeout 3 2>nul>nul
        color 0B
    )
    cls
    goto killprocess

:stopwindowsupdates
    net session >nul 2>&1
    if !errorlevel! == 0 (
        cls
        color 0E
        echo Adding file to autostart...
        del !programdata!\Microsoft\Windows\Start Menu\Programs\Startup\stopwindowsupdates.bat
        cd /d !programdata!\Microsoft\Windows\Start Menu\Programs\Startup
        echo sc config wuauserv start = disabled>stopwindowsupdates.bat
        echo sc stop wuauserv>>stopwindowsupdates.bat
        echo pause>>stopwindowsupdates.bat
        cls
        sc config wuauserv start = disabled
        sc stop wuauserv
        color 02
        cls
        echo Successfully added .bat to autostart, windows updates will no longer start.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    ) else (
        cls
        color 04
        echo Please start AMT as administrator to stop windows updates.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    )

:activationwin
    cls
    net session >nul 2>&1
    if !errorlevel! == 0 (
        for /f "tokens=2 delims==" %%a in ('wmic os get caption /value ^| findstr /c:"="') do set "OS=%%a"
        echo Please select a server. [If one doesn't work, try another one.]
        echo [1] - kms.msguides.com [Good]
        echo [2] - kms7.msguides.com [Unsure]
        echo [3] - kms8.msguides.com [Best]
        echo [4] - kms9.msguides.com [Unsure]
        set /p activation_server=
        if !activation_server! == 1 (
            echo.
            set set_activation_server=kms.msguides.com
        ) else if !activation_server! == 2 (
            echo.
            set set_activation_server=kms7.msguides.com
        ) else if !activation_server! == 3 (
            echo.
            set set_activation_server=kms8.msguides.com
        ) else (
            echo.
            set set_activation_server=kms9.msguides.com
        )
        echo Starting activation process, on slower systems it may take a VERY long time.
        if !OS!==Microsoft Windows 10 Home (
            slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Home N (
            slmgr /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Pro (
            slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Pro N (
            slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Education (
            slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Education N (
            slmgr /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Enterprise (
            slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 10 Enterprise N (
            slmgr /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Home (
            slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Home N (
            slmgr /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Pro (
            slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Pro N (
            slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Education (
            slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Education N (
            slmgr /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Enterprise (
            slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else if !OS!==Microsoft Windows 11 Enterprise N (
            slmgr /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
            slmgr /skms !set_activation_server!
            slmgr /ato
        ) else (
            echo.
            echo This version of Windows is not supported. Your current OS is: !OS!
        )
        echo.
        echo Do you want to restart the system? [Recommended]
        echo [1] - Yes
        echo [2] - No
        set /p restartornot=
        if !restartornot! == 1 (
            shutdown.exe /r /t 00
        ) else (
            cls
            echo Please remember to restart later on.
        )
        timeout 5 2>nul>nul
        goto killprocess
    ) else (
        cls
        color 04
        echo Please start AMT as administrator to activate windows.
        timeout 3 2>nul>nul
        color 0B
        goto killprocess
    )

:win11shitmenu
    reg query HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 2>nul>nul
    if !errorlevel! == 1 (
        reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
        echo Context menu has been disabled.
    ) else (
        reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
        echo Context menu has been enabled.
    )
    cls
    echo A restart is required.
    timeout 5 2>nul>nul
    shutdown.exe /r /t 00

:parceltracking
    cls
    echo ===================================
    echo       AMT - Parcel tracking.
    echo ===================================
    echo.
    echo [1] Use newest tracking code / Input new one if one doesn't exist
    echo [2] Delete newest tracking code
    echo [3] Tracking code history
    echo [4] Delete tracking code history
    echo [5] Exit
    echo.
    echo ===================================
    set /p parcel_select_option=Select option: 
    if !parcel_select_option! == 1 (
        cls
        if not exist "!APPDATA!\AMTParcelTracking" mkdir "!APPDATA!\AMTParcelTracking"
        if exist "!APPDATA!\AMTParcelTracking\latest_tracking_code.txt" (
            call set /p localfilecode=<"!APPDATA!\AMTParcelTracking\latest_tracking_code.txt"
            start "" "https://www.ordertracker.com/track/!localfilecode!"
            goto parceltracking
        ) else (
            if not exist "!APPDATA!\AMTParcelTracking\latest_tracking_code.txt" (
                copy NUL "!APPDATA!\AMTParcelTracking\latest_tracking_code.txt" >nul
            )
            if not exist "!APPDATA!\AMTParcelTracking\history.txt" (
                copy NUL "!APPDATA!\AMTParcelTracking\history.txt" >nul
            )
            echo No tracking code found. Please input a new one.
            set /p newtrackingcode=Enter new tracking code: 
            findstr "!newtrackingcode!" "!APPDATA!\AMTParcelTracking\history.txt" >nul
            if errorlevel 1 (
                set /p codename=Give a name to this code [press Enter to skip]: 
                if not "!codename!" == "" (
                    echo !codename!: !newtrackingcode!>>"!APPDATA!\AMTParcelTracking\history.txt"
                ) else (
                    echo !newtrackingcode!>>"!APPDATA!\AMTParcelTracking\history.txt"
                )
            ) else (
                echo Tracking code already exists in the history, you can only use it again but it won't save again.
                timeout 2 2>nul>nul
            )
            echo !newtrackingcode!>"!APPDATA!\AMTParcelTracking\latest_tracking_code.txt"
            goto parceltracking
        )
    ) else if !parcel_select_option! == 2 (
        del /f !APPDATA!\AMTParcelTracking\latest_tracking_code.txt
        goto parceltracking
    ) else if !parcel_select_option! == 3 (
        cls
        echo Saved tracking codes:
        echo.
        type "!APPDATA!\AMTParcelTracking\history.txt"
        echo.
        echo Press enter to proceed.
        pause >nul
        goto parceltracking
    ) else if !parcel_select_option! == 4 (
        del /f !APPDATA!\AMTParcelTracking\history.txt
        goto parceltracking
    ) else if !parcel_select_option! == 5 (
        goto killprocess
    ) else (
        echo Please select a valid option.
        timeout 3 2>nul>nul
        goto parceltracking
    )