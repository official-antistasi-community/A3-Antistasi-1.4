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
["LootToVehicle",
 "Loot To Vehicle",
 "",
 {[_target] execVM "fn_LootToVehicle.sqf"},
 // {true}
 {((count (player nearEntities ["Car", 25]) > 0) && (!alive _target))} 
 ] call ace_interact_menu_fnc_createAction;

["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */
 //Loot to vehicle end
