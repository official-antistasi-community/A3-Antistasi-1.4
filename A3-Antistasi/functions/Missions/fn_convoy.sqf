//Mission: Capture/destroy the convoy
if (!isServer and hasInterface) exitWith {};
private ["_pos","_timeOut","_posbase","_posDestination","_soldiers","_groups","_vehiclesX","_POWS","_timeXfin","_dateFinal","_enddateNum","_veh","_unit","_groupX","_sideX","_countX","_nameDest","_vehPool","_spawnPoint","_typeVehX"];
_destinationX = _this select 0;
_base = _this select 1;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_tsk1 = "";
_dateLimitNum = 0;
_isFIA = false;
_sideX = if (sidesX getVariable [_base,sideUnknown] == Occupants) then {Occupants} else {Invaders};

if (_sideX == Occupants) then
	{
	if ((random 10 >= tierWar) and !(_difficultX)) then
		{
		_isFIA = true;
		};
	};

_posbase = getMarkerPos _base;
_posDestination = getMarkerPos _destinationX;

_soldiers = [];
_groups = [];
_vehiclesX = [];
_POWS = [];
_reinforcementsX = [];
_typeVehEsc = "";
_typeVehObj = "";
_typeGroup = "";
_typeConvoy = [];
_posHQ = getMarkerPos respawnTeamPlayer;

_timeXfin = 120;
_dateFinal = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeXfin];
_enddateNum = dateToNumber _dateFinal;

private ["_tsk","_grpPOW","_pos"];

if ((_destinationX in airportsX) or (_destinationX in outposts)) then
	{
	_typeConvoy = ["ammunition","Armor"];
	if (_destinationX in outposts) then {if (((count (garrison getVariable [_destinationX, []]))/2) >= [_destinationX] call A3A_fnc_garrisonSize) then {_typeConvoy pushBack "reinforcementsX"}};
	}
else
	{
	if (_destinationX in citiesX) then
		{
		if (sidesX getVariable [_destinationX,sideUnknown] == Occupants) then {_typeConvoy = ["Supplies"]} else {_typeConvoy = ["Supplies"]}
		}
	else
		{
		if ((_destinationX in resourcesX) or (_destinationX in factories)) then {_typeConvoy = ["Money"]} else {_typeConvoy = ["Prisoners"]};
		if (((count (garrison getVariable [_destinationX, []]))/2) >= [_destinationX] call A3A_fnc_garrisonSize) then {_typeConvoy pushBack "reinforcementsX"};
		};
	};

_typeConvoyX = selectRandom _typeConvoy;

_timeLimit = if (_difficultX) then {0} else {round random 10};// timeX for the convoy to come out, we should put a random round 15
_timeLimit = 0;
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly when put through the function
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_destinationX] call A3A_fnc_localizar;
_nameOrigin = [_base] call A3A_fnc_localizar;
[_base,30] call A3A_fnc_addTimeForIdle;

_textX = "";
_taskState = "CREATED";
_taskTitle = "";
_taskIcon = "";
_taskState1 = "CREATED";

switch (_typeConvoyX) do
	{
	case "ammunition":
		{
		_textX = format ["A convoy from %1 is about to depart at %2. It will provide ammunition to %3. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Ammo Convoy";
		_taskIcon = "rearm";
		_typeVehObj = if (_sideX == Occupants) then {vehNATOAmmoTruck} else {vehCSATAmmoTruck};
		};
	case "Armor":
		{
		_textX = format ["A convoy from %1 is about to depart at %2. It will reinforce %3 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Armored Convoy";
		_taskIcon = "Destroy";
		_typeVehObj = if (_sideX == Occupants) then {vehNATOAA} else {vehCSATAA};
		};
	case "Prisoners":
		{
		_textX = format ["A group os POW's is being transported from %1 to %3, and it's about to depart at %2. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Prisoner Convoy";
		_taskIcon = "run";
		_typeVehObj = if (_sideX == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		};
	case "reinforcementsX":
		{
		_textX = format ["Reinforcements are being sent from %1 to %3 in a convoy, and it's about to depart at %2. Try to intercept and kill all the troops and vehicle objective.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Reinforcements Convoy";
		_taskIcon = "run";
		_typeVehObj = if (_sideX == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		};
	case "Money":
		{
		_textX = format ["A truck plenty of money is being moved from %1 to %3, and it's about to depart at %2. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nameOrigin,_displayTime,_nameDest];
		_taskTitle = "Money Convoy";
		_taskIcon = "move";
		_typeVehObj = "C_Van_01_box_F";
		};
	case "Supplies":
		{
		_textX = format ["A truck with medical supplies destination %3 it's about to depart at %2 from %1. Steal that truck bring it to %3 and let people in there know it is %4 who's giving those supplies.",_nameOrigin,_displayTime,_nameDest,nameTeamPlayer];
		_taskTitle = "Supply Convoy";
		_taskIcon = "heal";
		_typeVehObj = "C_Van_01_box_F";
		};
	};

[[teamPlayer,civilian],"CONVOY",[_textX,_taskTitle,_destinationX],_posDestination,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
[[_sideX],"CONVOY1",[format ["A convoy from %1 to %3, it's about to depart at %2. Protect it from any possible attack.",_nameOrigin,_displayTime,_nameDest],"Protect Convoy",_destinationX],_posDestination,false,0,true,"run",true] call BIS_fnc_taskCreate;
missionsX pushBack ["CONVOY","CREATED"]; publicVariable "missionsX";
sleep (_timeLimit * 60);

private _speedLimit = 40;

_posOrig = [];
_dir = 0;
if (_base in airportsX) then
{
	_indexX = airportsX find _base;
	_spawnPoint = server getVariable (format ["spawn_%1", _base]);
	_posOrig = getMarkerPos _spawnPoint;
	_dir = markerDir _spawnPoint;
}
else
{
	_spawnPoint = [getMarkerPos _base] call A3A_fnc_findNearestGoodRoad;
	_posOrig = position _spawnPoint;
	_dir = getDir _spawnPoint;
};

_groupX = createGroup _sideX;
_groups pushBack _groupX;
_typeVehX = if (_sideX == Occupants) then {if (!_isFIA) then {selectRandom vehNATOLightArmed} else {vehPoliceCar}} else {selectRandom vehCSATLightArmed};
_timeOut = 0;
_pos = _posOrig findEmptyPosition [0,100,_typeVehX];
while {_timeOut < 60} do
{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = _posOrig findEmptyPosition [0,100,_typeVehX];
	sleep 1;
};
if (count _pos == 0) then {_pos = _posOrig};

_vehicle=[_pos,_dir,_typeVehX, _groupX] call bis_fnc_spawnvehicle;
_vehLead = _vehicle select 0;
_vehLead allowDamage false;
[_vehLead,"Convoy Lead"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit;_x allowDamage false} forEach _vehCrew;
_soldiers append _vehCrew;
_vehiclesX pushBack _vehLead;
[_vehLead] call A3A_fnc_AIVEHinit;
_vehLead limitSpeed _speedLimit;

_countX = 1;
if (_difficultX) then {_countX =3} else {if ([_destinationX] call A3A_fnc_isFrontline) then {_countX = (round random 2) + 1}};
_vehPool = [_sideX, ["Air"]] call A3A_fnc_getVehiclePoolForQRFs;

for "_i" from 1 to _countX do
{
	sleep 2;
	_typeVehEsc = selectRandomWeighted _vehPool;
	_timeOut = 0;
	_pos = _posOrig findEmptyPosition [10,100,_typeVehEsc];
	while {_timeOut < 60} do
	{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _posOrig findEmptyPosition [10,100,_typeVehEsc];
		sleep 1;
	};
	if (count _pos == 0) then {_pos = _posOrig};
	_vehicle=[_pos, _dir,_typeVehEsc, _groupX] call bis_fnc_spawnvehicle;
	_veh = _vehicle select 0;
	_veh allowDamage false;
	[_veh,"Convoy Escort"] spawn A3A_fnc_inmuneConvoy;
	_vehCrew = _vehicle select 1;
	{[_x] call A3A_fnc_NATOinit;_x allowDamage false} forEach _vehCrew;
	_soldiers = _soldiers + _vehCrew;
	_vehiclesX pushBack _veh;
	[_veh] call A3A_fnc_AIVEHinit;
	if (_i == 1) then {_veh setConvoySeparation 60} else {_veh setConvoySeparation 20};
	if (!_isFIA) then
	{
		if (not(_typeVehEsc in vehTanks)) then
		{
			_typeGroup = [_typeVehEsc,_sideX] call A3A_fnc_cargoSeats;
			_groupEsc = [_posbase,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
			{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x;[_x] joinSilent _groupX} forEach units _groupEsc;
			deleteGroup _groupEsc;
		};
	}
	else
	{
		if (not(_typeVehEsc == vehFIAArmedCar)) then
		{
			_typeGroup = selectRandom groupsFIASquad;
			if (_typeVehEsc == vehFIACar) then
			{
				_typeGroup = selectRandom groupsFIAMid;
			};
			_groupEsc = [_posbase,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
			{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x;[_x] joinSilent _groupX} forEach units _groupEsc;
			deleteGroup _groupEsc;
		};
	};
};


//Objective creation starts here ----------------------------------------------
sleep 2;

_timeOut = 0;
_pos = _posOrig findEmptyPosition [10,100,_typeVehX];
while {_timeOut < 60} do
{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = _posOrig findEmptyPosition [10,100,_typeVehX];
	sleep 1;
};
if (count _pos == 0) then {_pos = _posOrig};

_vehicle=[_pos, _dir,_typeVehObj, _groupX] call bis_fnc_spawnvehicle;
_vehObj = _vehicle select 0;
_vehObj allowDamage false;
if (_difficultX) then {[_vehObj," Convoy Objective"] spawn A3A_fnc_inmuneConvoy} else {[_vehObj,"Convoy Objective"] spawn A3A_fnc_inmuneConvoy};
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit; _x allowDamage false} forEach _vehCrew;
_soldiers = _soldiers + _vehCrew;
_vehiclesX pushBack _vehObj;
[_vehObj] call A3A_fnc_AIVEHinit;

if (_typeConvoyX == "Armor") then {_vehObj lock 3};// else {_vehObj forceFollowRoad true};
if (_typeConvoyX == "Prisoners") then
{
	_grpPOW = createGroup teamPlayer;
	_groups pushBack _grpPOW;
	for "_i" from 1 to (1+ round (random 11)) do
	{
		_unit = [_grpPOW, SDKUnarmed, _posbase, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,true] remoteExec ["setCaptive",0,_unit];
		_unit setCaptive true;
		_unit disableAI "MOVE";
		_unit setBehaviour "CARELESS";
		_unit allowFleeing 0;
		_unit assignAsCargo _vehObj;
		_unit moveInCargo [_vehObj, _i + 3];
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		[_unit,"refugee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
		_POWS pushBack _unit;
		[_unit] call A3A_fnc_reDress;
	};
};
if (_typeConvoyX == "reinforcementsX") then
{
	_typeGroup = [_typeVehObj,_sideX] call A3A_fnc_cargoSeats;
	_groupEsc = [_posbase,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
	{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x;[_x] joinSilent _groupX;_reinforcementsX pushBack _x} forEach units _groupEsc;
	deleteGroup _groupEsc;
};
if ((_typeConvoyX == "Money") or (_typeConvoyX == "Supplies")) then
{
	reportedVehs pushBack _vehObj;
	publicVariable "reportedVehs";
	_vehObj addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and ((_this select 4=="") or (side (_this select 3) != teamPlayer)) and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)}}];
};

sleep 2;
_typeVehEsc = selectRandom _vehPool;
if (not([_typeVehEsc] call A3A_fnc_vehAvailable)) then
{
	_typeVehX = if (_sideX == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
	_vehPool = _vehPool - [_typeVehX];
	if (count _vehPool == 0) then {if (_sideX == Occupants) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks}};
};
_timeOut = 0;
_pos = _posOrig findEmptyPosition [10,100,_typeVehX];
while {_timeOut < 60} do
{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = _posOrig findEmptyPosition [10,100,_typeVehX];
	sleep 1;
};
if (count _pos == 0) then {_pos = _posOrig};

_vehicle=[_pos,_dir,_typeVehEsc, _groupX] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
_veh allowDamage false;
[_veh,"Convoy Escort"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit; _x allowDamage false} forEach _vehCrew;
[_veh] call A3A_fnc_AIVEHinit;
_soldiers = _soldiers + _vehCrew;
_vehiclesX pushBack _veh;

if (!_isFIA) then
{
	if (not(_typeVehEsc in vehTanks)) then
	{
		_typeGroup = [_typeVehEsc,_sideX] call A3A_fnc_cargoSeats;
		_groupEsc = [_posbase,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
		{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x;[_x] joinSilent _groupX} forEach units _groupEsc;
		deleteGroup _groupEsc;
	};
}
else
{
	if (not(_typeVehEsc == vehFIAArmedCar)) then
	{
		_typeGroup = selectRandom groupsFIASquad;
		if (_typeVehEsc == vehFIACar) then
		{
			_typeGroup = selectRandom groupsFIAMid;
		};
		_groupEsc = [_posbase,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
		{[_x] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x;[_x] joinSilent _groupX} forEach units _groupEsc;
		deleteGroup _groupEsc;
	};
};

[_vehiclesX,_soldiers] spawn
{
	sleep 30;
	{_x allowDamage true} forEach (_this select 0);
	{_x allowDamage true; if (vehicle _x == _x) then {deleteVehicle _x}} forEach (_this select 1);
};

private _route = [getPos _vehLead, _posDestination] call A3A_fnc_findPath;
if (_route isEqualTo []) then {
	_route = [getPos _vehLead, _posDestination]
} else {
	_route pushBack _posDestination;
};

/*
//{_x disableAI "AUTOCOMBAT"} forEach _soldiers;
_wp0 = _groupX addWaypoint [(position _vehLead),0];
//_wp0 = (waypoints _groupX) select 0;
_wp0 setWaypointType "MOVE";
_wp0 setWaypointFormation "COLUMN";
_wp0 setWaypointBehaviour "SAFE";
[_base,_posDestination,_groupX] call A3A_fnc_WPCreate;
_wp0 = _groupX addWaypoint [_posDestination, count waypoints _groupX];
_wp0 setWaypointType "MOVE";
*/

{
	_x limitSpeed _speedLimit;
	private _newPos = (_route select 0) findEmptyPosition [0, 40, typeOf _x];
	if !(_newPos isEqualTo []) then {
		_x setPos _newPos;
	};
	[_x, _route] execFSM "FSMs\DriveAlongPath.fsm";
} forEach _vehiclesX;


_bonus = if (_difficultX) then {2} else {1};

private _distanceFromTargetForArrival = 200;

if (_typeConvoyX == "ammunition") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if ((_vehObj distance _posDestination < _distanceFromTargetForArrival) or (dateToNumber date >_enddateNum)) then
	{
		_taskState = "FAILED";
		_taskState1 = "SUCCEEDED";
		[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
        if (_sideX == Occupants) then
        {
            [[-5, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
        };
		clearMagazineCargoGlobal _vehObj;
		clearWeaponCargoGlobal _vehObj;
		clearItemCargoGlobal _vehObj;
		clearBackpackCargoGlobal _vehObj;
	}
	else
	{
		_taskState = "SUCCEEDED";
		_taskState1 = "FAILED";
		[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
		[1800*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_vehObj,teamPlayer] call A3A_fnc_distanceUnits);
		[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
        [
            3,
            "Rebels won a ammo convoy mission",
            "aggroEvent",
            true
        ] call A3A_fnc_log;
		if (_sideX == Occupants) then
        {
            [[25, 120], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [25, 120]] remoteExec ["A3A_fnc_prestige",2]
        };
		if (!alive _vehObj) then
		{
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destinationX,_destinationX];
			killZones setVariable [_base,_killZones,true];
		};
	};
};

if (_typeConvoyX == "Armor") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if ((_vehObj distance _posDestination < _distanceFromTargetForArrival) or (dateToNumber date > _enddateNum)) then
	{
		_taskState = "FAILED";
		_taskState1 = "SUCCEEDED";
		server setVariable [_destinationX,dateToNumber date,true];
		[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
        if (_sideX == Occupants) then
        {
            [[-5, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
        };
	}
	else
	{
		_taskState = "SUCCEEDED";
		_taskState1 = "FAILED";
		[0,5*_bonus,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2];
		[1800*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_vehObj,teamPlayer] call A3A_fnc_distanceUnits);
		[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
        [
            3,
            "Rebels won a armor convoy mission",
            "aggroEvent",
            true
        ] call A3A_fnc_log;
        if (_sideX == Occupants) then
        {
            [[20, 90], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [20, 90]] remoteExec ["A3A_fnc_prestige",2]
        };
		if (!alive _vehObj) then
		{
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destinationX,_destinationX];
			killZones setVariable [_base,_killZones,true];
		};
	};
};

if (_typeConvoyX == "Prisoners") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or (not alive driver _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj == teamPlayer))) or ({alive _x} count _POWs == 0)};
	if ((_vehObj distance _posDestination < _distanceFromTargetForArrival) or ({alive _x} count _POWs == 0) or (dateToNumber date > _enddateNum)) then
	{
		_taskState = "FAILED";
		_taskState1 = "SUCCEEDED";
		{[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false} forEach _POWs;
		//_countX = 2 * (count _POWs);
		//[_countX,0] remoteExec ["A3A_fnc_prestige",2];
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
        if (_sideX == Occupants) then
        {
            [[-10, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [-10, 60]] remoteExec ["A3A_fnc_prestige",2]
        };
	};
	if ((not alive driver _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))) then
	{
		[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
		{[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false; _x enableAI "MOVE"; [_x] orderGetin false} forEach _POWs;
		waitUntil {sleep 2; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance _posHQ < 50)} count _POWs > 0) or (dateToNumber date > _enddateNum)};
		if (({alive _x} count _POWs == 0) or (dateToNumber date > _enddateNum)) then
		{
			_taskState = "FAILED";
			_taskState1 = "FAILED";
			_countX = 2 * (count _POWs);
			//[0,- _countX, _posDestination] remoteExec ["A3A_fnc_citySupportChange",2];
			[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
            [
                3,
                "Rebels killed a prisoner convoy",
                "aggroEvent",
                true
            ] call A3A_fnc_log;
            if (_sideX == Occupants) then
            {
                [[20, 120], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
            }
            else
            {
                [[0, 0], [20, 120]] remoteExec ["A3A_fnc_prestige",2]
            };
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destinationX,_destinationX];
			killZones setVariable [_base,_killZones,true];
		}
		else
		{
			_taskState = "SUCCEEDED";
			_taskState1 = "FAILED";
			_countX = {(alive _x) and (_x distance _posHQ < 150)} count _POWs;
			_hr = _countX;
			_resourcesFIA = 300 * _countX;
			[_hr,_resourcesFIA*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[0,10*_bonus,_posbase] remoteExec ["A3A_fnc_citySupportChange",2];
            if (_sideX == Occupants) then
            {
                [[10, 120], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
            }
            else
            {
                [[0, 0], [15, 120]] remoteExec ["A3A_fnc_prestige",2]
            };
			{[_x] join _grppow; [_x] orderGetin false} forEach _POWs;
			{[_countX,_x] call A3A_fnc_playerScoreAdd} forEach (allPlayers - (entities "HeadlessClient_F"));
			[(round (_countX/2))*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};
};

if (_typeConvoyX == "reinforcementsX") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or ({(!alive _x) or (captive _x)} count _reinforcementsX == count _reinforcementsX)};
	if ({(!alive _x) or (captive _x)} count _reinforcementsX == count _reinforcementsX) then
	{
		_taskState = "SUCCEEDED";
		_taskState1 = "FAILED";
		[0,10*_bonus,_posbase] remoteExec ["A3A_fnc_citySupportChange",2];
        if (_sideX == Occupants) then
        {
            [[10, 90], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
        }
        else
        {
            [[0, 0], [10, 90]] remoteExec ["A3A_fnc_prestige",2];
        };
		{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		_killZones = killZones getVariable [_base,[]];
		_killZones = _killZones + [_destinationX,_destinationX];
		killZones setVariable [_base,_killZones,true];
	}
	else
	{
		_taskState = "FAILED";
		_countX = {alive _x} count _reinforcementsX;
		if (_countX > 8) then {_taskState1 = "SUCCEEDED"} else {_taskState = "FAILED"};
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
        if (_sideX == Occupants) then
        {
            [[-10, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [-10, 60]] remoteExec ["A3A_fnc_prestige",2]
        };
		if (sidesX getVariable [_destinationX,sideUnknown] != teamPlayer) then
		{
			_typesX = [];
			{_typesX pushBack (typeOf _x)} forEach (_reinforcementsX select {alive _x});
			[_soldiers,_sideX,_destinationX,0] remoteExec ["A3A_fnc_garrisonUpdate",2];
		};
	};
};

if (_typeConvoyX == "Money") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if ((dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or (not alive _vehObj)) then
	{
		_taskState = "FAILED";
        if (_sideX == Occupants) then
        {
            [[-5, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
        };
		if ((dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival)) then
		{
			[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			_taskState1 = "SUCCEEDED";
		}
		else
		{
			[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
			[1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			_taskState1 = "FAILED";
			_killZones = killZones getVariable [_base,[]];
			_killZones = _killZones + [_destinationX,_destinationX];
			killZones setVariable [_base,_killZones,true];
		};
	};
	if ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer)) then
	{
		[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
		waitUntil {sleep 2; (_vehObj distance _posHQ < 50) or (not alive _vehObj) or (dateToNumber date > _enddateNum)};
		if ((not alive _vehObj) or (dateToNumber date > _enddateNum)) then
		{
			_taskState = "FAILED";
			_taskState1 = "FAILED";
			[1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
            if (_sideX == Occupants) then
            {
                [[-5, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
            }
            else
            {
                [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
            };
		};
		if (_vehObj distance _posHQ < 50) then
		{
			_taskState = "SUCCEEDED";
			_taskState1 = "FAILED";
			[10*_bonus,-20*_bonus,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2];
            [
                3,
                "Rebels won a money convoy mission",
                "aggroEvent",
                true
            ] call A3A_fnc_log;
            if (_sideX == Occupants) then
            {
                [[25, 120], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
            }
            else
            {
                [[0, 0], [25, 120]] remoteExec ["A3A_fnc_prestige",2]
            };
			[0,5000*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[-120*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			waitUntil {sleep 1; speed _vehObj < 1};
			[_vehObj] call A3A_fnc_empty;
			deleteVehicle _vehObj;
		};
	};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
};

if (_typeConvoyX == "Supplies") then
{
	waitUntil {sleep 1; (dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < _distanceFromTargetForArrival) or (not alive _vehObj) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))};
	if (not alive _vehObj) then
	{
		[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
		_taskState = "FAILED";
		_taskState1 = "FAILED";
        [
            3,
            "Rebels destroyed a supply convoy",
            "aggroEvent",
            true
        ] call A3A_fnc_log;
        if (_sideX == Occupants) then
        {
            [[20, 120], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
        }
        else
        {
            [[0, 0], [20, 120]] remoteExec ["A3A_fnc_prestige",2]
        };
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		_killZones = killZones getVariable [_base,[]];
		_killZones = _killZones + [_destinationX,_destinationX];
		killZones setVariable [_base,_killZones,true];
	};
	if ((dateToNumber date > _enddateNum) or (_vehObj distance _posDestination < 300) or ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer))) then
	{
		if ((driver _vehObj getVariable ["spawner",false]) and (side group (driver _vehObj) == teamPlayer)) then
		{
			[getPosASL _vehObj,_sideX,"",false] spawn A3A_fnc_patrolCA;
			waitUntil {sleep 1; (_vehObj distance _posDestination < 100) or (not alive _vehObj) or (dateToNumber date > _enddateNum)};
			if (_vehObj distance _posDestination < 100) then
			{
				_taskState = "SUCCEEDED";
				_taskState1 = "FAILED";
				[0,15*_bonus,_destinationX] remoteExec ["A3A_fnc_citySupportChange",2];
				{if (_x distance _vehObj < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
				[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
                if (_sideX != Occupants) then
                {
                    [[0, 0], [10, 90]] remoteExec ["A3A_fnc_prestige",2]
                };
			}
			else
			{
				_taskState = "FAILED";
				_taskState1 = "FAILED";
				[5*_bonus,-10*_bonus,_destinationX] remoteExec ["A3A_fnc_citySupportChange",2];
                if (_sideX == Occupants) then
                {
                    [[-10, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
                }
                else
                {
                    [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
                };
				[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			};
		}
		else
		{
			_taskState = "FAILED";
			_taskState1 = "SUCCEEDED";
            if (_sideX == Occupants) then
            {
                [[-10, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
            }
            else
            {
                [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
            };
			[15*_bonus,0,_destinationX] remoteExec ["A3A_fnc_citySupportChange",2];
			[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
};

["CONVOY",[_textX,_taskTitle,_destinationX],_posDestination,_taskState] call A3A_fnc_taskUpdate;
["CONVOY1",[format ["A convoy from %1 to %3, it's about to depart at %2. Protect it from any possible attack.",_nameOrigin,_displayTime,_nameDest],"Protect Convoy",_destinationX],_posDestination,_taskState1] call A3A_fnc_taskUpdate;
_wp0 = _groupX addWaypoint [_posbase, 0];
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_wp0 setWaypointSpeed "LIMITED";
_wp0 setWaypointFormation "COLUMN";

if (_typeConvoyX == "Prisoners") then
{
	{
		deleteVehicle _x;
	} forEach _POWs;
};

_nul = [600,"CONVOY"] spawn A3A_fnc_deleteTask;
_nul = [0,"CONVOY1"] spawn A3A_fnc_deleteTask;
{
if (!([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits)) then {deleteVehicle _x}
} forEach _vehiclesX;
{
if (!([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits)) then {deleteVehicle _x; _soldiers = _soldiers - [_x]}
} forEach _soldiers;

if (count _soldiers > 0) then
	{
	{
	waitUntil {sleep 1; (!([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits))};
	deleteVehicle _x;
	} forEach _soldiers;
	};
{deleteGroup _x} forEach _groups;
