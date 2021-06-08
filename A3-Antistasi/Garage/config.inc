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

    License: Håkon Rydland Garage SHARED SOURCE LICENSE
*/
HR_GRG_Prefix = "Antistasi";
//Overwrite client
HR_GRG_cmdClient = {
    if ((isServer && hasInterface) || {admin owner _this > 0}) then {_this} else {theBoss}; //LAN Host or admin on DS or commander
};

//condition to automatically close garage/placement as if canceled
HR_GRG_CP_closeCnd = {
    (!([player] call A3A_fnc_canFight))
    || {(!isNull HR_GRG_accessPoint)
        && {player distance HR_GRG_accessPoint > 25}
    }
};

HR_GRG_Cnd_canAccessAir = {
    count (airportsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (HR_GRG_accessPoint inArea _x)}) > 0
};

//Lock on garaged vehicles ( Values: [{""}, { getPlayerUID player }] )
HR_GRG_dLock = {""};

//garage pool cap
if (isNil "HR_GRG_PoolBase") then { HR_GRG_PoolBase = 10 }; //can be overwritten by CBA settings
if (isNil "HR_GRG_PoolIncr") then { HR_GRG_PoolIncr = 2 }; //can be overwritten by CBA settings
HR_GRG_VehCap = { HR_GRG_PoolBase + warTier * HR_GRG_PoolIncr };

//Pylon config
if (isNil "HR_GRG_Pylons_Enabled") then { HR_GRG_Pylons_Enabled = true }; //can be overwritten by CBA settings

//camo blacklist (display name, case sensitive)
HR_GRG_blackListCamo = ["IDAP"];

//proxies
HR_GRG_fnc_Log = { [2,_this, "HR Garage"] call A3A_fnc_log }; //log text passed as _this
HR_GRG_fnc_Hint = { ["Garage",_this#0] call A3A_fnc_customHint };
HR_GRG_fnc_vehInit = { [_this, TeamPlayer] call A3A_fnc_AIVEHinit; }; //is passed vehicle as _this
HR_GRG_onOpenEvent = { player setCaptive false; };

//CBA settings
if (isClass (configfile >> "CBA_Extended_EventHandlers")) then {

    ["HR_GRG_dLock", "CHECKBOX", ["Lock on garage", "Lock vehicles when garaged"], [HR_GRG_Prefix,"Garage"], (HR_GRG_dLock isEqualTo {getPlayerUID player}), false, {
        HR_GRG_dLock = [{""}, { getPlayerUID player }] select _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_Pylons_Enabled", "CHECKBOX", ["Allow pylon editing", "Allows player to configure pylons in the garage"], [HR_GRG_Prefix,"Garage"], true, true, {
        HR_GRG_Pylons_Enabled = _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_PoolBase", "SLIDER", ["Base Capacity", "Garage base capacity"], [HR_GRG_Prefix,"Garage"], [0, 50, HR_GRG_PoolBase, 0], true, {
        HR_GRG_PoolBase = round _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_PoolIncr", "SLIDER", ["Capacity increase", "Capacity increase per war level"], [HR_GRG_Prefix,"Garage"], [0, 10, HR_GRG_PoolIncr, 0], true, {
        HR_GRG_PoolIncr = round _this;
    }] call CBA_fnc_addSetting;

};
