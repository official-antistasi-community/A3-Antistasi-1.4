
// things we need to do here?
// - if markerX and unconscious then 50/50 delete from garrison?
// - if resPool is defence or attack then refund if not dead

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit"];

// Everything here should already be handled if unit was killed
if (!alive _unit) exitWith {};

private _pool = _unit getVariable ["A3A_resPool", "legacy"];
private _side = _unit getVariable ["originalSide", sideUnknown];
if (_side != Occupants and _side != Invaders) then {
    Error_2("Wrong unit had delete handler, side %1, type %2, pool %3", _side, _unit getVariable "UnitType", _pool);
};

//Debug_3("Enemy delete handler called with side %1, type %2, pool %3", _side, _unit getVariable "UnitType", _pool)

if (_unit call A3A_fnc_canFight) then 
{
    // Refund if we paid for this unit in advance
    if (_pool == "attack" or _pool == "defence") then {
        [10, _side, _pool] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
    };
}
else
{
    // Deplete resource pools if we haven't paid for this unit in advance
    if (_pool == "legacy") then {
        [-10, _side, _pool] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
    };

    // Remove from garrison if it belongs to one
    private _marker = _victim getVariable "markerX";
    if (isNil "_marker" or { sidesX getVariable [_marker, sideUnknown] != _side }) exitWith {};
    [_victim getVariable "unitType", _side, _marker,-1] remoteExec ["A3A_fnc_garrisonUpdate", 2];
};
