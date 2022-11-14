/****************************************************************
File: UPSMON_Packbag.sqf
Author: Azroul13

Description:
	Team dismounts static weapon
Parameter(s):
	<--- Gunner
	<--- Assistant
	<--- Static to dismount
Returns:
	Nothing
****************************************************************/
	
private["_gunner","_assistant","_weapon","_B_weapon","_B_tripod","_array","_position"];

_gunner = 	_this select 0;
_assistant = 	_this select 1;
_weapon = 	vehicle _gunner;

_B_weapon = "";
_B_tripod = "";
_array = getarray (configFile >> "cfgVehicles" >> typeof _weapon >> "assembleInfo" >> "dissasembleTo");
If (count _array > 0) then
{
	_B_weapon = _array select 0;
	_B_tripod = _array select 1;
};
	
_position = position _weapon;
unassignVehicle _gunner;
_gunner action ["getOut", _weapon];
doGetOut _gunner;
[_gunner] allowGetIn false;
	
	
sleep 0.5;
deletevehicle _weapon;
sleep 1;
	
if (alive _gunner && alive _assistant) then
{
	if (_B_weapon != "" && _B_tripod != "") then
	{
		_gunner addBackpack _B_weapon;
		_assistant addBackpack _B_tripod;
	};
	sleep 1;
	_assistant enableAI "move";
	_gunner enableAI "move";	
};