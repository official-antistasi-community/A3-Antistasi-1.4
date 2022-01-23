/****************************************************************
File: UPSMON_getminesclass.sqf
Author: Azroul13

Description:

Parameter(s):
	Nothing
Returns:
	Array of mines types
****************************************************************/

private ["_minesclassname","_minetype1","_minetype2","_cfgvehicles","_cfgvehicle","_inherit","_vehicle"];
	
_minesclassname = [];
_minetype1 = [];
_minetype2 = [];
_minetype3 = [];
	
_APMines = [];
_ATMines = [];
_underwatermines = [];
	
	
{
	_mineTriggerType = tolower gettext (_x >> "mineTriggerType");
	if (_mineTriggerType in ["radius","wire"]) then 
	{
		_mineMagnetic = getnumber (_x >> "mineMagnetic");
		_array = if (_mineMagnetic > 0) then {_ATMines} else {_APMines};
		_underwatermine=[tolower configname _x,"underwater"] call UPSMON_StrInStr;
		if (_underwatermine) then {_array=_underwatermines;};
		_array set [count _array,tolower configname _x];
	};
} foreach ((configfile >> "CfgMineTriggers") call bis_fnc_returnchildren);

{
	_cfgvehicle = _x;
	_inherit = inheritsFrom _cfgvehicle;
	If ((configName _inherit) == "MineBase") then
	{
		_vehicle = configName _cfgvehicle;
		_ammo = tolower gettext (_cfgvehicle >> "ammo");
		_trigger = tolower gettext (configfile >> "cfgAmmo" >> _ammo >> "mineTrigger");
		if (_trigger in _ATMines) then {_minetype1 set [count _minetype1,_vehicle];}; 
		if (_trigger in _APMines) then {_minetype2 set [count _minetype2,_vehicle];}; 
		if (_trigger in _underwatermines) then {_minetype3 set [count _minetype3,_vehicle];}; 
	};	
} foreach ((configfile >> "CfgVehicles") call bis_fnc_returnchildren);

_minesclassname = [_minetype1,_minetype2,_minetype3];
_minesclassname