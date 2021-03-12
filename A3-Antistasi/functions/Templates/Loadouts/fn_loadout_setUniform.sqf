/*
 * File: fn_loadout_setUniform.sqf
 * Author: Spoffy
 * Description:
 *    Adds a vest to a unit loadout
 * Params:
 *    _loadout - Loadout to add vest to
 *    _uniform - Uniform class to add
 *    _items - Array of items to add to the uniform (optional)
 * Returns:
 *    Modified loadout array
 * Example Usage:
 *    [_loadout, "V_PlateCarrierGL_rgr", [["30rnd_65x39_caseless_mag", 30, 3]]] call A3A_fnc_setUniform
 *    [_loadout, "V_PlateCarrierGL_rgr"] call A3A_fnc_setUniform
 */

params ["_loadout", "_uniform", ["_items", []]];

_loadout set [ 3,
	[_uniform, _items]
];

_loadout