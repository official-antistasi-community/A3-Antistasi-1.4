/*
 * File: fn_loadout_setVest.sqf
 * Author: Spoffy
 * Description:
 *    Adds a vest to a unit loadout
 * Params:
 *    _loadout - Loadout to add vest to
 *    _vest - Vest class to add
 *    _items - Array of items to add to the vest (optional)
 * Returns:
 *    Modified loadout array
 * Example Usage:
 *    [_loadout, "V_PlateCarrierGL_rgr", [["30rnd_65x39_caseless_mag", 30, 3]]] call A3A_fnc_setVest
 *    [_loadout, "V_PlateCarrierGL_rgr"] call A3A_fnc_setVest
 */

params ["_loadout", "_vest", ["_items", []]];

_loadout set [ 4,
	[_vest, _items]
];

_loadout