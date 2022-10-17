/*  Adds a random amount of the given one to the attack counter (Why tho?)

    Execution on: Server

    Scope: External

    Params:
        _timeToAdd: NUMBER : The amount of seconds to add
        _side: SIDE : To which side will the amount be added

    Returns:
        Nothing
*/

params ["_timeToAdd", "_side"];

// Function is obsolete but still used by mission rewards
// for now, fudge some effect on attack/defence resources

if (_timeToAdd < 0) exitWith {};
[-_timeToAdd/10, _side, "defence"] call A3A_fnc_addEnemyResources;
[-_timeToAdd/10, _side, "attack"] call A3A_fnc_addEnemyResources;
if (true) exitWith {};
