private ["_veh", "_coste","_tipo"];
_veh = cursortarget;

if (isNull _veh) exitWith {hint "You are not looking to any vehicle"};

if (_veh distance getMarkerPos respawnBuenos > 50) exitWith {hint "Vehicle must be closer than 50 meters to the flag"};

if ({isPlayer _x} count crew _veh > 0) exitWith {hint "In order to sell, vehicle must be empty."};

_owner = _veh getVariable "duenyo";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {hint "You are not owner of this vehicle and you cannot sell it"};

_tipo = typeOf _veh;
_coste = 0;

if (_tipo in vehFIA) then
	{
	_coste = round (([_tipo] call A3A_fnc_vehiclePrice)/2)
	}
else
	{
	if (_tipo in arrayCivVeh) then
		{
		_destino = _veh getVariable "destino";
		if (isNil "_destino") then
			{
			if (_tipo == "C_Van_01_fuel_F") then {_coste = 50} else {_coste = 25};
			}
		else
			{
			_coste = 200;
			};
		}
	else
		{
		if ((_tipo in vehNormal) or (_tipo in vehBoats) or (_tipo in vehAmmoTrucks)) then
			{
			_coste = 100;
			}
		else
			{
			if (_tipo in vehAPCs) then
				{
				_coste = 1000;
				}
			else
				{
				if (_tipo in vehPlanes) then
					{
					_coste = 4000;
					}
				else
					{
					if ((_tipo in vehAttackHelis) or (_tipo in vehTanks) or (_tipo in vehAA) or (_tipo in vehMRLS)) then
						{
						_coste = 3000;
						}
					else
						{
						if (_tipo in vehTransportAir) then
							{
							_coste = 2000;
							};
						};
					};
				};
			};
		};
	};

if (_coste == 0) exitWith {hint "The vehicle you are looking is not suitable in our marketplace"};

_coste = round (_coste * (1-damage _veh));

[0,_coste] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};

[_veh,true] call A3A_fnc_vaciar;

if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};

hint "Vehicle Sold";



