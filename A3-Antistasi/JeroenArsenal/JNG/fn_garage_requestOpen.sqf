/*
	Author: Jeroen Notenbomer

	Description:
	Sends a command to the client to open the garage. It also adds the client to the serverlist so the server knows which players
	need to be updated when vehicles get removed/added/changed. This command needs to be excuted on the server!

	Parameter(s):
	ID clientOwner

	Returns:
	NOTHING, well it sends a command which contains the jng_vehicleList and jng_ammoList
*/

if(!isServer)exitWith{};
params ["_clientOwner"];

_temp = server getVariable ["jng_playersInGarage",[]];
_temp pushBackUnique _clientOwner;
server setVariable ["jng_playersInGarage",_temp,true];

call compile preProcessFileLineNumbers "JeroenArsenal\JNG\recompile.sqf";

["Open",[jng_vehicleList,jng_ammoList]] remoteExecCall ["jn_fnc_garage", _clientOwner];