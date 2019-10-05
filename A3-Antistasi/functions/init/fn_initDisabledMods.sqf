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

if ("Enoch" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "enoch";
};
diag_log format ["%1: [Antistasi] | INFO | Filter | Disabled DLC: %2", servertime, disabledMods];
