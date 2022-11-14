/****************************************************************
File: UPSMON_Watchbino.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- Array of units
Returns:
	Array of units
****************************************************************/

private ["_npc","_hasbinocular","_timeout","_colorstatus","_dir","_dirpos"];
_npc = _this select 0;
_lookingpos = _this select 1;
	
_dir1 =[getposATL _npc, _lookingpos] call BIS_fnc_DirTo;
	
If (!IsNull _npc) then
{
	If (alive _npc) then
	{
			
		If (vehicle _npc == _npc) then
		{
			_hasbinocular = {_x == "Binocular"} count (weapons _npc);
			If (count _hasbinocular > 0) then
			{
				_timeout = time + 15;
				sleep 0.5;
				_npc selectWeapon "Binocular";
				//_colorstatus = ((group _npc) getvariable "UPSMON_Grpstatus") select 1;
				while {_timeout > time && alive _npc} do
				{
					_npc enableAI "anim";
					sleep 1;
					//_colorstatus = ((group _npc) getvariable "UPSMON_Grpstatus") select 1;
					If (!alive _npc) exitwith {};
					_dir2 = [(_dir1 + (random 70)),(_dir1 + ((random 100) + 190))] select (floor (random 2));
					_dirpos = [getposATL _npc,_dir2, 200] call UPSMON_GetPos2D;
					[_npc,_dirpos] call UPSMON_dowatch;
					sleep 0.7;
					_unit setDir _dir2;
					If (!alive _npc) exitwith {};
					_npc disableAI "anim";
					_npc dowatch objnull;
				};
				If (alive _npc) then {_npc lookat objNull;_npc enableAI "anim";_npc selectWeapon ((weapons _npc) select 0);};
			};
		}
		else
		{
			_timeout = time + 15;
			
			while {_timeout > time && alive _npc} do
			{
				sleep 1;
				//_colorstatus = ((group _npc) getvariable "UPSMON_Grpstatus") select 1;
				If (!alive _npc) exitwith {};
				_dir2 = [(_dir1 + (random 70)),(_dir1 + ((random 100) + 190))] select (floor (random 2));
				_dirpos = [getposATL _npc,_dir2, 200] call UPSMON_GetPos2D;
				[_npc,_dirpos] call UPSMON_dowatch;
				sleep 1;
				If (!alive _npc) exitwith {};
				_npc dowatch objnull;
			};
		};
	};
};