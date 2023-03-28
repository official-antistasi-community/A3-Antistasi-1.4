/*
    Author: [Hazey]
    Description:
		Gets current time of day cycle in phases.
		Exports Time (Hour / Minute).

    Arguments:
    	N/A

    Return Value:
    	<String> Current Day State

    Scope: Any
    Environment: Any
    Public: Yes

    Example: 
		_daystate = [] call A3A_fnc_getDayState

    License: MIT License
*/

private _date = date;
private _sunOrMoon = sunOrMoon;
private _dayState = "";

_hour = (_date#3);

if ((_hour > 5) && (_hour < 7)) then {
	_dayState = "MORNING";	
} else {
	_dayState = "DAY";
};

if(_sunOrMoon < 1) then {
    _dayState = "EVENING";
    if((_hour >= 23) || (_hour < 5)) then {
        _dayState = "NIGHT";
    };
};

if (_dayState == "") exitWith {"UNKNOWN"};

_dayState