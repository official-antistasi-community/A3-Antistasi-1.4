/*
Maintainer: Caleb Serafin
    REAL COSTING NOT IMPLEMENTED YET. A3A_fnc_fastTravelRadio still responsible for actual cost. Arguments will change.
    Calculates the monetary and time cost of fast travel.
    Note: Your code is responsible for to handling the money. That should happen on server in unscheduled execution to avoid the lost update problem.

Arguments:
    <OBJECT> Player who orders fast travel. objNull skips discounts.
    <OBJECT> | <GROUP> | <ARRAY<OBJECT>> Thing(s) being fast travelled.
    <POS2D> Destination.

Return Value:
    <SCALAR,SCALAR> Total Money and Max Time cost tuple.

Scope: Any, Global Arguments, No Effect
Environment: Any
Public: Yes

Example:
    [player, getPos _petrosWhitePowderHouse] call A3A_fnc_calculateFastTravelCost params ["_fastTravelCost","_fastTravelTime"];
*/
params [
    ["_player", objNull, [objNull]],
    ["_destination", nil, [[]], [2,3]]
];

[0,0.01];