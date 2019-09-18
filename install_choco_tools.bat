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
	where git > NUL
	if %ERRORLEVEL% neq 0 (
		echo [*] installing git...
		choco install git -y
	) else (
		echo [*] git is already installed
	)
	where node > NUL
	if %ERRORLEVEL% neq 0 (
		echo [*] installing nodejs...
		choco install nodejs-lts -y
	) else (
		echo [*] nodejs is already installed
	)
	where python > NUL
	if %ERRORLEVEL% neq 0 (
		echo [*] installing python...
		choco install python -y
	) else (
		echo [*] python is already installed
	)
	where bat > NUL
	if %ERRORLEVEL% neq 0 (
		echo [*] installing bat...
		choco install bat -y
	) else (
		echo [*] bat is already installed
	)
	where goodbyedpi > NUL
	if %ERRORLEVEL% neq 0 (
		echo [*] installing goodbyedpi...
		choco install goodbyedpi -y --ignore-checksums
	) else (
		echo [*] goodbyedpi is already installed
	)
