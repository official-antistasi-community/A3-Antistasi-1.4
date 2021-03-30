#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if !(isServer) exitWith {};
_unit = _this select 0;
_adminState = admin owner _unit;
if (playerHasBeenPvP isEqualTo []) exitWith {};
_leave = false;
_id = getPlayerUID _unit;
{
	if (_id == _x select 0 && _adminState != 2 && (time - teamSwitchDelay <= _x select 1)) exitWith
	{
		_leave = true
	};
} forEach playerHasBeenPvP;
if (_leave) then
{
	["noPvP",false,1,false,false] remoteExec ["BIS_fnc_endMission",_unit];
    Info_2("Player kicked because he has been rebel recently: %1, %2", name _unit, _id);
};
