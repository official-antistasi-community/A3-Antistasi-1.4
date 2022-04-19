/*
    Author: [Hazey]

    Description:
		Get's the current AI amount and outputs the load.

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[PATCOM_AI_LOAD] call A3A_fnc_patrolAILoad;

    License: MIT License

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_count"];

private _aiLoadSleep = 5;
private _maxLoadSleep = 60;

// IF SWITCH OF PAIN!
if (_count <= 30) exitWith {
	_aiLoadSleep = 5;
	_aiLoadSleep;
};

if ((_count >= 31) && (_count <= 60)) exitWith {
	_aiLoadSleep = 10;
	_aiLoadSleep;
};

if ((_count >= 61) && (_count <= 90)) exitWith {
	_aiLoadSleep = 25;
	_aiLoadSleep;
};

if ((_count >= 91) && (_count <= 120)) exitWith {
	_aiLoadSleep = 35;
	_aiLoadSleep;
};

if ((_count >= 121) && (_count <= 150)) exitWith {
	_aiLoadSleep = 45;
	_aiLoadSleep;
};

if (_count > 151) exitWith {
	_maxLoadSleep;
};

_aiLoadSleep