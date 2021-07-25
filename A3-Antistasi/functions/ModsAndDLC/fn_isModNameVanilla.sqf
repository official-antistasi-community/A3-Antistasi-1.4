/**
	Checks if a mod name belongs to vanilla

	Params:
		modName - Mod name (as returned by getModOfConfigClass)

	Returns:
		Boolean, true if mod is vanilla or DLC.
**/

params ["_modName"];

_modName == "" || _modName == toLower "officialmod" || { toLower _modName in (allDLCMods apply {toLower (_x#1)}) };
