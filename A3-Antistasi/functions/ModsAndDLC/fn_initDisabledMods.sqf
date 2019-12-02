scriptName "fn_initDisabledMods.sqf";
private _fileName = "fn_initDisabledMods.sqf";
private _disabledMods = [];

if ("Kart" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "kart";
};

if ("Mark" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "mark";
};

if ("Heli" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "heli";
};

if ("Expansion" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "expansion";
};

if ("Jets" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "jets";
};

if ("Orange" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "orange";
};

if ("Tanks" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "tank";
};

if ("GlobMob" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "globmob";
};

if ("Enoch" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "enoch";
};

if ("OfficialMod" call BIS_fnc_getParamValue isEqualTo 0) then
{
	_disabledMods pushBack "officialmod";
};
[2,format ["Disabled DLC: %1",_disabledMods],_fileName] call A3A_fnc_log;

_disabledMods;
