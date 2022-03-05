/*
Function:
    A3A_fnc_getAdmin

Description:
    Returns unit object of online admin or objNull.
    Does not work in SP. Must be on Local Host / Dedicated Multiplayer.

Scope:
    <SERVER>

Environment:
    <ANY>

Returns:
    <OBJECT> Admin unit if online/Local Host or objNull if no admin.

Examples:
    [] call A3A_fnc_getAdmin;

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

if (isServer && hasInterface) then { A3A_admin = player; };
if (isNil "A3A_admin") then {A3A_admin = objNull};
if (admin owner A3A_admin isEqualTo 0 && !hasInterface) then {
    private _allPlayers = (allUnits + allDeadMen);
    private _adminIndex = _allPlayers findIf {!(admin owner _x isEqualTo 0)};
    A3A_admin = if (_adminIndex isEqualTo -1) then { objNull } else { _allPlayers # _adminIndex };
};
A3A_admin;
