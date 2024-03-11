@echo off

 call :isAdmin

 if %errorlevel% == 0 (
    goto :run
 ) else (
    echo Requesting administrative privileges...
    goto :UACPrompt
 )

 exit /b

 :isAdmin
    fsutil dirty query %systemdrive% >nul
 exit /b

 :run
  for /F "tokens=3 delims=: " %%H in ('sc query "LSAirClientService" ^| findstr "        STATE"') do (
    if /I "%%H" NEQ "RUNNING" (
      REM Put your code you want to execute here
      REM For example, the following line
	  net start LSAirClientService
    ) else (
      taskkill -f -im LSAirClient.exe
      taskkill -f -im LSAirClientService.exe
      taskkill -f -im LSAirClientUI.exe
	  sc config LSAirClientService start= demand
	)
  )
 exit /b

 :UACPrompt
   echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
   echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

   "%temp%\getadmin.vbs"
   del "%temp%\getadmin.vbs"
  exit /B`
  
 :eof
 exit /B