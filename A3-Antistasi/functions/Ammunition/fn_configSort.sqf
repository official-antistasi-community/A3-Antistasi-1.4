private ["_allMap","_allCompass","_allGPS","_allWatch","_allPrimaryWeapon","_allHandGun","_allLauncher","_allItem","_allOptic","_allNVG","_allMagazine","_allGrenade","_allExplosive","_allMissile","_allBackpack","_allStaticWeapon","_allGlasses","_allLaserOptic","_allMineDetector","_allRadio","_nameX","_alreadyChecked","_item","_itemType"];
////////////////////////////////////
//  ITEM/WEAPON CLASSIFICATION   ///
////////////////////////////////////
_allPrimaryWeapon = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 1 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allHandGun = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 2 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allLauncher = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 4 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allItem = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allMineDetector = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'ItemMineDetector'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allRadio = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'ItemRadio'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allMap = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'ItemMap'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allGPS = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'ItemGPS'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allWatch = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'ItemWatch'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allCompass = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'ItemCompass'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allOptic = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'Binocular'
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 4096 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allLaserOptic = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'weapon'
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 4096 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allNVG = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'simulation' ) isEqualTo 'NVGoggles'
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 4096 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allMagazine = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 256 } )
" configClasses ( configFile >> "cfgMagazines" );

_allGrenade = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getNumber ( _x >> 'type' ) isEqualTo 16 } )
" configClasses ( configFile >> "cfgMagazines" );

_allExplosive = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'type' ) isEqualTo '2*		256' } )
" configClasses ( configFile >> "cfgMagazines" );

_allMissile = "
    ( getNumber ( _x >> 'scope' ) isEqualTo 2
    &&
    { getText ( _x >> 'type' ) isEqualTo '6 * 		256' } )
" configClasses ( configFile >> "cfgMagazines" );

_allBackpack = "
	( getNumber ( _x >> 'scope' ) isEqualTo 2
	&&
	{ getNumber ( _x >> 'type' ) isEqualTo 1
	&&
	{ getText ( _x >> 'vehicleClass' ) isEqualTo 'Backpacks' } } )
" configClasses ( configFile >> "cfgVehicles" );

_allStaticWeapon = "
	( getNumber ( _x >> 'scope' ) isEqualTo 2
	&&
	{ getNumber ( _x >> 'type' ) isEqualTo 1
	&&
	{ getText ( _x >> 'vehicleClass' ) isEqualTo 'Static' } } )
" configClasses ( configFile >> "cfgVehicles" );

_allGlasses = "
	( getNumber ( _x >> 'scope' ) isEqualTo 2 )
" configClasses ( configFile >> "cfgGlasses" );

//////////////////////////////
//    Sorting Function     ///
//////////////////////////////
_alreadyChecked = [];
{
_nameX = configName _x;
if (isClass (configFile >> "cfgWeapons" >> _nameX)) then
	{
	_nameX = [_nameX] call BIS_fnc_baseWeapon;
	};
if !(_nameX in _alreadyChecked) then
	{
	_alreadyChecked pushBack _nameX;
	_item = [_nameX] call BIS_fnc_itemType;
	_itemType = _item select 1;
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
} forEach _allMap + _allCompass + _allGPS + _allWatch + _allPrimaryWeapon + _allHandGun + _allLauncher + _allItem + _allOptic + _allNVG + _allMagazine + _allGrenade + _allExplosive + _allMissile + _allBackpack + _allStaticWeapon + _allGlasses + _allLaserOptic + _allMineDetector + _allRadio;
