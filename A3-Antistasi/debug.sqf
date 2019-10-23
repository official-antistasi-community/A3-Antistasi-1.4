if (!isServer) exitWith {};
/**
Mode: number;
0 = Off;
1 = systemChat;
2 = diag_log.
 */
params ["_message", "_mode"];

try {
	_mode = if(isNil "_mode") then {_mode = 0 } else { _mode };  
	if (_mode == 1) then { [_message, "systemchat"] call BIS_fnc_MP; };
	if (_mode == 2) then { diag_log _message};
} catch {
	_mode = if(isNil "_mode") then {_mode = 2 } else { _mode };  
	if (_mode == 1) then { [_exception, "systemchat"] call BIS_fnc_MP; };
	if (_mode == 2) then { diag_log _exception};
}