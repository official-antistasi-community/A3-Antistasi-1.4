/*
Author: Håkon
Description:
    Executes a function for a garage users

Arguments:
0. <Int> Client id
1. <Object> Player to pass to the function along with the player UID
2. <String> Function to be executed

Return Value:
<Nil/String> RemoteExecCall return

Scope: Server
Environment: Any
Public: No
Dependencies:

Example:

License: MIT License
*/
params ["_client", "_player", "_fnc"];
private _UID = getPlayerUID _player;
private _recipients = +HR_GRG_Users;
_recipients pushBackUnique 2;
_recipients pushBackUnique _client;
[_UID, _player] remoteExecCall [_fnc,_recipients];
