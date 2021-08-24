/*
Author: Killerswin2
    add actions for the to light the player
Arguments:
    0.<Object> Object that we try to add actions to 

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [_light] call A3A_fnc_initUtilityItems; 
*/

params[["_light", objNull,[objNull]]];

if (isNil "_light") exitwith {systemChat "light is nil"};


_light addAction [
    "Carry object",
    {
        [cursorObject, true] call A3A_fnc_carryItem;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(
        (([_this] call A3A_fnc_countAttachedObjects) isEqualTo 0)
        and (attachedTo cursorObject isEqualTo objNull)
    )", 
    4
];

player addAction [
    "Drop object",
    {
        [nil, false] call A3A_fnc_carryItem;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(
        (_this getVariable ['A3A_carryingObject', false])
    )"
];

_light addAction [
    "Rotate object",
    {
        [cursorObject] call A3A_fnc_rotateItem;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(
        !(_this getVariable ['A3A_rotatingObject',false])
    )",
    4
];


nil;