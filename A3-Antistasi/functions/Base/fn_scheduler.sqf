if (!isServer) exitWith {};
private _params = _this select 0;
private _function = _this select 1;
diag_log format ["%1: [Antistasi] | INFO | scheduler | Running schedule task for %2 at %3",servertime,_params,_function];
if (count hcArray == 0) exitWith {_params remoteExec [_function,2]};
diag_log format ["%1: [Antistasi] | INFO | scheduler | HC Array NOT empty, running scheduler for ONE HC",servertime];
if (count hcArray == 1) exitWith {_params remoteExec [_function,hcArray select 0]};
diag_log format ["%1: [Antistasi] | INFO | scheduler | More than one HC detected, running scheduler for all HC's",servertime];
_return = 2;
_min = 1000;
{
_hcID = _x;
_num = {owner _x == _hcID} count allUnits;
if (_num < _min) then
	{
	_return = _hcID;
	_min = _num;
	};
} forEach hcArray;

_params remoteExec [_function,_return];
diag_log format ["%1: [Antistasi] | INFO | scheduler | END TASK SCHEDULER",servertime,_params,_function];