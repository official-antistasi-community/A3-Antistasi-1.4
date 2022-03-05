/*
 * File: fn_loadout_addEquipment.sqf
 * Author: Spoffy
 * Description:
 *    Adds equipment to the loadout, using either defaults or specifically chosen items for each slot.
 * Params:
 *    _loadout - Loadout to modify
 *    _equipment - Array of equipment, where each entry is either a type string ("RADIO") or array with a type and class ["RADIO", "ItemRadio"]
 * Returns:
 *    Modified loadout
 * Example Usage:
 *    [_loadout, ["RADIO", "GPS", "Map", "WATCH", ["Compass", "ItemCompass"], "NVG"]] call A3A_fnc_loadout_addEquipment
 */

params ["_loadout", "_equipment"];

{
	private _type = "";
	private _specificClass = "";

	//If we've been given an array, use the specific class given to us, else use the default.
	if (_x isEqualType []) then {
		_type = _x select 0;
		_specificClass = _x select 1;
	} else {
		_type = _x;
	};

	switch (toUpper _type) do {
		case "GPS": {
			private _gps = ["ItemGPS", _specificClass] select (_specificClass != "");
			(_loadout select 9) set [1, _gps];
		};
		case "RADIO": {
			private _radio = ["ItemRadio", _specificClass] select (_specificClass != "");
			(_loadout select 9) set [2, _radio];
		};
		case "MAP": {
			private _map = ["ItemMap", _specificClass] select (_specificClass != "");
			(_loadout select 9) set [0, _map];
		};
		case "WATCH": {
			private _watch = ["ItemWatch", _specificClass] select (_specificClass != "");
			(_loadout select 9) set [4, _watch];
		};
		case "COMPASS": {
			private _compass = ["ItemCompass", _specificClass] select (_specificClass != "");
			(_loadout select 9) set [3, _compass];
		};
		case "NVG": {
			private _nvg = ["NVGoggles", _specificClass] select (_specificClass != "");
			(_loadout select 9) set [5, _nvg];
		};
		case "BINOCULARS": {
			private _binoculars = ["Binocular", _specificClass] select (_specificClass != "");
			_loadout set [8, [_binoculars, "", "", "", [], [], ""]]
		};
	};
} forEach _equipment;

_loadout

