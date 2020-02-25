_crate = _this select 0;
_gearType = _this select 1;
_amount = _this select 2;

_costMap = [
	["expLight", 300, 800], // [_gearType, cost for "some", cost for "many"]
	["expHeavy", 300, 800],
	["aCache", 500, 5000],
	["aCache", 500, 5000],
	["ASRifles", 1000, 2500],
	["Pistols", 1000, 2500],
	["Machineguns", 1000, 2500],
	["Sniper Rifles", 1000, 2500],
	["Launchers", 1000, 2500],
	["Random", 1000, 2500]
];
_amountSelect = [2, 1] select (_amount == "some"); // Indexes of 'cost for "some"' and 'cost for "many"' inside the _costMap array
_costMapIndex = _costMap findIf { _x select 0 == _gearType; };
_cost = (_costMap select _costMapIndex) select _amountSelect;

_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < _cost) exitWith {
	_dealer = player; // TODO: This should be the dealer NPC
	[_dealer,"sideChat","Get lost ya cheap wanker!"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]]; // TODO: Only exec on targets near the dealer?
};

// TODO: If crate is full, exit

// TODO: If crate cant fit all requested stuff, exit

/** Create item lists */
_lockedWeapons = ((missionNamespace getVariable "allweapons") - (missionNamespace getVariable "unlockedweapons"));
_lockedAttachments = [];
{
	_unlockedAttachments = (missionNamespace getVariable format ["unlocked%1", _x]);
	if(isNil "_unlockedAttachments") then { _unlockedAttachments = []; }; // Sometimes var is nil?
	_allAttachments = (missionNamespace getVariable format ["all%1", _x]);
	_lockedAttachments append (_allAttachments - _unlockedAttachments);
} forEach ["pointerattachments", "muzzleattachments", "lightattachments", "laserattachments"];
// TODO: These should actually be categorized in "mines" or "charges"
// TODO: If that is hard, you should edit the UI to reflect these categories
_lockedLightMines = [];
_lockedHeavyMines = [];
{
	_ammoClassName = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
	_hitValue = getNumber (configFile >> "CfgAmmo" >> _ammoClassName >> "hit");
	if (_hitValue > 200) then {
		_lockedHeavyMines pushBack _x;
	} else {
		_lockedLightMines pushBack _x;
	};
} forEach ((missionNamespace getVariable "allexplosives") - (missionNamespace getVariable "unlockedexplosives"));
_lockedASRifles = ((missionNamespace getVariable "allrifles") - (missionNamespace getVariable "unlockedrifles"));
_lockedPistols = ((missionNamespace getVariable "allhandguns") - (missionNamespace getVariable "unlockedhandguns"));
_lockedMachineguns = ((missionNamespace getVariable "allmachineguns") - (missionNamespace getVariable "unlockedmachineguns"));
_lockedSniperRifles = ((missionNamespace getVariable "allsniperrifles") - (missionNamespace getVariable "unlockedsniperrifles"));
_lockedLaunchers = ((missionNamespace getVariable "allmissilelaunchers") - (missionNamespace getVariable "unlockedmissilelaunchers")) + ((missionNamespace getVariable "allrocketlaunchers") - (missionNamespace getVariable "unlockedrocketlaunchers"));
/** END */

// TODO: We can make this switch a lot shorter if we abstract it
switch(_gearType) do {
	case "expLight": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedLightMines;
				dealerCrate addItemCargoGlobal [_item, _x];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedLightMines;
				dealerCrate addItemCargoGlobal [_item, _x];
			} forEach [3, 8, 8];
		};
	};
	case "expHeavy": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedHeavyMines;
				dealerCrate addItemCargoGlobal [_item, _x];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedHeavyMines;
				dealerCrate addItemCargoGlobal [_item, _x];
			} forEach [3, 8, 8];
		};
	};
	case "aCache": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedAttachments;
				dealerCrate addItemCargoGlobal [_item, _x];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedAttachments;
				dealerCrate addItemCargoGlobal [_item, _x];
			} forEach [3, 8, 8];
		};
	};
	case "ASRifles": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedASRifles;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedASRifles;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4 * 3];
			} forEach [3, 8, 8];
		};
	};
	case "Pistols": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedPistols;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedPistols;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4 * 3];
			} forEach [3, 8, 8];
		};
	};
	case "Machineguns": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedMachineguns;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedMachineguns;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4 * 3];
			} forEach [3, 8, 8];
		};
	};
	case "Sniper Rifles": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedSniperRifles;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedSniperRifles;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4 * 3];
			} forEach [3, 8, 8];
		};
	};
	case "Launchers": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedLaunchers;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedLaunchers;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4 * 3];
			} forEach [3, 8, 8];
		};
	};
	case "Random": {
		if (_amount == "some") exitWith {
			{
				_item = selectRandom _lockedWeapons;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4];
			} forEach [2, 3];
		};
		if (_amount == "many") exitWith {
			{
				_item = selectRandom _lockedWeapons;
				_magazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
				dealerCrate addItemCargoGlobal [_item, _x];
				dealerCrate addMagazineCargoGlobal [selectRandom _magazines, 4 * 3];
			} forEach [3, 8, 8];
		};
	};
};

_magazineCargo = count ((getMagazineCargo dealerCrate) select 1);
_itemCargo = count ((getItemCargo dealerCrate) select 1);

if (_magazineCargo + _itemCargo == 0) exitWith {
	_dealer = player; // TODO: This should be the dealer NPC
	[_dealer,"sideChat","Sorry, lad. Don't have any stuff right now. Check back later."] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]]; // TODO: Only exec on targets near the dealer?
};

dealerCrate addBackpackCargoGlobal ["B_Carryall_oli", 1]; // Free backpack with every purchase

_dealer = player; // TODO: This should be the dealer NPC
[_dealer,"sideChat","Aye, the market for explosives is boomin'. They be hard to get a hold of, don't ya know."] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]]; // TODO: Only exec on targets near the dealer?
[_dealer,"sideChat","You can find yer stuff in the crates."] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]]; // TODO: Only exec on targets near the dealer?

[0, (-1 * _cost)] remoteExec ["A3A_fnc_resourcesFIA",2];


/** All categories (except special)
["allrifles","allhandguns","allmachineguns","allmissilelaunchers","allmortars","allrocketlaunchers","allshotguns","allsmgs","allsniperrifles","allbipods","allmuzzleattachments","allpointerattachments","alloptics","allbinoculars","allcompasses","allfirstaidkits","allgps","alllaserdesignators","allmaps","allmedikits","allminedetectors","allnvgs","allradios","alltoolkits","alluavterminals","allwatches","allglasses","allheadgear","allvests","alluniforms","allbackpacks","allmagartillery","allmagbullet","allmagflare","allgrenades","allmaglaser","allmagmissile","allmagrocket","allmagshell","allmagshotgun","allmagsmokeshell","allmine","allminebounding","allminedirectional","allunknown","allweapons","allitems","allmagazines","allexplosives"]
*/

/** All unlocks
unlockedunknown
unlockedunlimitedammo
unlockedrifles
unlockedminedetectors
unlockedmissilelaunchers
unlockedminebounding
unlockedfirstaidkits
unlockedmaps
unlockedgps
unlockedwatches
unlocked_meta
unlockedbipods
unlockeditems
unlockedminedirectional
unlockedglasses
unlockedbackpackscargo
unlockednvgs
unlockedmagbullet
unlockedheadgear
unlockedmuzzleattachments
unlockeduavterminals
unlockedsmgs
unlockedhandguns
unlockedlaserdesignators
unlockedbackpacks
unlockedequipmentarraynames
unlockedrocketlaunchers
unlockedshotguns
unlockedpointerattachments
unlockedgrenadelaunchers
unlockedmagshotgun
unlockedmine
unlockedmagsmokeshell
unlockedexplosives
unlockedmagmissile
unlockedaa
unlockedat
unlockedtoolkits
unlockedgrenades
unlockedmedikits
unlockedexplosives
unlockedmachineguns
unlockedmaglaser
unlockedmortars
unlockedsniperrifles
unlockedbinoculars
unlockedvests
unlockedarmoredheadgear
unlockedweapons
unlockedmagshell
unlockedcompasses
unlockedmagrocket
unlockedarmoredvests
unlockedradios
unlockedoptics
unlockedmagazines
unlockeduniforms
unlockedmagflare
unlockedmagartillery
*/