#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_veh"];

sleep 5;

if (isNull _veh) exitWith {
    Debug_1("%1 is null on spawn", typeof _veh);
};

if (!alive _veh) then
{
    Debug_1("%1 destroyed on spawn", typeof _veh);
	_veh hideObjectGlobal true;
	deleteVehicle _veh;
};
