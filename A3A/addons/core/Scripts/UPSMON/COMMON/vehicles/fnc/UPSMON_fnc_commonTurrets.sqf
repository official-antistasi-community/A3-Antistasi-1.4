/****************************************************************
File: UPSMON_fnc_commonTurrets.sqf
Author: Killzonekid

Description:
	Get all the turretpath of the vehicle
Parameter(s):
	<--- vehicle
Returns:
	array of turretpath
****************************************************************/

private ["_arr","_trts"];

_arr = [];
_trts = configFile / "CfgVehicles" / typeOf _this / "Turrets";
for "_i" from 0 to count _trts - 1 do 
{
	_arr pushback [_i];

	for "_j" from 0 to count (
		_trts / configName (_trts select _i) / "Turrets"
		) - 1 do 
	{
		_arr pushback [_i, _j];
	};
};

_arr
