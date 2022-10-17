/****************************************************************
File: UPSMON_checkbackpack.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- bagpack
Returns:
	---> Gun type classname
	---> tripod type classname
****************************************************************/
private ["_bagpack","_cfg","_parents","_result","_gun","_tripod","_gun"];
	
_bagpack = _this select 0;
_cfg = (configFile >> "cfgVehicles" >> _bagpack);
_parents = [_cfg,true] call BIS_fnc_returnParents;
	
_result = [];
_gun = "";
_tripod = [];
	
if ("Weapon_Bag_Base" in _parents) then 
{
	_gun = gettext (configFile >> "cfgVehicles" >> _bagpack >> "assembleInfo" >> "assembleTo");
	_tripod = getarray (configFile >> "cfgVehicles" >> _bagpack >> "assembleInfo" >> "base");
	_result = [_gun,_tripod];
};

_result