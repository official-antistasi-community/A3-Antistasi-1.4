params ["_vUID","_stateIndex", "_state"];

private "_vehData";
for "_i" from 0 to 4 do { _vehData = (HR_GRG_Vehicles#_i) get _vUID; if (!isNil "_vehdata") exitWith {}; }; //find vehicles in categorys, typically cat 0 "cars"

(_vehData#4) set [_stateIndex, _state];
