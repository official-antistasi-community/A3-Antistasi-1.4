params ["_name", "_getClass"];

private _return = "";

"[
	if (configName _x isEqualTo _name) then {_return = getText (_x >> ""name""); false},
	if ((getText (_x >> ""name"")) isEqualTo _name) then {_return = configName _x; false}
] select _getClass" configClasses (configFile >> "CfgWorlds" >> worldName >> "Names");

_return
