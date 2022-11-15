/**
	Gets the mod (or DLC) a config item is from, if any;
	
	Params:
		_config: Config class - The config class to look up.
		
	Returns:
		Name of the mod, as a string. Lowercased because of inconsistency with DLC and CDLC
**/

params ["_config"];

private _return = "";

private _addons = configSourceAddonList _config;
if (count _addons > 0) then {
	private _mods = configSourceModList (configFile >> "CfgPatches" >> _addons select 0);
	if (count _mods > 0) then {
		_return = _mods select 0;
	};
};

if (_return == "") then {
	_return = getText (_config >> "DLC");
};

toLower _return;