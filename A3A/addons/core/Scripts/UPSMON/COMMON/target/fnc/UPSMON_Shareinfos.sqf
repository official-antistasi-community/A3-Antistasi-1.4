/****************************************************************
File: UPSMON_Shareinfos.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- Array of enemies
	<--- leader
Returns:
	Nothing
****************************************************************/

private ["_enemies","_npc","_arrnpc","_side","_pos","_alliednpc","_alliedlead","_enemy"];
	
_npc = _this select 0;
_arrnpc = UPSMON_NPCs - [group _npc];
_side = side _npc;
_pos = getposATL _npc;
_alliednpc = [];
_enemies = [];
	
{
	If (!IsNull _x) then
	{
		If (alive (leader _x)) then
		{
			If (_x getvariable ["UPSMON_Shareinfos",false]) then
			{
				If (_side == side _x) then
				{
					If (count (_x getvariable ["UPSMON_GrpEnies",[]]) > 0) then
					{
						If (round ([_pos,getposATL (leader _x)] call UPSMON_distancePosSqr)  <= UPSMON_sharedist) then 
						{
							_alliednpc pushback _x;
						};
					};
				};
			};
		};
	};
} foreach _arrnpc;

			
{
	If (!IsNull _x) then
	{
		_alliedlead = leader _x;
		if (alive _alliedlead) then
		{
			_enies = _x getvariable ["UPSMON_GrpEnies",[]];
			{
				If (alive _x) then
				{
					If (!(_x in _enemies)) then
					{
						_enemies pushback _x;
					};
				};
			} foreach _enies;
		};
		sleep 0.1;
	};
} foreach _alliednpc;

_enemies