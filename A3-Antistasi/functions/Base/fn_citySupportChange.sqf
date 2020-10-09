private _filename = "fn_citySupportChange";
if (!isServer) exitWith {
	[1, "Server-only function miscalled", _filename] call A3A_fnc_log;
};

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;

params ["_changeGov", "_changeReb", "_pos", ["_isRadio", false]];

private _city = if (_pos isEqualType "") then {_pos} else {[citiesX, _pos] call BIS_fnc_nearestPosition};
private _dataX = server getVariable _city;
if (isNil "_dataX" || {!(_dataX isEqualType [])}) exitWith
{
	cityIsSupportChanging = false;
	[1, format ["No data found for city %1", _city], _filename] call A3A_fnc_log;
};
_dataX params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];

// Radio propaganda can't increase support above 30% or decrease below 50%
if (_isRadio) then {
	if (_changeGov > 0) then { _changeGov = (30 - _supportGov) max 0 min _changeGov };
	if (_changeGov < 0) then { _changeGov = (50 - _supportGov) min 0 max _changeGov };
	
	if (_changeReb > 0) then { _changeReb = (30 - _supportReb) max 0 min _changeReb };
	if (_changeReb < 0) then { _changeReb = (50 - _supportReb) min 0 max _changeReb };
};

// Cap total to 100 and minimums to 0
_changeGov = _changeGov min (100 - _supportReb + _supportGov);
_supportGov = 0 max (_supportGov + _changeGov);

_changeReb = _changeReb min (100 - _supportReb + _supportGov);
_supportReb = 0 max (_supportReb + _changeReb);

_dataX = [_numCiv, _numVeh, _supportGov, _supportReb];

server setVariable [_city,_dataX,true];
cityIsSupportChanging = false;
true
