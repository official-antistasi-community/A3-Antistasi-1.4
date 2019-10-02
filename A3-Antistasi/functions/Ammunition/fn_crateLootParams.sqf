//Author: PoweredByPot
//This script uses the given parameters to create public variables that
//Loot crates use to determing range of item types and quantity for each
//category of items that crates spawn.

//do weapons automatically unlock primary magazine when unlocked?
unlockedUnlimitedAmmo = "unlockedUnlimitedAmmo" call BIS_fnc_getParamValue; publicVariable "unlockedUnlimitedAmmo";

//weapons
crateWepTypeMin = "crateWepTypeMin" call BIS_fnc_getParamValue; publicVariable "crateWepTypeMin";
crateWepTypeMax = "crateWepTypeMax" call BIS_fnc_getParamValue; publicVariable "crateWepTypeMax";
crateWepNumMin = "crateWepNumMin" call BIS_fnc_getParamValue; publicVariable "crateWepNumMin";
crateWepNumMax = "crateWepNumMax" call BIS_fnc_getParamValue; publicVariable "crateWepNumMax";

//items
crateItemTypeMin = "crateItemTypeMin" call BIS_fnc_getParamValue; publicVariable "crateItemTypeMin";
crateItemTypeMax = "crateItemTypeMax" call BIS_fnc_getParamValue; publicVariable "crateItemTypeMax";
crateItemNumMin = "crateItemNumMin" call BIS_fnc_getParamValue; publicVariable "crateItemNumMin";
crateItemNumMax = "crateItemNumMax" call BIS_fnc_getParamValue; publicVariable "crateItemNumMax";

//ammo
crateAmmoTypeMin = "crateAmmoTypeMin" call BIS_fnc_getParamValue; publicVariable "crateAmmoTypeMin";
crateAmmoTypeMax = "crateAmmoTypeMax" call BIS_fnc_getParamValue; publicVariable "crateAmmoTypeMax";
crateAmmoNumMin = "crateAmmoNumMin" call BIS_fnc_getParamValue; publicVariable "crateAmmoNumMin";
crateAmmoNumMax = "crateAmmoNumMax" call BIS_fnc_getParamValue; publicVariable "crateAmmoNumMax";

//mines
crateMineTypeMin = "crateMineTypeMin" call BIS_fnc_getParamValue; publicVariable "crateMineTypeMin";
crateMineTypeMax = "crateMineTypeMax" call BIS_fnc_getParamValue; publicVariable "crateMineTypeMax";
crateMineNumMin = "crateMineNumMin" call BIS_fnc_getParamValue; publicVariable "crateMineNumMin";
crateMineNumMax = "crateMineNumMax" call BIS_fnc_getParamValue; publicVariable "crateMineNumMax";

//optics
crateOpticTypeMin = "crateOpticTypeMin" call BIS_fnc_getParamValue; publicVariable "crateOpticTypeMin";
crateOpticTypeMax = "crateOpticTypeMax" call BIS_fnc_getParamValue; publicVariable "crateOpticTypeMax";
crateOpticNumMin = "crateOpticNumMin" call BIS_fnc_getParamValue; publicVariable "crateOpticNumMin";
crateOpticNumMax = "crateOpticNumMax" call BIS_fnc_getParamValue; publicVariable "crateOpticNumMax";

//backpacks
crateBackpackTypeMin = "crateBackpackTypeMin" call BIS_fnc_getParamValue; publicVariable "crateBackpackTypeMin";
crateBackpackTypeMax = "crateBackpackTypeMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackTypeMax";
crateBackpackNumMin = "crateBackpackNumMin" call BIS_fnc_getParamValue; publicVariable "crateBackpackNumMin";
crateBackpackNumMax = "crateBackpackNumMax" call BIS_fnc_getParamValue; publicVariable "crateBackpackNumMax";