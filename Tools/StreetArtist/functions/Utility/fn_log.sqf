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
if (_level > 4) exitwith {};

// Sets up the actual log event.
private _logLine = "";
switch (_level) do {
	case 1: {
		_logLine = format ["%1: [Antistasi] | ERROR | %2 | %3", servertime, _file, _message];
	};
	case 2: {
		_logLine = format ["%1: [Antistasi] | INFO | %2 | %3", servertime, _file, _message];
	};
	case 3: {
		_logLine = format ["%1: [Antistasi] | DEBUG | %2 | %3", servertime, _file, _message];
	};
	case 4: {
		_logLine = format ["%1: [Antistasi] | VERBOSE | %2 | %3", servertime, _file, _message];
	};
	default {
		_logLine = format ["%1: [Antistasi] | Unknown Log Level Specified, please use 1= Errors, 2= Info, 3= Debug | %2 | %3", servertime, _file, _message];
	};
};

if (isNil "blockServerLogging" && _toServer && !isServer) then {
	// Tag remote log lines with player. HCs return hc, hc_1, hc_2 etc
	_logLine = format ["%1 | (R) %2", _logLine, str player];
	_logLine remoteExec ["diag_log", 2];
} else {
	diag_log _logLine;
};
