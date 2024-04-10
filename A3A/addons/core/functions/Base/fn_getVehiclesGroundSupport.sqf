/*  
Maintainer: John Jordan
    Returns a weighted ground support vehicle pool based on war level and side

Arguments:
    <SIDE> The side for which the vehicle pool should be generated (occupants or invaders)
    <INTEGER> 1-10 range, war-level based vehicle quality

Return value:
    <ARRAY> [vehType, weight, vehType2, weight2, ...]
*/
params ["_side", "_level"];
_level = (_level max 1 min 10) - 1;
private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);

private _fnc_addArrayToWeights = {
    params ["_vehArray", "_baseWeight"];
    { _vehWeights append [_x, _baseWeight / count _vehArray] } forEach _vehArray;
};

private _vehWeights = [];

private _milCarWeight =     [50, 40, 30, 20, 10,  0,  0,  0,  0,  0] select _level;
private _carWeight =        [50, 50, 50, 50, 50, 50, 50, 40, 35, 30] select _level;
private _aaWeight =         [ 0,  0,  3,  5,  7,  8, 10, 12, 13, 14] select _level;
private _ltWeight =         [ 0,  5,  7,  9, 10, 11, 12, 13, 14, 15] select _level;
private _tankWeight =       [ 0,  0,  3,  6, 10, 14, 18, 22, 26, 35] select _level;
private _hvytWeight =       [ 0,  0,  0,  2,  4,  6,  8, 10, 12, 14] select _level; 

// filter out weak AA that shouldn't be tier-scaled (eg. Avenger, zu23)
private _vehAA = (_faction get "vehiclesAA") select { A3A_vehicleResourceCosts get _x >= 100 };
if (_vehAA isEqualTo []) then { _tankWeight = _tankWeight + _aaWeight };

// Only one of these two is mandatory
if (!(_faction get "vehiclesHeavyTanks" isEqualTo [])) then {
    _tankWeight = _tankWeight   -   ((_hvytWeight / 10) * (10 - (_level + 1)));
    _ltWeight   = _ltWeight     -   ((_hvytWeight / 10) * (_level + 1));
};
if (_faction get "vehiclesLightTanks" isEqualTo []) then { _tankWeight = _tankWeight + _ltWeight };
if (_faction get "vehiclesTanks" isEqualTo []) then { _ltWeight = _ltWeight + _tankWeight };

// only occupants use militia vehicles?
if (_side == Occupants) then {
    [_faction get "vehiclesMilitiaLightArmed", _milCarWeight] call _fnc_addArrayToWeights;
};
[_faction get "vehiclesLightArmed", _carWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesLightTanks", _ltWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesTanks", _tankWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesHeavyTanks", _hvytWeight] call _fnc_addArrayToWeights;
[_vehAA, _aaWeight] call _fnc_addArrayToWeights;

_vehWeights;
