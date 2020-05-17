/**
	Maps the class name of an item to the variable name of the category it belongs in.
	
	Params:
		_className - Class of the equipment to unlock.
		
	Returns:
		Array of appropriate categories, selected from allCategories.
**/

params ["_className"];

// First check if the item has hardcoded categories
private _categories = categoryOverrides getVariable [_className, []];
if (count _categories > 0) exitWith { _categories };

private _itemType = [_className] call A3A_fnc_itemType;

private _baseCategory =	switch (_itemType select 1) do
	{
		case "AssaultRifle": {"Rifles"};
		case "BombLauncher": {""}; //Only for vehicles //allBombLaunchers pushBack _nameX};
		case "GrenadeLauncher": {""}; //Only for vehicles //allGrenadeLaunchers pushBack _nameX};
		case "Handgun": {"Handguns"};
		case "Launcher": {""}; //Unused
		case "MachineGun": {"MachineGuns"};
		case "MissileLauncher": {"MissileLaunchers"};
		case "Mortar": {"Mortars"};
		case "RocketLauncher": {"RocketLaunchers"};
		case "Shotgun": {"Shotguns"};
		case "Throw": {""}; //Unused
		case "Rifle": {"Rifles"};
		case "SubmachineGun": {"SMGs"};
		case "SniperRifle": {"SniperRifles"};

		case "Magazine": {"Magazines"};

		case "AccessoryBipod": {"Bipods"};
		case "AccessoryMuzzle": {"MuzzleAttachments"};
		case "AccessoryPointer": {"PointerAttachments"};
		case "AccessorySights": {"Optics"};
		case "Binocular": {"Binoculars"};
		case "Compass": {"Compasses"};
		case "FirstAidKit": {"FirstAidKits"};
		case "GPS": {"GPS"};
		case "LaserDesignator": {"LaserDesignators"};
		case "Map": {"Maps"};
		case "Medikit": {"Medikits"};
		case "MineDetector": {"MineDetectors"};
		case "NVGoggles": {"NVGs"};
		case "Radio": {"Radios"};
		case "Toolkit": {"Toolkits"};
		case "UAVTerminal": {"UAVTerminals"};
		case "Unknown": {"Unknown"};
		case "UnknownEquipment": {"Unknown"};
		case "UnknownWeapon": {"Unknown"};
		case "Watch": {"Watches"};

		case "Glasses": {"Glasses"};
		case "Headgear": {"Headgear"};
		case "Vest": {"Vests"};
		case "Uniform": {"Uniforms"};
		case "Backpack": {"Backpacks"};

		case "Artillery": {"MagArtillery"};
		case "Bullet": {"MagBullet"};
		case "Flare": {"MagFlare"};
		case "Grenade": {"Grenades"};
		case "Laser": {"MagLaser"};
		case "Missile": {"MagMissile"};
		case "Rocket": {"MagRocket"};
		case "Shell": {"MagShell"};
		case "ShotgunShell": {"MagShotgun"};
		case "SmokeShell": {"MagSmokeShell"};
		case "UnknownMagazine": {"Unknown"};

		case "Mine": {"Mine"};
		case "MineBounding": {"MineBounding"};
		case "MineDirectional": {"MineDirectional"};

		default {"Unknown"};
	};

if (_baseCategory != "") then { _categories pushBack _baseCategory};

private _aggregateCategory = switch (_itemType select 0) do {
	case "Weapon": {"Weapons"};
	case "Item";
	case "Equipment": {"Items"};
	case "Magazine": {"Magazines"};
	case "Mine": {"Explosives"};
	default {""};
}; 

if (_aggregateCategory != "") then {
	_categories pushBack _aggregateCategory;
};

//Every explosive is a magazine.
if (_aggregateCategory == "Explosives") then {
	_categories pushBack "Magazines";
};

if (_baseCategory == "RocketLaunchers") then {
	_categories pushBack "AT";
};

if (_baseCategory == "MissileLaunchers") then {
	private _launcherInfo = [_className] call A3A_fnc_launcherInfo;
	
	//If we can lock air, it's AA.
	if (_launcherInfo select 1) then {
		_categories pushBack "AA";
	};
	
	//If we can lock ground, or can't lock either air or ground, it's AT.
	if (_launcherInfo select 0 || !(_launcherInfo select 0 || _launcherInfo select 1)) then {
		_categories pushBack "AT";
	};
};

if (_baseCategory == "Rifles") then {
	private _config = configfile >> "CfgWeapons" >> _className;
	private _muzzles = getArray (_config >> "muzzles");
	// workaround for RHS having an extra muzzle for "SAFE"
	if (count _muzzles >= 2 && {"gl" == getText (_config >> (_muzzles select 1) >> "cursorAim")}) then {
		_categories pushBack "GrenadeLaunchers";
	};
};

if (_basecategory == "Vests") then {
	if (getNumber (configfile >> "CfgWeapons" >> _className >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5) then {
		_categories pushBack "ArmoredVests";
	};
};

if (_basecategory == "Headgear") then {
	if (getNumber (configfile >> "CfgWeapons" >> _className >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0) then {
		_categories pushBack "ArmoredHeadgear";
	};
};

if (_basecategory == "Backpacks") then {
	// 160 = assault pack. Just a way to limit which backpacks friendly AI are using.
	if (getNumber (configFile >> "CfgVehicles" >> _className >> "maximumLoad") >= 160) then {
		_categories pushBack "BackpacksCargo";
	};
};

_categories;