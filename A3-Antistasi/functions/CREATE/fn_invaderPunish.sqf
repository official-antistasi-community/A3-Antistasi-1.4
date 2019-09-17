if (!isServer and hasInterface) exitWith {};
private ["_posOrigin","_typeGroup","_nameOrigin","_markTsk","_wp1","_soldiers","_landpos","_pad","_vehiclesX","_wp0","_wp3","_wp4","_wp2","_groupX","_groups","_typeVehX","_vehicle","_pilots","_rnd","_resourcesAAF","_nVeh","_radiusX","_roads","_Vwp1","_tanksX","_road","_veh","_vehCrew","_groupVeh","_Vwp0","_size","_Hwp0","_groupX1","_uav","_groupUAV","_uwp0","_tsk","_vehicle","_soldierX","_pilot","_mrkDestination","_posDestination","_prestigeCSAT","_base","_airportX","_nameDest","_timeX","_solMax","_nul","_pos","_timeOut"];
_mrkDestination = _this select 0;
_mrkOrigin = _this select 1;
bigAttackInProgress = true;
publicVariable "bigAttackInProgress";
_posDestination = getMarkerPos _mrkDestination;
_posOrigin = getMarkerPos _mrkOrigin;
_groups = [];
_soldiers = [];
_pilots = [];
_vehiclesX = [];
_civiles = [];

diag_log format ["[Antistasi] Launching CSAT Punish Against %1 from %2 (CSATpunish.sqf)", _mrkDestination, _mrkOrigin];

_nameDest = [_mrkDestination] call A3A_fnc_localizar;
[[teamPlayer,civilian,Occupants],"AttackAAF",[format ["%2 is making a punishment expedition to %1. They will kill everybody there. Defend the city at all costs",_nameDest,nameInvaders],format ["%1 Punishment",nameInvaders],_mrkDestination],getMarkerPos _mrkDestination,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

_nul = [_mrkOrigin,_mrkDestination,Invaders] spawn A3A_fnc_artillery;
_sideX = if (sidesX getVariable [_mrkDestination,sideUnknown] == Occupants) then {Occupants} else {teamPlayer};
_timeX = time + 3600;

private _CSATTransportAir = vehCSATTransportHelis + vehCSATTransportPlanes;

for "_i" from 1 to 3 do
	{
	_typeVehX = if (_i != 3) then {selectRandom (vehCSATAir select {[_x] call A3A_fnc_vehAvailable})} else {selectRandom (_CSATTransportAir select {[_x] call A3A_fnc_vehAvailable})};
	_timeOut = 0;
	_pos = _posOrigin findEmptyPosition [0,100,_typeVehX];
	while {_timeOut < 60} do
		{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _posOrigin findEmptyPosition [0,100,_typeVehX];
		sleep 1;
		};
	if (count _pos == 0) then {_pos = _posOrigin};
	private _spawnResult=[_pos, 0, _typeVehX, Invaders] call bis_fnc_spawnvehicle;
	private _veh = _spawnResult select 0;
	private _vehCrew = _spawnResult select 1;
	{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
	[_veh] call A3A_fnc_AIVEHinit;
	_groupVeh = _spawnResult select 2;
	_pilots = _pilots + _vehCrew;
	_groups pushBack _groupVeh;
	_vehiclesX pushBack _veh;

	//If spawning a plane, it needs moving into the air.
	if (_typeVehX isKindOf "Plane") then {
		_veh setDir ((getDir _veh) + (_veh getRelDir _posDestination));
		_veh setPos (getPos _veh vectorAdd [0, 0, 300]);
		_veh setVelocityModelSpace (velocityModelSpace _veh vectorAdd [0, 150, 10]);
	};

	//If we're an attack vehicle.
	if (not(_typeVehX in _CSATTransportAir)) then
		{
		_wp1 = _groupVeh addWaypoint [_posDestination, 0];
		_wp1 setWaypointType "SAD";
		//[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
		}
	else
		{
		{_x setBehaviour "CARELESS";} forEach units _groupVeh;
		_typeGroup = [_typeVehX,Invaders] call A3A_fnc_cargoSeats;
		_groupX = [_posOrigin, Invaders, _typeGroup] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] call A3A_fnc_NATOinit; _x setVariable ["originX",_mrkOrigin]} forEach units _groupX;
		_groups pushBack _groupX;
		//[_veh,"CSAT Air Transport"] spawn A3A_fnc_inmuneConvoy;

		if (_typeVehX isKindOf "Plane") then {
			[_veh,_groupX,_mrkDestination,_mrkOrigin] spawn A3A_fnc_airdrop;
		} else {
			if (not(_typeVehX in vehFastRope)) then
				{

				_landPos = _posDestination getPos [(random 500) + 300, random 360];

				_landPos = [_landPos, 200, 350, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
				if !(_landPos isEqualTo [0,0,0]) then
					{
					_landPos set [2, 0];
					_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
					_vehiclesX pushBack _pad;
					_wp0 = _groupVeh addWaypoint [_landpos, 0];
					_wp0 setWaypointType "TR UNLOAD";
					_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT'"];
					[_groupVeh,0] setWaypointBehaviour "CARELESS";
					_wp3 = _groupX addWaypoint [_landpos, 0];
					_wp3 setWaypointType "GETOUT";
					_wp0 synchronizeWaypoint [_wp3];
					_wp4 = _groupX addWaypoint [_posDestination, 1];
					_wp4 setWaypointType "SAD";
					_wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
					[_groupVeh,1] setWaypointBehaviour "AWARE";
					};
				}
			else
				{
				{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _groupVeh;
				[_veh,_groupX,_posDestination,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
				};
			};
		};
	sleep 20;
	};

_dataX = server getVariable _mrkDestination;

_numCiv = _dataX select 0;
_numCiv = round (_numCiv /10);

if (sidesX getVariable [_mrkDestination,sideUnknown] == Occupants) then {[[_posDestination,Occupants,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};

if (_numCiv < 8) then {_numCiv = 8};

_size = [_mrkDestination] call A3A_fnc_sizeMarker;
//_groupCivil = if (_sideX == teamPlayer) then {createGroup teamPlayer} else {createGroup Occupants};
_groupCivil = createGroup teamPlayer;
_groups pushBack _groupCivil;
//[Invaders,[civilian,0]] remoteExec ["setFriend",2];
_typeUnit = if (_sideX == teamPlayer) then {SDKUnarmed} else {NATOUnarmed};
for "_i" from 0 to _numCiv do
	{
	while {true} do
		{
		_pos = _posDestination getPos [random _size,random 360];
		if (!surfaceIsWater _pos) exitWith {};
		};
	_typeUnit = selectRandom arrayCivs;
	_civ = _groupCivil createUnit [_typeUnit,_pos, [],0,"NONE"];
	_civ forceAddUniform (selectRandom civUniforms);
	_rnd = random 100;
	if (_rnd < 90) then
		{
		if (_rnd < 25) then {[_civ, "hgun_PDW2000_F", 5, 0] call BIS_fnc_addWeapon;} else {[_civ, "hgun_Pistol_heavy_02_F", 5, 0] call BIS_fnc_addWeapon;};
		};
	_civiles pushBack _civ;
	[_civ] call A3A_fnc_civInit;
	sleep 0.5;
	};

_nul = [leader _groupCivil, _mrkDestination, "AWARE","SPAWNED","NOVEH2"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link

_civilMax = {alive _x} count _civiles;
_solMax = count _soldiers;

for "_i" from 0 to round random 2 do
	{
	if ([vehCSATPlane] call A3A_fnc_vehAvailable) then
		{
		private _bombType = if (napalmEnabled) then {"NAPALM"} else {"HE"};
		_nul = [_mrkDestination,Invaders,_bombType] spawn A3A_fnc_airstrike;
		sleep 30;
		};
	};

waitUntil {sleep 5; (({not (captive _x)} count _soldiers) < ({captive _x} count _soldiers)) or ({alive _x} count _soldiers < round (_solMax / 3)) or (({(_x distance _posDestination < _size*2) and (not(vehicle _x isKindOf "Air")) and (alive _x) and (!captive _x)} count _soldiers) > 4*({(alive _x) and (_x distance _posDestination < _size*2)} count _civiles)) or (time > _timeX)};

if ((({not (captive _x)} count _soldiers) < ({captive _x} count _soldiers)) or ({alive _x} count _soldiers < round (_solMax / 3)) or (time > _timeX)) then
	{
	{_x doMove [0,0,0]} forEach _soldiers;
	//["AttackAAF", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
	["AttackAAF",[format ["%2 is making a punishment expedition to %1. They will kill everybody there. Defend the city at all costs",_nameDest,nameInvaders],format ["%1 Punishment",nameInvaders],_mrkDestination],getMarkerPos _mrkDestination,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	if ({(side _x == teamPlayer) and (_x distance _posDestination < _size * 2)} count allUnits >= {(side _x == Occupants) and (_x distance _posDestination < _size * 2)} count allUnits) then
		{
		if (sidesX getVariable [_mrkDestination,sideUnknown] == Occupants) then {[-15,15,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]} else {[-5,15,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]};
		[-5,0] remoteExec ["A3A_fnc_prestige",2];
		{[-10,10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach citiesX;
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posDestination,teamPlayer] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		if (sidesX getVariable [_mrkDestination,sideUnknown] == Occupants) then {[15,-5,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]} else {[15,-15,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2]};
		{[10,-10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach citiesX;
		};
	}
else
	{
	["AttackAAF",[format ["%2 is making a punishment expedition to %1. They will kill everybody there. Defend the city at all costs",_nameDest,nameInvaders],format ["%1 Punishment",nameInvaders],_mrkDestination],getMarkerPos _mrkDestination,"FAILED"] call A3A_fnc_taskUpdate;
	//["AttackAAF", "FAILED",true] spawn BIS_fnc_taskSetState;
	[-20,-20,_posDestination] remoteExec ["A3A_fnc_citySupportChange",2];
	{[-10,-10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach citiesX;
	destroyedCities = destroyedCities + [_mrkDestination];
	publicVariable "destroyedCities";
	for "_i" from 1 to 60 do
		{
		_mineX = createMine ["APERSMine",_posDestination,[],_size];
		Invaders revealMine _mineX;
		};
	[_mrkDestination] call A3A_fnc_destroyCity;
	};

sleep 15;
//[Invaders,[civilian,1]] remoteExec ["setFriend",2];
_nul = [0,"AttackAAF"] spawn A3A_fnc_deleteTask;
[7200] remoteExec ["A3A_fnc_timingCA",2];
{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x};
} forEach _vehiclesX;
{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _soldiers = _soldiers - [_x]};
} forEach _soldiers;
{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _pilots = _pilots - [_x]};
} forEach _pilots;

bigAttackInProgress = false;
publicVariable "bigAttackInProgress";

if (count _soldiers > 0) then
	{
	{
	_veh = _x;
	waitUntil {sleep 1; !([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
	deleteVehicle _veh;
	} forEach _soldiers;
	};

if (count _pilots > 0) then
	{
	{
	_veh = _x;
	waitUntil {sleep 1; !([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
	deleteVehicle _veh;
	} forEach _pilots;
	};
{deleteGroup _x} forEach _groups;

waitUntil {sleep 1; (spawner getVariable _mrkDestination == 2)};

{deleteVehicle _x} forEach _civiles;
deleteGroup _groupCivil;
