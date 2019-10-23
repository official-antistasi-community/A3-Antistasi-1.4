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

if (not(_veh isKindOf "Air")) exitWith {hint "Only Air Vehicles can be used to increase Airstrike points"};

_tipo = typeOf _veh;

//if (_tipo == vehSDKHeli) exitWith {hint "Syndikat Helicopters cannot be used to increase Airstrike points"};

_puntos = 2;

if (_tipo in vehAttackHelis) then {_puntos = 5};
if ((_tipo == vehCSATPlane) or (_tipo == vehNATOPlane)) then {_puntos = 10};
deleteVehicle _veh;
hint format ["Air Support increased in %1 points",_puntos];
bombRuns = bombRuns + _puntos;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];