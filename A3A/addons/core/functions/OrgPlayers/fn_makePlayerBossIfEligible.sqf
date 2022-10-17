#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_player"];

Info_1("Attempting to make %1 the boss", name _player);

if !(_player getVariable ["eligible", false]) exitWith { Error("Attempted boss transfer to an ineligible player"); false };
if (!A3A_guestCommander and !(_player call A3A_fnc_isMember)) exitWith { Error("Attempted to transfer boss to a guest"); false };

Info("Player is eligible, making them the boss");
[_player] call A3A_fnc_theBossTransfer;
true;
