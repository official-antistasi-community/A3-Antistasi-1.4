/**
	Maps the class name of an item to the variable name of the category it belongs in.
	
	Params:
		_className - Class of the equipment to unlock.
		
	Returns:
		Array of appropriate categories, selected from allCategories.
**/

params ["_className"];

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

private _categories = [];

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

if (_baseCategory == "Rifles" && {count (getArray (configfile >> "CfgWeapons" >> _className >> "muzzles")) == 2}) then {
	_categories pushBack "GrenadeLaunchers";
};

_categories;