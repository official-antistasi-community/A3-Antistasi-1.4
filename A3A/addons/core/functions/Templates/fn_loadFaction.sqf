/*
* File: fn_loadFaction.sqf
* Author: Spoffy
* Description:
*    Loads a faction definition file
* Params:
*    _filepaths - Single or array of faction definition filepath
* Returns:
*    Namespace containing faction information
* Example Usage:
*/

#include "..\..\script_component.hpp"
A3A_staticCounter = 0;
A3A_staticArray = [];
params [
    ["_filepaths",[],["",[]]],
    ["_factionPrefix", "", [""]]
];
 
if (_filepaths isEqualType "") then {_filepaths = [_filepaths]};
if (count _filepaths == 0) then {Error("No filepaths provided.")};
 
private _dataStore = createHashMap;
 
private _fnc_saveToTemplate = {
    params ["_name", "_data"];
 
    _dataStore set [_name, _data];
};
 
private _fnc_getFromTemplate = {
    params ["_name"];
 
    _dataStore get _name;
};
 
 //Keep track of loadout namespaces so we can delete them when we're done.
private _loadoutNamespaces = createHashMap;
private _fnc_createLoadoutData = {
    params ["_key"];
    private _namespace = createHashMap;
    _loadoutNamespaces set [_key, _namespace];
    _namespace
};
 
private _fnc_copyLoadoutData = {
    params ["_sourceNamespace"];
    + _sourceNamespace //hashmaps deepcopy with +
};
 
private _allLoadouts = createHashMap;
_dataStore set ["loadouts", _allLoadouts];
 
private _fnc_saveUnitToTemplate = {
    params ["_typeName", "_loadouts", ["_traits", []]];
    private _unitDefinition = [_loadouts, _traits];
    _allLoadouts set [_typeName, _unitDefinition];
};
 
private _fnc_generateAndSaveUnitToTemplate = {
    params ["_name", "_template", "_loadoutData", ["_traits", []]];
    private _loadouts = [];
    for "_i" from 1 to 5 do {
        _loadouts pushBack ([_template, _loadoutData] call A3A_fnc_loadout_builder);
    };
    [_name, _loadouts, _traits] call _fnc_saveUnitToTemplate;
};
 
private _fnc_generateAndSaveUnitsToTemplate = {
    params ["_prefix", "_unitTemplates", "_loadoutData"];
    {
        A3A_staticArray pushback [_prefix, _unitTemplates, _loadoutData];
        _x params ["_name", "_template", ["_traits", []]];
        private _finalName = format ["%1_%2", _prefix, _name];
        [_finalName, _template, _loadoutData, _traits] call _fnc_generateAndSaveUnitToTemplate;
    } forEach _unitTemplates;
};


private _manTemplate = {};
private _workerTemplate = {};
private _pressTemplate = {};
 
private _traitorTemplate = {};
private _unarmedTemplate = {};
private _crewTemplate = {};
private _policeTemplate = {};
private _sniperTemplate = {};
private _marksmanTemplate = {};
private _machineGunnerTemplate = {};
private _aaTemplate = {};
private _atTemplate = {};
private _latTemplate = {};
private _engineerTemplate = {};
private _explosivesExpertTemplate = {};
private _grenadierTemplate = {};
private _medicTemplate = {};
private _riflemanTemplate = {};
private _squadLeaderTemplate = {};
 
private _templatesToGenerate = [];
 
/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

_squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
 
    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};
 
_riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
 
 
    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
 
    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
 
    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;
 
    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
 
    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
 
    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};
 
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
 
    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
 
    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};
 
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
 
    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
 
    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
 
    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
 
    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};
 
_marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
 
 
    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};
 
_sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
 
    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};
 
_policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
 
 
    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};
 
_crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
 
    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
 
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
 
    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};
 
_unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
 
    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
 
    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};
 
_traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};
 
 ////////////////////////////////////////////////////////////////////////////////////////
 //  You shouldn't touch below this line unless you really really know what you're doing.
 //  Things below here can and will break the gamemode if improperly changed.
 ////////////////////////////////////////////////////////////////////////////////////////
if (_factionPrefix in ["occ", "inv"] ) then 
{
 
    /////////////////////////////
    //  Special Forces Units   //
    /////////////////////////////
    private _prefix = "SF";
    private _unitTypes = [
        ["SquadLeader", _squadLeaderTemplate],
        ["Rifleman", _riflemanTemplate],
        ["Medic", _medicTemplate, [["medic", true]]],
        ["Engineer", _engineerTemplate, [["engineer", true]]],
        ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
        ["Grenadier", _grenadierTemplate],
        ["LAT", _latTemplate],
        ["AT", _atTemplate],
        ["AA", _aaTemplate],
        ["MachineGunner", _machineGunnerTemplate],
        ["Marksman", _marksmanTemplate],
        ["Sniper", _sniperTemplate]
    ];
 
    _templatesToGenerate pushBack [_prefix, _unitTypes, "sfLoadoutData"];
 
 
    ///////////////////////
    //  Military Units   //
    ///////////////////////
    private _prefix = "military";
    private _unitTypes = [
        ["SquadLeader", _squadLeaderTemplate],
        ["Rifleman", _riflemanTemplate],
        ["Medic", _medicTemplate, [["medic", true]]],
        ["Engineer", _engineerTemplate, [["engineer", true]]],
        ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
        ["Grenadier", _grenadierTemplate],
        ["LAT", _latTemplate],
        ["AT", _atTemplate],
        ["AA", _aaTemplate],
        ["MachineGunner", _machineGunnerTemplate],
        ["Marksman", _marksmanTemplate],
        ["Sniper", _sniperTemplate]
    ];
 
    _templatesToGenerate pushBack [_prefix, _unitTypes, "militaryLoadoutData"];
 
    ////////////////////////
    //    Police Units    //
    ////////////////////////
    private _prefix = "police";
    private _unitTypes = [
        ["SquadLeader", _policeTemplate],
        ["Standard", _policeTemplate]
    ];
 
    _templatesToGenerate pushBack [_prefix, _unitTypes, "policeLoadoutData"];
 
    ////////////////////////
    //    Militia Units    //
    ////////////////////////
    private _prefix = "militia";
    private _unitTypes = [
        ["SquadLeader", _squadLeaderTemplate],
        ["Rifleman", _riflemanTemplate],
        ["Medic", _medicTemplate, [["medic", true]]],
        ["Engineer", _engineerTemplate, [["engineer", true]]],
        ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
        ["Grenadier", _grenadierTemplate],
        ["LAT", _latTemplate],
        ["AT", _atTemplate],
        ["AA", _aaTemplate],
        ["MachineGunner", _machineGunnerTemplate],
        ["Marksman", _marksmanTemplate],
        ["Sniper", _sniperTemplate]
    ];
 
    _templatesToGenerate pushBack [_prefix, _unitTypes, "militiaLoadoutData"];
 
    //////////////////////
    //    Misc Units    //
    //////////////////////
 
    //The following lines are determining the loadout of vehicle crew
    _templatesToGenerate pushBack ["other", [["Crew", _crewTemplate]], "crewLoadoutData"];
    //The following lines are determining the loadout of the pilots
    _templatesToGenerate pushBack ["other", [["Pilot", _crewTemplate]], "pilotLoadoutData"];
    //The following lines are determining the loadout for the unit used in the "kill the official" mission
    _templatesToGenerate pushBack ["other", [["Official", _SquadLeaderTemplate]], "militaryLoadoutData"];
    //The following lines are determining the loadout for the AI used in the "kill the traitor" mission
    _templatesToGenerate pushBack ["other", [["Traitor", _traitorTemplate]], "militaryLoadoutData"];
    //The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
    _templatesToGenerate pushBack ["other", [["Unarmed", _UnarmedTemplate]], "militaryLoadoutData"];
};
 
if (_factionPrefix isEqualTo "reb") then 
{
    _squadLeaderTemplate = {
        ["uniforms"] call _fnc_setUniform;
    
        ["maps"] call _fnc_addMap;
        ["watches"] call _fnc_addWatch;
        ["compasses"] call _fnc_addCompass;
        ["binoculars"] call _fnc_addBinoculars;
    };
    
    _riflemanTemplate = {
        ["uniforms"] call _fnc_setUniform;
    
        ["maps"] call _fnc_addMap;
        ["watches"] call _fnc_addWatch;
        ["compasses"] call _fnc_addCompass;
    };
    
    private _prefix = "militia";
    private _unitTypes = [
        ["Petros", _squadLeaderTemplate],
        ["SquadLeader", _squadLeaderTemplate],
        ["Rifleman", _riflemanTemplate],
        ["staticCrew", _riflemanTemplate],
        ["Medic", _riflemanTemplate, [["medic", true]]],
        ["Engineer", _riflemanTemplate, [["engineer", true]]],
        ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
        ["Grenadier", _riflemanTemplate],
        ["LAT", _riflemanTemplate],
        ["AT", _riflemanTemplate],
        ["AA", _riflemanTemplate],
        ["MachineGunner", _riflemanTemplate],
        ["Marksman", _riflemanTemplate],
        ["Sniper", _riflemanTemplate],
        ["Unarmed", _riflemanTemplate]
    ];
    
    _templatesToGenerate pushBack [_prefix, _unitTypes, "loadoutData"];
};
 
if (_factionPrefix isEqualTo "civ") then 
{
    _manTemplate = {
        ["helmets"] call _fnc_setHelmet;
        ["uniforms"] call _fnc_setUniform;
    
        ["items_medical_standard"] call _fnc_addItemSet;
    
        ["maps"] call _fnc_addMap;
        ["watches"] call _fnc_addWatch;
        ["compasses"] call _fnc_addCompass;
    };
    _workerTemplate = {
        ["helmets"] call _fnc_setHelmet;
        ["workerUniforms"] call _fnc_setUniform;
    
        ["items_medical_standard"] call _fnc_addItemSet;
    
        ["maps"] call _fnc_addMap;
        ["watches"] call _fnc_addWatch;
        ["compasses"] call _fnc_addCompass;
    };
    _pressTemplate = {
        ["pressHelmets"] call _fnc_setHelmet;
        ["pressVests"] call _fnc_setVest;
        ["pressUniforms"] call _fnc_setUniform;
    
        ["items_medical_standard"] call _fnc_addItemSet;
    
        ["maps"] call _fnc_addMap;
        ["watches"] call _fnc_addWatch;
        ["compasses"] call _fnc_addCompass;
    };
    private _prefix = "militia";
    private _unitTypes = [
        ["Press", _pressTemplate],
        ["Worker", _workerTemplate],
        ["Man", _manTemplate]
    ];
    
    _templatesToGenerate pushBack [_prefix, _unitTypes, "loadoutData"];
};
 
 
{
    call compile preprocessFileLineNumbers _x;
} forEach _filepaths;
 
copyToClipboard str _loadoutNamespaces;

{   //prefix, unitType, loadoutdata
    [_x#0, _x#1, (_loadoutNamespaces get _x#2)] call _fnc_generateAndSaveUnitsToTemplate;
} forEach _templatesToGenerate;

_dataStore
 