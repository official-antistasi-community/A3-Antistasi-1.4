private ["_pool","_veh","_typeVehX"];

_veh = cursorObject;

if (isNull _veh) exitWith {["Unlock Vehicle", "You are not looking at a vehicle"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {["Unlock Vehicle", "You cannot unlock destroyed"] call A3A_fnc_customHint;};

if (_veh isKindOf "Man") exitWith {["Unlock Vehicle", "Are you kidding?"] call A3A_fnc_customHint;};
if (not(_veh isKindOf "AllVehicles")) exitWith {["Unlock Vehicle", "The vehicle you are looking at cannot be used"] call A3A_fnc_customHint;};
_ownerX = _veh getVariable "ownerX";

if (isNil "_ownerX") exitWith {["Unlock Vehicle", "The vehicle you are looking at is already unlocked"] call A3A_fnc_customHint;};

if (_ownerX != getPlayerUID player) exitWith {["Unlock Vehicle", "You cannot unlock vehicles which you do not own"] call A3A_fnc_customHint;};

_veh setVariable ["ownerX",nil,true];

["Unlock Vehicle", "Vehicle Unlocked"] call A3A_fnc_customHint;