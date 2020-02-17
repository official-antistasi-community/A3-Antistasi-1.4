private ["_mrkDestination","_mrkOrigin","_numberX","_sideX","_typeGroup","_typeVehX","_indexX","_spawnPoint","_pos","_timeOut","_veh","_groupX","_landPos","_Vwp0","_posOrigin","_land","_pos1","_pos2"];

_mrkDestination = _this select 0;
_mrkOrigin = _this select 1;
_numberX = _this select 2;
_sideX = _this select 3;
diag_log format ["[Antistasi] Spawning PatrolReinforcement. Dest:%1, Orig:%2, Size:%3, Side: %4",_mrkDestination,_mrkOrigin,_numberX,_sideX];
_posDestination = getMarkerPos _mrkDestination;
_posOrigin = getMarkerPos _mrkOrigin;

_land = if (_posOrigin distance _posDestination > distanceForLandAttack) then {false} else {true};
_typeGroup = if (_sideX == Occupants) then {if (_numberX == 4) then {selectRandom groupsNATOmid} else {selectRandom groupsNATOSquad}} else {if (_numberX == 4) then {selectRandom groupsCSATmid} else {selectRandom groupsCSATSquad}};
_typeVehX = "";
if (_land) then
{
	if (_sideX == Occupants) then {_typeVehX = selectRandom vehNATOTrucks} else {_typeVehX = selectRandom vehCSATTrucks};
}
else
{
	_vehPool = if (_sideX == Occupants) then {vehNATOTransportHelis + vehNATOTransportPlanes} else {vehCSATTransportHelis + vehNATOTransportPlanes};
	if ((_numberX > 4) and (count _vehPool > 1) and !hasIFA) then {_vehPool = _vehPool - [vehNATOPatrolHeli,vehCSATPatrolHeli]};
	//_vehPool = _vehPool select {(_x isKindOf "Helicopter") and (_x in vehFastRope)};
	_typeVehX = selectRandom _vehPool;
};

_pos = [];
_veh = objNull;
_groupX = grpNull;

if (_land) then
{
	_indexX = airportsX find _mrkOrigin;
	_spawnPoint = server getVariable (format ["spawn_%1", _mrkOrigin]);
	_pos = getMarkerPos _spawnPoint;
	_timeOut = 0;
	_pos = _pos findEmptyPosition [0,100,_typeVehX];
	while {_timeOut < 60} do
	{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _pos findEmptyPosition [0,100,_typeVehX];
		sleep 1;
	};
	if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
	_veh = _typeVehX createVehicle _pos;
	_veh setDir (markerDir _spawnPoint);
	_groupX = [_pos,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
	_groupX addVehicle _veh;
	{
		if (_x == leader _x) then {_x assignAsDriver _veh;_x moveInDriver _veh} else {_x assignAsCargo _veh;_x moveInCargo _veh};

		if (vehicle _x == _x) then
		{
			deleteVehicle _x;
		}
		else
		{
			[_x] call A3A_fnc_NATOinit;
		};
	} forEach units _groupX;
	[_veh] call A3A_fnc_AIVEHinit;
	[_veh,"Inf Truck."] spawn A3A_fnc_inmuneConvoy;
	_groupX spawn A3A_fnc_attackDrillAI;
	[_mrkOrigin,_posDestination,_groupX] call A3A_fnc_WPCreate;
	_Vwp0 = (wayPoints _groupX) select 0;
	_Vwp0 setWaypointBehaviour "SAFE";
	_Vwp0 = _groupX addWaypoint [_posDestination, count (wayPoints _groupX)];
	_Vwp0 setWaypointType "GETOUT";
	_Vwp0 setWaypointStatements ["true","nul = [(thisList select {alive _x}),side this,(group this) getVariable [""reinfMarker"",""""],0] remoteExec [""A3A_fnc_garrisonUpdate"",2];[group this] spawn A3A_fnc_groupDespawner; reinfPatrols = reinfPatrols - 1; publicVariable ""reinfPatrols"";"];
	}
else
{
	_pos = _posOrigin;
	_ang = 0;
	_size = [_mrkOrigin] call A3A_fnc_sizeMarker;
	_buildings = nearestObjects [_posOrigin, ["Land_LandMark_F","Land_runway_edgelight"], _size / 2];
	if (count _buildings > 1) then
	{
		_pos1 = getPos (_buildings select 0);
		_pos2 = getPos (_buildings select 1);
		_ang = [_pos1, _pos2] call BIS_fnc_DirTo;
		_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
	};
	if (count _pos == 0) then {_pos = _posOrigin};

	_vehicle=[_pos, _ang + 90,_typeVehX, _sideX] call bis_fnc_spawnvehicle;
	_veh = _vehicle select 0;
	_vehCrew = _vehicle select 1;
	_groupVeh = _vehicle select 2;
	{
		[_x] call A3A_fnc_NATOinit;
		_x addEventHandler ["Killed",{deleteVehicle (group (_this select 0) getVariable ["myPad",objNull])}];
	} forEach units _groupVeh;
	[_veh] call A3A_fnc_AIVEHinit;

	_groupX = [_posOrigin,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
	{
		_x assignAsCargo _veh;
		_x moveInCargo _veh;
		if (vehicle _x == _x) then
		{
			deleteVehicle _x;
		}
		else
		{
			[_x] call A3A_fnc_NATOinit;
		};
	} forEach units _groupX;
	_landPos = if (_typeVehX isKindOf "Helicopter") then {[_posDestination, 0, 300, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos} else {[0,0,0]};
	if !(_landPos isEqualTo [0,0,0]) then
	{
		_landPos set [2, 0];
		_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
		_groupVeh setVariable ["myPad",_pad];
		_wp0 = _groupVeh addWaypoint [_landpos, 0];
		_wp0 setWaypointType "TR UNLOAD";
		_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';deleteVehicle ((group this) getVariable [""myPad"",objNull])"];
		_wp0 setWaypointBehaviour "CARELESS";
		_wp3 = _groupX addWaypoint [_landpos, 0];
		_wp3 setWaypointType "GETOUT";
		_wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
		_wp0 synchronizeWaypoint [_wp3];
		_wp4 = _groupX addWaypoint [_posDestination, 1];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointStatements ["true","nul = [(thisList select {alive _x}),side this,(group this) getVariable [""reinfMarker"",""""],0] remoteExec [""A3A_fnc_garrisonUpdate"",2];[group this] spawn A3A_fnc_groupDespawner; reinfPatrols = reinfPatrols - 1; publicVariable ""reinfPatrols"";"];
		_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
		[_groupVeh,1] setWaypointBehaviour "AWARE";
	}
	else
	{
		if (_typeVehX in vehFastRope) then
		{
			[_veh,_groupX,_posDestination,_posOrigin,_groupVeh,true] spawn A3A_fnc_fastrope;
		}
		else
		{
			[_veh,_groupX,_posDestination,_mrkOrigin,true] spawn A3A_fnc_airdrop;
		};
	};
};

reinfPatrols = reinfPatrols + 1; publicVariable "reinfPatrols";
_groupX setVariable ["reinfMarker",_mrkDestination];
_groupX setVariable ["originX",_mrkOrigin];
{
_x addEventHandler ["Killed",
	{
	_unit = _this select 0;
	_groupX = group _unit;
	if ({alive _x} count units _groupX == 0) then
		{
		reinfPatrols = reinfPatrols - 1; publicVariable "reinfPatrols";
		_originX = _groupX getVariable "originX";
		_destinationX = _groupX getVariable "reinfMarker";
		if (((sidesX getVariable [_originX,sideUnknown] == Occupants) and (sidesX getVariable [_destinationX,sideUnknown] == Occupants)) or ((sidesX getVariable [_originX,sideUnknown] == Invaders) and (sidesX getVariable [_destinationX,sideUnknown] == Invaders))) then
			{
			_killzones = killZones getVariable [_originX,[]];
			_killzones pushBack _destinationX;
			killZones setVariable [_originX,_killzones,true];
			}
		};
	}];
} forEach units _groupX;
