/*
Maintainer: Caleb Serafin
    Outcome changes depending on the provided argument!
    Transfers the desired funds from the donor to the receiver.
    The donor does not get points for donating. This was disabled due to abuse-ability.
    Function will automatically re-execute on the server if called on a client.
    Provides backwards compatibility for direct execution on client.

Arguments:
    <OBJECT> The player object who loses money.
    <OBJECT | STRING> The receiver who gains money. Either a player object or the string "faction" to donate to faction.
    <SCALAR> Amount of Euros to transfer.

Return Value:
    <BOOL> Returns true if donation successful, false if not. Will always be false if executed on non-server.

Scope: Any, Global Arguments, Global Effect
Environment: Unscheduled
Public: Yes

Example:
    [player, cursorObject, 100] call A3A_fnc_donateMoney;
    [player, "faction", 420] call A3A_fnc_donateMoney;
*/

private _titleStr = localize "STR_A3A_fn_orgp_donMon_titel";
private ["_resourcesPlayer","_pointsXJ","_target"];

_resourcesPlayer = player getVariable "moneyX";
if (_resourcesPlayer < 100) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_donMon_no_less"] call A3A_fnc_customHint;};

if (count _this == 0) exitWith
	{
	[0,100] remoteExec ["A3A_fnc_resourcesFIA",2];
	_pointsXJ = (player getVariable "score") + 1;
	player setVariable ["score",_pointsXJ,true];
	[-100] call A3A_fnc_resourcesPlayer;
	[_titleStr, localize "STR_A3A_fn_orgp_donMon_donated_faction"] call A3A_fnc_customHint;
	};
_target = cursortarget;

if (!isPlayer _target) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_donMon_no_looking"] call A3A_fnc_customHint;};

[-100] call A3A_fnc_resourcesPlayer;
[100] remoteExec ["A3A_fnc_resourcesPlayer", _target];
[_titleStr, format [localize "STR_A3A_fn_orgp_donMon_donated_player", name _target]] call A3A_fnc_customHint;
