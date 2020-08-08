diag_log format ["%1: [Antistasi] | INFO | Init Started.",servertime];
//Arma 3 - Antistasi - Warlords of the Pacific by Barbolani & The Official AntiStasi Community
//Do whatever you want with this code, but credit me for the thousand hours spent making this.
private _fileName = "init.sqf";
scriptName "init.sqf";

if (isNil "logLevel") then {logLevel = 2};
[2,"Init SQF started",_fileName] call A3A_fnc_log;

//If it's singleplayer, delete every playable unit that isn't the player.
//Addresses the issue of a bunch of randoms running around at the start.
if (!isMultiplayer) then {
	[3, "Singleplayer detected: Deleting units for other players.", _fileName] call A3A_fnc_log;
	{ deleteVehicle _x; } forEach (switchableUnits select {_x != player});
};

enableSaving [false,false];
mapX setObjectTexture [0,"Pictures\Mission\whiteboard.jpg"];

//ACE Carry values
ACE_maxWeightCarry = 15000;
ACE_maxWeightDrag = 20000;

//Fortify Init
[independent, 0, [["Land_PillboxBunker_01_rectangle_F", 40], ["Land_BagFence_01_long_green_F", 10], ["Land_BagFence_01_round_green_F", 10], ["Land_PillboxBunker_01_hex_F", 50 ], ["Land_PillboxBunker_01_big_F", 50], ["Land_HBarrier_1_F", 1], ["Land_HBarrier_5_F", 5], ["Land_HBarrierWall4_F", 10], ["Land_HBarrierWall_corner_F", 10], ["Land_HBarrierTower_F", 25], ["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 25], ["Land_BagBunker_Large_F", 50], ["Land_CncBarrierMedium_F", 5], ["Land_CncBarrierMedium4_F", 20], ["Land_HelipadCircle_F", 25],["Land_PortableLight_double_F", 3], ["StorageBladder_01_fuel_forest_F", 175], ["StorageBladder_01_fuel_sand_F", 175], ["Land_ClutterCutter_medium_F", 1]]] call acex_fortify_fnc_registerObjects;
[civilian, 0, [["Land_PillboxBunker_01_rectangle_F", 40], ["Land_BagFence_01_long_green_F", 10], ["Land_BagFence_01_round_green_F", 10], ["Land_PillboxBunker_01_hex_F", 50 ], ["Land_PillboxBunker_01_big_F", 50], ["Land_HBarrier_1_F", 1], ["Land_HBarrier_5_F", 5], ["Land_HBarrierWall4_F", 10], ["Land_HBarrierWall_corner_F", 10], ["Land_HBarrierTower_F", 25], ["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 25], ["Land_BagBunker_Large_F", 50], ["Land_CncBarrierMedium_F", 5], ["Land_CncBarrierMedium4_F", 20], ["Land_HelipadCircle_F", 25],["Land_PortableLight_double_F", 3], ["StorageBladder_01_fuel_forest_F", 175], ["StorageBladder_01_fuel_sand_F", 175], ["Land_ClutterCutter_medium_F", 1]]] call acex_fortify_fnc_registerObjects;

//fortify persistant listener event handlers.
["acex_fortify_objectPlaced", {
	staticsToSave pushBackUnique [(_this select 2)];
    }] call CBA_fnc_addEventHandler;
 
["acex_fortify_objectDeleted", {
	private _deletedObject = [(_this select 2)]; 
	staticsToSave = staticsToSave - _deletedObject;
    }] call CBA_fnc_addEventHandler;

[2,"Init finished",_fileName] call A3A_fnc_log;
