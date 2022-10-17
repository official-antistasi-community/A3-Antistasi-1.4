params ["_configClass", "_categories"];

private _itemMod = (_configClass call A3A_fnc_getModOfConfigClass);
private _itemIsVanilla = [_itemMod] call A3A_fnc_isModNameVanilla;

//Mod is disabled, remove item.
if (toLower _itemMod in disabledMods) exitWith { false };

//We remove anything without a picture, because it's a surprisingly good indicator if whether something
//is actually a valid item or not.
//Despite all the filtering, we still get a few RHS guns, etc that are for APCs, but are still classed the item type as normal weapons.
//This is a pretty hard filter that removes anything that shouldn't be in there - I'm hoping it isn't prone to false negatives!
if (getText (_configClass >> "picture") == "") exitWith { false };

//Remove vanilla items if no vanilla sides (IFA, GM and VN handled seperately)
if (_itemIsVanilla && {A3A_hasRHS || A3A_hasCUP } &&  { !(A3A_hasGM && A3A_hasCUP) } ) exitWith {
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

//IFA is stricter, remove all modern day stuff unless necessary (some ACE items)
//Avoid listing all of the mods here.

//we should find a Solution that is not bound to Foldernames
private _acemods = ["@ace", "@ACE - No medical [Updated]", "@Automated Ace No Medical", "@ACENomedical"];

private _TFARmods = ["@task_force_radio", "@taskforceradio", "@Task Force Arrowhead Radio (BETA!!!)", "@TaskForceArrowheadRadioBETA"];

if (A3A_hasIFA && {(_itemIsVanilla || _itemMod in _acemods || _itemMod in _TFARmods)}) exitWith {
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
				case "Watch": { false };
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
if (A3A_hasVN && {(_itemIsVanilla || _itemMod in _acemods || _itemMod in _TFARmods)}) exitWith {
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
				case "Compasses";
				case "Unknown";
				case "Watch": { false };
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
if (A3A_hasUNS && {(_itemIsVanilla || _itemMod in _acemods || _itemMod in _TFARmods)}) exitWith {
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

if (A3A_hasGM && A3A_hasCUP) exitWith {
//if (A3A_hasGM && A3A_hasCUP && {(_itemIsVanilla || _itemMod in _acemods || _itemMod in _TFARmods || _itemMod == "GM" || _itemMod == "@CUP Weapons")}) exitWith {
	private _blacklist = ["gm_g36a1_blk", "gm_g36a1_des", "gm_g36e_blk", "gm_p2a1_launcher_blk"];
	private _whitelist = ["DemoCharge_Remote_Mag", "ItemGPS", "ACE_ATragMX","ACE_Kestrel4500","ACE_DAGR",
		"ACE_microDAGR","MineDetector","ACE_M26_Clacker","ACE_Clacker", "CUP_srifle_G22_wdl", "CUP_muzzle_snds_AWM",
		"CUP_optic_LeupoldMk4_10x40_LRT_Woodland_pip", "CUP_5Rnd_762x67_G22", "CUP_bipod_Harris_1A2_L_BLK",
		"CUP_srifle_Mosin_Nagant", "CUP_optic_PEM", "CUP_5Rnd_762x54_Mosin_M", "CUP_srifle_LeeEnfield", "CUP_10x_303_M",
		"CUP_srifle_Remington700", "CUP_6Rnd_762x51_R700", "CUP_NVG_PVS7", "CUP_NVG_1PN138"];
	private _isProhbited = (toLower _itemMod isEqualTo "gm" && (configName _configClass) in _blacklist);
	private _isItemBase = (toLower _itemMod isEqualTo "gm" && ["_base", (configName _configClass), false] call BIS_fnc_inString );
	private _isNotFromGM = toLower _itemMod isNotEqualTo "gm" ;
	private _isWhitelisted = (configName _configClass) in _whitelist ;
	private _unallowed = !( _isProhbited || _isItemBase || _isNotFromGM );
	_unallowed || _isWhitelisted
};

//no other CDLC content when using VN
if (A3A_hasVN && {toLower _itemMod isNotEqualTo "vn"} && {toLower _itemMod in (allCDLC apply {toLower (_x#1)})}) exitWith {false};

true;
