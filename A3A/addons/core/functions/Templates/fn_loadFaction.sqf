/*
  Function: A3A_fnc_loadFaction
  Loads a faction definition file.

  Author:
        - Spoffy

  Params:
        _filepaths - Single or array of faction definition filepath
        _factionPrefix - string of the faction role

  Returns:
        Namespace containing faction information

  Examples:
        - [_factionDefaultFile,_file], _factionPrefix] call A3A_fnc_loadFaction;
        - [["\x\A3A\Addons\Core\Templates\Templates\FactionDefaults\EnemyDefaults.sqf", "\x\A3A\addons\core\Templates\Templates\Vanilla\Vanilla_AI_CSAT_Arid.sqf"], "occ"] call A3A_fnc_loadFaction;

*/

#include "..\..\script_component.hpp"
params [
    ["_filepaths",[],["",[]]],
    ["_factionPrefix", "", [""]]
];
 
if (_filepaths isEqualType "") then {_filepaths = [_filepaths]};
if (count _filepaths == 0) then {Error("No filepaths provided.")};
 
/* var: _dataStore
* Hashmap of faction data
*/
private _dataStore = createHashMap;

/* var: _loadoutNamespaces
* Hashmap of all loadouts in the template.
* Keeps track of loadout namespaces so we can delete them when we're done.
*/
private _loadoutNamespaces = createHashMap;

/* var: _allLoadouts
 * Hashmap of all selected unit loadouts
 */
private _allLoadouts = createHashMap;

_dataStore set ["loadouts", _allLoadouts];

/* var: _templatesToGenerate
 * array of templates that will be generated
 */
private _templatesToGenerate = [];

/* 
  Functions: _fnc_saveToTemplate
  saves data to the faction data hashmap <_dataStore>

  Params:
        _name - [ANY] key for hashmap
        _data - [ANY] data set 
*/ 
private _fnc_saveToTemplate = {
    params ["_name", "_data"];
 
    _dataStore set [_name, _data];
};

/* 
  Functions: _fnc_getFromTemplate
  gets data to the faction data hashmap <_dataStore>

  Params:
        _name - [ANY] key for hashmap 
*/ 
private _fnc_getFromTemplate = {
    params ["_name"];
 
    _dataStore get _name;
};

/* 
  Functions: _fnc_createLoadoutData
  creates a new hashmap and sets the key to the loadout hashmap data hashmap <_loadoutNamespaces>

  Params:
        _key - [ANY] key for hashmap 
*/ 
private _fnc_createLoadoutData = {
    params ["_key"];
    private _namespace = createHashMap;
    
    // intermediate hashmap for holding the namespaces for loudout building
    _loadoutNamespaces set [_key, _namespace];
    _namespace
};

/* 
  Functions: _fnc_copyLoadoutData
  deep copys a hashmap, it is recommanded that you use createLoadoutData, then merge

  Params:
        _sourceNamespace - [NAMESPACE] hashmap to copy from
*/ 
private _fnc_copyLoadoutData = {
    params ["_sourceNamespace"];
    + _sourceNamespace //hashmaps deepcopy with +
};
 
/* 
  Functions: _fnc_saveUnitToTemplate
  saves a unit loadout to the unit loadout hashmap

  Params:
        _typeName - [ANY] key for <_allLoadouts>
        _loadouts - [ARRAY] Loadout array to set to <_allLoadouts>
        _traits - [ARRAY][optional]  unit traits for specific units, Engineers, Medic... etc
*/ 
private _fnc_saveUnitToTemplate = {
    params ["_typeName", "_loadouts", ["_traits", []]];
    private _unitDefinition = [_loadouts, _traits];
    _allLoadouts set [_typeName, _unitDefinition];
};
 
/* 
  Functions: _fnc_generateAndSaveUnitToTemplate
  generators a unit loadout by calling A3A_fnc_loadout_builder, then calls <_fnc_saveUnitToTemplate> to save loadout

  Params:
        _name - [STRING] unit named type, ie SQUADLEADER
        _template - [CODE] unit loadout generator code 
        _loadoutData - [ARRAY] loadout hashmap
        _traits - [ARRAY][optional] unit traits for specific units, Engineers, Medic... etc
*/ 
private _fnc_generateAndSaveUnitToTemplate = {
    params ["_name", "_template", "_loadoutData", ["_traits", []]];
    private _loadouts = [];
    for "_i" from 1 to 5 do {
        _loadouts pushBack ([_template, _loadoutData] call A3A_fnc_loadout_builder);
    };
    [_name, _loadouts, _traits] call _fnc_saveUnitToTemplate;
};
 
/* 
  Functions: _fnc_generateAndSaveUnitsToTemplate
  generator, makes final prefix, helps <_fnc_generateAndSaveUnitToTemplate> by breaking down components, calls <_fnc_generateAndSaveUnitToTemplate>

  Params:
        _prefix - [STRING] template prefix for certain loadout generation
        _unitTemplates - [CODE] unit loadout generator code 
        _loadoutData - [ARRAY] template faction gear hashmap
*/ 
private _fnc_generateAndSaveUnitsToTemplate = {
    params ["_prefix", "_unitTemplates", "_loadoutData"];
    {
        _x params ["_name", "_template", ["_traits", []]];
        private _finalName = format ["%1_%2", _prefix, _name];
        [_finalName, _template, _loadoutData, _traits] call _fnc_generateAndSaveUnitToTemplate;
    } forEach _unitTemplates;
};



// these private functions are empty for reassignment later depending on what faction was passed
// ie occ, reb, civ

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

// all the unit defines that are default
#include "functionTemplates.sqf"

{
    call compile preprocessFileLineNumbers _x;
} forEach _filepaths;
 
{   //prefix, unitType, loadoutdata
    [_x#0, _x#1, (_loadoutNamespaces get _x#2)] call _fnc_generateAndSaveUnitsToTemplate;
} forEach _templatesToGenerate;

_dataStore
 