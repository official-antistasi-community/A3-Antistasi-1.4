/*
    Author: [Håkon]
    [Description]
        This is the config file for the garage, everything that is meant to be adjustable can be changed here.

    Arguments:

    Return Value:

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example:

    License: MIT License
*/
HR_GRG_Prefix = "Red Rebelion";
//Overwrite client
if (isNil "HR_GRG_cmdClient") then { HR_GRG_cmdClient = { objNull } };

//condition to automatically close garage/placement as if canceled
if (isNil "HR_GRG_CP_closeCnd") then { HR_GRG_CP_closeCnd = {
    (!alive player)
} }; publicVariable "HR_GRG_CP_closeCnd";

//Lock on garaged vehicles ( Values: [{""}, { getPlayerUID player }] )
if (isNil "HR_GRG_dLock") then { HR_GRG_dLock = {""} }; publicVariable "HR_GRG_dLock";

//garage pool cap
if (isNil "warTier") then {warTier = 1; publicVariable "warTier"};//debug due to lack of warTier
if (isNil "HR_GRG_PoolBase") then { HR_GRG_PoolBase = 10 }; publicVariable "HR_GRG_PoolBase";
if (isNil "HR_GRG_PoolIncr") then { HR_GRG_PoolIncr = 2 }; publicVariable "HR_GRG_PoolIncr";
if (isNil "HR_GRG_VehCap") then { HR_GRG_VehCap = { HR_GRG_PoolBase + warTier * HR_GRG_PoolIncr } }; publicVariable "HR_GRG_VehCap";

//Pylon config
if (isNil "HR_GRG_Pylons_Enabled") then { HR_GRG_Pylons_Enabled = true }; publicVariable "HR_GRG_Pylons_Enabled";
if (isNil "HR_GRG_Pylons_requireSource") then { HR_GRG_Pylons_requireSource = true }; publicVariable "HR_GRG_Pylons_requireSource";

//camo blacklist (display name, case sensitive)
HR_GRG_blackListCamo = ["IDAP"]; publicVariable "HR_GRG_blackListCamo";

//CBA settings
if (isClass (configfile >> "CBA_Extended_EventHandlers")) then {

    ["HR_GRG_dLock", "CHECKBOX", ["Lock on garage", "Lock vehicles when garaged"], ["Red Rebelion","Garage"], (HR_GRG_dLock isEqualTo {getPlayerUID player}), false, {
        HR_GRG_dLock = [{""}, { getPlayerUID player }] select _this;
    }] remoteExecCall ["CBA_fnc_addSetting",0,true];

    ["HR_GRG_Pylons_Enabled", "CHECKBOX", ["Allow pylon editing", "Allows player to configure pylons in the garage"], ["Red Rebelion","Garage"], true, true, {
        HR_GRG_Pylons_Enabled = _this;
    }] remoteExecCall ["CBA_fnc_addSetting",0,true];

    ["HR_GRG_Pylons_requireSource", "CHECKBOX", ["Pylon require ammo source", "Require an ammo source in garage to allow pylon editing"], ["Red Rebelion","Garage"], true, true, {
        HR_GRG_Pylons_requireSource = _this;
    }] remoteExecCall ["CBA_fnc_addSetting",0,true];

    ["HR_GRG_PoolBase", "SLIDER", ["Base Capacity", "Garage base capacity"], ["Red Rebelion","Garage"], [0, 50, HR_GRG_PoolBase, 0], true, {
        HR_GRG_PoolBase = round _this;
        HR_GRG_VehCap = { HR_GRG_PoolBase + warTier * HR_GRG_PoolIncr };
    }] remoteExecCall ["CBA_fnc_addSetting",0,true];

    ["HR_GRG_PoolIncr", "SLIDER", ["Capacity increase", "Capacity increase per war level"], ["Red Rebelion","Garage"], [0, 10, HR_GRG_PoolIncr, 0], true, {
        HR_GRG_PoolIncr = round _this;
        HR_GRG_VehCap = { HR_GRG_PoolBase + warTier * HR_GRG_PoolIncr };
    }] remoteExecCall ["CBA_fnc_addSetting",0,true];

};
