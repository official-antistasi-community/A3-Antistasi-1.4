/**
	Logs to the Arma log file.
	
	Params:
		Log level: number - Error, Info or Debug. Levels 1, 2 and 3 respectively.
		Log Message: string - Message to log
		File: string - File in which the log message originated
**/

params ["_logLevel", "_message", "_file"];

[_logLevel, _message, _file] execvm "log.sqf";