private ["_mrkOrigin","_mrkDestination","_posOrigin","_posDestination","_roadsMrk","_finalArray","_road","_pos"];
_mrkOrigin = _this select 0;
_posOrigin = if (_mrkOrigin isEqualType "") then {getMarkerPos _mrkOrigin} else {_mrkOrigin};
_mrkDestination = _this select 1;
_posDestination = if (_mrkDestination isEqualType "") then {getMarkerPos _mrkDestination} else {_mrkDestination};
_distance = _posOrigin distance2d _posDestination;
//diag_log format ["Antistasi: Convoy Debug. Convoy sent from %1 to %2, distance: %3",_mrkOrigin,_mrkDestination,_distance];
if (_distance < 1500) exitWith {
	diag_log format ["%1: [Antistasi] | DEBUG | WPCreateAltis.sqf | Convoy with zero WP because they are too close: %2 to %3, distance: %4",servertime,_mrkOrigin,_mrkDestination,_distance];
};
//_roadsMrk = roadsMrk + (controlsX select {isOnRoad (getMarkerPos _x)});
//_roadsMrk = _roadsMrk select {((getMarkerPos _x) distance2d _posDestination < _distance) and ((getMarkerPos _x) distance2d _posOrigin < _distance)};
_roadsMrk = roadsMrk select {((getMarkerPos _x) distance2d _posDestination < _distance) and ((getMarkerPos _x) distance2d _posOrigin < _distance)};
if (_roadsMrk isEqualTo []) exitWith {};
_roadsMrk = [_roadsMrk,[],{getMarkerPos _x distance2d _posOrigin},"ASCEND"] call BIS_fnc_sortBy;
//diag_log format ["Antistasi: Convoy Debug. Convoy from %1 to %2, have this possible mid waypoints %3",_mrkOrigin,_mrkDestination,_roadsMrk];
_finalArray = [_roadsMrk select 0];
_roadsMrk = _roadsMrk - _finalArray;
while {true} do
	{
	if (_roadsMrk isEqualTo []) exitWith {};
	_lastRoad = _finalArray select ((count _finalArray) -1);
	_road = [_roadsMrk,_lastRoad] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _road;
	_pos1 = getMarkerPos _lastRoad;
	if (_pos distance2D _posDestination < _pos1 distance2d _posDestination) then
		{
		_finalArray pushBack _road;
		};
	_roadsMrk = _roadsMrk - [_road];
	};
_groupX = _this select 2;

for "_i" from 0 to (count _finalArray) - 1 do
	{
	_groupX addWaypoint [getMarkerPos (_finalArray select _i), _i]
	};