@echo off
pushd %~dp0
echo Run Options:
echo 1 - KillProcesses
echo 2 - KillProcesses_PSKill
set /p option="Choose option[Or press enter for 1]: "

IF "%option%"=="2" GOTO pskill
  cscript KillProcesses.vbs  
  goto exit
:pskill
  cscript KillProcesses_PSKill.vbs 
:exit
pause