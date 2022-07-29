#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

// Does a restart issued by a moderator
params [["_comment", "", [""]]];

private _owner = remoteExecutedOwner;
private _player = (allPlayers select {owner _x == _owner;}) select 0;

if (isNil "_player") exitWith { diag_log format ["[ASMS] Error: Player is nil, owner: %1", _owner]; };

private _name = name _player;
private _uid = getPlayerUID _player;

// Check if the player who requested restart has the required permissions
private _permissions = [_uid] call FUNC(getUIDPermissions);
if (! ("restart" in _permissions)) exitWith {
	diag_log format ["[ASMS] Error: Restart was requested by client without restart permissions: %1, %2", _name, _uid];
};

// Perform a restart
private _text = [
"==============================================================",
"",
"######   #######   #####   #######     #     ######   ####### ",
"#     #  #        #     #     #       # #    #     #     #    ",
"#     #  #        #           #      #   #   #     #     #    ",
"######   #####     #####      #     #     #  ######      #    ",
"#   #    #              #     #     #######  #   #       #    ",
"#    #   #        #     #     #     #     #  #    #      #    ",
"#     #  #######   #####      #     #     #  #     #     #    ",
"",
"=============================================================="];
{diag_log _x;} forEach _text;
diag_log format ["[ASMS] Info: Restart was issued by: %1, uid: %2", _name, _uid];
diag_log format ["Restart comment: %1", _comment];
private _password = getText (configFile >> "AntistasiServerMembers" >> "serverPassword");
_password serverCommand "#missions";
