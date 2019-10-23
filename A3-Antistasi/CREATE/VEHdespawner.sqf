private ["_veh"];

_veh = _this select 0;

_inside = _veh getVariable "inDespawner";
if (!isNil "_inside") exitWith {};

_veh setVariable ["inDespawner",true,true];

if ((typeOf _veh in arrayCivVeh) and ({_x getVariable ["GREENFORSpawn",false]} count crew _veh > 0) and (_veh distance getMarkerPos respawnBuenos > 50)) then
	{
	_pos = position _veh;
	[0,-1,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
	_ciudad = [ciudades, _pos] call BIS_fnc_nearestPosition;
	_datos = server getVariable _ciudad;
	_prestigeOPFOR = _datos select 2;
	sleep 5;
	if (random 100 < _prestigeOPFOR) then
		{
		{_amigo = _x;
		if ((captive _amigo) and (isPlayer _amigo)) then
			{
			[_amigo,false] remoteExec ["setCaptive",0,_amigo];
			_amigo setCaptive false;
			};
		{
		if ((side _x == malos) and (_x distance _pos < distanciaSPWN)) then {_x reveal [_amigo,4]};
		} forEach allUnits;
		} forEach crew _veh;
		};
	};
while {alive _veh} do
	{
	if ((not([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) and (not([distanciaSPWN,1,_veh,"OPFORSpawn"] call A3A_fnc_distanceUnits)) and (not([distanciaSPWN,1,_veh,"BLUFORSpawn"] call A3A_fnc_distanceUnits)) and (not(_veh in staticsToSave)) and (_veh distance getMarkerPos respawnBuenos > 100)) then
		{
		//hint format ["%1 se lo ha cargado el despawner",_veh];
		if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
		deleteVehicle _veh
		};
	sleep 60;
	};