/**
	Gets the mod (or DLC) a config item is from, if any;
	
	Params:
		_config: Config class - The config class to look up.
		
	Returns:
		Name of the mod, as a string.
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
	_return = toLower getText (_config >> "DLC");
};

_return;