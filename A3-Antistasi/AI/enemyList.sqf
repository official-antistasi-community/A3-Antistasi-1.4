private _grupo = _this;

private _lider = leader _grupo;

private _lado = side _grupo;
private _enemySides = _lado call BIS_fnc_enemySides;
private _objetivos = (_lider nearTargets  distanciaSPWN) select {((_x select 2) in _enemySides) and ([_x select 4] call A3A_fnc_canFight)};
_objetivos = [_objetivos,[_lider],{_input0 distance (_x select 0)},"ASCEND"] call BIS_fnc_sortBy;
_grupo setVariable ["objetivos",_objetivos];
_objetivos