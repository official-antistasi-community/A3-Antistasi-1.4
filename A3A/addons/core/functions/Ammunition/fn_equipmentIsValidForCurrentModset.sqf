params ["_configClass", "_categories"];

private _itemMod = (_configClass call A3A_fnc_getModOfConfigClass);
private _itemIsVanilla = _itemMod in A3A_vanillaMods;

//Mod is disabled, remove item.
// This is pre-checked in configSort, so don't need it here
//if (toLower _itemMod in A3A_disabledMods) exitWith { false };

//We remove anything without a picture, because it's a surprisingly good indicator if whether something
//is actually a valid item or not.
//Despite all the filtering, we still get a few RHS guns, etc that are for APCs, but are still classed the item type as normal weapons.
//This is a pretty hard filter that removes anything that shouldn't be in there - I'm hoping it isn't prone to false negatives!
if (getText (_configClass >> "picture") == "") exitWith { false };

// Just allow all faction mod & enabled CDLC gear. If CDLC and mods are loaded unnecessarily then assume that's what the user wants.
if !(_itemIsVanilla or _itemMod in A3A_extraEquipMods) exitWith {true};

if ("lowTech" in A3A_factionEquipFlags) exitWith {
	switch (_categories select 0) do {
		case "Item": {
			switch (_categories select 1) do {
				case "AccessoryMuzzle";
				case "AccessoryPointer";
				case "AccessorySights";
				case "AccessoryBipod";
				case "Binocular";
				case "GPS";
				case "LaserDesignator";
				case "MineDetector";
				case "NVGoggles";
				case "Radio";
				case "UAVTerminal";
				case "Unknown": { false };
				case "Compass": { !("replaceCompass" in A3A_factionEquipFlags) };
				case "Watch": { !("replaceWatch" in A3A_factionEquipFlags) };
				default { true };
			};
		};
		case "Weapon";
		case "Equipment";
		case "Magazine";
		case "Mine": { false };
		default { true };
	};
};

// Remove most vanilla gear if we're not running two vanilla mods
if !("vanilla" in A3A_factionEquipFlags) exitWith {
	switch (_categories select 0) do {
		case "Item": {
			switch (_categories select 1) do {
				case "AccessoryMuzzle";
				case "AccessoryPointer";
				case "AccessorySights";
				case "AccessoryBipod";
				case "NVGoggles": { false };
				default { true };
			};
		};
		case "Weapon": { false };
		case "Equipment": {
			switch (_categories select 1) do {
				case "Headgear": {
					if (getNumber (_configClass >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") < 0.1) then { true };
				};
				case "Vest": {
					if (getNumber (_configClass >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") < 12.1) then { true };
				};
				default { true };
			};
		};
		default { true };
	};
};

true;			// otherwise allow everything
