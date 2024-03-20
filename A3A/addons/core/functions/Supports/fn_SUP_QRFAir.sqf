/*  Sets up an air QRF support

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend on this QRF.
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

// No typeOfAttack, QRF contents depend purely on target?
// not 100% smart but we don't want it to be
// Also no killzones, QRFs have resource spend limitations instead

private _airbase = [_side, _targPos] call A3A_fnc_availableBasesAir;
if (isNil "_airbase") exitWith { Info("QRF cancelled because no airbases available (how?)"); -1 };

private _vehCount = 3 min ceil (_maxSpend / A3A_balanceVehicleCost);        // will overshoot a bit (no 1.5x factor). This is preferable to sending tiny QRFs
// TODO: bias a bit for tank/APC/static targets?
private _attackCount = round random ([0, 0, 0.8, 1.5] select _vehCount);

// 1.5 cost factor for air
private _estResources = 1.5 * _vehCount * A3A_balanceVehicleCost;
A3A_supportStrikes pushBack [_side, "TROOPS", _targPos, time + 45*60, 45*60, _estResources];

private _aggro = [aggressionOccupants, aggressionInvaders] select (_side == Invaders);
if (_delay < 0) then { _delay = (0.5 + random 1) * (300 - 15*tierWar - 1*_aggro) };

//Set idle times for marker, just so that stuff doesn't spawn on top? Carrier will ignore anyway
//[_airbase, 5+_delay/60] call A3A_fnc_addTimeForIdle;

// kinda epic but whatever
[[_suppName, _side, _resPool, _delay, _targPos, _airbase, true, _vehCount, _attackCount, _estResources], "A3A_fnc_SUP_QRFRoutine"] call A3A_fnc_scheduler;

private _approxTime = _delay + (markerPos _airbase distance2D _targPos) / (200 / 3.6);      // estimated travel time
[_reveal, _side, "QRFAIR", _targPos, _approxTime] spawn A3A_fnc_showInterceptedSetupCall;

_estResources;            // *estimated* resource cost of QRF
