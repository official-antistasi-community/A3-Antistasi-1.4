private ["_toDelete"];

[petros,"hint","Deleting Garbage. Please wait", "Garbage Cleaner"] remoteExec ["A3A_fnc_commsMP", 0];

/*
_toDelete = nearestObjects [markerPos "base_4", ["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 16000];
//_toDelete = _toDelete + ((markerPos "base_4") nearObjects ["Default", 16000]); // fix for bug with detecting satchels
for "_i" from 0 to ((count _toDelete) - 1) do
{
	deleteVehicle (_toDelete select _i);
};*/
{deleteVehicle _x} forEach allDead;
{deleteVehicle _x} forEach (allMissionObjects "WeaponHolder");
{deleteVehicle _x} forEach (allMissionObjects "WeaponHolderSimulated");

[petros,"hint","Garbage deleted", "Garbage Cleaner"] remoteExec ["A3A_fnc_commsMP", 0];