@echo off
:: =================================================================
:: ULTIMATE SYSTEM MASTER v1.0
:: Copyright (c) 2026 JEROM REQUILLO
::
:: This code is licensed under the MIT License.
:: You are free to use, modify, and distribute this script, 
:: provided that this copyright notice remains intact.
::
:: GitHub: https://github.com/JeromRequillo/Ultimate-System-Master-v1
:: =================================================================

setlocal enabledelayedexpansion

:: [1] AUTO-ADMIN ELEVATION
:CHECK_PRIVILEGES
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [SYSTEM] Humihingi ng Admin Access...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

:: CODE STARTS HERE
set "LOGFILE=%USERPROFILE%\Desktop\Maintenance_Log.txt"
set PATH=%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0\

:MENU
cls
title JEROM REQUILLO - ULTIMATE SYSTEM MASTER v2.0
color 0B

echo.
echo  ============================================================
echo      SYSTEM MAINTENANCE ^& OPTIMIZATION MASTER TOOL
echo  ------------------------------------------------------------
echo      Developer   : JEROM REQUILLO
echo      Version     : 1.0 
echo      Status      : Admin Mode Active
echo  ============================================================
echo.
echo    [1] DEEP CLEAN /REFRESH     [10] SYSTEM INFO
echo    [2] QUICK CLEAN             [11] THEME TOGGLE
echo    [3] BROWSER CLEAN           [12] DNS SWITCHER
echo    [4] SYSTEM REPAIR           [13] WINGET APP UPDATER
echo    [5] NETWORK BOOST           [14] ULTIMATE PERFORMANCE
echo    [6] REGISTRY OPTIMIZER      [15] SHOW WI-FI PASSWORDS
echo    [7] RAM OPTIMIZER           [16] MICROSOFT ACTIVATION
echo    [8] WINDOWS DEBLOATER       [17] CHRIS TITUS WINUTIL
echo    [9] PC HEALTH CHECK         [18] WINDOWS RUN COMMANDS
echo.
echo    [19] EXIT ^& SAVE LOG
echo.
echo  ============================================================
set /p choice="Piliin ang iyong nais (1-18): "

if "%choice%"=="1" goto DEEPCLEAN
if "%choice%"=="2" goto QUICK
if "%choice%"=="3" goto BROWSER
if "%choice%"=="4" goto REPAIR
if "%choice%"=="5" goto NETBOOST
if "%choice%"=="6" goto REGOPT
if "%choice%"=="7" goto RAMOPT
if "%choice%"=="8" goto DEBLOAT
if "%choice%"=="9" goto HEALTH
if "%choice%"=="10" goto SYSINFO
if "%choice%"=="11" goto THEME
if "%choice%"=="12" goto DNSSWITCH
if "%choice%"=="13" goto WINGET_UPDATE
if "%choice%"=="14" goto POWER_PLAN
if "%choice%"=="15" goto WIFI_PASS
if "%choice%"=="16" goto ACTIVATE
if "%choice%"=="17" goto CTITUS
if "%choice%"=="18" goto RUN_COMMANDS_MENU
if "%choice%"=="19" goto EXIT_LOG
goto MENU

:: --- [ FUNCTIONS ] ---

:DEEPCLEAN
cls
call :ColorText Yellow "[SYSTEM] Running Ultimate Full Auto Maintenance..."
echo Maintenance Start: %date% %time% > "%LOGFILE%"

:: [ silent cleanups]
call :QUICK_SILENT
call :BROWSER_SILENT
call :RESIDUE_SILENT
call :DEEP_SILENT

:: ---  (Deep Refresh Section) ---
call :ColorText Red "[!] Refreshing File Explorer (Screen will flash)..."
taskkill /f /im explorer.exe >nul 2>&1
del /f /q /s "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
del /f /q /s "%LocalAppData%\IconCache.db" 2>nul
start explorer.exe

call :ColorText Red "[!] Resetting Network IP Address..."
ipconfig /release >nul
ipconfig /renew >nul
:: --------------------------------------------

call :ColorText Cyan "[+] Running DISM Component Cleanup..."
dism.exe /online /cleanup-image /startcomponentcleanup /quiet
call :ColorText Green "[DONE] Full Auto Clean Complete!"
pause
goto MENU

:QUICK
cls
call :QUICK_SILENT
echo.
call :ColorText Green "[DONE] Quick Clean Complete!"
pause
goto MENU

:QUICK_SILENT
call :ColorText Cyan "[+] Cleaning Temp files..."
del /q /s /f "%temp%\*" 2>nul
for /d %%x in ("%temp%\*") do rd /s /q "%%x" 2>nul
del /q /s /f "C:\Windows\Temp\*" 2>nul
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" 2>nul

call :ColorText Cyan "[+] Cleaning Windows Log Files..."
del /f /q /s "C:\Windows\*.log" 2>nul
del /f /q /s "C:\Windows\debug\*.log" 2>nul

call :ColorText Cyan "[+] Emptying Recycle Bin..."
powershell.exe -NoProfile -Command "Clear-RecycleBin -Confirm:$false" 2>nul

call :ColorText Cyan "[+] Flushing DNS..."
ipconfig /flushdns >nul
goto :eof

:BROWSER
cls
call :BROWSER_SILENT
echo.
call :ColorText Green "[DONE] Browser Caches Cleared!"
pause
goto MENU

:BROWSER_SILENT
call :ColorText Cyan "[+] Closing Browsers..."
taskkill /F /IM chrome.exe /T >nul 2>&1
taskkill /F /IM msedge.exe /T >nul 2>&1
taskkill /F /IM firefox.exe /T >nul 2>&1
call :ColorText Cyan "[+] Cleaning Browser Caches..."
del /q /s /f "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" 2>nul
del /q /s /f "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" 2>nul
del /q /s /f "%LocalAppData%\Mozilla\Firefox\Profiles\*\cache2\*" 2>nul
goto :eof

:RESIDUE_SILENT
call :ColorText Cyan "[+] Cleaning App Residues..."
:: Tinatanggal ang mga naiwang folders sa Temp at CrashDumps
for /d %%x in ("%LocalAppData%\Temp\*") do rd /s /q "%%x" 2>nul
if exist "%LocalAppData%\CrashDumps" del /f /q /s "%LocalAppData%\CrashDumps\*" 2>nul
goto :eof

:DEEP_SILENT
call :ColorText Cyan "[+] Running Deep Search Cleanup..."
:: Tinatarget ang Windows Error Reports at Installer logs
del /f /q /s "%LocalAppData%\Microsoft\Windows\WER\*" 2>nul
del /f /q /s "%WinDir%\Installer\*.tmp" 2>nul
del /f /q /s "%WinDir%\SoftwareDistribution\Download\*" 2>nul
goto :eof

:REPAIR
cls
call :ColorText Yellow "[1/2] Running System File Checker (SFC)..."
sfc /scannow
call :ColorText Yellow "[2/2] Running DISM Restore Health..."
dism /online /cleanup-image /restorehealth
echo.
call :ColorText Green "[DONE] System Repair Complete!"
echo - System Repair Executed >> "%LOGFILE%"
pause
goto MENU

:NETBOOST
cls
call :ColorText Cyan "[+] Resetting TCP/IP Stack..."
netsh int ip reset >nul 2>&1
netsh winsock reset >nul 2>&1
call :ColorText Cyan "[+] Optimizing Network Settings..."
netsh interface tcp set global autotuninglevel=normal >nul
call :ColorText Green "[DONE] Network Optimized!"
pause
goto MENU

:REGOPT
cls
call :ColorText Cyan "[+] Applying Registry Speed Tweaks..."
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f >nul 2>&1
call :ColorText Green "[DONE] Registry Optimized!"
pause
goto MENU

:RAMOPT
cls
call :ColorText Yellow "[SYSTEM] Upgraded RAM Optimization in progress..."

:: 1. GC Collect
call :ColorText Cyan "[+] Forcing Garbage Collection..."
powershell.exe -NoProfile -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers();"

:: 2. Clear Working Sets
call :ColorText Cyan "[+] Trimming Process Working Sets..."
powershell -NoProfile -Command "Get-Process | Where-Object {$_.WorkingSet -gt 10MB} | ForEach-Object { try { $_.Trim() } catch {} }"

:: 3. Clear System Standby List
call :ColorText Cyan "[+] Flushing Standby Memory List..."
powershell -NoProfile -Command "$code = '[DllImport(\"psapi.dll\")] public static extern bool EmptyWorkingSet(IntPtr hProcess);'; $type = Add-Type -MemberDefinition $code -Name 'MemUtil' -Namespace 'Utils' -PassThru; Get-Process | ForEach-Object { $type::EmptyWorkingSet($_.Handle) } " 2>nul

echo.
call :ColorText Green "[DONE] RAM has been deeply optimized!"
pause
goto MENU

:DEBLOAT
cls
call :ColorText Red "[!] Removing Bloatware (News, Weather, GetHelp)..."
powershell -Command "Get-AppxPackage *bingnews* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *weather* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *gethelp* | Remove-AppxPackage"
call :ColorText Green "[DONE] Selected Bloatware Removed!"
pause
goto MENU

:HEALTH
cls
call :ColorText Yellow "[1] STORAGE STATUS (S.M.A.R.T):"
wmic diskdrive get model,status,interfacetype
call :ColorText Yellow "[2] SYSTEM UPTIME:"
powershell -command "$u = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime; '{0} Days, {1} Hours, {2} Mins' -f $u.Days, $u.Hours, $u.Minutes"
call :ColorText Yellow "[3] BATTERY REPORT:"
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Battery_Report.html" >nul 2>&1
call :ColorText Cyan "[!] Battery report saved to Desktop (if laptop)."
pause
goto MENU

:SYSINFO
cls
echo  ============================================================
echo              DETAILED SYSTEM SPECIFICATIONS
echo  ============================================================
call :ColorText Yellow "[BASIC INFO]"
echo  PC Name         : %COMPUTERNAME%
powershell -command "'OS Version     : ' + (Get-CimInstance Win32_OperatingSystem).Caption"
powershell -command "'Processor      : ' + (Get-CimInstance Win32_Processor).Name"
echo.
call :ColorText Yellow "[MOTHERBOARD]"
powershell -command "'Manufacturer   : ' + (Get-CimInstance Win32_BaseBoard).Manufacturer"
powershell -command "'Model          : ' + (Get-CimInstance Win32_BaseBoard).Product"
echo.
call :ColorText Yellow "[MEMORY ^& STORAGE]"
powershell -command "'Total RAM      : ' + [math]::round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB, 2) + ' GB'"
echo  RAM Slots/Speed :
wmic memorychip get devicelocator, capacity, speed | findstr /v "Capacity"
echo.
echo  Disk Health Status:
powershell "Get-PhysicalDisk | Select-Object FriendlyName, MediaType, HealthStatus | ft -AutoSize"
echo.
call :ColorText Yellow "[SYSTEM UPTIME]"
powershell -command "$u = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime; 'Booted since    : {0} Days, {1} Hours, {2} Mins ago' -f $u.Days, $u.Hours, $u.Minutes"
echo  ============================================================
pause
goto MENU

:THEME
cls
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme') do set "currentTheme=%%a"
if "%currentTheme%"=="0x1" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
    call :ColorText Red "[!] Switched to DARK MODE"
) else (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f >nul
    call :ColorText Cyan "[!] Switched to LIGHT MODE"
)
pause
goto MENU

:DNSSWITCH
cls
echo  ============================================================
echo        DNS SWITCHER ^& BENCHMARK
echo  ============================================================
for /f "tokens=4*" %%a in ('netsh interface show interface ^| findstr "Connected"') do set "interfaceName=%%b"
echo  Active Interface: %interfaceName%
echo  ------------------------------------------------------------
call :ColorText Yellow "Testing Latency (Ping)..."
echo  [G] Google DNS    : 
for /f "tokens=4 delims==" %%i in ('ping 8.8.8.8 -n 1 ^| findstr "Average"') do echo    Latency:%%i
echo  [C] Cloudflare    : 
for /f "tokens=4 delims==" %%i in ('ping 1.1.1.1 -n 1 ^| findstr "Average"') do echo    Latency:%%i
echo  [A] AdGuard       : 
for /f "tokens=4 delims==" %%i in ('ping 94.140.14.14 -n 1 ^| findstr "Average"') do echo    Latency:%%i
echo  ------------------------------------------------------------
echo  [1] Apply Google DNS
echo  [2] Apply Cloudflare
echo  [3] Apply AdGuard (AdBlock)
echo  [4] Reset to Automatic (DHCP)
echo  [5] Back to Menu
echo  ============================================================
set /p dnschoice="Choice: "
if "%dnschoice%"=="1" (set "p=8.8.8.8" & set "s=8.8.4.4" & goto APPLY_DNS)
if "%dnschoice%"=="2" (set "p=1.1.1.1" & set "s=1.0.0.1" & goto APPLY_DNS)
if "%dnschoice%"=="3" (set "p=94.140.14.14" & set "s=94.140.15.15" & goto APPLY_DNS)
if "%dnschoice%"=="4" (
    netsh interface ip set dns name="%interfaceName%" source=dhcp
    ipconfig /flushdns >nul
    call :ColorText Green "[+] DNS Reset Done!"
    pause & goto MENU
)
goto MENU

:APPLY_DNS
netsh interface ip set dns name="%interfaceName%" source=static addr=%p% register=primary
netsh interface ip add dns name="%interfaceName%" addr=%s% index=2
ipconfig /flushdns >nul
echo [+] DNS Applied: %p% >> "%LOGFILE%"
call :ColorText Green "[+] Done!"
pause
goto MENU

:WINGET_UPDATE
cls
call :ColorText Yellow "[SYSTEM] Checking for Software Updates (Winget)..."
winget upgrade --all
echo.
call :ColorText Green "[DONE] All apps updated!"
pause
goto MENU

:POWER_PLAN
cls
call :ColorText Yellow "[SYSTEM] Unlocking Ultimate Performance Power Plan..."
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
call :ColorText Green "[+] Ultimate Performance Plan added to Power Options."
call :ColorText Red "[!] Mangyaring piliin ito sa 'Choose a power plan' settings."
control /name Microsoft.PowerOptions
pause
goto MENU

:WIFI_PASS
cls
echo  ============================================================
echo        SAVED WI-FI NETWORKS AND PASSWORDS
echo  ============================================================
echo.
for /f "skip=9 tokens=3,4*" %%a in ('netsh wlan show profiles') do (
    set "ssid=%%c"
    if "!ssid!" NEQ "" (
        call :ColorText Cyan "Network Name: !ssid!"
        netsh wlan show profile name="!ssid!" key=clear | findstr "Key Content"
        echo  ------------------------------------------------------------
    )
)
call :ColorText Green "[DONE] Lahat ng saved passwords ay naipakita na."
pause
goto MENU

:ACTIVATE
cls
call :ColorText Yellow "[SYSTEM] Loading Microsoft Activation Scripts..."
call :ColorText Red "[!] Please wait for the script to download and execute."
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"
echo - Activation Tool Executed >> "%LOGFILE%"
pause
goto MENU

:CTITUS
cls
call :ColorText Yellow "[SYSTEM] Launching Chris Titus Tech Windows Utility..."
call :ColorText Red "[!] A new GUI window should appear."
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://christitus.com/win | iex"
echo - Chris Titus Utility Executed >> "%LOGFILE%"
pause
goto MENU

:RUN_COMMANDS_MENU
cls
call :ColorText Cyan "============================================================"
echo            WINDOWS RUN COMMANDS ^& SYSTEM TOOLS
call :ColorText Cyan "============================================================"
echo.
echo   [A] SYSTEM ^& MGMT          [B] CONTROL PANEL (.CPL)
echo   [C] DISK ^& FILES           [D] HARDWARE ^& DIAGNOSTICS
echo   [E] NETWORK ^& ACCESS       [M] BACK TO MAIN MENU
echo.
set /p subchoice="Piliin ang kategorya: "

if /i "%subchoice%"=="A" goto RUN_A
if /i "%subchoice%"=="B" goto RUN_B
if /i "%subchoice%"=="C" goto RUN_C
if /i "%subchoice%"=="D" goto RUN_D
if /i "%subchoice%"=="E" goto RUN_E
if /i "%subchoice%"=="M" goto MENU
goto RUN_COMMANDS_MENU

:RUN_A
cls
echo [1] System Config (msconfig)   [6] Services (services.msc)
echo [2] Resource Monitor           [7] Registry Editor (regedit)
echo [3] Performance Monitor        [8] Group Policy (gpedit.msc)
echo [4] Task Manager               [9] Local Security (secpol.msc)
echo [5] Computer Management        [10] Event Viewer (eventvwr.msc)
echo [0] BACK
set /p cmd="Choice: "
if "%cmd%"=="1" start msconfig
if "%cmd%"=="2" start resmon
if "%cmd%"=="3" start perfmon
if "%cmd%"=="4" start taskmgr
if "%cmd%"=="5" start compmgmt.msc
if "%cmd%"=="6" start services.msc
if "%cmd%"=="7" start regedit
if "%cmd%"=="8" start gpedit.msc
if "%cmd%"=="9" start secpol.msc
if "%cmd%"=="10" start eventvwr.msc
goto RUN_COMMANDS_MENU

:RUN_B
cls
echo [1] Uninstall Apps (appwiz)    [7] Power Options (powercfg)
echo [2] Network Connections        [8] Windows Firewall
echo [3] System Properties (sysdm)  [9] Region Settings
echo [4] Mouse Properties           [10] Date and Time
echo [5] Display Settings           [11] Game Controllers
echo [6] Sound Settings             [0] BACK
set /p cmd="Choice: "
if "%cmd%"=="1" start appwiz.cpl
if "%cmd%"=="2" start ncpa.cpl
if "%cmd%"=="3" start sysdm.cpl
if "%cmd%"=="4" start main.cpl
if "%cmd%"=="5" start desk.cpl
if "%cmd%"=="6" start mmsys.cpl
if "%cmd%"=="7" start powercfg.cpl
if "%cmd%"=="8" start firewall.cpl
if "%cmd%"=="9" start intl.cpl
if "%cmd%"=="10" start timedate.cpl
if "%cmd%"=="11" start joy.cpl
goto RUN_COMMANDS_MENU

:RUN_C
cls
echo [1] Disk Management            [5] File Explorer Options
echo [2] Disk Cleanup (cleanmgr)    [6] File Explorer
echo [3] Defragment (dfrgui)        [7] Startup Folder
echo [4] Bluetooth Transfer         [0] BACK
set /p cmd="Choice: "
if "%cmd%"=="1" start diskmgmt.msc
if "%cmd%"=="2" start cleanmgr
if "%cmd%"=="3" start dfrgui
if "%cmd%"=="4" start fsquirt
if "%cmd%"=="5" start folders
if "%cmd%"=="6" start explorer
if "%cmd%"=="7" start shell:startup
goto RUN_COMMANDS_MENU

:RUN_D
cls
echo [1] Device Manager             [4] Malicious Software Removal
echo [2] DirectX Diagnostics        [5] Memory Diagnostic
echo [3] System Information         [6] Windows Version (winver)
echo [0] BACK
set /p cmd="Choice: "
if "%cmd%"=="1" start devmgmt.msc
if "%cmd%"=="2" start dxdiag
if "%cmd%"=="3" start msinfo32
if "%cmd%"=="4" start mrt
if "%cmd%"=="5" start mdsched
if "%cmd%"=="6" start winver
goto RUN_COMMANDS_MENU

:RUN_E
cls
echo [1] Administrative Tools       [4] Screen Magnifier
echo [2] Remote Desktop (mstsc)     [5] Narrator
echo [3] On-Screen Keyboard         [0] BACK
set /p cmd="Choice: "
if "%cmd%"=="1" start control admintools
if "%cmd%"=="2" start mstsc
if "%cmd%"=="3" start osk
if "%cmd%"=="4" start magnify
if "%cmd%"=="5" start narrator
goto RUN_COMMANDS_MENU

:EXIT_LOG
echo Maintenance End: %date% %time% >> "%LOGFILE%"
echo ------------------------------------------------------------ >> "%LOGFILE%"
exit

:: --- [ COLOR HELPER FUNCTION ] ---
:ColorText
powershell -NoProfile -Command "Write-Host '%~2' -ForegroundColor %~1"
goto :eof