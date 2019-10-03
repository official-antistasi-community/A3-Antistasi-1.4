params ["_vehicle"];

_isAPC = (typeOf _vehicle) in vehAPCs;
_isTank = (typeOf _vehicle) in vehTanks;

if (_isAPC || _isTank) exitWith {
	[_vehicle, ["Breach Vehicle", A3A_fnc_startBreachVehicle,nil,4,false,true,"","(isPlayer _this) && (_this == vehicle _this)",5]] remoteExec ["addAction", 0, _vehicle];
};