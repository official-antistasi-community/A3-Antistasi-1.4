private ["_veh"];

_veh = _this select 0;

if !(alive _veh) exitWith {};

if !(local _veh) exitWith {};

private _smoked = _veh getVariable ["smoked",0];

if (time < _smoked) exitWith {};

_veh setVariable ["smoked",time + 120];

if ({"SmokeLauncher" in (_veh weaponsTurret _x)} count (allTurrets _veh) > 0) then
	{
	[_veh,"SmokeLauncher"] call BIS_fnc_fire;
	}
else
	{
	if !(hasIFA) then
		{
		private ["_pos","_smokeX"];
		_typeSmoke = selectRandom allSmokeGrenades;
		for "_i" from 0 to 8 do
			{
			_pos = position _veh getPos [(28 + random 2),_i*40];
			_smokeX = _typeSmoke createVehicle [_pos select 0, _pos select 1,getPos _veh select 2];
			};
		};
	};