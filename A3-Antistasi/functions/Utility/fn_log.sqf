/**
	Logs to the Arma log file.

	Params:
		Log level: number - Error, Info or Debug. Levels 1, 2 and 3 respectively.
		Log Message: string - Message to log
		File (optional): string - File in which the log message originated
		Log to server (optional): bool - true for logging to server RPT instead of client
			Defaults to true for all HC logs, and errors (level 1) on clients

		The example below would output an error to the console.
		private _filename = "fn_log";
		[1, "Message", _filename] call A3A_fnc_log;
**/

params ["_level", "_message", ["_file", "No File Specified"]];
private _toServer = param [3, !(hasInterface && _level > 1)];
private _filename = "fn_log";

//This ignores the log event if it's above the global threshold
if (_level > LogLevel) exitwith {};

// Sets up the actual log event.
private _logLine = if (1 <= _level && _level <= 4) then {
	(systemTimeUTC call A3A_fnc_systemTime_format_S) + " | Antistasi | " + ["Error","Info","Debug","Verbose"]#(_level-1) + " | File: " + _file + " | " + _message;
} else {
	(systemTimeUTC call A3A_fnc_systemTime_format_S) + " | Antistasi | Error | File: fn_log | Invalid Log Level | Dump: " + str _this;
};

if (isNil "blockServerLogging" && _toServer && !isServer) then {
	// Tag remote log lines with player. HCs return hc, hc_1, hc_2 etc
	_logLine = _logLine + " | Client: "+str player+" ["+str clientOwner+"]";
	_logLine remoteExec ["A3A_fnc_localLog", 2];
} else {
	diag_log text _logLine;
};
