/*
Maintainer: Caleb Serafin
    REAL CHECKING NOT IMPLEMENTED YET. A3A_fnc_fastTravelRadio still responsible for actual checks. Arguments will change.
    Checks whether a player can fast travel. Does not check financials.
    If destination is provided: travel to there will also be verified.
    returns tuple of isAllowed and list of reasons why not.

Arguments:
    <OBJECT> Player who orders fast travel. objNull skips permissions.
    <OBJECT> | <GROUP> | <ARRAY<OBJECT>> Thing(s) being fast travelled.
    <POS2D> Optionally specify destination. [DEFAULT = nil]

Return Value:
    <BOOL,ARRAY<STRING>> If fast travel is allowed and reasons why not.

Scope: Any, Global Arguments, No Effect
Environment: Any
Public: Yes

Example:
    [player] call A3A_fnc_canFastTravel params ["_isFastTravelAllowed","_fastTravelBlockers"];
    if (!_isFastTravelAllowed) exitWith {
        { systemChat _x } foreach _fastTravelBlockers;
    }
    [] call A3A_fnc_fastTravelRadio;
*/
params [
    ["_player", objNull, [objNull]],
    ["_destination", nil, [[]], [2,3]]
];

[true,[]];

