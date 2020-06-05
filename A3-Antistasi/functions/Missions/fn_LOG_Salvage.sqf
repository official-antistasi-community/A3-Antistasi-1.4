//Mission: Logistics for Salvage
private _fileName = "fn_LOG_Salvage";
if (!isServer and hasInterface) exitWith {};

params ["_markerX"];

[2, format ["Creating Salvage mission"], _filename] call A3A_fnc_log;

private _positionX = getMarkerPos _markerX;

//Type of salvage crate to spawn
private _boxType = "Box_NATO_Equip_F";
//Sunken ship that was carrying the box to spawn in
private _shipType = "Land_UWreck_FishingBoat_F";

//Select possible locations for sunken treasure
private _firstPos = round (random 100) + 150;
private _mrk1Pos = (selectRandom (selectBestPlaces [_positionX, _firstPos,"waterDepth", 5, 20]) select 0) + [0];
private _mrk2Pos = (selectRandom (selectBestPlaces [_mrk1Pos, 300,"waterDepth", 5, 20]) select 0) + [0];
private _mrk3Pos = (selectRandom (selectBestPlaces [_mrk2Pos, 300,"waterDepth", 5, 20]) select 0) + [0];

//Create markers for treasure locations!
private _mrk1 = createMarker ["salvageLocation1", _mrk1Pos];
_mrk1 setMarkerShape "ELLIPSE";
_mrk1 setMarkerSize [25, 25];
private _mrk2 = createMarker ["salvageLocation2", _mrk2Pos];
_mrk2 setMarkerShape "ELLIPSE";
_mrk2 setMarkerSize [25, 25];
private _mrk3 = createMarker ["salvageLocation3", _mrk3Pos];
_mrk3 setMarkerShape "ELLIPSE";
_mrk3 setMarkerSize [25, 25];

[3, format ["Salvage Mission Positions: %1, %2, %3", _mrk1Pos, _mrk2Pos, _mrk3Pos], _filename] call A3A_fnc_log;

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};

//Set time limit on mission
private _timeLimit = if (_difficultX) then {30} else {60};
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

//Name of seaport marker
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _title = "Salvage supplies";
private _text = format ["A supply shipment was sunk outside of %1. Go there and recover the supplies before %2. You will need to get a hold of a boat with a winch to recover the shipment, check beaches for civilian boats you can commandeer.", _nameDest, _displayTime];
[[teamPlayer, civilian], "LOG",[ _text, _title, [_mrk1, _mrk2, _mrk3]], _positionX, false, 0, true, "rearm", true] call BIS_fnc_taskCreate;

missionsX pushBack ["LOG","CREATED"]; publicVariable "missionsX";

//salvageRope action
[] remoteExec ["A3A_fnc_SalvageRope", 0, true];

[3, format ["Mission created, waiting for players to get near"], _filename] call A3A_fnc_log;
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))};
[3, format ["players in spawning range, starting spawning"], _filename] call A3A_fnc_log;


private _boxPos = selectRandom [_mrk1Pos, _mrk2Pos, _mrk3Pos];
private _shipPos = _boxPos vectorAdd [4, -5, 2];

private _ship = _shipType createVehicle _shipPos;
private _box = _boxType createVehicle _boxPos;

//Used in salvage rope
_box setVariable ["SalvageCrate", true, true];
private _crateContents = selectRandom [
	[_box, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 10, 5, 10, 0, 0], 
	[_box, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0], 
	[_box, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
_crateContents call A3A_fnc_fillLootCrate;
[3, format ["Box spawned"], _filename] call A3A_fnc_log;

//Create boat and initialise crew members
[3, format ["Spawning patrol boat and crew"], _filename] call A3A_fnc_log;
private _typeVeh = if (_difficultX) then {if (_sideX == Occupants) then {vehNATOBoat} else {vehCSATBoat}} else {if (_sideX == Occupants) then {vehNATORBoat} else {vehCSATRBoat}};
private _typeGroup = if (_difficultX) then {if (_sideX == Occupants) then {NATOSquad} else {CSATSquad}} else {if (_sideX == Occupants) then {groupsNATOmid select 0} else {groupsCSATmid select 0}};
private _boatSpawnLocation = selectRandom [_mrk1Pos, _mrk2Pos, _mrk3Pos];

private _veh = createVehicle [_typeVeh, _boatSpawnLocation, [], 0, "NONE"];
[_veh, _sideX] call A3A_fnc_AIVEHinit;
private _vehCrewGroup = [_positionX,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
private _vehCrew = units _vehCrewGroup;
{_x moveInAny _veh} forEach (_vehCrew);
_vehCrewGroup addVehicle _veh;
{[_x,""] call A3A_fnc_NATOinit} forEach _vehCrew;

//While the boat is alive, we remove undercover from nearby players
[_veh, [_mrk1Pos, _mrk2Pos, _mrk3Pos]] spawn {
	params ["_veh", "_positions"];
	while {alive _veh} do {
		sleep 2;
		private _nearbyPlayers = allPlayers inAreaArray [getPos _veh, 150, 150];
		{ [_x, false] remoteExec ["setCaptive", _x] } forEach _nearbyPlayers;

		private _vehGroup = group _veh;
		if (_vehGroup != grpNull && {currentWaypoint _vehGroup == count waypoints _vehGroup}) then {
			private _newWaypoint = _vehGroup addWaypoint [selectRandom _positions, 30];
			_newWaypoint setWaypointType "MOVE";
			_vehGroup setCurrentWaypoint _newWaypoint;
		};
	};
};

//Disable simulation if we *really* want to

[3, format ["Waiting for salvage mission end"], _filename] call A3A_fnc_log;
waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or ((_box distance2D posHQ) < 100)};

private _timeout = false;
if (dateToNumber date > _dateLimitNum) then {
	_timeout = true;
	waitUntil {sleep 1; ((_box distance2D posHQ) < 100) || allPlayers inAreaArray [getPos _box, 50, 50] isEqualTo [] || isNull _box};
};

private _bonus = if (_difficultX) then {2} else {1};

if (_timeout && alive _box) then {
	["LOG",[ _text, _title,[_mrk1, _mrk2, _mrk3]],_positionX,"FAILED","rearm"] call A3A_fnc_taskUpdate;
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	[2, format ["Mission Failed"], _filename] call A3A_fnc_log;
	deleteVehicle _box;
} else {
	["LOG",[ _text, _title,[_mrk1, _mrk2, _mrk3]],_positionX,"SUCCEEDED","rearm"] call A3A_fnc_taskUpdate;
	[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	{if (_x distance _box < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	[2, format ["Mission Succeeded"], _filename] call A3A_fnc_log;
};

_nul = [1200,"LOG"] spawn A3A_fnc_deleteTask;
[3, format ["set delete task timer"], _filename] call A3A_fnc_log;

deleteMarker _mrk1;
deleteMarker _mrk2;
deleteMarker _mrk3;
deleteVehicle _ship;

[_vehCrewGroup] spawn A3A_fnc_groupDespawner;
[_veh] spawn A3A_fnc_vehDespawner;

