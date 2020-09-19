params ["_vehicleType", "_pos", "_dir"];

private _garageVeh = createVehicle [_vehicleType, [0,0,1000], [], 0, "NONE"];
_garageVeh setDir _dir;
//Set position exactly
_garageVeh setPosASL _pos;

clearMagazineCargoGlobal _garageVeh;
clearWeaponCargoGlobal _garageVeh;
clearItemCargoGlobal _garageVeh;
clearBackpackCargoGlobal _garageVeh;

_garageVeh allowDamage true;
_garageVeh enableSimulation true;

_garageVeh;
