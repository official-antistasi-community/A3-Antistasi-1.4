/*
Function:
    A3A_fnc_getItemListFromDLC

Description:
    Returns an Array of Array with Items and what it is autodetected as.

Scope:
    <ANY>

Environment:
    <ANY>

Returns:
    <Array<Array<String,<Array<Strings>>>> 

Examples:
    "GM" call A3A_fnc_getItemListFromDLC;

Author: martin
*/
params["_mod"];

private _items = [];

{
	private _cfg = _x;
	private _itemList = ( 
			("true" configClasses ( configFile >>  _cfg )) select {
				private _name = configName _x;
				private _modOfItem = [configFile >> _cfg >> _name] call A3A_fnc_getModOfConfigClass;
				_modOfItem == _mod
			}
		) apply { 
			private _CfgName = configName _x;
			[_CfgName, _CfgName call A3A_fnc_equipmentClassToCategories]
		}; 
	_items append _itemList;
} forEach ["CfgWeapons", "CfgGlasses", "CfgMagazines"];

_items