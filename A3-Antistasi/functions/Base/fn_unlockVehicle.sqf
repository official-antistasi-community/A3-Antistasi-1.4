private ["_pool","_veh","_typeVehX"];

_veh = cursorObject;

if (isNull _veh) exitWith {hint "You are not looking at a vehicle"};

if (!alive _veh) exitWith {hint "You cannot unlock destroyed"};

if (_veh isKindOf "Man") exitWith {hint "Are you kidding?"};
if (not(_veh isKindOf "AllVehicles")) exitWith {hint "The vehicle you are looking at cannot be used"};
_ownerX = _veh getVariable "ownerX";

if (isNil "_ownerX") exitWith {hint "The vehicle you are looking at is already unlocked"};

if (_ownerX != getPlayerUID player) exitWith {hint "You cannot unlock vehicles which you do not own"};

_veh setVariable ["ownerX",nil,true];

hint "Vehicle Unlocked";
