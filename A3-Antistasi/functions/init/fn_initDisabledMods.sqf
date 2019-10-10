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

if ("RHS" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "rhsafrf";
	disabledMods pushBack "rhsusaf";
	disabledMods pushBack "rhsgref";
};

if ("3CB" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "3cb_factions";
	disabledMods pushBack "3cb_baf_vehicles";
	disabledMods pushBack "3cb_baf_equipment";
	disabledMods pushBack "3cb_baf_weapons";
	disabledMods pushBack "3cb_baf_units";
	disabledMods pushBack "rksl studios- attachments v3.01";
};

if ("IFA" call BIS_fnc_getParamValue isEqualTo 0) then
{
	disabledMods pushBack "ifa3_aio_lite";
};
diag_log format ["%1: [Antistasi] | INFO | Filter | Disabled DLC: %2", servertime, disabledMods];
