#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*
    Author: [Hazey]
    Description:
		Create Ambient Civ's within city

    Arguments:
    	<Marker> City Marker where you would like the Ambient Civilians created.
		Note, the marker must be provided from citiesX

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: Yes

    Example: 
		[[_marker], "A3A_fnc_createAmbientCivs"] call A3A_fnc_scheduler;

    License: MIT License
*/

params ["_markerX"];

// We only want to run on the server and not on the players
if (!isServer and hasInterface) exitWith{};

private _civilianGroups = [];
private _civilianPopulation = 0;
private _positionX = getMarkerPos (_markerX);
private _locationRadius = [_markerX] call A3A_fnc_sizeMarker;
private _dayState = [] call A3A_fnc_getDayState;

_locationRadius = round (_locationRadius / 100);
private _buildings = nearestObjects [_positionX, ["House"], _locationRadius];

ServerDebug_1("Spawning City Civilians in %1", _markerX);

private _city = if (_positionX isEqualType "") then {_positionX} else {[citiesX, _positionX] call BIS_fnc_nearestPosition};
private _cityData = server getVariable _city;

// This is just for testing purposes, will math better.
_civilianPopulation = round ((_cityData#0) / 30);

for "_i" from 1 to _civilianPopulation do {
	private _posHouse = [];

	while {true} do {
		private _building = selectRandom _buildings;

		private _housePositions = [_building] call BIS_fnc_buildingPositions;

		if !(_housePositions isEqualTo []) exitWith {
			_posHouse = selectRandom _housePositions;};
	};

	private _groupX = createGroup civilian;
	private _civUnit = [_groupX, FactionGet(civ, "unitMan"), _posHouse, [],0, "NONE"] call A3A_fnc_createUnit;
	_civUnit setPosATL _posHouse;
	_civUnit setVariable ["A3A_civHomePosition", _posHouse, false];
	[_civUnit] spawn A3A_fnc_CIVinit;
	_civUnit forceWalk true;

	if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
		private _building = _posHouse nearestObject "House";
		_light = [_building] call A3A_fnc_createRoomLight;
	};

	if (_dayState == "MORNING") then {

	};

	if (_dayState == "DAY") then {
		private _building = _posHouse nearestObject "House";
		_musicSource = [_building] call A3A_fnc_createMusicSource;

		[
			_groupX,
			_posHouse,
			50,
			3,
			"MOVE",
			"CARELESS",
			"BLUE",
			"NORMAL",
			"NO CHANGE",
			"",
			[10, 20, 30],
			25,
			"water",
			false
		] call A3A_fnc_createPatrol;
	};

	_civilianGroups pushBack _groupX;
};

waitUntil {sleep 30;(spawner getVariable _markerX == 2)};
{deleteGroup _x} forEach _civilianGroups;