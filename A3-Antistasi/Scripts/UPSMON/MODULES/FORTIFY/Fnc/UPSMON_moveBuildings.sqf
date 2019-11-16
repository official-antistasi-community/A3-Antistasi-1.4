/****************************************************************
File: UPSMON_moveBuildings.sqf
Author: Monsada

Description:

Parameter(s):
	<--- array of units
	<--- array of buildingsinfo [_bld,pos]
	<--- must patrol or not
Returns:
	nothing
****************************************************************/

private ["_wait","_minpos","_units","_blds","_blds2","_UPSMON_Bld_ruins","_i","_arraybld","_bld","_bldpos1","_bldpos2","_cntobjs1","_movein","_result","_altura","_id2"];

_wait = 60;
_minpos  = 2;

_units = _this select 0;
_blds = _this select 1;
_i = 0;
if ((count _this) > 2) then {_wait = _this select 2;};
if ((count _this) > 3) then {_i = _this select 3;};

if (_i > 7) exitwith {_units};

_UPSMON_Bld_ruins = ["Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_d_Stone_HouseBig_V1_F","Land_d_Stone_Shed_V1_F","Land_u_House_Small_02_V1_F","Land_i_Stone_HouseBig_V1_F","Land_u_Addon_02_V1_F","Land_Cargo_Patrol_V1_F"];
_blds2 = [];
if (UPSMON_Debug>0) then {diag_log format["MON_moveBuildings _units=%1 _blds=%2",count _units, count _blds];};	


{
	_arraybld = _x;
	_bld 		= _x select 0;
	_bldpos1 	= (_x select 1) select 0;
	_bldpos2 	= (_x select 1) select 1;
		
	If (count _bldpos1 < _minpos) then {_bldpos1 = (_x select 1) select 1;_bldpos2 = _bldpos1;};
	if ("deletethis" in _bldpos1) then {_bldpos1 = _bldpos1 - ["deletethis"];};

	if ( count _bldpos1 >= _minpos ) then 
	{
		_cntobjs1 = 1;
		_movein = [];
		if (count _bldpos1 >= 3) then { _cntobjs1 =   round(random 1) + 2;};
		if (count _bldpos1 >= 8) then { _cntobjs1 =   round(random 2)  + 6;};
		if (count _bldpos1 >= 10) then {_cntobjs1 =   round(random 3)  + 7;};
			
		{							
			if (alive _x) then
			{
				If (canmove _x) then
				{
					If (vehicle _x == _x) then
					{
						If (_cntobjs1 > 0) then
						{
							_movein pushback _x;
							_cntobjs1 = _cntobjs1 - 1;
						};
					};
				};
			};
		} foreach  _units;
			
		if (count _movein > 0) then
		{
			{
				If (count _bldpos1 > 0) then
				{
					_result = [_bldpos1] call UPSMON_Checkfreebldpos;
					If (count _result > 0) then
					{
						_altura = _result select 0;
						_id2 = _result select 1;					
						[_x,_bld,_altura,_wait,_arraybld] spawn UPSMON_movetoBuilding;
						_bldpos1 set [_id2,"deletethis"];
						_bldpos1 = _bldpos1 - ["deletethis"];
						_units = _units - [_x];
					};
				};					
			} foreach _movein;
		};
	};
	_blds2 pushback [_bld,[_bldpos1,_bldpos2]];
} foreach _blds;
_blds = _blds2;


if (count _units > 0) then
{
	_i = _i + 1;
	_units = [_units,_blds,_wait,_i] call UPSMON_moveBuildings;
};

if (_i <= 1) then
{
	{
		_bld = _x select 0;
		If (!(typeof _bld in _UPSMON_Bld_ruins)) then {[_bld] execvm "Scripts\UPSMON\COMMON\UPSMON_CloseDoor.sqf";};
	} foreach _blds;
};

_units