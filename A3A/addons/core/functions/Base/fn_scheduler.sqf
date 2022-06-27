if (!isServer) exitWith {};

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_params", "_function"];
Info_2("Scheduled function: %1, Function params: %2", _function, _params);

if (count hcArray == 0) exitWith {_params remoteExec [_function,2]};
//if (count hcArray == 1) exitWith {_params remoteExec [_function,hcArray select 0]};

private _targetID = 2;
private _min = ({local _x} count allUnits) * 2;			// use server too when it's quiet
{
	private _hcID = _x;
	private _num = {owner _x == _hcID} count allUnits;
	if (_num < _min) then {
		_targetID = _hcID;
		_min = _num;
	};
} forEach hcArray;

Info_2("Executing on machine ID %1, minimum units %2", _targetID, _min);
_params remoteExec [_function, _targetID];
