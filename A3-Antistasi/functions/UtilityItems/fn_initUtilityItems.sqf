/*
Author: [Killerswin2]
    add actions for the to light the player
Arguments:
    <nil>

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
     call A3A_fnc_initUtilityItems; 
*/

player addAction [
    "carry light",
    {
        [cursorObject, true] call A3A_fnc_carryCrate;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(
        ((typeof cursorObject) isEqualTo (A3A_faction_reb getVariable [""vehicleLightSource"", """"]))
        and (([_this] call A3A_fnc_countAttachedObjects) isEqualTo 0)
        and (attachedTo cursorObject isEqualTo objNull)
    )"
];

player addAction [
    "drop light",
    {
        [nil, false] call A3A_fnc_carryCrate;;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(
        (_this getVariable ['carryingCrate', false])
    )"
];

player addAction [
    "rotate light",
    {
        [cursorObject] call A3A_fnc_rotateItem;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(
        ((typeof cursorObject) isEqualTo (A3A_faction_reb getVariable [""vehicleLightSource"", """"]))
        and !(_this getVariable ['rotatingLight',false])
    )"
];


nil;