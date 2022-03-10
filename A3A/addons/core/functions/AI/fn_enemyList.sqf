private _groupX = _this;

private _LeaderX = leader _groupX;

private _sideX = side _groupX;
private _enemySides = _sideX call BIS_fnc_enemySides;
private _objectivesX = (_LeaderX nearTargets  500) select {((_x select 2) in _enemySides) and ([_x select 4] call A3A_fnc_canFight)};
_objectivesX = [_objectivesX,[_LeaderX],{_input0 distance (_x select 0)},"ASCEND"] call BIS_fnc_sortBy;
_groupX setVariable ["objectivesX",_objectivesX];
_objectivesX