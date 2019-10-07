//Author: PoweredByPot
//This script uses the given parameters to create public variables that
//Loot crates use to determing range of item types and quantity for each
//category of items that crates spawn.

//do weapons automatically unlock primary magazine when unlocked?
unlockedUnlimitedAmmo = "unlockedUnlimitedAmmo" call BIS_fnc_getParamValue; publicVariable "unlockedUnlimitedAmmo";

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
crateVestTypeMax = "crateBackpackTypeMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackTypeMax";
crateVestNumMax = "crateBackpackNumMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackNumMax";

//Helmets
crateHelmetTypeMax = "crateBackpackTypeMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackTypeMax";
crateHelmetNumMax = "crateBackpackNumMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackNumMax";
