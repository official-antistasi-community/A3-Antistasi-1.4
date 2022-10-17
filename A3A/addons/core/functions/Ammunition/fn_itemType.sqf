/*
	Get the type of the item.
	
	This is a modified version of ACE's item detection code.
	Thanks ACE!
	(https://github.com/acemod/ACE3, a good chunk of this code was authored by Alganthe and Dedmen)	

    Inputs:
        _item: Classname of item to categorise.

    Outputs
        category as a string.
*/

// weapon types
#define TYPE_WEAPON_PRIMARY 1
#define TYPE_WEAPON_HANDGUN 2
#define TYPE_WEAPON_SECONDARY 4
// magazine types
#define TYPE_MAGAZINE_HANDGUN_AND_GL 16 // mainly
#define TYPE_MAGAZINE_PRIMARY_AND_THROW 256
#define TYPE_MAGAZINE_SECONDARY_AND_PUT 512 // mainly
// more types
#define TYPE_BINOCULAR_AND_NVG 4096
#define TYPE_WEAPON_VEHICLE 65536
#define TYPE_ITEM 131072
// item types
#define TYPE_DEFAULT 0
#define TYPE_MUZZLE 101
#define TYPE_OPTICS 201
#define TYPE_FLASHLIGHT 301
#define TYPE_BIPOD 302
#define TYPE_FIRST_AID_KIT 401
#define TYPE_FINS 501 // not implemented
#define TYPE_BREATHING_BOMB 601 // not implemented
#define TYPE_NVG 602
#define TYPE_GOGGLE 603
#define TYPE_SCUBA 604 // not implemented
#define TYPE_HEADGEAR 605
#define TYPE_FACTOR 607
#define TYPE_RADIO 611
#define TYPE_HMD 616
#define TYPE_BINOCULAR 617
#define TYPE_MEDIKIT 619
#define TYPE_TOOLKIT 620
#define TYPE_UAV_TERMINAL 621
#define TYPE_VEST 701
#define TYPE_UNIFORM 801
#define TYPE_BACKPACK 901

params ["_item"];

//These were previously all used. Leave them in, in case we need to do more sophisticated matching in the future.
private _configCfgWeapons = configFile >> "CfgWeapons";
private _weaponConfig = configFile >> "CfgWeapons" >> _item;
private _itemInfoConfig = _weaponConfig >> "ItemInfo";
private _magazineConfig = configFile >> "CfgMagazines" >> _item;
private _itemType = switch true do {
	case (isClass _weaponConfig): {getNumber (_weaponConfig >> "type")};
	case (isClass _magazineConfig): {getNumber (_magazineConfig >> "type")};
	default {-1};
};
private _itemInfoType =	if (isClass _itemInfoConfig) then {(getNumber (_itemInfoConfig >> "type"))} else {-1};
private _simulationType = getText (_weaponConfig >> "simulation");

//If it's a CBA Misc Item, claim it's unknown.
if (isClass _weaponConfig 
		&& _itemInfoType in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD] 
		&& _item isKindOf ["CBA_MiscItem", (_configCfgWeapons)]
	) exitWith 
{
	["Item", "Unknown"];
};

_item call BIS_fnc_itemType; 