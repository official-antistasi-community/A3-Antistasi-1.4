#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

private ["_markerX","_vehiclesX","_groups","_soldiers","_civs","_positionX","_pos","_typeGroup","_typeCiv","_size","_mrk","_ang","_countX","_groupX","_veh","_civ","_frontierX","_flagX","_dog","_garrison","_sideX","_cfg","_isFIA","_roads","_dist","_road","_roadscon","_roadcon","_dirveh","_bunker","_typeVehX","_typeUnit","_unit","_typeGroup","_stance"];
_markerX = _this select 0;

//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

Debug_1("Spawning Resource Point %1", _markerX);

_positionX = getMarkerPos _markerX;

_size = [_markerX] call A3A_fnc_sizeMarker;

_civs = [];
_soldiers = [];
private _dogs = [];
_groups = [];
_vehiclesX = [];

_frontierX = [_markerX] call A3A_fnc_isFrontline;

_sideX = Invaders;

_isFIA = false;
if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then
{
	_sideX = Occupants;
	if ((random 10 <= (tierWar + difficultyCoef)) and !(_frontierX)) then //Forced spawn is missing (check createAI outpost)
	{
		_isFIA = true;
	};
};
private _faction = Faction(_sideX);

if (_frontierX) then
{
	_roads = _positionX nearRoads _size;
	if (count _roads != 0) then
	{
		_dist = 0;
		_road = objNull;
		{if ((position _x) distance _positionX > _dist) then {_road = _x;_dist = position _x distance _positionX}} forEach _roads;
		_roadscon = roadsConnectedto _road;
		_roadcon = objNull;
		{if ((position _x) distance _positionX > _dist) then {_roadcon = _x}} forEach _roadscon;
		_dirveh = [_roadcon, _road] call BIS_fnc_DirTo;

		//if (!_isFIA) then
		//{

		_groupX = createGroup _sideX;
		_groups pushBack _groupX;
		_pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
		_bunker = "Land_BagBunker_01_small_green_F" createVehicle _pos;
		_vehiclesX pushBack _bunker;
		_bunker setDir _dirveh;
		_pos = getPosATL _bunker;
		_typeVehX = selectRandom (_faction get "staticAT");
		_veh = _typeVehX createVehicle _positionX;
		_vehiclesX pushBack _veh;
		_veh setPos _pos;
		_veh setDir _dirVeh + 180;
		_typeUnit = _faction get "unitStaticCrew";
		_unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		_unit moveInGunner _veh;
		[_unit,_markerX] call A3A_fnc_NATOinit;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_soldiers pushBack _unit;
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
//If one is missing, there are no patrols??
if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then
{
	_patrol = false;
}
else
{
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};
if (_patrol) then
{
	_countX = 0;
	while {_countX < 4} do
	{
        _arrayGroups = _faction get (if (_isFIA) then {"groupsMilitiaSmall"} else {"groupsSmall"});
		if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) then {_arraygroups = _arraygroups - (_faction get "groupSniper")};
		_typeGroup = selectRandom _arraygroups;
		_groupX = [_positionX,_sideX, _typeGroup,false,true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then
		{
			sleep 1;
			if ((random 10 < 2.5) and (_typeGroup isNotEqualTo (_faction get "groupSniper"))) then
			{
				_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
			};
			_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "RANDOM","NOVEH2"] spawn UPSMON_fnc_UPSMON;//TODO need delete UPSMON link
			_groups pushBack _groupX;
			{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
		};
		_countX = _countX +1;
	};
};

_typeVehX = _faction get "flag";
_flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];
_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
_vehiclesX pushBack _flagX;
if (flagTexture _flagX != (_faction get "flagTexture")) then {[_flagX,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_flagX]};

if (not(_markerX in destroyedSites)) then
{
	if ((daytime > 8) and (daytime < 18)) then
	{
		_groupX = createGroup civilian;
		_groups pushBack _groupX;
		for "_i" from 1 to 4 do
		{
			_civ = [_groupX, FactionGet(civ, "unitWorker"), _positionX, [],0, "NONE"] call A3A_fnc_createUnit;
			_nul = [_civ] spawn A3A_fnc_CIVinit;
			_civs pushBack _civ;
			_civ setVariable ["markerX",_markerX,true];
			sleep 0.5;
			_civ addEventHandler ["Killed",
				{
					if (({alive _x} count (units group (_this select 0))) == 0) then
					{
						_markerX = (_this select 0) getVariable "markerX";
						_nameX = [_markerX] call A3A_fnc_localizar;
						destroyedSites pushBackUnique _markerX;
						publicVariable "destroyedSites";
						["TaskFailed", ["", format ["%1 Destroyed",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
					};
				}];
		};
		//_nul = [_markerX,_civs] spawn destroyCheck;
		_nul = [leader _groupX, _markerX, "SAFE", "SPAWNED","NOFOLLOW", "NOSHARE","DORELAX","NOVEH2"] spawn UPSMON_fnc_UPSMON;//TODO need delete UPSMON link
	};
};

//_pos = _positionX findEmptyPosition [5,_size,"I_Truck_02_covered_F"];//donde pone 5 antes ponía 10
private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
if (_spawnParameter isEqualType []) then
{
	private _typeVehX = call {
		if (FactionGet(civ,"vehiclesCivRepair") isEqualTo [] and random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesRepairTrucks") };
		if (FactionGet(civ,"vehiclesCivFuel") isEqualTo [] and random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesFuelTrucks") };
		private _types = if (!_isFIA) then {(_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks")} else {_faction get "vehiclesMilitiaTrucks"};
		_types = _types select { _x in FactionGet(all,"vehiclesCargoTrucks") };
		if (count _types == 0) then { (_faction get "vehiclesCargoTrucks") } else { _types };
		selectRandom _types;
	};
	_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
	_veh setDir (_spawnParameter select 1);
	_vehiclesX pushBack _veh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	sleep 1;
};

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

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
	_groupX = if (_i == 0) then
	{
		[_positionX,_sideX, (_array select _i),true,false] call A3A_fnc_spawnGroup
	}
	else
	{
		[_positionX,_sideX, (_array select _i),false,true] call A3A_fnc_spawnGroup
	};
	_groups pushBack _groupX;
	{
		[_x,_markerX] call A3A_fnc_NATOinit;
		_soldiers pushBack _x;
	} forEach units _groupX;
	if (_i == 0) then
	{
		//Can't we just precompile this and call this like every other funtion? Would save some time
		_nul = [leader _groupX, _markerX, "SAFE", "RANDOMUP","SPAWNED", "NOVEH2", "NOFOLLOW"] spawn UPSMON_fnc_UPSMON;
	}
	else
	{
		_nul = [leader _groupX, _markerX, "SAFE","SPAWNED", "RANDOM","NOVEH2", "NOFOLLOW"] spawn UPSMON_fnc_UPSMON;
	};
	};//TODO need delete UPSMON link
["locationSpawned", [_markerX, "Resource", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

[_markerX] call A3A_fnc_freeSpawnPositions;

deleteMarker _mrk;

{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _civs;
{ deleteVehicle _x } forEach _dogs;
{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been captured
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;
["locationSpawned", [_markerX, "Resource", false]] call EFUNC(Events,triggerEvent);
