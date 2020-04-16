//Mission: Logistics for Salvage
private _fileName = "fn_LOG_Salvage";
if (!isServer and hasInterface) exitWith{};
params ["_markerX"];
[2, format ["Deffining variables, and creating markers"], _filename] call A3A_fnc_log;
_positionX = getMarkerPos _markerX;
private _boxType = "Box_NATO_Equip_F";
private _shipType = "Land_UWreck_FishingBoat_F";
private _boxCreated = false;
private _shipCreated = false;
private _boatCreated = false;
private _detectPlayer = true;
private _firstPos = round (random 100) + 150;
private _mrk1Pos = selectBestPlaces [_positionX, _firstPos,"waterDepth", 5, 20];
private _mrk2Pos = selectBestPlaces [(selectRandom _mrk1Pos) select 0, 300,"waterDepth", 5, 20];
private _mrk3Pos = selectBestPlaces [(selectRandom _mrk2Pos) select 0, 300,"waterDepth", 5, 20];
_mrk1 = createMarker ["Posible 1", (_mrk1Pos select 0) select 0];
_mrk1 setMarkerShape "ELLIPSE";
_mrk1 setMarkerSize [25, 25];
_mrk2 = createMarker ["Posible 2", (_mrk2Pos select 0) select 0];
_mrk2 setMarkerShape "ELLIPSE";
_mrk2 setMarkerSize [25, 25];
_mrk3 = createMarker ["Posible 3", (_mrk3Pos select 0) select 0];
_mrk3 setMarkerShape "ELLIPSE";
_mrk3 setMarkerSize [25, 25];
_road = [_positionX] call A3A_fnc_findNearestGoodRoad;
_pos = position _road;

[2, format ["Createing mission"], _filename] call A3A_fnc_log;
_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_city = [citiesX,_positionX] call BIS_fnc_nearestPosition;
_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_timeLimit = if (_difficultX) then {30} else {60};
if (hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints
_nameDest = [_markerX] call A3A_fnc_localizar;
_size = [_markerX] call A3A_fnc_sizeMarker;
_title = "Salvage supplies";
_text = format ["A supply shipment was sunk outside of %1. Go there and recover the supplies before %2.",_nameDest,_displayTime];
[[teamPlayer, civilian], "LOG",[ _text, _title, [_mrk1, _mrk2, _mrk3]], _pos, false, 0, true, "rearm", true] call BIS_fnc_taskCreate;
_truckCreated = false;
missionsX pushBack ["LOG","CREATED"]; publicVariable "missionsX";
_bonus = if (_difficultX) then {2} else {1};
_typeVeh = if (_difficultX) then {if (_sideX == Occupants) then {vehNATOBoat} else {vehCSATBoat}} else {if (_sideX == Occupants) then {vehNATORBoat} else {vehCSATRBoat}};
_typeGroupX = if (_difficultX) then {if (_sideX == Occupants) then {NATOSquad} else {CSATSquad}} else {if (_sideX == Occupants) then {groupsNATOmid select 0} else {groupsCSATmid select 0}};
_typeGroup = _typeGroupX;

[2, format ["Mission created, waiting for players to get near"], _filename] call A3A_fnc_log;
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))};
[2, format ["players in spawning range, starting spawning"], _filename] call A3A_fnc_log;

_boatmrk = createMarkerLocal ["boatmrk", selectRandom [((_mrk1Pos select 0) select 0), ((_mrk2Pos select 0) select 0), ((_mrk3Pos select 0) select 0)]];
_boatmrk setMarkerShape "ELLIPSE";
_boatmrk setMarkerSize [150, 150];
if (!debug) then {_boatmrk setMarkerAlphaLocal 0};
_boxmrk = selectRandom ["Posible 1", "Posible 2", "Posible 3"];
_boxPos = getmarkerPos _boxmrk;
_shipPos = [(_boxPos select 0) + 4, (_boxPos select 1) + -5, (_boxPos select 2)];
[2, format ["starting obj spawning and despawning loop"], _filename] call A3A_fnc_log;

_ship = _shipType createVehicle _shipPos;
_boxX = _boxType createVehicle _boxPos;
_boxX addAction ["Atach rope", {params ["_target", "_caller", "_iD"]; [_target, _caller, _iD] call A3A_fnc_SalvageCargo;}, [], 1.5, true, true, "", "", 3];
_loot = selectRandom [[_boxX, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 10, 5, 10, 0, 0], [_boxX, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0], [_boxX, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
_loot call A3A_fnc_NATOcrate;
[4, format ["Box spawned"], _filename] call A3A_fnc_log;
sleep 10;

private _spawnLoop = {
	params ["_boxX", "_boxPos", "_typeVeh", "_sideX", "_pos", "_typeGroup", "_positionX"];
	_missionComplete = "LOG" call BIS_fnc_taskCompleted;
	while {!_missionComplete} do {
		waitUntil {(allPlayers findIf {getPos _x distance2D _boxPos < 1000}!= -1)};//players in spawning range
		//boat spawn
		_vehicle=[(getMarkerPos "boatmrk"), 0,_typeVeh, _sideX] call bis_fnc_spawnvehicle;
		_veh = _vehicle select 0;
		[_veh] call A3A_fnc_AIVEHinit;
		[_veh] call A3A_fnc_SalvageRope;
		{deleteVehicle _x} forEach (crew _veh);
		_vehCrew = [_pos,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
		{_x moveInAny _veh} forEach (units _vehCrew);
		{[_x,""] call A3A_fnc_NATOinit} forEach units _vehCrew;
		_boatCreated = true;

		waitUntil {count (_positionX nearEntities [["ship"], 300]) != 0};
		sleep 5;// to let stuff spawn in
		_civBoat = _positionX nearEntities [["ship"], 300];
		{if ([_x, _boxX] call jn_fnc_logistics_canLoad != -3) then {[_x] call A3A_fnc_SalvageRope};}forEach _civBoat; //adds salvageRope to all boats that can load the crate
		sleep 5;//to stop spamming spawn and despawn

		waitUntil {!(allPlayers findIf {getPos _x distance2D _boxPos < 1000}!= -1)};//all players left spawning range
		//code to despawn stuff here
		if (_boatCreated) then {
		{deleteVehicle _x}forEach units _vehCrew;
		deleteVehicle _veh;
		_missionComplete = "LOG" call BIS_fnc_taskCompleted;// stops loop if on mission end
		};
	};
};
[_boxX, _boxPos, _typeVeh, _sideX, _pos, _typeGroup, _positionX] spawn _spawnLoop;

[2, format ["start detect player loop"], _filename] call A3A_fnc_log;
private _detect = {
	params ["_boatmrk"];
	_missionComplete = "LOG" call BIS_fnc_taskCompleted;
	while {!_missionComplete} do {
		sleep 5;
		{
			if (_x inArea _boatmrk) then {
				[_x, false] remoteExec["setCaptive"];
				[] spawn A3A_fnc_statistics;
			};
		}forEach allPlayers;
		_missionComplete = "LOG" call BIS_fnc_taskCompleted;
	};
};
[_boatmrk] spawn _detect;
//end check
[2, format ["Wait for mission end"], _filename] call A3A_fnc_log;
waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or ((_boxX distanceSqr posHQ) < 10000)};
if (dateToNumber date > _dateLimitNum) then {
	["LOG",[ _text, _title,[_mrk1, _mrk2, _mrk3]],_positionX,"FAILED","rearm"] call A3A_fnc_taskUpdate;
	deleteMarkerLocal _boatmrk;
	deleteMarker _mrk1;
	deleteMarker _mrk2;
	deleteMarker _mrk3;
	[-1200*_bonus] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	waitUntil {sleep 1; !([300,1,_veh,teamPlayer] call A3A_fnc_distanceUnits)};
	if (_boatCreated) then {
	{deleteVehicle _x} forEach units _vehCrew;
	deleteVehicle _veh;
	};
	deleteVehicle _boxX;
	deleteVehicle _ship;
	[2, format ["Mission Failed"], _filename] call A3A_fnc_log;

} else {
	["LOG",[ _text, _title,[_mrk1, _mrk2, _mrk3]],_positionX,"SUCCEEDED","rearm"] call A3A_fnc_taskUpdate;
	deleteMarkerLocal _boatmrk;
	deleteMarker _mrk1;
	deleteMarker _mrk2;
	deleteMarker _mrk3;
	[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	[1200*_bonus] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _boxX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	if (_boatCreated) then {
	waitUntil {sleep 1; !([300,1,_veh,teamPlayer] call A3A_fnc_distanceUnits)};
	{deleteVehicle _x} forEach units _vehCrew;
	deleteVehicle _veh;
	};
	deleteVehicle _ship;
	[2, format ["Mission Succeeded"], _filename] call A3A_fnc_log;
};
_nul = [1200,"LOG"] spawn A3A_fnc_deleteTask;
[2, format ["set delete task timer"], _filename] call A3A_fnc_log;
