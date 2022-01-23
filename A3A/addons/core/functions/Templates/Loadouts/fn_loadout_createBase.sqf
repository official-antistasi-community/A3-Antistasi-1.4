/*
 * File: fn_loadout_createBase
 * Author: Spoffy
 * Description:
 *    Creates a loadout array, optionally with a uniform.
 * Params:
 *    _uniform - Class of uniform to add
 * Returns:
 *    Loadout array as used by setUnitLoadout
 * Example Usage:
 *    private _loadout = ["my_uniform_class"] call A3A_fnc_loadout_createBase
 */

params [["_uniform", ""]];

[[],[],[],[_uniform, []],[],[],"","",[],["","","","","",""]]