if (!isServer) exitWith {};
private _fileName = "fn_scheduler";
scriptName "fn_scheduler";
private _params = _this select 0;
private _function = _this select 1;
[2,format ["Scheduled function: %1, Function params: %2",_function,_params],_fileName] call A3A_fnc_log;
if (count hcArray == 0) exitWith {_params remoteExec [_function,2]};
if (count hcArray == 1) exitWith {_params remoteExec [_function,hcArray select 0]};
_return = 2;
_min = 1000;
{
	_hcID = _x;
	_num = {owner _x == _hcID} count allUnits;
	if (_num < _min) then {
		_return = _hcID;
		_min = _num;
	};
} forEach hcArray;

_params remoteExec [_function,_return];