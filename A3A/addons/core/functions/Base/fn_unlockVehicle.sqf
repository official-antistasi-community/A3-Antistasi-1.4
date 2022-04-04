private ["_pool","_veh","_typeVehX"];

_veh = cursorObject;

if (isNull _veh) exitWith {["Unlock Vehicle", "You are not looking at a vehicle."] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {["Unlock Vehicle", "You cannot unlock/lock destroyed."] call A3A_fnc_customHint;};

if (_veh isKindOf "Man") exitWith {["Unlock Vehicle", format ["Sorry you cannot unlock %1.",name _veh]] call A3A_fnc_customHint;};

if (not(_veh isKindOf "AllVehicles")) exitWith {["Unlock Vehicle", "The vehicle you are looking at cannot be used."] call A3A_fnc_customHint;};
_ownerX = _veh getVariable "ownerX";

if (isNil "_ownerX") exitWith {["Unlock Vehicle", "The vehicle you are looking does not belong to anyone."] call A3A_fnc_customHint;};

if (_ownerX != getPlayerUID player) exitWith {["Unlock Vehicle", "You cannot unlock/lock vehicles which you do not own."] call A3A_fnc_customHint;};

_locked = _veh getVariable "locked";
if (_locked isequalto false) then {
    _veh setVariable ["locked",true];
    ["Unlock Vehicle", "Vehicle locked."] call A3A_fnc_customHint;
} else {
    _veh setVariable ["locked",false];
    ["Unlock Vehicle", "Vehicle unlocked."] call A3A_fnc_customHint;	
};