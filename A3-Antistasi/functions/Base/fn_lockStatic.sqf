params ["_target", "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", true, true]; 

// kick any AIs out of the vehicle
{
    if (isPlayer _x) then { continue };
    [_x] remoteExec ["unassignVehicle", _x];
    moveOut _x;
} forEach (crew _target);
