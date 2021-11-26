/*
    Author: John Jordan
    Description:
        Initializes user-modifiable global vars from saved game, config (role-screen) parameters and defaults

    Arguments: None
    Return Value: None
    Scope: Server
    Environment: Init
    Dependencies: Save game (if any) must have been selected
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

Info("Initializing global params");

// A3A_paramTable format: ["globalvar", "paramname", [options], default]
// globalvar is the name of the saved parameter as well as the global variable
// paramname is the name of the config parameter. Empty will be treated as non-existent
// options is array of strings:
// - "server" means that the var won't be broadcast to clients & HCs
// - "override" means that the var's value will be overwritten by the default even if it already exists
// - "oldsave" means that the var was saved separately with the same name in older versions
// default can be either a number or bool. If bool, values from config params will be converted
// params.hpp should be updated to match this table

A3A_paramTable = [
    ["gameMode", "gameMode", ["locked", "oldsave"], 1],
    ["autoSave", "autoSave", [], true],
    ["autoSaveInterval", "autoSaveInterval", [], 3600],
    ["distanceMission", "mRadius", [], 4000],
    ["skillMult", "AISkill", [], 2],
    ["civTraffic", "civTraffic", [], 2],
    ["limitedFT", "allowFT", [], true],									// backwards naming...
    ["napalmEnabled", "napalmEnabled", [], false],
    ["playerMarkersEnabled", "pMarkers", [], true],
    ["allowUnfairSupports", "allowUnfairSupports", [], false],
    ["allowFuturisticSupports", "allowFuturisticSupports", [], false],

    ["allowDLCKart", "Kart", ["server"], false],
    ["allowDLCMark", "Mark", ["server"], false],
    ["allowDLCHeli", "Heli", ["server"], false],
    ["allowDLCExpansion", "Expansion", ["server"], false],
    ["allowDLCJets", "Jets", ["server"], false],
    ["allowDLCOrange", "Orange", ["server"], false],
    ["allowDLCTanks", "Tanks", ["server"], false],
    ["allowDLCGlobMob", "GlobMob", ["server"], false],
    ["allowDLCEnoch", "Enoch", ["server"], false],
    ["allowDLCAoW", "AoW", ["server"], false],
    ["allowDLCVN", "VN", [], false],

    ["membershipEnabled", "membership", [], true],
    ["switchCom", "switchComm", ["server"], true],						// dead param
    ["tkpunish", "tkPunish", [], true],
    ["memberDistance", "memberDistance", [], 5000],
    ["memberSlots", "memberSlots", ["server"], 20],

    ["startWithLongRangeRadio", "startWithLongRangeRadio", [], true],
    ["helmetLossChance", "helmetLossChance", [], 33],
    ["minWeaps", "unlockItem", [], 25],
    ["memberOnlyMagLimit", "memberOnlyMagLimit", [], 40],				// dead param
    ["unlockedUnlimitedAmmo", "unlockedUnlimitedAmmo", [], 0],			// these three are not bool for some reason
    ["allowUnlockedExplosives", "allowUnlockedExplosives", [], 0],
    ["allowGuidedLaunchers", "allowGuidedLaunchers", [], 0],
    ["LootToCrateEnabled", "EnableLootToCrate", [], true],
    ["LTCLootUnlocked", "LTCLootUnlocked", [], false],

    ["logLevel", "LogLevel", ["override"], 3],

    ["bobChaosCrates", "truelyRandomCrates", [], false],
    ["cratePlayerScaling", "cratePlayerScaling", [], true],

    ["crateWepTypeMax", "crateWepTypeMax", [], 9],
    ["crateWepNumMax", "crateWepNumMax", [], 8],
    ["crateItemTypeMax", "crateItemTypeMax", [], 4],
    ["crateItemNumMax", "crateItemNumMax", [], 5],
    ["crateAmmoTypeMax", "crateAmmoTypeMax", [], 6],
    ["crateAmmoNumMax", "crateAmmoNumMax", [], 20],
    ["crateExplosiveTypeMax", "crateExplosiveTypeMax", [], 2],
    ["crateExplosiveNumMax", "crateExplosiveNumMax", [], 5],
    ["crateAttachmentTypeMax", "crateAttachmentTypeMax", [], 6],
    ["crateAttachmentNumMax", "crateAttachmentNumMax", [], 15],
    ["crateBackpackTypeMax", "crateBackpackTypeMax", [], 0],
    ["crateBackpackNumMax", "crateBackpackNumMax", [], 3],
    ["crateVestTypeMax", "crateVestTypeMax", [], 0],
    ["crateVestNumMax", "crateVestNumMax", [], 0],
    ["crateHelmetTypeMax", "crateHelmetTypeMax", [], 0],
    ["crateHelmetNumMax", "crateHelmetNumMax", [], 0],
    ["crateDeviceTypeMax", "crateDeviceTypeMax", [], 2],
    ["crateDeviceNumMax", "crateDeviceNumMax", [], 3],

    // Not visible parameters yet, but otherwise handled the same way
    ["distanceSPWN", "", ["oldsave"], 1000],
    ["civPerc", "", ["oldsave"], 5],
    ["maxUnits", "", ["oldsave"], 140],
    ["minPlayersRequiredForPVP", "", [], 2]

    // beware of the comma
];

Debug("Setting default params");

// Set all parameters to their defaults if not already set (SP may set them from dialogs)
{
    _x params ["_varName", "_paramName", "_options", "_default"];
    if (isNil {missionNamespace getVariable _varName} || "override" in _options) then {
         missionNamespace setVariable [_varName, _default];
    };
} forEach A3A_paramTable;

Debug("Loading params from saved game");

// Load parameter values from saved game
if (loadLastSave) then
{
    // Attempt to read the new saved params array
    private _savedParams = ["params"] call A3A_fnc_returnSavedStat;
    if (isNil "_savedParams") exitWith
    {
        Info("No params array found in saved game, treating as legacy save");

        // Special case for legacy difficultyX + SP, ugh
        private _difficultyX = ["difficultyX"] call A3A_fnc_returnSavedStat;
        if (!isMultiplayer && !(isNil "_difficultyX")) then {
            skillMult = _difficultyX;
            if (skillMult == 1) then {minWeaps = 15};
            if (skillMult == 3) then {minWeaps = 40};
        };

        // Load the other legacy saved params
        {
            _x params ["_varName", "_paramName", "_options", "_default"];
            if ("oldsave" in _options) then {
                private _val = [_varName] call A3A_fnc_returnSavedStat;
                if !(isNil "_val") then { missionNamespace setVariable [_varName, _val] };
            };
        } forEach A3A_paramTable;
    };

    // Saved params array should have elements ["varname", value]
    {
        _x params ["_savedName", "_savedValue"];
        private _idx = A3A_paramTable findIf { _x#0 == _savedName };
        if (_idx == -1) then {
            Error_1("Unknown parameter %1 found in saved game", _savedName);
        } else {
            if !(_savedValue isEqualType A3A_paramTable#_idx#3) exitWith {
                Error_1("Bad parameter type for %1 in saved game", _savedName);
            };
            missionNamespace setVariable [_savedName, _savedValue];
        };
    } forEach _savedParams;
};

Debug("Setting overrides from role-screen params");

// Set non-default values from role-screen parameters
if (isMultiplayer) then {
    {
        _x params ["_varName", "_paramName", "_options", "_default"];
        call {
            if (_paramName isEqualTo "") exitWith {};			// internal-only param

            // disabled for backwards compatibility
            //if (loadLastSave && ("locked" in _options)) exitWith {};

            private _val = [_paramName, 9998] call BIS_fnc_getParamValue;
            if (_val == 9998) exitWith {
                Error_1("Param %1 not found", _paramName);
            };
            if (_val == 9999) exitWith {};			// "Default (xxx)" option, do nothing here

            // conversion to bool
            if (_default isEqualType true) then { _val = _val isEqualTo 1 };
            missionNamespace setVariable [_varName, _val];
        };
        if !("server" in _options)	then { publicVariable _varName };
    } forEach A3A_paramTable;
};

Info("Param setup completed");

initParamsDone = true; publicVariable "initParamsDone";

// debug output
{
    Debug_2("Param %1 %2", _x#0, missionNamespace getVariable _x#0);
} forEach A3A_paramTable;
