/*
    Author: [Hazey]
    Description:
		Modify current weather value based on Min/Max and Weather Modifier.

    Arguments:
		<Number> Current Weather Value.
		<Number> Min Weather Bounds.
		<Number> Max Weather Bounds.
		<Number> Modifier for weather Value to scale.

    Return Value:
		<Number> New Weather value based on Min/Max bounds and weather Modifier.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		private _newOvercastValue = [0.5, 0.1, 0.8, 0.2] call A3A_fnc_getWeatherValue;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_currentValue", "_minValue", "_maxValue", "_modifier"];

private _returnValue = 0;
private _aboveBounds = false;
private _belowBounds = false;

// If above bounds, we lower the number by the random number from modifier.
if (round(_currentValue * (10 ^ 2)) / (10 ^ 2) >= _maxValue) then { 
	_aboveBounds = true;
	_returnValue = round((_currentValue - (random _modifier)) * (10 ^ 2)) / (10 ^ 2);
};

// If below bounds, we raise the number by the random number from modifier.
if (round(_currentValue * (10 ^ 2)) / (10 ^ 2) <= _minValue) then { 
	_belowBounds = true; 
	_returnValue = round((_currentValue + (random _modifier)) * (10 ^ 2)) / (10 ^ 2);
};

// If not below min or above max. Then we generate a random number.
if !(_aboveBounds || _belowBounds) then {
	if (random 10 > 5) then {
		_returnValue = round((_currentValue + (random _modifier)) * (10 ^ 2)) / (10 ^ 2); 
	} else {
		_returnValue = round((_currentValue - (random _modifier)) * (10 ^ 2)) / (10 ^ 2);
	};
};

// We don't want to go above 1.
if (_returnValue > 1) then {_returnValue = 1};

// We don't want to go below 0 either.
if (_returnValue < 0) then {_returnValue = 0};

_returnValue