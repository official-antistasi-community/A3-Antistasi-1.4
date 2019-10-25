params [["_filter", {true}]];

////////////////////////////////////
//  ITEM/WEAPON CLASSIFICATION   ///
////////////////////////////////////
//Ignore type 65536, we don't want Vehicle Weapons.
private _allWeaponConfigs = "
	getNumber (_x >> 'scope') == 2
	&&
	getNumber (_x >> 'type') != 65536
" configClasses (configFile >> "CfgWeapons");

//Ignore anything with type 0. They're generally vehicle magazines.
//Type 16 is generally throwables, type 256 or above normal magazines.
private _allMagazineConfigs = "
	getNumber (_x >> 'scope') == 2
	&&
	getNumber (_x >> 'type') > 0
" configClasses (configFile >> "CfgMagazines");

private _allBackpackConfigs = "
	getNumber ( _x >> 'scope' ) isEqualTo 2
	&&
	{ getText ( _x >> 'vehicleClass' ) isEqualTo 'Backpacks' }
" configClasses ( configFile >> "CfgVehicles" );

private _allStaticWeaponConfigs = "
	getNumber ( _x >> 'scope' ) isEqualTo 2
	&&
	{ getText ( _x >> 'vehicleClass' ) isEqualTo 'StaticWeapon' }
" configClasses ( configFile >> "CfgVehicles" );

private _allGlassesConfigs = "
	( getNumber ( _x >> 'scope' ) isEqualTo 2 )
" configClasses ( configFile >> "CfgGlasses" );

private _allConfigs = _allWeaponConfigs + _allMagazineConfigs + _allBackpackConfigs + _allStaticWeaponConfigs + _allGlassesConfigs;

////////////////////////////////////////////////////
//    Filter out content from disabled mods.     ///
////////////////////////////////////////////////////
_allConfigs = _allConfigs select {!(_x call A3A_fnc_getModOfConfigClass in disabledMods)};

//////////////////////////////
//    Sorting Function     ///
//////////////////////////////
private _nameX = "";
{
	_nameX = configName _x;
	if (isClass (configFile >> "CfgWeapons" >> _nameX)) then
	{
		_nameX = [_nameX] call BIS_fnc_baseWeapon;
	};
	
	private _item = [_nameX] call A3A_fnc_itemType;
	private _itemType = _item select 1;
	
	if !([_x, _item] call _filter) then
	{
		private _categories = _nameX call A3A_fnc_equipmentClassToCategories;
		{
			//We're not returning a default value with getVariable, becuase it *must* be instantiated before now. If it isn't, we *need* it to error.
			private _categoryName = _x;
			(missionNamespace getVariable ("all" + _categoryName)) pushBackUnique _nameX;
		} forEach _categories;
	};

} forEach _allConfigs;
