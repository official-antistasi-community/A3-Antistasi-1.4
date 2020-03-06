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
mapX setObjectTexture [0,"pic.jpg"];

[2,"Init finished",_fileName] call A3A_fnc_log;


//Loot to vehicle start
_action = 
["LootToVehicle", "Loot To Vehicle", "Scripts\LTV\Load.paa",
	{
		private _sorted_vic = [((position _player) nearEntities [["Car", "Motorcycle", "Tank"], 25]),
		[], { _player distance _x }, "ASCEND"] call BIS_fnc_sortBy; //sorts nearby vics from closest to farthest
		private _nearestVic = _sorted_vic select 0; //closest vic
		[_target, _player, _nearestVic] execVM "Scripts\LTV\fn_LootToVehicle.sqf"
	},//code to execute, passes ace variables _target & _player
	{
		((count (_player nearEntities ["Car", 25]) > 0) && (!alive _target))
	}, //condition to show action
	{
        private _statement = {
            params ["_target", "_player", "_vehicle"];
            [_target, _player, _vehicle] ExecVM "Scripts\LTV\fn_LootToVehicle.sqf";
        };
		        private _vehicles = (nearestObjects [_target, ace_cargo_cargoHolderTypes, 25]) select {
            (_x != _target) && {([_target, _x] call ace_interaction_fnc_getInteractionDistance) < 25}
        };
		[_vehicles, _statement, _target] call ace_interact_menu_fnc_createVehiclesActions;
    } //creates undermenu off vehicles to select from
] call ace_interact_menu_fnc_createAction;

["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass; //ads _action to AIM main menu
 //Loot to vehicle end