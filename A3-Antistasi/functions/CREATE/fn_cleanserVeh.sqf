#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_veh"];

private _vehpos = getpos _veh;
private _nearestMarker  = ([markersX, _vehpos] call BIS_fnc_nearestPosition);

sleep 5;

if (isNull _veh) exitWith {
    Debug_1("%1 is null on spawn", typeof _veh);
};

if (!alive _veh) then
{
    Debug_3("%1 destroyed on spawn at %2, near %3", typeof _veh, _vehpos, _nearestMarker);
	_veh hideObjectGlobal true;
	deleteVehicle _veh;
};
