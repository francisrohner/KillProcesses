'Francis Rohner
'Terminate all processes with the names stored in the processes.txt file
'Utilizes Win323_Process hook, may not work for System level processes
Const strComputer = "." 
Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FileExists("processes.txt") Then
    MsgBox("ProcessList not found!")
	Wscript.Quit
End If
Set reader = fso.OpenTextFile("processes.txt")

Do Until reader.AtEndOfStream
	'Kill all instances of processes matching the current name from the process list file
	Dim objWMIService, colProcessList
	Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
	Set colProcessList = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name = '" & reader.ReadLine & "'")
	For Each objProcess in colProcessList 
		objProcess.Terminate() 
	Next  

Loop

reader.Close