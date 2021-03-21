#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_player"];

Debug_1("Attempting to make %1 the boss", _player);

if (_player getVariable ["eligible",false] && (side (group _player) == teamPlayer) && [_player] call A3A_fnc_isMember) exitWith {
	Debug("Player is eligible, making them the boss");
	[_player] call A3A_fnc_theBossTransfer;
	true;
};

Debug("Player is not eligible, unable to make them the boss");

false;
