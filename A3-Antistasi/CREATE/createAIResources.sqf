if (!isServer and hasInterface) exitWith{};

private ["_markerX","_vehiclesX","_groups","_soldiers","_civs","_positionX","_pos","_typeGroup","_typeCiv","_size","_mrk","_ang","_countX","_groupX","_veh","_civ","_frontierX","_flagX","_dog","_garrison","_sideX","_cfg","_isFIA","_roads","_dist","_road","_roadscon","_roadcon","_dirveh","_bunker","_typeVehX","_typeUnit","_unit","_typeGroup","_stance"];

_markerX = _this select 0;

diag_log format ["[Antistasi] Spawning Resource Point %1 (createAIResources.sqf)", _markerX];

_positionX = getMarkerPos _markerX;

_size = [_markerX] call A3A_fnc_sizeMarker;

_civs = [];
_soldiers = [];
_groups = [];
_vehiclesX = [];

_frontierX = [_markerX] call A3A_fnc_isFrontline;

_sideX = Invaders;

_isFIA = false;
if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then
	{
	_sideX = Occupants;
	if ((random 10 <= (tierWar + difficultyCoef)) and !(_frontierX)) then
		{
		_isFIA = true;
		};
	};
_roads = _positionX nearRoads _size;
_dist = 0;
_road = objNull;
{if ((position _x) distance _positionX > _dist) then {_road = _x;_dist = position _x distance _positionX}} forEach _roads;
_roadscon = roadsConnectedto _road;
_roadcon = objNull;
{if ((position _x) distance _positionX > _dist) then {_roadcon = _x}} forEach _roadscon;
_dirveh = [_roadcon, _road] call BIS_fnc_DirTo;

if ((spawner getVariable _markerX != 2) and _frontierX) then
	{
	if (count _roads != 0) then
		{
		if (!_isFIA) then
			{
			_groupX = createGroup _sideX;
			_groups pushBack _groupX;
			_pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
			_bunker = "Land_BagBunker_01_small_green_F" createVehicle _pos;
			_vehiclesX pushBack _bunker;
			_bunker setDir _dirveh;
			_pos = getPosATL _bunker;
			_typeVehX = if (_sideX==Occupants) then {staticATOccupants} else {staticATInvaders};
			_veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPos _pos;
			_veh setDir _dirVeh + 180;
			_typeUnit = if (_sideX==Occupants) then {staticCrewOccupants} else {staticCrewInvaders};
			_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
			[_unit,_markerX] call A3A_fnc_NATOinit;
			[_veh] call A3A_fnc_AIVEHinit;
			_unit moveInGunner _veh;
			_soldiers pushBack _unit;
			}
		else
			{
			_typeGroup = selectRandom groupsFIAMid;
			_groupX = [_positionX, _sideX, _typeGroup,false,true] call A3A_fnc_spawnGroup;
			if !(isNull _groupX) then
				{
				_veh = vehFIAArmedCar createVehicle getPos _road;
				_veh setDir _dirveh + 90;
				_nul = [_veh] call A3A_fnc_AIVEHinit;
				_vehiclesX pushBack _veh;
				sleep 1;
				_unit = _groupX createUnit [FIARifleman, _positionX, [], 0, "NONE"];
				_unit moveInGunner _veh;
				{_soldiers pushBack _x; [_x,_markerX] call A3A_fnc_NATOinit} forEach units _groupX;
				};
			};
		};
	};

_mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_ang = markerDir _markerX;
_mrk setMarkerDirLocal _ang;
if (!debug) then {_mrk setMarkerAlphaLocal 0};
_garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;
_radiusX = count _garrison;
private _patrol = true;
if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then
	{
	_patrol = false;
	}
else
	{
	if ({if ((getMarkerPos _x inArea _mrk) and (sidesX getVariable [_x,sideUnknown] != _sideX)) exitWIth {1}} count markersX > 0) then {_patrol = false};
	};
if (_patrol) then
	{
	_countX = 0;
	while {(spawner getVariable _markerX != 2) and (_countX < 4)} do
		{
		_arraygroups = if (_sideX == Occupants) then
			{
			if (!_isFIA) then {groupsNATOsmall} else {groupsFIASmall};
			}
		else
			{
			groupsCSATsmall
			};
		if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) then {_arraygroups = _arraygroups - sniperGroups};
		_typeGroup = selectRandom _arraygroups;
		_groupX = [_positionX,_sideX, _typeGroup,false,true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then
			{
			sleep 1;
			if ((random 10 < 2.5) and (not(_typeGroup in sniperGroups))) then
				{
				_dog = _groupX createUnit ["Fin_random_F",_positionX,[],0,"FORM"];
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
				};
			_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "RANDOM","NOVEH2"] execVM "scripts\UPSMON.sqf";
			_groups pushBack _groupX;
			{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
			};
		_countX = _countX +1;
		};
	};

_typeVehX = if (_sideX == Occupants) then {NATOFlag} else {CSATFlag};
_flagX = createVehicle [_typeVehX, _positionX, [],0, "CAN_COLLIDE"];
_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
_vehiclesX pushBack _flagX;

if (not(_markerX in destroyedCities)) then
	{
	if ((daytime > 8) and (daytime < 18)) then
		{
		_groupX = createGroup civilian;
		_groups pushBack _groupX;
		for "_i" from 1 to 4 do
			{
			if (spawner getVariable _markerX != 2) then
				{
				_civ = _groupX createUnit ["C_man_w_worker_F", _positionX, [],0, "NONE"];
				_nul = [_civ] spawn A3A_fnc_CIVinit;
				_civs pushBack _civ;
				_civ setVariable ["markerX",_markerX,true];
				sleep 0.5;
				_civ addEventHandler ["Killed",
					{
					if (({alive _x} count units group (_this select 0)) == 0) then
						{
						_markerX = (_this select 0) getVariable "markerX";
						_nameX = [_markerX] call A3A_fnc_localizar;
						destroyedCities pushBackUnique _markerX;
						publicVariable "destroyedCities";
						["TaskFailed", ["", format ["%1 Destroyed",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
						};
					}];
				};
			};
		//_nul = [_markerX,_civs] spawn destroyCheck;
		_nul = [leader _groupX, _markerX, "SAFE", "SPAWNED","NOFOLLOW", "NOSHARE","DORELAX","NOVEH2"] execVM "scripts\UPSMON.sqf";
		};
	};

_pos = _positionX findEmptyPosition [5,_size,"I_Truck_02_covered_F"];//donde pone 5 antes ponía 10
if (count _pos > 0) then
	{
	_typeVehX = if (_sideX == Occupants) then
		{
		if (!_isFIA) then {vehNATOTrucks + vehNATOCargoTrucks} else {[vehFIATruck]};
		}
	else
		{
		vehCSATTrucks
		};
	_veh = createVehicle [selectRandom _typeVehX, _pos, [], 0, "NONE"];
	_veh setDir random 360;
	_vehiclesX pushBack _veh;
	_nul = [_veh] call A3A_fnc_AIVEHinit;
	sleep 1;
	};

_array = [];
_subArray = [];
_countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do
	{
	_array pushBack (_garrison select [_countX,7]);
	_countX = _countX + 8;
	};
for "_i" from 0 to (count _array - 1) do
	{
	_groupX = if (_i == 0) then {[_positionX,_sideX, (_array select _i),true,false] call A3A_fnc_spawnGroup} else {[_positionX,_sideX, (_array select _i),false,true] call A3A_fnc_spawnGroup};
	_groups pushBack _groupX;
	{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
	if (_i == 0) then {_nul = [leader _groupX, _markerX, "SAFE", "RANDOMUP","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf"} else {_nul = [leader _groupX, _markerX, "SAFE","SPAWNED", "RANDOM","NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf"};
	};

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

deleteMarker _mrk;
{
if (alive _x) then
	{
	deleteVehicle _x
	};
} forEach _soldiers;
//if (!isNull _periodista) then {deleteVehicle _periodista};
{deleteGroup _x} forEach _groups;
{deleteVehicle _x} forEach _civs;
{if (!([distanceSPWN-_size,1,_x,teamPlayer] call A3A_fnc_distanceUnits)) then {deleteVehicle _x}} forEach _vehiclesX;
