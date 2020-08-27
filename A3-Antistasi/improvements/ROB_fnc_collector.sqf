/*
file: ROB_fnc_collector.sqf
by DaVidoSS
add possibility to automatically collect war spoils in nearest vehicle
created for Barbolani's Antistasi
parameters:
0: OBJECT
1: OBJECT
2: Number
3: Number
return VOID
*/
params [
["_loot",objNull,[objNull]],
["_graber",objNull,[objNull]],
["_actionId",-1,[0]],
["_arguments",nil,[]]
];

private _vehicle = ((nearestObjects [_loot, ["LandVehicle"], 25]) select {((getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "hasDriver")) isEqualTo 1) &&{canMove _x}}) select 0;
if (isNil "_vehicle") exitWith {hint "You need any operative land vehicle near to collect gear"};
private _owner = _vehicle getVariable "duenyo";

if (!isNil "_owner") then {
	if (_owner isEqualType "") then {
		if ({getPlayerUID _x == _owner} count (units group _graber) == 0) exitWith {hint "You cannot collect gear in other player vehicle if you are not in the same group"};
	};
};

private _cfgVeh = configFile >> "cfgVehicles" >> typeOf _vehicle;
private _displayName = getText (_cfgVeh >> "displayName");

if (_loot isKindOf "Man") then {

	private _droppedGuns = nearestObjects [_loot, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 3]; //array - holders around 3m
	private _corpseGear = getUnitLoadout _loot;
	_corpseGear params [["_pW",[],[[]]],["_sW",[],[[]]],["_hW",[],[[]]],["_un",[],[[]]],["_ve",[],[[]]],["_bp",[],[[]]],["_hm","",[""]],["_fw","",[""]],["_bo",[],[[]]],["_aI",[],[[]]]];
	_pW params [["_pWeapon","",[""]],["_pWeaponMuzzle","",[""]],["_pWeaponPointer","",[""]],["_pWeaponOptic","",[""]],["_pWeaponMag",[],[[]]],["_pWeaponMagAlt",[],[[]]],["_pWeaponBipod","",[""]]];
	_sW params [["_sWeapon","",[""]],["_sWeaponMuzzle","",[""]],["_sWeaponPointer","",[""]],["_sWeaponOptic","",[""]],["_sWeaponMag",[],[[]]],["_sWeaponMagAlt",[],[[]]],["_sWeaponBipod","",[""]]];
	_hW params [["_hWeapon","",[""]],["_hWeaponMuzzle","",[""]],["_hWeaponPointer","",[""]],["_hWeaponOptic","",[""]],["_hWeaponMag",[],[[]]],["_hWeaponMagAlt",[],[[]]],["_hWeaponBipod","",[""]]];
	_un params [["_uniform","",[""]],["_uniformGear",[],[[]]]];
	_ve params [["_vestraw","",[""]],["_vestGear",[],[[]]]];
	_bp params [["_backpackraw","",[""]],["_backpackGear",[],[[]]]];
	_bo params [["_binocular","",[""]]];

	private _weaponsRaw = [];
	private _backpack = [];
	private _gweapons = [];
	private _muzzles = [];
	private _pointers = [];
	private _optics = [];
	private _bipods = [];
	private _mags = [];
	private _weapons = [];
	private _items = [];
	private _vest = [];

	{_weaponsRaw pushBack (weaponsItems _x)} forEach _droppedGuns;//dropped guns and attachments
	{
		{
			_x params [["_gWeapon","",[""]],["_gWeaponMuzzle","",[""]],["_gWeaponPointer","",[""]],["_gWeaponOptic","",[""]],["_gWeaponMag",[],[[]]],["_gWeaponMagAlt",[],[[],""]],["_gWeaponBipod","",[""]]];
			_gweapons pushBack _gWeapon;
			_muzzles pushBack [_gWeaponMuzzle,1];
			_pointers pushBack [_gWeaponPointer,1];
			_optics pushBack [_gWeaponOptic,1];
			if (_gWeaponMagAlt isEqualType "") then {
				_bipods pushBack [_gWeaponMagAlt,1];
			} else {
				_bipods pushBack [_gWeaponBipod,1];
			};
			_mags pushBack [_gWeaponMag select 0,1];
			if (_gWeaponMagAlt isEqualType []) then {
			_mags pushBack [_gWeaponMagAlt select 0,1];
			};
		} forEach _x;
	} forEach _weaponsRaw;

	{
	if (_x != "") then {_weapons pushBack [[_x] call BIS_fnc_baseWeapon,1]}
	} forEach _gweapons + [_binocular,_pWeapon,_sWeapon,_hWeapon];// pack all weapons without attachments

	{
		{
			private _array = _x; 
			if ((count _array) isEqualTo 3) then {
				_mags pushBack [_array select 0,_array select 1];
			};
			if ((count _array) isEqualTo 2) then {
				_items pushBack [_array select 0,_array select 1];
			};

		} forEach _x;
	} forEach [_uniformGear,_vestGear,_backpackGear];

	if (count _bp > 0) then {
	
		private _inherit = configName (inheritsFrom (configFile >> "CfgVehicles" >> _backpackraw));
		if (getNumber (configFile >> "CfgVehicles" >> _inherit >> "scope") == 2) then {
		_backpack = [_inherit,1];
		} else {
		_backpack = [_backpackraw,1];
		};
	};
	if (count _ve > 0) then {

		_vest pushBack [_vestraw,1];
	};

	switch (true) do {

		case (!(_hWeaponMag isEqualTo [])): {_mags pushBack [_hWeaponMag select 0,1]}; 
		case (_hWeaponMuzzle != ""): {_muzzles pushBack  [_hWeaponMuzzle,1]};
		case (_hWeaponPointer != ""): {_pointers pushBack [_hWeaponPointer,1]};
		case (_hWeaponOptic != ""): {_optics pushBack [_hWeaponOptic,1]};
		case (_hWeaponBipod != ""): {_bipods pushBack [_hWeaponBipod,1]};
	};

	{
		private _item = _x;
		if (_item != "") then {
		_items pushBack [_item,1];
		};
	} forEach (_aI + [_hm,_fw]);



	{_vehicle addWeaponCargoGlobal _x} forEach _weapons;
	{_vehicle addItemCargoGlobal _x} forEach (_items + _muzzles + _pointers + _optics + _bipods + _vest);
	{_vehicle addMagazineCargoGlobal _x} forEach _mags;
	_vehicle addBackpackCargoGlobal _backpack;

	hint format ["Corpse gear collected into nearest %1", _displayName];
	//corpse and holder handle
	if (isMultiplayer) then {
		0 = [_loot] remoteExec [ "ROB_fnc_remRobAction", [0,-2 ] select isDedicated];
		0 = [_loot] remoteExecCall ["hideBody",_arguments];
	} else {
		0 = [_loot] spawn ROB_fnc_remRobAction;
		hideBody _loot;
	};
	{deleteVehicle _x} forEach _droppedGuns;

} else {

	private _fnc_getStack = {
		params [["_keys",[],[[]]], ["_values",[],[[]]]];
		_merged = _keys apply {[_x,(_values select (_keys find _x))]};
		_merged
	};

	{_vehicle addWeaponCargoGlobal _x} forEach ((getWeaponCargo _loot) call _fnc_getStack);
	{_vehicle addMagazineCargoGlobal _x} forEach ((getMagazineCargo _loot) call _fnc_getStack);
	{_vehicle addItemCargoGlobal _x} forEach ((getItemCargo _loot) call _fnc_getStack);
	{_vehicle addBackPackCargoGlobal _x} forEach ((getBackpackCargo _loot) call _fnc_getStack);
	clearWeaponCargoGlobal _loot;
	clearMagazineCargoGlobal _loot;
	clearItemCargoGlobal _loot;
	clearBackpackCargoGlobal _loot;
	hint format ["Box gear collected in nearest %1", _displayName];
	if (isMultiplayer) then {
		0 = [_loot] remoteExec [ "ROB_fnc_remRobAction", [0,-2 ] select isDedicated];
	} else {
		0 = [_loot] spawn ROB_fnc_remRobAction;
	};
};