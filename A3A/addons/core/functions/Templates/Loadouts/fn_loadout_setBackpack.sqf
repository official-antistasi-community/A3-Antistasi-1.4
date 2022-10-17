/*
 * File: fn_loadout_setBackpack.sqf
 * Author: Spoffy
 * Description:
 *    Adds a backpack to a unit loadout
 * Params:
 *    _loadout - Loadout to add backpack to
 *    _backpack - Backpack class to add
 *    _items - Array of items to add to the backpack (optional)
 * Returns:
 *    Modified loadout array
 * Example Usage:
 *    [_loadout, "B_AssaultPack_mcamo_AT", [["30rnd_65x39_caseless_mag", 30, 3]]] call A3A_fnc_setBackpack
 *    [_loadout, "B_AssaultPack_mcamo_AT"] call A3A_fnc_setBackpack
 */

params ["_loadout", "_backpack", ["_items", []]];

_loadout set [ 5,
	[_backpack, _items]
];

_loadout