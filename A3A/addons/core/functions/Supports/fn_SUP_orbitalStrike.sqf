/*  Sets up an orbital strike support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here
    <OBJECT|BOOL> Target of the support. False for none
    <POSITION> Target position for orbital strike
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_delay < 0) then { _delay = (0.5 + random 1) * (350 - 15*tierWar - 1*_aggroValue) };

// ["_side", "_basetype", "_target", "_endtime", "_duration", "_power"]
A3A_supportStrikes pushBack [_side, "AREA", _targPos, time + 1200, 1200, 500];

[_supportName, _side, _delay, ATLtoASL _targPos, _reveal] spawn A3A_fnc_SUP_orbitalStrikeRoutine;

[_reveal, _side, "ORBITALSTRIKE", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

// Return resource cost of support
500;
