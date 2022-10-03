/*
Maintainer: Caleb Serafin
    Modifies the provided player's funds.
    Function will automatically re-execute on the server if called on a client.
    Provides backwards compatibility for direct execution on client.

Arguments:
    <SCALAR> Amount to add (make negative for deduction.)
    <OBJECT> The player to add to remove money from. (DEFAULT: player)

Return Value:
    <BOOL> Returns true if transaction successful, false if not. Will always be false if executed on non-server.

Scope: Any, Global Arguments, Global Effect
Environment: Unscheduled
Public: Yes

Example:
    [-100] call A3A_fnc_resourcesPlayer; // Backwards compatible Deduct 100 Euros
    [420, _theAffectedPlayer] call FUNCMAIN(donateMoney); // The server-side call to add money.
*/
if (!isServer) exitWith {
    this remoteExecCall ["A3A_fnc_resourcesPlayer", 2];
};

params [
    ["_moneyAdjustment", 0, [0]],
    ["_playerObject", player, [objNull]]
];

_storedMoney = _playerObject getVariable ["moneyX", 0];
if (_moneyAdjustment < 0 && -_moneyAdjustment < _storedMoney) exitWith {false};  // Prevent debt, but allow adding money if somehow in debt.
_storedMoney = _storedMoney + _moneyAdjustment;
_playerObject setVariable ["moneyX", _storedMoney, true];

[] remoteExec ["A3A_fnc_statistics", _playerObject];
true;
