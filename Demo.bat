@echo off
@REM Open a bunch of standard windows processes
echo Opening some processes
start notepad.exe
start wordpad.exe
start notepad.exe
start wordpad.exe
@REM Wait 5 Seconds
@REM echo Waiting 5 Seconds
timeout /t 5 /nobreak
@REM Run script
echo Killing the processes
cscript KillProcesses_PSKill.vbs
pause