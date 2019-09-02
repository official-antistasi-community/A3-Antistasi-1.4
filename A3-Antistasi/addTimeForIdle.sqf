//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

params ["_siteX", "_time"];

private _isMarker = [false, true] select (_siteX isEqualType "");

if (_isMarker) then {
	private _dateNum = server getVariable [_siteX, 0];

	if (_dateNum < dateToNumber date) then { _dateNum = dateToNumber date; };

	private _dateArray = numberToDate [2035, _dateNum];
	_dateArray set [4, + _time];
	server setVariable [_siteX, dateToNumber _dateArray, true];
} else {
	private _dateNum = timer getVariable [(typeOf _siteX), 0];

	if (_dateNum < dateToNumber date) then { _dateNum = dateToNumber date; };

	private _dateArray = numberToDate [2035, _dateNum];

	if (side _siteX == Occupants) then {
		_time = round (_time * 1.5);
	} else {
		if ({sidesX getVariable [_x, sideUnknown] == Invaders} count airportsX == 1) then {
			_time = 0;
		};
	};

	_dateArray set [4, + _time];
	timer setVariable [typeOf _siteX, dateToNumber _dateArray, true];
};
