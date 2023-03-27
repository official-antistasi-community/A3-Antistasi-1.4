/*
    Author: [Hazey]
    Description:
		Debug Utility to draw 3D Text above AI Units.

    Arguments:
		<Object> - Unit you want text to be drawn over.
		<String> - Text.
		<Number> - How long you want text to display for.
		<String> - Color you want. Red, Green, Blue, Yellow, White
    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[leader _group, "ATTACK", 10, "White"] call A3A_fnc_debugText3D;
    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_Unit", "_Text", ["_Timer", 10], ["_color", "Green"]];

if !(alive _Unit) exitWith {};
if (isNil "_Unit") exitWith {};

private _TimerEXP = time + _Timer;

private _red = 0.9;
private _green = 0.9;
private _blue = 0.9;

if (_color == "Red") then {
	_red = 0.9;
	_green = 0;
	_blue = 0;
};

if (_color == "Green") then {
	_red = 0;
	_green = 0.8;
	_blue = 0;
};

if (_color == "Blue") then {
	_red = 0;
	_green = 0;
	_blue = 1;
};

if (_color == "Yellow") then {
	_red = 0.85;
	_green = 0.85;
	_blue = 0;
};

if (_color == "White") then {
	_red = 0.9;
	_green = 0.9;
	_blue = 0.9;
};

[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
[(str _Unit), "onEachFrame", 
{
	params ["_Unit", "_text", "_TimerEXP", "_red", "_green", "_blue"];
	private _pos = getposATL _Unit;
	_pos set [2,3];
	call compile format ['drawIcon3D["", [%1,%2,%3,1], %4, 0, 0, 0, %5, 2, 0.04, "PuristaMedium", "center", false];', _red, _green, _blue, _pos, (str _text)];

	if (!(alive _Unit) || time > _TimerEXP) then {
		[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	};
},[_Unit,_text,_TimerEXP, _red, _green, _blue]] call BIS_fnc_addStackedEventHandler;