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

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// We only want to run on the server and not on the players
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

// This array will be used later, as it appears redundent now.
private _civilians = [];
// ---
private _civilianGroups = [];
private _civilianPopulation = 0;
private _positionX = getMarkerPos (_markerX);
private _num = [_markerX] call A3A_fnc_sizeMarker;
private _dayState = [] call A3A_fnc_getDayState;
private _buildings = nearestObjects [_positionX, ["House"], _num];

_num = round (_num / 100);

ServerDebug_1("Spawning City Civilians in %1", _markerX);

private _city = if (_positionX isEqualType "") then {_positionX} else {[citiesX, _positionX] call BIS_fnc_nearestPosition};
private _cityData = server getVariable _city;

// This is just for testing purposes, will math better.
_civilianPopulation = round ((_cityData#0) / 30);

diag_log text format["Hazey Debug--- City Data Dump near Call: %1", _cityData];
diag_log text format["Hazey Debug--- Amount of AI to spawn: %1", _civilianPopulation];

for "_i" from 1 to _civilianPopulation do {
	private _posHouse = [];

	while {true} do {
		private _building = selectRandom _buildings;
		diag_log text format["Hazey Debug--- House Selected: %1", _building];

		private _housePositions = [_building] call BIS_fnc_buildingPositions;

		diag_log text format["Hazey Debug--- House Positions: %1", _housePositions];

		if !(_housePositions isEqualTo []) exitWith {
			_posHouse = selectRandom _housePositions;};
	};

	private _groupX = createGroup civilian;
	private _civUnit = [_groupX, FactionGet(civ, "unitMan"), _posHouse, [],0, "NONE"] call A3A_fnc_createUnit;
	_civUnit setPosATL _posHouse;
	_civUnit setVariable ["A3A_civHomePosition", _posHouse, false];
	[_civUnit] spawn A3A_fnc_CIVinit;
	_civUnit forceWalk true;

	diag_log text format["Hazey Debug--- dayState: %1", _dayState];

	if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
		private _building = _posHouse nearestObject "House";
		_light = [_building] call A3A_fnc_createRoomLight;
	};

	if (_dayState == "MORNING") then {

	};

	if (_dayState == "DAY") then {
		// --- Disabled for now while I CfgSounds is broken.
		//private _building = _posHouse nearestObject "House";
		//_musicSource = [_building] call A3A_fnc_createMusicSource;
		// ---

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

	_civilians pushBack _civUnit;
	_civilianGroups pushBack _groupX;

	diag_log text format["Hazey Debug--- Creating AI group: %1", _groupX];
};

waitUntil {sleep 30;(spawner getVariable _markerX == 2)};

{if (alive _x) then {deleteVehicle _x}} forEach _civilians;
{deleteGroup _x} forEach _civilianGroups;