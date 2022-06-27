/*
Maintainer: John Jordan
    Returns a weighted ground transport vehicle pool based on war level and side

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

private _policeWeight =    [40, 20,  0,  0,  0,  0,  0,  0,  0,  0] select _level;
private _milCarWeight =    [40, 30, 20, 10,  5,  0,  0,  0,  0,  0] select _level;
private _milTruckWeight =  [50, 40, 30, 20, 10,  0,  0,  0,  0,  0] select _level;
private _carWeight =       [40, 30, 20, 10, 10, 10, 10, 10, 10, 10] select _level;
private _truckWeight =     [80, 80, 80, 70, 60, 50, 40, 30, 30, 30] select _level;
private _apcWeight =       [ 0, 20, 30, 30, 40, 50, 60, 70, 80, 90] select _level;

// only occupants use militia vehicle types?
if (_side == Occupants) then
{
    [_faction get "vehiclesPolice", _policeWeight] call _fnc_addArrayToWeights;
    [_faction get "vehiclesMilitiaCars", _milCarWeight] call _fnc_addArrayToWeights;
    [_faction get "vehiclesMilitiaTrucks", _milTruckWeight] call _fnc_addArrayToWeights;
};
[_faction get "vehiclesLightUnarmed", _carWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesTrucks", _truckWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesAPCs", _apcWeight] call _fnc_addArrayToWeights;

_vehWeights;
