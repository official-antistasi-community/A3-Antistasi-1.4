
_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

ServerInfo_2("Spawning Control Point %2 %1", _markerX, _sideX);

if ((_sideX == teamPlayer) or (_sideX == sideUnknown)) exitWith {};
if ({if ((sidesX getVariable [_x,sideUnknown] != _sideX) and (_positionX inArea _x)) exitWith {1}} count markersX >1) exitWith {};
_vehiclesX = [];
_soldiers = [];
private _dogs = [];
private _groups = [];
_pilots = [];
_conquered = false;
_groupX = grpNull;
_isFIA = false;
_leave = false;



_typeGroup = (_faction get "groupPoliceSquad");
Verbose_2("Side: %1 spawning group composition: %2", _sideX, _typeGroup);
_groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
_groups pushBack _groupX;
_groupX setBehaviour "COMBAT";
[_groupX, "Patrol_Defend", 0, 50, -1, true, _positionX, false] call A3A_fnc_patrolLoop;


// Spawn in the "civilians"
private _numCiv = 4 + random 4;

private _civilians = [];
private _civGroups = [];
private _civWeapons = [unlockedshotguns, unlockedhandguns, unlockedsniperrifles, unlockedrifles, unlockedsmgs];

if("vanilla" in A3A_factionEquipFlags) then {
    _civWeapons set [2, ["srifle_DMR_06_hunter_F"]];
    _civWeapons set [3, ["arifle_AKM_F","arifle_AKS_F"]];
    _civWeapons set [4, ["arifle_AKS_F"] + unlockedsmgs];
};

private _weaponsWeights = [100, 80, 30, -10+10*tierWar, 15+10*(tierWar/2)];
{
    if !(_x isEqualType []) then {continue};
    if(count _x == 0) then {
        _civWeapons set [_forEachIndex, unlockedhandguns + unlockedshotguns];
    };
} forEach _civWeapons;
private _unitType = FactionGet(reb, "unitUnarmed");

while {count _civilians < _numCiv} do
{
    private _groupCivil = createGroup teamPlayer;
    _civGroups pushBack _groupCivil;
    private _pos = while {true} do {
        private _pos = _positionX getPos [150 + (random 60 / 2),random 360];
        if (!surfaceIsWater _pos) exitWith { _pos };
    };
    for "_i" from 1 to 4 do {
        private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
        private _civ = [_groupCivil, _unitType, _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
        _civ forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
        _civ addHeadgear selectRandom (A3A_faction_civ get "headgear");
        [_civ, selectRandom(_civWeapons selectRandomWeighted _weaponsWeights), 5, 0] call BIS_fnc_addWeapon;
        //War tier scaling on rifles and SMGs, making them more common as the war escalates, tier 1: 0, 20. tier 5: 40, 40, tier 10: 90, 65.
        //This would inhertently decrease the probability of the other weapon types

        _civ setSkill 0.15; //Sub with half rebel skill?
        _civilians pushBack _civ;
    };
};

{
    _x setBehaviour "COMBAT";
	_wp = _x addWaypoint [_positionX, 15];
	_wp setWaypointType "SAD";
} forEach _civGroups;
_groups append _civGroups;
    
if (_leave) exitWith {};

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

_spawnStatus = 0;
while {(spawner getVariable _markerX != 2) and ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers > 0)} do
	{
	if ((spawner getVariable _markerX == 1) and (_spawnStatus != spawner getVariable _markerX)) then
		{
		_spawnStatus = 1;
		if (isMultiplayer) then
			{
			{if (vehicle _x == _x) then {[_x,false] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
			}
		else
			{
			{if (vehicle _x == _x) then {_x enableSimulationGlobal false}} forEach _soldiers
			};
		}
	else
		{
		if ((spawner getVariable _markerX == 0) and (_spawnStatus != spawner getVariable _markerX)) then
			{
			_spawnStatus = 0;
			if (isMultiplayer) then
				{
				{if (vehicle _x == _x) then {[_x,true] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
				}
			else
				{
				{if (vehicle _x == _x) then {_x enableSimulationGlobal true}} forEach _soldiers
				};
			};
		};
	sleep 3;
	};
["locationSpawned", [_markerX, "POI", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1;((spawner getVariable _markerX == 2))  or ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers == 0)};

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};


{ if (alive _x) then { deleteVehicle _x } } forEach (_soldiers + _pilots);
{ deleteVehicle _x } forEach _dogs;

{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been captured
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

["locationSpawned", [_markerX, "POI", false]] call EFUNC(Events,triggerEvent);
