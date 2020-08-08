/*
 * The reason for this split, is we can't open dialog boxes during initServer in singleplayer.
 * This is an issue if we want to get params data before initialising the server.
 
 * So if it's singleplayer, we wait for initServer.sqf to finish (and the player to be spawned in), then get params, then load.
 */

//Fortify Init
diag_log "InitServer Fortify Init loading"; 
_budget = -1;

_fortificationStructures = [
	["Land_PillboxBunker_01_rectangle_F", 40],
	["Land_PillboxBunker_01_hex_F", 50 ],
	["Land_PillboxBunker_01_big_F", 50],
	["Land_HBarrierTower_F", 25],
	["Land_BagFence_Long_F", 5],
	["Land_BagFence_Round_F", 5],
	["Land_BagBunker_Small_F", 25],
	["Land_BagBunker_Large_F", 50],
	["Land_HelipadCircle_F", 25],
	["Land_PortableLight_double_F", 3]
];

//side setup
[west, _budget, _fortificationStructures] call acex_fortify_fnc_registerObjects;
[east, _budget, _fortificationStructures] call acex_fortify_fnc_registerObjects;
[resistance, _budget, _fortificationStructures] call acex_fortify_fnc_registerObjects;
[civilian, _budget, _fortificationStructures] call acex_fortify_fnc_registerObjects;

//fortify persistant listener event handlers.
["acex_fortify_objectPlaced", {
	private _newObject = [(_this select 2)]; 
	staticsToSave pushBackUnique _newObject;
}] call CBA_fnc_addEventHandler;
 
["acex_fortify_objectDeleted", {
	private _deletedObject = [(_this select 2)]; 
	staticsToSave = staticsToSave - _deletedObject;
}] call CBA_fnc_addEventHandler;




if (isNil "logLevel") then {LogLevel = 2};
if (isMultiplayer) then {
	[] call A3A_fnc_initServer;
} else {
	[] spawn {
		waitUntil {!isNull player && player == player && !isNull (finddisplay 46)};
		[2, "Opening Singleplayer Parameter Dialog", "initServer.sqf"] call A3A_fnc_log;
		[] call A3A_fnc_createDialog_setParams;
		[2, "Proceeding to initServer", "initServer.sqf"] call A3A_fnc_log;
		[] call A3A_fnc_initServer;
	};
};