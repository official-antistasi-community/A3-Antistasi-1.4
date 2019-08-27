_veh = cursortarget;

if (isNull _veh) exitWith {hint "You are not looking to any vehicle"};

if (_veh distance getMarkerPos respawnTeamPlayer > 50) exitWith {hint "Vehicle must be closer than 50 meters to the flag"};

if ({isPlayer _x} count crew _veh > 0) exitWith {hint "In order to sell, vehicle must be empty."};

_owner = _veh getVariable "ownerX";
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

_typeX = typeOf _veh;

//if (_typeX == vehSDKHeli) exitWith {hint "Syndikat Helicopters cannot be used to increase Airstrike points"};

_pointsX = 2;

if (_typeX in vehAttackHelis) then {_pointsX = 5};
if ((_typeX == vehCSATPlane) or (_typeX == vehNATOPlane)) then {_pointsX = 10};
deleteVehicle _veh;
hint format ["Air Support increased in %1 points",_pointsX];
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];