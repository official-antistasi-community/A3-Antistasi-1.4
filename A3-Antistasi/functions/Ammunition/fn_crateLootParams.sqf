//Author: PoweredByPot
//This script uses the given parameters to create public variables that
//Loot crates use to determing range of item types and quantity for each
//category of items that crates spawn.

//do weapons automatically unlock primary magazine when unlocked?
unlockedUnlimitedAmmo = "unlockedUnlimitedAmmo" call BIS_fnc_getParamValue; publicVariable "unlockedUnlimitedAmmo";
allowUnlockedExplosives = "allowUnlockedExplosives" call BIS_fnc_getParamValue; publicVariable "allowUnlockedExplosives";
allowGuidedLaunchers = "allowGuidedLaunchers" call BIS_fnc_getParamValue; publicVariable "allowGuidedLaunchers";

//Weapons
crateWepTypeMax = "crateWepTypeMax" call BIS_fnc_getParamValue; publicVariable "crateWepTypeMax";
crateWepNumMax = "crateWepNumMax" call BIS_fnc_getParamValue; publicVariable "crateWepNumMax";

//Items
crateItemTypeMax = "crateItemTypeMax" call BIS_fnc_getParamValue; publicVariable "crateItemTypeMax";
crateItemNumMax = "crateItemNumMax" call BIS_fnc_getParamValue; publicVariable "crateItemNumMax";

//Ammo
crateAmmoTypeMax = "crateAmmoTypeMax" call BIS_fnc_getParamValue; publicVariable "crateAmmoTypeMax";
crateAmmoNumMax = "crateAmmoNumMax" call BIS_fnc_getParamValue; publicVariable "crateAmmoNumMax";

//Exlposives
crateExplosiveTypeMax = "crateExplosiveTypeMax" call BIS_fnc_getParamValue; publicVariable "crateExplosiveTypeMax";
crateExplosiveNumMax = "crateExplosiveNumMax" call BIS_fnc_getParamValue; publicVariable "crateExplosiveNumMax";

//Attachments
crateAttachmentTypeMax = "crateAttachmentTypeMax" call BIS_fnc_getParamValue; publicVariable "crateAttachmentTypeMax";
crateAttachmentNumMax = "crateAttachmentNumMax" call BIS_fnc_getParamValue; publicVariable "crateAttachmentNumMax";

//Backpacks
crateBackpackTypeMax = "crateBackpackTypeMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackTypeMax";
crateBackpackNumMax = "crateBackpackNumMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackNumMax";

//Vests
crateVestTypeMax = "crateVestTypeMax" call BIS_fnc_getParamValue; publicVariable "crateVestTypeMax";
crateVestNumMax = "crateVestNumMax" call BIS_fnc_getParamValue; publicVariable "crateVestNumMax";

//Helmets
crateHelmetTypeMax = "crateHelmetTypeMax" call BIS_fnc_getParamValue; publicVariable "crateHelmetTypeMax";
crateHelmetNumMax = "crateHelmetNumMax" call BIS_fnc_getParamValue; publicVariable "crateHelmetNumMax";

//Device Bags
crateDeviceTypeMax = "crateDeviceTypeMax" call BIS_fnc_getParamValue; publicVariable "crateDeviceTypeMax";
crateDeviceNumMax = "crateDeviceNumMax" call BIS_fnc_getParamValue; publicVariable "crateDeviceNumMax";
