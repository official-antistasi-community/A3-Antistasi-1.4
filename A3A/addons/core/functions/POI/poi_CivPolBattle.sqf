
_typeGroup = (_faction get "groupPoliceSquad");
Verbose_2("Side: %1 spawning group composition: %2", _sideX, _typeGroup);
_groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
_groups pushBack _groupX;
{[_x, "Patrol_Defend", 0, 50, -1, true, _positionX, false] call A3A_fnc_patrolLoop;} forEach _groups;

_groupX setBehaviour "COMBAT";

// Spawn in the "civilians"
private _numCiv = 4 + random 4;

private _civilians = [];
private _civGroups = [];
private _civWeapons = unlockedsniperrifles + unlockedshotguns +  unlockedshotguns + unlockedrifles + unlockedsmgs + unlockedhandguns + unlockedhandguns;
private _unitType = FactionGet(reb, "unitUnarmed");

while {count _civilians < _numCiv} do
{
    private _groupCivil = createGroup teamPlayer;
    _civGroups pushBack _groupCivil;
    private _pos = while {true} do {
        private _pos = _positionX getPos [80 + (random 60 / 2),random 360];
        if (!surfaceIsWater _pos) exitWith { _pos };
    };
    for "_i" from 1 to _numCiv) do {
        private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
        private _civ = [_groupCivil, _unitType, _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
        _civ forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
        _civ addHeadgear selectRandom (A3A_faction_civ get "headgear");
        [_civ, selectRandom _civWeapons, 5, 0] call BIS_fnc_addWeapon;
        _civ setSkill 0.25;
        _civilians pushBack _civ;
    };
};

{
	_wp = _x addWaypoint [_positionX, 15];
	_wp setWaypointType "SAD";
} forEach _civGroups;
_groups append _civGroups;