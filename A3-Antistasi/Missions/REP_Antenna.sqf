//Mission: Repair the antenna
if (!isServer and hasInterface) exitWith{};

private ["_markerX","_positionX","_dateLimit","_dateLimitNum","_nameDest","_truckCreated","_size","_pos","_veh","_groupX","_unit"];

_markerX = _this select 0;
_positionX = _this select 1;

_timeLimit = 60;
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;

[[teamPlayer,civilian],"REP",[format ["%3 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2.",_nameDest,_displayTime,nameOccupants],"Tower Rebuild Disrupt",_markerX],_positionX,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
missionsX pushBack ["REP","CREATED"]; publicVariable "missionsX";
_truckCreated = false;

waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (spawner getVariable _markerX != 2)};

if (spawner getVariable _markerX != 2) then
	{
	_truckCreated = true;
	_size = [_markerX] call A3A_fnc_sizeMarker;
	_road = [_positionX] call A3A_fnc_findNearestGoodRoad;
	_pos = position _road;
	_pos = _pos findEmptyPosition [1,60,"B_T_Truck_01_repair_F"];
	_veh = createVehicle [vehNATORepairTruck, _pos, [], 0, "NONE"];
	_veh allowdamage false;
	_veh setDir (getDir _road);
	_nul = [_veh] call A3A_fnc_AIVEHinit;
	_groupX = createGroup Occupants;

	sleep 5;
	_veh allowDamage true;

	for "_i" from 1 to 3 do
		{
		_unit = _groupX createUnit [NATOCrew, _pos, [], 0, "NONE"];
		[_unit,""] call A3A_fnc_NATOinit;
		sleep 2;
		};

	waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (not alive _veh)};

	if (not alive _veh) then
		{
		["REP",[format ["%3 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2.",_nameDest,_displayTime,nameOccupants],"Tower Rebuild Disrupt",_markerX],_positionX,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
		[2,0] remoteExec ["A3A_fnc_prestige",2];
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		{if (_x distance _veh < 500) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};
if (dateToNumber date > _dateLimitNum) then
	{
	if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
		{
		["REP",[format ["%3 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2:%3.",_nameDest,_displayTime,nameOccupants],"Tower Rebuild Disrupt",_markerX],_positionX,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
		[2,0] remoteExec ["A3A_fnc_prestige",2];
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		{if (_x distance _veh < 500) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		["REP",[format ["%3 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2.",_nameDest,_displayTime,nameOccupants],"Tower Rebuild Disrupt",_markerX],_positionX,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
		//[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	antennasDead = antennasDead - [_positionX]; publicVariable "antennasDead";
	_antenna = nearestBuilding _positionX;
	if (isMultiplayer) then {[_antenna,true] remoteExec ["hideObjectGlobal",2]} else {_antenna hideObject true};
	_antenna = createVehicle ["Land_Communication_F", _positionX, [], 0, "NONE"];
	antennas pushBack _antenna; publicVariable "antennas";
	{if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,true] spawn A3A_fnc_blackout}} forEach citiesX;
	_mrkFinal = createMarker [format ["Ant%1", count antennas], _positionX];
	_mrkFinal setMarkerShape "ICON";
	_mrkFinal setMarkerType "loc_Transmitter";
	_mrkFinal setMarkerColor "ColorBlack";
	_mrkFinal setMarkerText "Radio Tower";
	mrkAntennas pushBack _mrkFinal;
	publicVariable "mrkAntennas";
	_antenna addEventHandler ["Killed",
		{
		_antenna = _this select 0;
		{if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
		_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
		antennas = antennas - [_antenna]; antennasDead = antennasDead + [getPos _antenna]; deleteMarker _mrk;
		["TaskSucceeded",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
		["TaskFailed",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",Occupants];
		publicVariable "antennas"; publicVariable "antennasDead";
		}
		];
	};

_nul = [30,"REP"] spawn A3A_fnc_deleteTask;

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

if (_truckCreated) then
	{
	{deleteVehicle _x} forEach units _groupX;
	deleteGroup _groupX;
	if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits)) then {deleteVehicle _veh};
	};
