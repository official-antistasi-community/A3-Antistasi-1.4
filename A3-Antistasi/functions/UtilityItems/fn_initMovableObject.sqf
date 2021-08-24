/*
Author: Killerswin2
    add actions for the to light the player
Arguments:
    0.<Object> Object that we try to add actions to 
    1.<String> Custom JIP key to prevent overwriting 

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [_object, ] call A3A_fnc_initMovableObject; 
*/

params[["_object", objNull, [objNull]],["_jipKey", "", [""]]];

if (isNil "_object") exitwith {remoteExec ["", _jipKey];};
    
_object addAction [
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
        and (attachedTo _target isEqualTo objNull)
    )", 
    4
];

_object addAction [
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