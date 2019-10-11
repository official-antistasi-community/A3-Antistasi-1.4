if (!isServer) exitWith {};
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _updated = "";
private _item = objNull;
private _cateogry = objNull;
["buttonInvToJNA"] call jn_fnc_arsenal;

private _weapons = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON)) select {_x select 1 != -1};
private _explosives = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT) select {_x select 1 != -1};
private _magazines = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) select {_x select 1 != -1};
private _backpacks = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) select {_x select 1 != -1};
private _items = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_UNIFORM)) select {_x select 1 != -1};
private _optics = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) select {_x select 1 != -1};
private _nv = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS) select {_x select 1 != -1};
private _helmets = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) select {_x select 1 != -1};
private _vests = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST) select {_x select 1 != -1};

private _type = objNull;
private _magazine = [];
private _capacity = objNull;
private _count = objNull;
{
_type = _x select 0;
_capacity = getNumber (configFile >> "CfgMagazines" >> _type >> "count");
_bullets = _x select 1;
_count = floor (_bullets/_capacity);
_magazine pushBack [_type,_count];
} forEach _magazines;

{
if (_x select 1 >= minWeaps) then {
	_item = _x select 0;
	if (unlockedUnlimitedAmmo == 1) then {
		_weaponMagazine = (getArray (configFile >> "CfgWeapons" >> _item >> "magazines") select 0);
		if (!isNil "_weaponMagazine") then {
			if (not(_weaponMagazine in unlockedMagazines)) then {
				unlockedMagazines pushBack _weaponMagazine; publicVariable "unlockedMagazines";
				_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _weaponMagazine >> "displayName")];
				_category = _weaponMagazine call jn_fnc_arsenal_itemType;
				[_category,_weaponMagazine,-1] call jn_fnc_arsenal_addItem;
			};
		};
	};
	unlockedWeapons pushBack _item; publicVariable "unlockedWeapons";
	if (_item in arifles) then {
		unlockedRifles pushBack _item; publicVariable "unlockedRifles";
		if (count (getArray (configfile >> "CfgWeapons" >> _item >> "muzzles")) == 2) then {
			unlockedGL pushBack _item; publicVariable "unlockedGL";
		};
	}
	else {
		if (_item in mguns) then {
			unlockedMG pushBack _item; publicVariable "unlockedMG";
		}
		else {
			if (_item in srifles) then {
				unlockedSN pushBack _item; publicVariable "unlockedSN";
			}
			else {
				if (_item in allWeaponSubmachineGun) then {
					unlockedSMG pushBack _item; publicVariable "unlockedSMG";
				}
				else {
					if (_item in rlaunchers) then {
						if ((getNumber (configfile >> "CfgWeapons" >> _item >> "canLock")) isEqualTo 0) then {
							unlockedAT pushBack _item; publicVariable "unlockedAT";
						}
						else {
							if (allowGuidedLanchers isEqualTo 1) then {
								unlockedAT pushBack _item; publicVariable "unlockedAT";
							}
						};
					}
					else {
						if (_item in mlaunchers) then {
							if (allowGuidedLaunchers isEqualTo 1) then {
								if (getText (configfile >> "CfgWeapons" >> _item >> "nameSound") == "aalauncher") then {
									unlockedAA pushBack _item; publicVariable "unlockedAA";
								};
								if (getText (configfile >> "CfgWeapons" >> _item >> "nameSound") == "atlauncher") then {
									unlockedAT pushBack _item; publicVariable "unlockedAT";
								};
							};
						};
					};
				};
			};
		};
	};
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	_category = _item call jn_fnc_arsenal_itemType;
	[_category,_item,-1] call jn_fnc_arsenal_addItem;
};
} forEach _weapons;

{
if (_x select 1 >= minWeaps) then
	{
	_item = _x select 0;
	_category = _item  call jn_fnc_arsenal_itemType;
	[_category,_item,-1] call jn_fnc_arsenal_addItem;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _item >> "displayName")];
	unlockedMagazines pushBack _item; publicVariable "unlockedMagazines";
	};
} forEach _magazine;

if ((allowUnlockedExplosives) isEqualTo 1) then {
	{
	if (_x select 1 >= minWeaps) then
		{
		_item = _x select 0;
		_category = _item  call jn_fnc_arsenal_itemType;
		[_category,_item,-1] call jn_fnc_arsenal_addItem;
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _item >> "displayName")];
		unlockedMagazines pushBack _item; publicVariable "unlockedMagazines";
		};
	} forEach _explosives;
};

{
if (_x select 1 >= minWeaps) then
	{
	_item = _x select 0;
	_category = _item  call jn_fnc_arsenal_itemType;
	[_category,_item,-1] call jn_fnc_arsenal_addItem;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgVehicles" >> _item >> "displayName")];
	unlockedBackpacks pushBack _item; publicVariable "unlockedBackpacks";
	};
} forEach _backpacks;

private _check = false;
{
if (_x select 1 >= minWeaps) then
	{
	_item = _x select 0;
	unlockedItems pushBack _item; publicVariable "unlockedItems";
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	_check = true;
	_category = _item call jn_fnc_arsenal_itemType;
	[_category,_item,-1] call jn_fnc_arsenal_addItem;
	};
} forEach _items;

if (_check) then
	{
	call A3A_fnc_checkRadiosUnlocked;
	};

{
if (_x select 1 >= minWeaps) then
	{
	_item = _x select 0;
	unlockedOptics pushBack _item; publicVariable "unlockedOptics";
	unlockedOptics = [unlockedOptics,[],{getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")},"DESCEND"] call BIS_fnc_sortBy;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	_category = _item call jn_fnc_arsenal_itemType;
	[_category,_item,-1] call jn_fnc_arsenal_addItem;
	};
} forEach _optics;

{
	if (_x select 1 >= minWeaps) then
	{
		_item = _x select 0;
		unlockedHelmet pushBack _item; publicVariable "unlockedHelmet";
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
		_category = _item call jn_fnc_arsenal_itemType;
		[_category,_item,-1] call jn_fnc_arsenal_addItem;
	};
} forEach _helmets;

{
	if (_x select 1 >= minWeaps) then
	{
		_item = _x select 0;
		unlockedVest pushBack _item; publicVariable "unlockedVest";
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
		_category = _item call jn_fnc_arsenal_itemType;
		[_category,_item,-1] call jn_fnc_arsenal_addItem;
	};
} forEach _vests;

//Handle NVG unlocking
//Unlock a random NVG per X non-unlocked NVG we have, from the list we've collected.
private _countX = 0;
private _lockedNvs = [];

//Add up how many non-unlocked NVGs we have.
{
	private _amount = (_x select 1);
	if (_amount > 0) then {
		_countX = _countX + _amount;
		_lockedNvs pushBack (_x select 0);
	};
} forEach _nv;

//Implicitly, we have locked NVGs if we've counted more than 0 locked NVGs in the box.
if (_countX >= minWeaps) then
{
	private _nvToUnlock = selectRandom _lockedNvs;
	unlockedNVG pushBack _nvToUnlock; publicVariable "unlockedNVG";
	haveNV = true; publicVariable "haveNV";
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _nvToUnlock >> "displayName")];
	_category = _nvToUnlock call jn_fnc_arsenal_itemType;
	[_category,_nvToUnlock,-1] call jn_fnc_arsenal_addItem;
};

_updated