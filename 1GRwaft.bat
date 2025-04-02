@echo off
title 1GR's Windows Automatic Fix Tool v1.2
echo [##############################]
echo [ 1GR's Windows Auto Fix Tool  ]
echo [         Version 1.2          ]
echo [      instagram.com/_1hz      ]
echo [##############################]
echo.
echo NOTICE: THIS OPEN SOURCE TOOL IS A^
 SCRIPT DESIGNED TO AUTOMATE COMMON TASKS^
 USED BY IT PROFESSIONALS
echo AND PC REPAIR SERVICES. THIS^
 SCRIPT ONLY RUNS COMMANDS BUILT^
 INTO WINDOWS. NO THIRD PARTY^
 APPLICATIONS 
echo OR TOOLS ARE USED BY THIS SCRIPT.
echo ================================
echo *** This tool will attempt to fix^
 common Windows issues by running^
 these Windows tasks:
echo 1.) DEPLOYMENT IMAGE SERVICING^
 AND MANAGEMENT TOOL.
echo 2.) SYSTEM FILE CHECKER.
echo 3.) TEMP FILES,OLD Win Temp^
 Update Files REMOVAL and Clear^
 DNS Cache.
echo ================================
echo.
@pause
echo Running tasks...
color 60
echo --- DISM SCAN STARTED ---
echo.
DISM /Online /Cleanup-Image /ScanHealth
echo.
echo --- DISM REPAIR STARTED ---
DISM /Online /Cleanup-Image /RestoreHealth
echo.
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
echo.
echo --- SYSTEM FILE CHECKER STARTED ---
SFC /scannow
echo.
echo Done...
echo.
echo --- Temp File Removal Started ---
@echo off
:: Cleanup Windows Cache, Temp Files, and Update Installer Files
:: Run Disk Cleanup on C: drive with VERYLOWDISK flag
cleanmgr.exe /d C: /VERYLOWDISK
echo Cleaning up temporary files...

:: Clear Temp Folder
del /q /f /s %temp%\*
rd /s /q %temp%
md %temp%

:: Clear Windows Temp Folder
del /q /f /s C:\Windows\Temp\*
rd /s /q C:\Windows\Temp
md C:\Windows\Temp

:: Cleanup Windows Update Installer Files
echo Cleaning up Windows Update Installer files...
del /q /f /s C:\Windows\SoftwareDistribution\Download\*

:: Cleanup Windows Event Logs
echo Cleaning up Windows Event Logs...
wevtutil cl Application
wevtutil cl Security
wevtutil cl System

:: Clean up Windows Prefetch
echo Cleaning up Windows Prefetch...
del /q /f /s C:\Windows\Prefetch\*

:: Clean up System Cache
echo Cleaning up System Cache...
del /q /f /s C:\Windows\SoftwareDistribution\DataStore\*

:: Clean up Recent Files
echo Cleaning up Recent Files...
del /q /f /s %APPDATA%\Microsoft\Windows\Recent\*

:: Clear DNS Cache
echo Flushing DNS Cache...
ipconfig /flushdns

:: Clean up Windows Error Reporting Files
echo Cleaning up Windows Error Reporting...
del /q /f /s C:\ProgramData\Microsoft\Windows\WER\*

:: Cleanup DirectX Shader Cache
echo Cleaning up DirectX Shader Cache...
del /q /f /s C:\Users\%USERNAME%\AppData\Local\D3DSCache\*

:: Clean up Delivery Optimization Files
echo Cleaning up Delivery Optimization Files...
del /q /f /s C:\Windows\SoftwareDistribution\DeliveryOptimization\*

:: Clean up Windows Thumbnail Cache
echo Cleaning up Windows Thumbnail Cache...
del /q /f /s C:\Users\%USERNAME%\AppData\^
Local\Microsoft\Windows\Explorer\thumbcache_*

:: Remove Other Temporary and System Files (Additional Cleanups)
echo Cleaning up additional system files...

:: Clean up older temporary files and folders
del /s /f /q C:\Windows\Temp\*.*
rd /s /q C:\Windows\Temp

:: Remove temporary folders from the Windows directory
rd /s /q C:\Windows\TempOr~1
del /f /q C:\Windows\TempOr~1
rd /s /q C:\Windows\Temp
del /f /q C:\Windows\Temp

:: Remove spool printer files
rd /s /q C:\Windows\System32\spool\PRINTERS
del /f /q C:\Windows\System32\spool\PRINTERS

:: Remove old WIN386.SWP file (virtual memory swap file)
del /f /q C:\WIN386.SWP

:: Clean up History, Cookies, and Recent folders
rd /s /q C:\Windows\History
del /f /q C:\Windows\History
rd /s /q C:\Windows\Cookies
del /f /q C:\Windows\Cookies
rd /s /q C:\Windows\Recent
del /f /q C:\Windows\Recent
echo Done!
echo.
echo Task completed successfully...
echo.
color 20
echo All tasks have completed successfully!
echo You can press any key to close this window. Reboot your PC.
@pause
exit