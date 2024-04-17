/*
Author: Killerswin2
    add actions for dropping objects
Arguments:
    0.<nil>

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [] call A3A_fnc_dropObject; 
*/

player addAction [
    localize "STR_A3A_fn_UtilItem_dropOb_addact_drop",
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

nil;