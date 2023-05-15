/*
    Initialize data for buyable items
    Sets global vars A3A_buyableItemList and A3A_buyableItemHM

Arguments: none
Returns: none

Environment: Server, must be called after faction loading
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fuelDrum = FactionGet(reb,"vehicleFuelDrum");
private _fuelTank = FactionGet(reb,"vehicleFuelTank");
private _medCrate = FactionGet(reb,"vehicleMedicalBox");
private _medTent = FactionGet(reb,"vehicleHealthStation");
private _ammoStation = FactionGet(reb,"vehicleAmmoStation");
private _repairStation = FactionGet(reb,"vehicleRepairStation");

// TODO: Name should be stringtabled somewhere

private _items = [
    [FactionGet(reb,"surrenderCrate"), 10, "Loot Box", "gear", ["move", "loot"]],
    [_fuelDrum#0, _fuelDrum#1, "Fuel Drum", "refuel", ["cmmdr", "fuel", "move", "save"]],
    [_fuelTank#0, _fuelTank#1, "Fuel Tank", "refuel", ["fuel", "place", "move", "save"]],
    [_medTent#0, _medTent#1, "Medical Tent", "heal", ["place", "move", "pack"]],
    [_ammoStation#0, _ammoStation#1, "Ammo Station", "rearm", ["cmmdr", "place", "move", "save"]],
    [_repairStation#0, _repairStation#1, "Repair Station", "repair", ["cmmdr", "place", "move", "pack", "save"]],
    [FactionGet(reb,"vehicleLightSource"), 25, "Light", "", ["move", "save"]]
];

if (!LootToCrateEnabled) then { _items deleteAt 0 };

if(A3A_hasACE) then {
    _items pushBack [_medCrate#0, _medCrate#1, "Medical Box", "heal", ["noclear", "move"]],
    _items pushBack ["ACE_Wheel", 5, "Spare Wheel", "", []];
    _items pushBack ["ACE_Track", 5, "Spare Track", "", []];
};

// Add packed variants so that they can be initialized properly
{
    private _packClass = getText (configFile >> "A3A" >> "A3A_Logistics_Packable" >> _x#0 >> "packObject");
    if (_packClass == "") then { Error_1("Packable item %1 has no packed object", _x#0); continue };
    _items pushBack [_packClass, -1, "", "", ["move", "unpack"]];
} forEach (_items select { "pack" in _x#4 });

A3A_buyableItemList = _items select { _x#1 >= 0 } apply { _x#0 };
A3A_buyableItemHM = (_items apply { _x#0 }) createHashMapFromArray _items;
