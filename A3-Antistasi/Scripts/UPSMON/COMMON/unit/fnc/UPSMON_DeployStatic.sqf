/****************************************************************
File: UPSMON_DeployStatic.sqf
Author: Azroul13

Description:
	Check before deploying the static
Parameter(s):

Returns:

****************************************************************/
private ["_grp","_currpos","_attackpos","_checkforstatic","_staticteam","_insideveh"];	

_grp = _this select 0;
_currpos = _this select 1;
_attackpos = _this select 2;

_checkforstatic = [_grp] call UPSMON_GetStaticTeam; 
_staticteam = _checkforstatic select 0;
_weapon = _checkforstatic select 1;

if (count _staticteam == 2) then
{
	_insideveh = false;
	{
		If (alive _x) exitwith 
		{
			If (vehicle _x != _x) then
			{
				If (!_insideveh) then
				{
					_insideveh = true
				};
			};
		};
	} foreach _staticteam;
	
	If (!_insideveh) then
	{
		[_staticteam select 0,_staticteam select 1,_currpos,_attackpos,_weapon] spawn UPSMON_Unpackbag;
	};
};