params ["_configClass", "_categories"];

private _remove = false;

private _itemMod = (_configClass call A3A_fnc_getModOfConfigClass);
private _itemIsVanilla = [_itemMod] call A3A_fnc_isModNameVanilla;

//Mod is disabled, remove item.
if (_itemMod in disabledMods) exitWith {
	true;
};

//We remove anything without a picture, because it's a surprisingly good indicator if whether something
//is actually a valid item or not.
//Despite all the filtering, we still get a few RHS guns, etc that are for APCs, but are still classed the item type as normal weapons.
//This is a pretty hard filter that removes anything that shouldn't be in there - I'm hoping it isn't prone to false positives!
if (getText (_configClass >> "picture") == "") exitWith {
	true;
};

//Remove vanilla items if no vanilla sides (IFA handled seperately)
if (_itemIsVanilla && {has3CB || {activeAFRF && activeGREF && activeUSAF}}) then {
	switch (_categories select 0) do {
		case "Item": {
			switch (_categories select 1) do {
				case "AccessoryMuzzle";
				case "AccessoryPointer";
				case "AccessorySights";
				case "AccessoryBipod";
				case "NVGoggles": {
					_remove = true;
				};
			};
		};
		case "Weapon": {
			_remove = true;
		};
		case "Equipment": {
			switch (_categories select 1) do {
				case "Headgear": {
					if (getNumber (_configClass >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0) then {
						_remove = true;
					};
				};
				case "Vest": {
					if (getNumber (_configClass >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5) then {
						_remove = true;
					};
				};
			};
		};
	};
};

//IFA is stricter, remove all modern day stuff unless necessary (some ACE items)
//Avoid listing all of the mods here.
if (hasIFA && !_remove && {(_itemIsVanilla || _itemMod == "@ace" || _itemMod ==	"@task_force_radio")}) then {
	switch (_categories select 0) do {
		case "Item": {
			switch (_categories select 1) do {
				case "AccessoryMuzzle";
				case "AccessoryPointer";
				case "AccessorySights";
				case "AccessoryBipod";
				case "Binocular";
				case "Compass";
				case "GPS";
				case "LaserDesignator";
				case "MineDetector";
				case "NVGoggles";
				case "Radio";
				case "UAVTerminal";
				case "Unknown";
				case "Watch": {
					_remove = true;
				};
			};
		};
		case "Weapon": {
			_remove = true;
		};
		case "Equipment": {
			_remove = true;
		};
		case "Magazine": {
			_remove = true;
		};
		case "Mine": {
			_remove = true;
		};
	};

};

_remove;
