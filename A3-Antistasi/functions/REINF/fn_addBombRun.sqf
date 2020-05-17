_veh = cursortarget;

if (isNull _veh) exitWith {["Airstrike", "You are not looking to any vehicle"] call A3A_fnc_customHint;};

if (_veh distance getMarkerPos respawnTeamPlayer > 50) exitWith {["Airstrike", "Vehicle must be closer than 50 meters to the flag"] call A3A_fnc_customHint;};

if ({isPlayer _x} count crew _veh > 0) exitWith {["Airstrike", "In order to sell, vehicle must be empty."] call A3A_fnc_customHint;};

_owner = _veh getVariable "ownerX";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {["Airstrike", "You are not owner of this vehicle and you cannot sell it"] call A3A_fnc_customHint;};

if (not(_veh isKindOf "Air")) exitWith {["Airstrike", "Only Air Vehicles can be used to increase Airstrike points"] call A3A_fnc_customHint;};

_typeX = typeOf _veh;

if (isClass (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo")) then {
	if (count getArray (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo" >> "dissasembleTo") > 0) then {
		_exit = true;
	};
};
if (_exit) exitWith {["Airstrike", "Backpack drones cannot be used to increase Airstrike points"] call A3A_fnc_customHint;};


//if (_typeX == vehSDKHeli) exitWith {hint "Syndikat Helicopters cannot be used to increase Airstrike points"};

_pointsX = 2;

if (_typeX in vehAttackHelis) then {_pointsX = 5};
if ((_typeX == vehCSATPlane) or (_typeX == vehNATOPlane)) then {_pointsX = 10};
deleteVehicle _veh;
["Airstrike", format ["Air Support increased in %1 points",_pointsX]] call A3A_fnc_customHint;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];