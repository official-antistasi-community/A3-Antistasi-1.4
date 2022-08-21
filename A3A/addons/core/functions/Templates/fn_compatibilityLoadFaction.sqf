/*

 * File: fn_compatabilityLoadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file, and transforms it into the old global variable system for sides.
 * Params:
 *    _file - Faction definition file path
 *    _side - Side to load them in as
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_file", "_side"];

Info_2("Compatibility loading template: '%1' as side %2", _file, _side);
setStartTime;

private _factionDefaultFile = ["EnemyDefaults","EnemyDefaults","RebelDefaults","CivilianDefaults"] #([west, east, independent, civilian] find _side);
_factionDefaultFile = QPATHTOFOLDER(Templates\Templates\FactionDefaults) + "\" + _factionDefaultFile + ".sqf";

private _faction = [[_factionDefaultFile,_file]] call A3A_fnc_loadFaction;
private _factionPrefix = ["occ", "inv", "reb", "civ"] #([west, east, independent, civilian] find _side);
missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction];
[_faction, _factionPrefix] call A3A_fnc_compileGroups;

private _baseUnitClass = switch (_side) do {
    case west: { "B_G_Soldier_F" };
    case east: { "O_G_Soldier_F" };
    case independent: { "I_G_Soldier_F" };
    case civilian: { "C_Man_1" };
};

private _unitClassMap = if (_side isNotEqualTo independent) then { createHashMap } else {
    createHashMapFromArray [                // Cases matter. Lower case here because allVariables on namespace returns lowercase
        ["militia_Unarmed", "I_G_Survivor_F"],
        ["militia_Rifleman", "I_G_Soldier_F"],
        ["militia_staticCrew", "I_G_Soldier_F"],
        ["militia_Medic", "I_G_medic_F"],
        ["militia_Sniper", "I_G_Sharpshooter_F"],
        ["militia_Marksman", "I_G_Soldier_M_F"],
        ["militia_LAT", "I_G_Soldier_LAT_F"],
        ["militia_MachineGunner", "I_G_Soldier_AR_F"],
        ["militia_ExplosivesExpert", "I_G_Soldier_exp_F"],
        ["militia_Grenadier", "I_G_Soldier_GL_F"],
        ["militia_SquadLeader", "I_G_Soldier_SL_F"],
        ["militia_Engineer", "I_G_engineer_F"],
        ["militia_AT", "I_Soldier_AT_F"],
        ["militia_AA", "I_Soldier_AA_F"],
        ["militia_Petros", "I_G_officer_F"]
    ]
};
//validate loadouts
private _loadoutsPrefix = format ["loadouts_%1_", _factionPrefix];
private _allDefinitions = _faction get "loadouts";

#if __A3_DEBUG__
    [_faction, _file] call A3A_fnc_TV_verifyLoadoutsData;
#endif

//Register loadouts globally.
{
    private _loadoutName = _x;
    private _unitClass = _unitClassMap getOrDefault [_loadoutName, _baseUnitClass];
    [_loadoutsPrefix + _loadoutName, _y + [_unitClass]] call A3A_fnc_registerUnitType;
} forEach _allDefinitions;

#if __A3_DEBUG__
    [_faction, _side, _file] call A3A_fnc_TV_verifyAssets;
#endif

//compile collection list of vehicles for occ and inv
if (_side in [Occupants, Invaders]) then {
    _faction set ["vehiclesLight", (_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightUnarmed")];
    _faction set ["vehiclesAttack", (_faction get "vehiclesAPCs") + (_faction get "vehiclesTanks")];
    _faction set ["vehiclesBoats", (_faction get "vehiclesGunBoats") + (_faction get "vehiclesTransportBoats")];
};

_faction;
