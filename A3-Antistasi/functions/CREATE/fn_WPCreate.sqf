//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

params ["_mrkOrigin", "_mrkDestination", "_groupX"];

private _posOrigin = [];
private _posDestination = [];

if (_mrkOrigin isEqualType "") then {
	_posOrigin = getMarkerPos _mrkOrigin;
} else {
	_posOrigin = _mrkOrigin;
};

if (_mrkDestination isEqualType "") then {
	_posDestination = getMarkerPos _mrkDestination;
} else {
	_posDestination = _mrkDestination;
};

private _finalArray = [];

if (worldName == "Tanoa") then {

	private _exit = false;

	if (_mrkOrigin isEqualType "") then {
		if ((_mrkOrigin != "airport") && (_mrkOrigin != "airport_2")) then { _exit = true; };
	} else {
		if (!([_mrkOrigin, "airport"] call A3A_fnc_isTheSameIsland)) then {
			_exit = true;
		} else {
			if (_mrkOrigin distance2D (getMarkerPos "airport") < _mrkOrigin distance2D (getMarkerPos "airport_2")) then {
				_mrkOrigin = "airport";
			} else {
				_mrkOrigin = "airport_2";
			};
		};
	};

	if (_exit) exitWith {};

	waitUntil
	{
		sleep 1;
		diag_log "WPCreate cannot get the roadsMrk, sleeping 1 second to await marker init!";
		!(isNil "roadsMrk")
	};

	private _arr2 = [];
	private _final = [roadsMrk, _posDestination] call BIS_fnc_nearestPosition;
	private _useCentral = true;
	private _isCentral = false;

	switch (true) do {
		case (_final in roadsCentral): { _isCentral = true; };
		case (_final in roadsCE): { _arr2 = +roadsCE; };
		case (_final in roadsCSE): { _arr2 = +roadsCSE; };
		case (_final in roadsSE): { _arr2 = +roadsSE; };
		case (_final in roadsSW): {
			_arr2 = +roadsSW;
			if (_mrkOrigin == "airport") then { _useCentral = false; };
		};
		case (_final in roadsCW): { _arr2 = +roadsCW; };
		case (_final in roadsNW): { _arr2 = +roadsNW; };
		default {
			_arr2 = +roadsNE;
			if (_mrkOrigin == "airport_2") then { _useCentral = false; };
		};
	};

	private _roadsCentral = roadsCentral;

	if (_useCentral && (_mrkOrigin != "airport")) then {reverse _roadsCentral};

	if (_isCentral) then {
		{
			_finalArray pushBack _x;
			if (_x == _final) exitWith {};
		} forEach _roadsCentral;
	} else {
		if (_useCentral) then {
			private _inicial = _arr2 select 0;
			private _medio = [_roadsCentral, _inicial] call BIS_fnc_nearestPosition;
			{
				_finalArray pushBack _x;
				if (_x == _medio) exitWith {};
			} forEach _roadsCentral;

			{
				_finalArray pushBack _x;
				if (_x == _final) exitWith {};
			} forEach _arr2;
		} else {
			{
				_finalArray pushBack _x;
				if (_x == _final) exitWith {};
			} forEach _arr2;
		};
	};

	if (getMarkerPos _final distance _posOrigin > _posDestination distance _posOrigin) then {
		_finalArray = _finalArray - [_final];
	};

} else {

	private ["_road", "_pos", "_pos1"];
	private _distance = _posOrigin distance2d _posDestination;

	if (_distance < 1500) exitWith {
		diag_log format ["%1: [Antistasi] | DEBUG | WPCreateAltis.sqf | Convoy with zero WP because they are too close: %2 to %3, distance: %4", servertime, _mrkOrigin, _mrkDestination, _distance];
	};

	private _roadsMrk = roadsMrk select {
		((getMarkerPos _x) distance2d _posDestination < _distance) &&
		((getMarkerPos _x) distance2d _posOrigin < _distance)
	};

	if (_roadsMrk isEqualTo []) exitWith
	{
		diag_log "Could not find any road marker in range, assuming direct way!";
		_finalArray = [];
	};

	_roadsMrk = [_roadsMrk, [], {getMarkerPos _x distance2d _posOrigin}, "ASCEND"] call BIS_fnc_sortBy;
	_finalArray = [_roadsMrk select 0];
	_roadsMrk = _roadsMrk - _finalArray;

	while {true} do {
		if (_roadsMrk isEqualTo []) exitWith {};

		_lastRoad = _finalArray select ((count _finalArray) -1);
		_road = [_roadsMrk, _lastRoad] call BIS_fnc_nearestPosition;
		_pos = getMarkerPos _road;
		_pos1 = getMarkerPos _lastRoad;

		if (_pos distance2D _posDestination < _pos1 distance2d _posDestination) then {
			_finalArray pushBack _road;
		};
		_roadsMrk = _roadsMrk - [_road];
	};
};

private _waypoints = _finalArray apply {_groupX addWaypoint [getMarkerPos (_x), 0]};
{_x setWaypointBehaviour "SAFE"} forEach _waypoints;

if (count _waypoints > 0) then { _groupX setCurrentWaypoint (_waypoints select 0) };

_waypoints;
