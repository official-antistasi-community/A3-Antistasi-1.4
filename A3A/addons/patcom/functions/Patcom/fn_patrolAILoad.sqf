/*
    Author: [Hazey]

    Description:
		Get's the current AI amount and outputs the load.

    Arguments:
    	<Number> Amount of AI currently spawned.

    Return Value:
    	<Number> How long to pause the main loop.

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

private _aiLoadSleep = 10;
private _maxLoadSleep = 120;

// IF SWITCH OF PAIN!
if (_count <= 30) exitWith {
	_aiLoadSleep = 10;
	_aiLoadSleep;
};

if ((_count >= 31) && (_count <= 60)) exitWith {
	_aiLoadSleep = 20;
	_aiLoadSleep;
};

if ((_count >= 61) && (_count <= 90)) exitWith {
	_aiLoadSleep = 40;
	_aiLoadSleep;
};

if ((_count >= 91) && (_count <= 120)) exitWith {
	_aiLoadSleep = 60;
	_aiLoadSleep;
};

if ((_count >= 121) && (_count <= 150)) exitWith {
	_aiLoadSleep = 90;
	_aiLoadSleep;
};

if (_count > 151) exitWith {
	_maxLoadSleep;
};

_aiLoadSleep