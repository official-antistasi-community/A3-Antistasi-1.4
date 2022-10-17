/*
 * File: fn_loadout_itemLoad.sqf
 * Author: Spoffy
 * Description:
 *    Calculates the load for item from one of the uniform/vest/backpack content arrays.
 * Params:
 *    _item
 * Returns:
 *    Total load (or 0)
 * Example Usage:
 *    Example usage goes here
 */

params ["_item"];

//First, we need to figure out what we're dealing with.
//We do this by looking at size of the array.
// 2 - Item
// 3 - Magazine
// 7 - Weapon

if (_item isEqualType "") exitWith {
	(_item call A3A_fnc_itemConfig) call A3A_fnc_itemConfigMass
};

if (count _item == 2 || count _item == 3) exitWith {
	private _class = _item select 0;
	if (_class isEqualTo "") exitWith { 0 };
	((_class call A3A_fnc_itemConfig) call A3A_fnc_itemConfigMass) * (_item select 1)
};

if (count _item == 7) exitWith {
	private _items = [_item select 0, _item select 1, _item select 2, _item select 3, _item select 6];
	if (count (_item select 4) > 0) then {
		_items pushBack (_item select 4 select 0);
	};

	if (count (_item select 5) > 0) then {
		_items pushBack (_item select 5 select 0);
	};

	private _totalLoad = 0;
	{
		_totalLoad = _totalLoad + ((_x call A3A_fnc_itemConfig) call A3A_fnc_itemConfigMass);
	} forEach _items;

	_totalLoad
};

0