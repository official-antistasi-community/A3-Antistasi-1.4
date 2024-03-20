/*
Author: Håkon
Description:
    Adds the contents of an addon pack to the specified faction

Arguments:
0. <side> Side of the faction to recive the addon pack
1. <String> Path to the addon pack

Return Value: <Hashmap> Faction hashmap

Scope: Server
Environment: unscheduled
Public: Yes
Dependencies:

Example: [civilian, "Templates\AddonVics\rds_Civ.sqf"] call A3A_fnc_loadAddon;

License: MIT License
*/
#include "..\..\script_component.hpp"
params [["_side","",[""]], ["_path","",[""]]];
_side = toLower _side;
if !(fileExists _path) exitWith {
    Error_2("File missing! - Side: %1 File: %2", _side, _path);
};
if !(_side in ["occ", "inv", "reb", "civ"]) exitWith {
    Error_2("Invalid side of addon - Side: %1 File: %2", _side, _path);
};

//get the addon data
private _addon = createHashMap;
call compile preprocessFileLineNumbers _path;

//add the addon data to the faction data
private _faction = missionNamespace getVariable ["A3A_faction_"+_side, createHashMap];
{
    _faction set [_x, (_faction get _x) + _y];
} forEach _addon;

//update the faction data globaly
_faction
