params ["_vehicle"];

private _type = typeOf _vehicle;

if (_type in vehAPCs || _type in vehTanks || _type in vehAA) exitWith {
	[_vehicle, ["Breach Vehicle", A3A_fnc_startBreachVehicle,nil,4,false,true,"","(isPlayer _this) && (_this == vehicle _this)",5]] remoteExec ["addAction", 0, _vehicle];
};