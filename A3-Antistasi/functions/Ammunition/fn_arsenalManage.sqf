if (!isServer) exitWith {};
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
private ["_weaponsX","_backpcks","_items","_magazines","_weaponX","_magazine","_index","_backpck","_item","_optics","_nv"];

_updated = "";

["buttonInvToJNA"] call jn_fnc_arsenal;
_weaponsX = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) /*+ (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT)*/ + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON)) select {_x select 1 != -1};
_magazines = /*(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG) +*/ (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) select {_x select 1 != -1};
_backpcks = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) select {_x select 1 != -1};
_items = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_UNIFORM)) select {_x select 1 != -1};
_optics = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) select {_x select 1 != -1};
_nv = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS) select {_x select 1 != -1};

private _check = false;
private _checkmag = false;
{
if (_x select 1 >= minWeaps) then
	{
	_weaponX = _x select 0;
	if !(_weaponX in mlaunchers) then
		{
		if (unlockedUnlimitedAmmo == 1) then
			{
			_weaponMagazine = (getArray (configFile / "CfgWeapons" / _weaponX / "magazines") select 0);
			if (!isNil "_weaponMagazine") then
				{
				if (not(_weaponMagazine in unlockedMagazines)) then
					{
					unlockedMagazines pushBack _weaponMagazine;
					_checkmag	= true;
					_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _weaponMagazine >> "displayName")];
					_index = _weaponMagazine call jn_fnc_arsenal_itemType;
					[_index,_weaponMagazine,-1] call jn_fnc_arsenal_addItem;
					};
				};
			};
		unlockedWeapons pushBack _weaponX;
		_check = true;
		//lockedWeapons = lockedWeapons - [_weaponX];
		if (_weaponX in arifles) then
			{
			unlockedRifles pushBack _weaponX; publicVariable "unlockedRifles";
			if (count (getArray (configfile >> "CfgWeapons" >> _weaponX >> "muzzles")) == 2) then
				{
				unlockedGL pushBack _weaponX; publicVariable "unlockedGL";
				};
			}
		else
			{
			if (_weaponX in mguns) then
				{
				unlockedMG pushBack _weaponX; publicVariable "unlockedMG";
				}
			else
				{
				if (_weaponX in srifles) then
					{
					unlockedSN pushBack _weaponX; publicVariable "unlockedSN";
					}
				else
					{
					if (_weaponX in ((rlaunchers + mlaunchers) select {(getNumber (configfile >> "CfgWeapons" >> _x >> "lockAcquire") == 0)})) then
						{
						unlockedAT pushBack _weaponX; publicVariable "unlockedAT";
						}
					else
						{
						if (_weaponX in (mlaunchers select {(getNumber (configfile >> "CfgWeapons" >> _x >> "lockAcquire") == 1)})) then {unlockedAA pushBack _weaponX; publicVariable "unlockedAA"};
						};
					};
				};
			};
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _weaponX >> "displayName")];
		_index = _weaponX call jn_fnc_arsenal_itemType;
		[_index,_weaponX,-1] call jn_fnc_arsenal_addItem;
		};
	};
} forEach _weaponsX;

if (_check) then
	{
	 publicVariable "unlockedWeapons";
	_check = false;
	};

if (_checkmag) then
	{
	 publicVariable "unlockedMagazines";
	_checkmag = false;
	};

{
if (_x select 1 >= minWeaps) then
	{
	_magazines = _x select 0;
	_index = _magazines  call jn_fnc_arsenal_itemType;
	[_index,_magazines,-1] call jn_fnc_arsenal_addItem;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _magazines >> "displayName")];
	_check = true;
	unlockedMagazines pushBack _magazines;
	};
} forEach _magazines;

if (_check) then
	{
	 publicVariable "unlockedMagazines";
	_check = false;
	};
	
{
if (_x select 1 >= minWeaps) then
	{
	_backpck = _x select 0;
	_index = _backpck  call jn_fnc_arsenal_itemType;
	[_index,_backpck,-1] call jn_fnc_arsenal_addItem;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgVehicles" >> _backpck >> "displayName")];
	_check = true;
	unlockedBackpacks pushBack _backpck;
	};
} forEach _backpcks;

if (_check) then
	{
	publicVariable "unlockedBackpacks";
	_check = false;
	};
{
if (_x select 1 >= minWeaps) then
	{
	_item = _x select 0;
	unlockedItems pushBack _item;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	_check = true;
	_index = _item call jn_fnc_arsenal_itemType;
	[_index,_item,-1] call jn_fnc_arsenal_addItem;
	};
} forEach _items;

if (_check) then
	{
	call A3A_fnc_checkRadiosUnlocked;
	_check = false;
	};
{
if (_x select 1 >= minWeaps) then
	{
	_item = _x select 0;
	unlockedOptics pushBack _item;
	unlockedOptics = [unlockedOptics,[],{getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")},"DESCEND"] call BIS_fnc_sortBy;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	_check = true;
	_index = _item call jn_fnc_arsenal_itemType;
	[_index,_item,-1] call jn_fnc_arsenal_addItem;
	};
} forEach _optics;

if (_check) then
	{
	 publicVariable "unlockedOptics";
	_check = false;
	};

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
	unlockedNVG pushBack _nvToUnlock;
	haveNV = true; publicVariable "haveNV";
	publicVariable "unlockedItems";
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _nvToUnlock >> "displayName")];
	_index = _nvToUnlock call jn_fnc_arsenal_itemType;
	[_index,_nvToUnlock,-1] call jn_fnc_arsenal_addItem;
};

//fixes bad case issues
/*if (("optic_Hamr") in unlockedOptics) then {unlockedOptics pushBack "optic_hamr"};
if (("optic_Aco_smg") in unlockedOptics) then {unlockedOptics pushBack "optic_aco_smg"};
if (("optic_Aco") in unlockedOptics) then {unlockedOptics pushBack "optic_aco"};*/

_updated