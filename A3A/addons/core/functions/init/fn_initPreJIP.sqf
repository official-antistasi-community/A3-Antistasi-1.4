/*
Maintainer: Caleb Serafin
    First code run upon machine joining/starting the mission.
    This is run before Join-In-Progress.
    Mission objects have not initialised.
    Player object is not available.
    https://community.bistudio.com/wiki/Initialization_Order

    This file is best suited for calling initialisers for variables and lookup tables.
    This file ensures that a dependency order can be maintained.
    Do not vomit your initialiser code in here, place it in the relevant folder for your module and call it.
    Code is allowed to take a while to execute (multiple milliseconds).
    Because if it started later in scheduled init code, the player would still need to wait, and for much longer.

Scope: All
Environment: Unscheduled
Public: Yes
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug("fn_initPreJIP Started");

//******************* Mismatched mod/mission check code **************************

private _fnc_warningMessage = {
    if (!hasInterface) exitWith {};
    params ["_title", "_message"];
    waituntil {!isNull (findDisplay 46)};
    9000 cutText [format ["<t size='5'>%1</t><br/><t size='2'>%2</t>", _title, _message], "BLACK", nil, nil, true];
    uiSleep 20;
    {_x cutFadeOut 20} forEach allActiveTitleEffects;
};

// If CfgFunctions/A3A exists in mission config then it's a pre-mod Antistasi mission and will clash
if (isClass (missionConfigFile/"CfgFunctions"/"A3A")) exitWith {
    Error("Non-mod Antistasi mission detected");
    [localize "STR_A3A_missioncheck_nonmodmission_title", localize "STR_A3A_missioncheck_nonmodmission"] spawn _fnc_warningMessage;
};

// (Probably) not an Antistasi mission, don't install anything
if (!isClass (missionConfigFile/"A3A")) exitWith {
    Info("Probable non-Antistasi mission detected, ignoring");
};

// Check that the mission version is compatible with the mod version
getArray (missionConfigFile/"A3A"/"version") params [["_major", 0, [0]], ["_minor", 0, [0]], ["_patchLvl", 0, [0]]];
[MINIMUM_MISSION_VERSION_AR] params [["_reqMajor", 0], ["_reqMinor", 0], ["_reqPatchLvl", 0]];

if (_reqMajor > _major || (_reqMajor == _major && (_reqMinor > _minor || (_reqMinor == _minor && _reqPatchLvl > _patchLvl)))) then {
    Error("This mission is outdated and could lack important map details that may break your game, inform your mission maker or update the extension to the latest version.");
    [localize "STR_A3A_missioncheck_oldmission_title", localize "STR_A3A_missioncheck_oldmission"] spawn _fnc_warningMessage;
};

//************************* Init goes here ***************************************

call A3A_fnc_uintToHexGenTables;
call A3A_fnc_shortID_init;

Debug("fn_initPreJIP Finished");
