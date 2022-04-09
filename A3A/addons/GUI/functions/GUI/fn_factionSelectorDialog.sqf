#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"

private _display = findDisplay A3A_IDD_FACTIONSELECTORDIALOG;


// get the listBox IDC
private _rebelsList = _display displayCtrl A3A_IDC_REBELSLISTBOX;
private _occupantsList = _display displayCtrl A3A_IDC_OCCUPANTSLISTBOX;
private _invadersList = _display displayCtrl A3A_IDC_INVADERSLISTBOX;
private _civiliansList = _display displayCtrl A3A_IDC_CIVILIANSLISTBOX;


// get the text idc 
private _addonPackText = _display displayCtrl A3A_IDC_ADDONPACKSTEXT;
private _infoText = _display displayCtrl A3A_IDC_INFOTEXT;


private _invandoccTemplates = [];
private _rebTemplates = [];
private _civTemplates = [];

private _fnc_requirementMeet = { getArray (_this/"requiredAddons") findIf { !(isClass (configFile/"CfgPatches"/_x)) } == -1 };
private _templates = configFile/"A3A"/"Templates";
{
	if !(_x call _fnc_requirementMeet) then { continue };
	private _variantOf = getText (_x/"variantOf"); // sub faction of a faction
	private _modset = if (_variantOf isNotEqualTo "") then {_variantOf} else {configName _x};
	private _rootPath = getText (_x/"path") + "\";
	private _aiFactions = [_modset, getText(_x >> "logo"),_rootPath];
	
	//get the AI factions
	//todo check that there is a AI class
	private _aiFactions = [];
	if (isClass (_x/"AI")) then {
		_aiFactions = [_modset, getText(_x >> "logo"),_rootPath];
		{
		private _tempfactionarray = [configName _x, getText(_x >> "flagTexture")];
		_aifactions append [_tempfactionarray];
	
		}forEach ("true" configClasses (_x >> "AI"));
	};
	
	
	//get reb factions
	//todo check that there is a reb faction
	private _rebFactions = [];
	if (isClass (_x/"Reb")) then {
		_rebFactions = [_modset, getText(_x >> "logo"), _rootPath];
		if((count ("true" configClasses (_x/"Reb"))) > 0) then {
			{
			private _tempfactionarrayREB = [configName _x, getText(_x >> "flagTexture")];
			_rebFactions append [_tempfactionarrayREB];
			} forEach ("true" configClasses (_x >> "Reb"));
		} else {
			private _tempfactionarrayREB = [(_modset + " Reb"), getText(_x >> "flagTexture")];
		};
	};
	
	//get civ factions
	private _civFaction = [];
	if (isClass (_x/"Civ")) then {
		_civFaction = [_modset, getText(_x >> "logo"), _rootPath];
		if((count ("true" configClasses (_x/"Civ"))) > 0) then {
			{
			private _tempfactionarrayCIV = [configName _x, getText(_x >> "flagTexture")];
			_civFaction append [_tempfactionarrayCIV];
			} forEach ("true" configClasses (_x >> "Civ"));
		} else {
			private _tempfactionarrayCIV = [(_modset + " Civ"), getText(_x >> "flagTexture")];
			_civFaction append [_tempfactionarrayCIV];		
		};
	};
	
	//append to _invandoccTemplates
	_invandoccTemplates append [_aiFactions];
	_rebTemplates append [_rebFactions];
	_civTemplates append [_civFaction];	
	//debug
	copyToClipboard str (_invandoccTemplates ); 
	
} forEach ("true" configClasses _templates);