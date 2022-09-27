/*
  Function: A3A_fnc_loadFaction
  Loads a faction definition file.
  Author:
        - Spoffy
  Params:
        _filepaths - Single or array of faction definition filepath
  Returns:
        Namespace containing faction information
  Examples:
        - [_factionDefaultFile,_file] call A3A_fnc_loadFaction;
        - ["\x\A3A\Addons\Core\Templates\Templates\FactionDefaults\EnemyDefaults.sqf", "\x\A3A\addons\core\Templates\Templates\Vanilla\Vanilla_AI_CSAT_Arid.sqf"] call A3A_fnc_loadFaction;
*/

#include "..\..\script_component.hpp"
params [
    ["_filepaths",[],["",[]]]
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


{
    call compile preprocessFileLineNumbers _x;
} forEach _filepaths;

// we want to help with 3rd party mods
["factionTemplateLoaded", [_loadoutNamespaces, _dataStore]] call A3A_Events_fnc_triggerEvent;


_dataStore

