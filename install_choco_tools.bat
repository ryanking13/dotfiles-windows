@echo off

goto check_Permissions

:check_Permissions
    echo [*] Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto install
    ) else (
        echo [-] Failure: Current permissions inadequate.
        exit /B 1
    )

:install
    rem choco
    where choco > NUL
    if %ERRORLEVEL% neq 0 (
        echo [*] installing chocolatey...
        @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    ) else (
        echo [*] chocolatey is already installed
    )

    rem utility
    choco install chocolatey-core.extension -y
    choco install sysinternals -y
    choco install procexp -y
    choco install sudo -y

    rem development packages
    echo [*] installing git...
    choco install git -y
    echo [*] installing nodejs...
    choco install nodejs -y
    echo [*] installing python...
    choco install python -y
