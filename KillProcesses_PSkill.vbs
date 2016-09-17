'Francis Rohner
'Terminate all processes with the names stored in the processes.txt file
'Uses third party application pskill to kill processes
Const strComputer = "." 
Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FileExists("processes.txt") Then
    MsgBox("ProcessList not found!")
	Wscript.Quit
End If
Set reader = fso.OpenTextFile("processes.txt")

Do Until reader.AtEndOfStream
	'Kill all instances of processes matching the current name from the process list file
	Set WshShell = CreateObject("WScript.Shell")
	Dim objWMIService, colProcessList
	Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
	Set colProcessList = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name = '" & reader.ReadLine & "'")
	'Run silently
	For Each objProcess in colProcessList 
	  WshShell.Run "PSKill " & objProcess.ProcessId, 0, true 
	Next

Loop

reader.Close