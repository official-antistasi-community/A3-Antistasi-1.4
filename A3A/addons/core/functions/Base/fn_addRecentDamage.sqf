#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_side", "_pos", "_value"];

// do we allow this and just ignore it?
if (_side != Occupants && _side != Invaders) exitWith { Error_1("Called with invalid side: %1", _side) };

private _killPosValue = [_pos#0, _pos#1, 1000*20 + round _value];      // upper part is a time in minutes, lower part is value
([A3A_recentDamageOcc, A3A_recentDamageInv] select (_side == Invaders)) pushBack _killPosValue;
