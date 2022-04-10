







params ["_status"];
#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#define IDC_OK  1

private _display = findDisplay A3A_IDD_FACTIONSELECTORDIALOG;


// get the listBox IDC
private _rebelsList = _display displayCtrl A3A_IDC_REBELSLISTBOX;
private _occupantsList = _display displayCtrl A3A_IDC_OCCUPANTSLISTBOX;
private _invadersList = _display displayCtrl A3A_IDC_INVADERSLISTBOX;
private _civiliansList = _display displayCtrl A3A_IDC_CIVILIANSLISTBOX;


// get the text idc 
private _addonPackText = _display displayCtrl A3A_IDC_ADDONPACKSTEXT;
private _infoText = _display displayCtrl A3A_IDC_INFOTEXT;

// climate 
private _worldName = toLower worldName;
A3A_climate = toLower (if (isText (missionConfigFile/"A3A"/"mapInfo"/_worldName/"climate")) then {
    getText (missionConfigFile/"A3A"/"mapInfo"/_worldName/"climate")
} else {
    getText (configFile/"A3A"/"mapInfo"/_worldName/"climate")
});

if (_status isEqualTo "selection") exitWith {
	private _selectionArray = [];
	

	_occupantsSelection = lbSelection _occupantsList;
	if (_occupantsSelection isEqualTo []) then {_occupantsSelection = [0]};
	private _dataOcc = (_occupantsList lbData _occupantsSelection#0) splitString ",";
	_selectionArray pushBack [_dataOcc#0, west, _dataOcc#1];

	_invaderSelection = lbSelection _invadersList;
	if (_invaderSelection isEqualTo []) then {_invaderSelection = [0]};
	private _dataInv = (_invadersList lbData _invaderSelection#0) splitString ",";
	_selectionArray pushBack [_dataInv#0, east, _dataInv#1];

	_rebelSelection = lbSelection _rebelsList;
	if (_rebelSelection isEqualTo []) then {_rebelSelection = [0]}; //why does BI not populate on zero?
	private _dataReb = (_rebelsList lbData _rebelSelection#0) splitString ",";
	_selectionArray pushBack [_dataReb#0, resistance, _dataReb#1];

	_civiliansSelection = lbSelection _civiliansList;
	if (_civiliansSelection isEqualTo []) then {_civiliansSelection = [0]};
	private _dataCiv = (_civiliansList lbData _civiliansSelection#0) splitString ",";
	_selectionArray pushBack [_dataCiv#0, civilian,_dataCiv#1];

	copyToClipboard str _selectionArray;


	// close the Dialog if they picked all templates
	closeDialog IDC_OK;

	// time to load the templates

	{
		[_x#0, _x#1] call A3A_fnc_compatibilityLoadFaction;
		
	} forEach _selectionArray;
	{
    private _type = ["Occ", "Inv", "Reb", "Civ"] # _forEachIndex;
    missionNamespace setVariable ["A3A_"+_type+"_template", _x#2];
	} forEach _selectionArray;

	{
    _x call A3A_fnc_loadAddon;
    Info_2("Loading addon: %1 for side: %2",_x#1,_x#0);
	} forEach A3A_addons;

	call A3A_fnc_compileMissionAssets;

	A3A_factionSelectorIsDone = true;

};

// populate the arrays to get the pool of templates
// different to selector as the we attempt to create a different record of info
/* this is the record
[
	["Vanilla","a3\ui_f\data\logos\arma3_white_ca.paa","\x\A3A\addons\core\Templates\Templates\Vanilla\", // Mod, logo, path
		[
			["CSAT","A3\Data_F\Flags\Flag_CSAT_CO.paa","\x\A3A\addons\core\Templates\Templates\Vanilla\Vanilla_AI_CSAT_Tropical.sqf"], // Faction, flagTexture, path
			["LDF","a3\data_f_enoch\flags\flag_enoch_co.paa","\x\A3A\addons\core\Templates\Templates\Vanilla\Vanilla_AI_LDF.sqf"],
			["NATO","\A3\Data_F\Flags\Flag_NATO_CO.paa","\x\A3A\addons\core\Templates\Templates\Vanilla\Vanilla_AI_NATO_Tropical.sqf"],
			["AAF","a3\data_f\flags\flag_aaf_co.paa","\x\A3A\addons\core\Templates\Templates\Vanilla\Vanilla_AI_AAF.sqf"]
		]
	]
]
*/

private _invandoccTemplates = [];
private _rebTemplates = [];
private _civTemplates = [];
private _nodes = [];

private _fnc_requirementMeet = { getArray (_this/"requiredAddons") findIf { !(isClass (configFile/"CfgPatches"/_x)) } == -1 };
private _templates = configFile/"A3A"/"Templates";
{
	if !(_x call _fnc_requirementMeet) then { continue };
	private _variantOf = getText (_x/"variantOf"); // sub faction of a faction
	private _modset = if (_variantOf isNotEqualTo "") then {_variantOf} else {configName _x};
	private _rootPath = getText (_x/"path") + "\";
	_nodes append (getArray (_x/"Nodes") apply {_rootPath + _X});
	
	//get the AI factions
	private _aiFactions = [];
	private _tempAIfactions = [];
	if (isClass (_x/"AI")) then {
		_aiFactions = [_modset, getText(_x >> "logo"),_rootPath];
		{
			private _camo = "";
			if(isClass (_x >> "camo")) then {
				if (getText (_x/"camo"/A3A_climate) isNotEqualTo "") then {_camo = getText (_x/"camo"/A3A_climate) } else {_camo = getText (_x/"camo"/"Default")};
			};
			private _path = "";
			if (_camo isEqualTo "") then {
				_path = _rootPath + _modset + "_AI_" + (configName _x) + ".sqf";
			} else {
				_path = _rootPath + _modset + "_AI_" + (configName _x) + "_" + _camo + ".sqf";
			};
			private _tempfactionarray = [configName _x , getText(_x >> "flagTexture"), _path + "," + _modset];
			_tempAIfactions append [_tempfactionarray];
	
		}forEach ("true" configClasses (_x >> "AI"));
		_aiFactions append [_tempAIfactions];
	};
	
	
	//get reb factions
	private _rebFactions = [];
	private _tempREBfactions = [];
	if (isClass (_x/"Reb")) then {
		_rebFactions = [_modset, getText(_x >> "logo"), _rootPath];
		private _path = "";
		if((count ("true" configClasses (_x/"Reb"))) > 0) then {
			{
			_path = _rootPath + _modset + "_Reb_" + (configName _x) + ".sqf";
			private _tempfactionarrayREB = [configName _x, getText(_x >> "flagTexture"), _path + "," + _modset];
			_tempREBfactions append [_tempfactionarrayREB];
			} forEach ("true" configClasses (_x >> "Reb"));
			_rebFactions append [_tempREBfactions];
		} else {
			_path = _rootPath + _modset + "_Reb" + ".sqf";
			private _tempfactionarrayREB = [[(_modset + " Reb"), getText(_x/"Reb"/"flagTexture"), _path + "," + _modset]]; //double array 2d 
			_rebFactions append [_tempfactionarrayREB];
		};
	};
	
	//get civ factions
	private _civFaction = [];
	if (isClass (_x/"Civ")) then {
		_civFaction = [_modset, getText(_x >> "logo"), _rootPath];
		private _path = "";
		if((count ("true" configClasses (_x/"Civ"))) > 0) then {
			{
			_path = _rootPath + _modset + "_Civ_" + (configName _x) + ".sqf";
			private _tempfactionarrayCIV = [configName _x, getText(_x >> "flagTexture"), _path + "," + _modset];
			_civFaction append [_tempfactionarrayCIV];
			} forEach ("true" configClasses (_x >> "Civ"));
		} else {
			_path = _rootPath + _modset + "_Civ" + ".sqf";
			private _tempfactionarrayCIV = [[(_modset + " Civ"), getText(_x/"Civ"/"flagTexture"), _path + "," + _modset]];//double array 2d
			_civFaction append [_tempfactionarrayCIV];		
		};
	};
	
	//append to _invandoccTemplates
	_invandoccTemplates append [_aiFactions];
	_rebTemplates append [_rebFactions];
	_civTemplates append [_civFaction];	
	//debug
	//copyToClipboard str (); 
	
} forEach ("true" configClasses _templates);

// addons
A3A_addons = [];
private _addonVics = configFile/"A3A"/"AddonVics";
{
    if !(_x call _fnc_requirementMeet) then { continue };
    private _root = getText (_x/"path") + "\";
    _nodes append (getArray (_x/"Nodes") apply {_root + _x});
    A3A_addons append (getArray (_x/"files") apply {
        private _side = switch (toLower (_x#0)) do {
            case "occ": {west};
            case "inv": {east};
            case "reb": {resistance};
            case "civ": {civilian};
            default {sideUnknown};
        };

        [_side, _root + (_x#1)]
    });
} forEach ("true" configClasses _addonVics);


// add stuff to the list box for Inv and Occ
{
	private _logo = _x#1;
	private _factionList = _x#3;
	{
		//occ
		private _indexOCC = _occupantsList lbAdd _x#0;
		_occupantsList lbSetPicture [_indexOCC, _x#1];
		_occupantsList lbSetData [_indexOCC, _x#2];
		_occupantsList lbSetPictureRight [_indexOCC, _logo];

		//inv
		private _indexINV = _invadersList lbAdd _x#0;
		_invadersList lbSetPicture [_indexINV, _x#1];
		_invadersList lbSetData [_indexINV, _x#2];
		_invadersList lbSetPictureRight [_indexINV, _logo];

	} forEach _factionList;
}forEach _invandoccTemplates;

// add stuff for rebels
{
	private _logo = _x#1;
	private _factionList = _x#3;
	{
		//reb
		private _indexREB = _rebelsList lbAdd _x#0;
		_rebelsList lbSetPicture [_indexREB, _x#1];
		_rebelsList lbSetData [_indexREB, _x#2];
		_rebelsList lbSetPictureRight [_indexREB, _logo];

	} forEach _factionList;
}forEach _rebTemplates;


// add stuff for civs
{
	private _logo = _x#1;
	private _factionList = _x#3;
	{
		//reb
		private _indexCIV = _civiliansList lbAdd _x#0;
		_civiliansList lbSetPicture [_indexCIV, _x#1];
		_civiliansList lbSetData [_indexCIV, _x#2];
		_civiliansList lbSetPictureRight [_indexCIV, _logo];

	} forEach _factionList;
}forEach _civTemplates;

// do the nodes
private _vanillaNodes = _nodes findIf {"Vanilla" in _x};
call compile preprocessFileLineNumbers (_nodes deleteAt _vanillaNodes);
{
    call compile preprocessFileLineNumbers _x;
    Info_1("Loading logistic nodes: %1", _x);
} forEach _nodes;