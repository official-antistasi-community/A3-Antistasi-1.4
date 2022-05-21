/*
Author: Håkon
Description:
    Checks that a configs required addons are loaded

Arguments:
0. <Config> config class to check

Return Value:
<Bool> if requirements are meet

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
params ["_cfg", configNull, [configNull]];
{ getArray (_cfg/"requiredAddons") findIf { !(isClass (configFile/"CfgPatches"/_x)) } == -1 }
