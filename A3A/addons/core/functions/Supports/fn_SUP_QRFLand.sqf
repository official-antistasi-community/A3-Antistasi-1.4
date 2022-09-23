/*  Sets up a land QRF support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend on this QRF. Must be greater than zero
    <OBJECT|BOOL> Target, or "false" for none. Might be used to flavour the QRF
    <POSITION> Estimated position of target, or center of target zone
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _base = [_side, _targPos] call A3A_fnc_availableBasesLand;
if (isNil "_base") exitWith { Info("QRF cancelled because no land bases available"); -1 };

//Set idle times for marker, just so that stuff doesn't spawn on top
[_base, 10] call A3A_fnc_addTimeForIdle;

private _vehCount = 3 min ceil (_maxSpend / A3A_balanceVehicleCost);
private _attackCount = [0, 0, round random 1, 1] select _vehCount;

private _estResources = _vehCount * A3A_balanceVehicleCost;
A3A_supportStrikes pushBack [_side, "TROOPS", _targPos, time + 2700, 2700, _estResources];

//private _aggro = [aggressionOccupants, aggressionInvaders] select (_side == Invaders);
// Land QRF delay is purely dependent on travel as they're slow enough already
if (_delay < 0) then { _delay = 0 };            // land QRFs slow enough already

// kinda epic but whatever
[[_suppName, _side, _resPool, _delay, _targPos, _base, false, _vehCount, _attackCount, _estResources], "A3A_fnc_SUP_QRFRoutine"] call A3A_fnc_scheduler;

private _approxTime = _delay + (markerPos _base distance2D _targPos) / (30 / 3.6);      // (badly) estimated travel time
[_reveal, _side, "QRFLAND", _targPos, _approxTime] spawn A3A_fnc_showInterceptedSetupCall;

_estResources;            // *estimated* resource cost of QRF
