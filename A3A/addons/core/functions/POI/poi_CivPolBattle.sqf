
private ["_markerX"];

_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

_vehiclesX = [];
_soldiers = [];
private _dogs = [];
private _groups = [];
_pilots = [];

private _typeGroup = (_faction get "groupPoliceSquad");
Verbose_2("Side: %1 spawning group composition: %2", _sideX, _typeGroup);
private _groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
private _groups pushBack _groupX;
_groupX setBehaviour "COMBAT";
[_groupX, "Patrol_Defend", 0, 50, -1, true, _positionX, false] call A3A_fnc_patrolLoop;

{_soldiers pushBack _x; [_x,"", false] call A3A_fnc_NATOinit} forEach units _groupX;

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
		_soldiers pushBack _civ; 
		[_civ,"", false] call A3A_fnc_NATOinit;
    };
};

{
    _x setBehaviour "COMBAT";
	_wp = _x addWaypoint [_positionX, 15];
	_wp setWaypointType "SAD";
} forEach _civGroups;
_groups append _civGroups;

[_groups, _soldiers, _vehiclesX, _dogs, _pilots]