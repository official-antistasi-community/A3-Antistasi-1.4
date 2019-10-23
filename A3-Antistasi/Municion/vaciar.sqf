private ["_camiones","_camion","_armas","_municion","_items","_mochis","_contenedores","_todo"];

_camion = objNull;

if (count _this > 0) then
	{
	_camion = _this select 0;
	if (_camion isKindOf "StaticWeapon") then {_camion = objNull};
	}
else
	{
	_camiones = nearestObjects [caja, ["LandVehicle","ReammoBox_F"], 20];
	_camiones = _camiones select {not (_x isKindOf "StaticWeapon")};
	_camiones = _camiones - [caja,cajaVeh];
	if (count _camiones < 1) then {_camion = cajaVeh} else {_camion = _camiones select 0};
	};

if (isNull _camion) exitWith {};

_armas = weaponCargo _camion;
_municion = magazineCargo _camion;
_items = itemCargo _camion;
_mochis = backpackCargo _camion;

_todo = _armas + _municion + _items + _mochis;

if (count _todo < 1) exitWith
	{
	if (count _this == 0) then {hint "Closest vehicle cargo is empty"};
	if (count _this == 2) then {deleteVehicle _camion};
	};

if (count _this == 2) then {[_camion,caja,true] remoteExec ["A3A_fnc_munitionTransfer",2]} else {[_camion,caja] remoteExec ["A3A_fnc_munitionTransfer",2]}