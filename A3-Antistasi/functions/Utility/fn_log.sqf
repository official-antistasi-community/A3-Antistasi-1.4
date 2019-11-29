/**
	Logs to the Arma log file.
	
	Params:
		Log level: number - Error, Info or Debug. Levels 1, 2 and 3 respectively.
		Log Message: string - Message to log
		File (optional): string - File in which the log message originated
		Log to server (optional): bool - true for logging to server RPT instead of client
**/

params ["_level", "_message", ["_file", "No File Specified"], ["_toServer", false]];

if (_level > LogLevel) exitwith {};

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
	default {
		_logLine = format ["%1: [Antistasi] | Unknown Log Level Specified, please use 1= Errors, 2= Info, 3= Debug | %2 | %3", servertime, _file, _message];
	};
};

// Lazy evaluation should be removed if default value of _toServer is changed
if (_toServer && {!isServer}) then {
	_logLine remoteExec ["diag_log", 2];
} else {
	diag_log _logLine;
};

