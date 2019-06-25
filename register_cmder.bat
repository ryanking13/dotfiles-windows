@echo off
echo D | xcopy /e /h /k cmder_mini %localappdata%\cmder
set ICON=%LocalAppData%\cmder\Cmder.exe
set LABEL=Open terminal here
set COMMAND=%LocalAppData%\cmder\Cmder.exe \"%%V\"
set SLUG=Cmder

reg delete "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f
reg delete "HKCU\Software\Classes\Directory\shell\%SLUG%" /f
reg delete "HKCU\Software\Classes\Drive\shell\%SLUG%" /f
reg delete "HKCU\Software\Classes\LibraryFolder\Background\shell\%SLUG%" /f

reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
rem reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
rem reg add "HKCU\Software\Classes\Drive\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"
reg add "HKCU\Software\Classes\LibraryFolder\Background\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
rem reg add "HKCU\Software\Classes\LibraryFolder\Background\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\LibraryFolder\Background\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\LibraryFolder\Background\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"