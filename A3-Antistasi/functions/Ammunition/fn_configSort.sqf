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
		switch (_itemType) do
		{
			case "AssaultRifle": {arifles pushBack _nameX};
			case "BombLauncher": {allWeaponBombLauncher pushBack _nameX};
			case "GrenadeLauncher": {allWeaponGrenadeLauncher pushBack _nameX};
			case "Handgun": {hguns pushBack _nameX};
			case "Launcher": {allWeaponLauncher pushBack _nameX};
			case "MachineGun": {mguns pushBack _nameX};
			case "MissileLauncher": {mlaunchers pushBack _nameX};
			case "Mortar": {allWeaponMortar pushBack _nameX};
			case "RocketLauncher": {rlaunchers pushBack _nameX};
			case "Shotgun": {allWeaponShotgun pushBack _nameX};
			case "Throw": {allWeaponThrow pushBack _nameX};
			case "Rifle": {allWeaponRifle pushBack _nameX};
			case "SubmachineGun": {allWeaponSubmachineGun pushBack _nameX};
			case "SniperRifle": {srifles pushBack _nameX};

			case "Magazine": {allMagazine pushBack _nameX};

			case "AccessoryBipod": {allAttachmentBipod pushBack _nameX};
			case "AccessoryMuzzle": {allAttachmentMuzzle pushBack _nameX};
			case "AccessoryPointer": {allAttachmentPointer pushBack _nameX};
			case "AccessorySights": {allAttachmentOptic pushBack _nameX};
			case "Binocular": {allBinocular pushBack _nameX};
			case "Compass": {allCompass pushBack _nameX};
			case "FirstAidKit": {allFirstAidKit pushBack _nameX};
			case "GPS": {allGPS pushBack _nameX};
			case "LaserDesignator": {allLaserDesignator pushBack _nameX};
			case "Map": {allMap pushBack _nameX};
			case "Medikit": {allMedikit pushBack _nameX};
			case "MineDetector": {allMineDetector pushBack _nameX};
			case "NVGoggles": {allNVG pushBack _nameX};
			case "Radio": {allRadio pushBack _nameX};
			case "Toolkit": {allToolkit pushBack _nameX};
			case "UAVTerminal": {allUAVTerminal pushBack _nameX};
			case "Unknown": {allUnknown pushBack _nameX};
			case "UnknownEquipment": {allUnknown pushBack _nameX};
			case "UnknownWeapon": {allUnknown pushBack _nameX};
			case "Watch": {allWatch pushBack _nameX};

			case "Glasses": {allGlasses pushBack _nameX};
			case "Headgear": {allHeadgear pushBack _nameX};
			case "Vest": {allVest pushBack _nameX};
			case "Uniform": {allUniform pushBack _nameX};
			case "Backpack": {allBackpack pushBack _nameX};

			case "Artillery": {allMagArtillery pushBack _nameX};
			case "Bullet": {allMagBullet pushBack _nameX};
			case "Flare": {allMagFlare pushBack _nameX};
			case "Grenade": {allMagGrenade pushBack _nameX};
			case "Laser": {allMagLaser pushBack _nameX};
			case "Missile": {allMagMissile pushBack _nameX};
			case "Rocket": {allMagRocket pushBack _nameX};
			case "Shell": {allMagShell pushBack _nameX};
			case "ShotgunShell": {allMagShotgun pushBack _nameX};
			case "SmokeShell": {allMagSmokeShell pushBack _nameX};
			case "UnknownMagazine": {allUnknown pushBack _nameX};

			case "Mine": {allMine pushBack _nameX};
			case "MineBounding": {allMineBounding pushBack _nameX};
			case "MineDirectional": {allMineDirectional pushBack _nameX};

			default {allUnknown pushBack _nameX};
		};
	};

} forEach _allConfigs;
