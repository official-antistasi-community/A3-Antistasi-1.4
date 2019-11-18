disabledMods = [];

if ("Kart" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "kart";
};

if ("Mark" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "mark";
};

if ("Heli" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "heli";
};

if ("Expansion" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "expansion";
};

if ("Jets" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "jets";
};

if ("Orange" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "orange";
};

if ("Tanks" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "tank";
};

if ("GlobMob" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "globmob";
};

if ("Enoch" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "enoch";
};

if ("OfficialMod" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "officialmod";
};
[2,format ["Disabled DLC: %1",disabledMods],"fn_initDisabledMods.sqf"] call A3A_fnc_log;
