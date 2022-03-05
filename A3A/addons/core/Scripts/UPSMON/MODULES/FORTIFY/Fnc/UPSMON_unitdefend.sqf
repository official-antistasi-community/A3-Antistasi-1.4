/****************************************************************
File: UPSMON_unitdefend.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- group
	<--- Distance between group and nearest enemy
Returns:
	nothing
****************************************************************/

private ["_grp","_dist","_supstatus","_unit","_inbuilding","_NearestEnemy","_cansee","_poseni","_distance","_unitdirchk","_watch","_abx","_aby","_abz","_vec","_result","_bld","_bldpos","_pos"];
	
_grp = _this select 0;
_dist = _this select 1;
	
_grp setvariable ["UPSMON_Checkbuild",true]; 
{
	_unit = _x;
	if (alive _unit && !captive _unit) then
	{
		If (vehicle _unit == _unit) then
		{
			_inbuilding = [_unit] call UPSMON_Inbuilding;
			If (_inbuilding) then
			{
				_NearestEnemy = _unit findNearestEnemy _unit;
				_supstatus = _unit getvariable ["UPSMON_SUPSTATUS",""];
				if (_supstatus != "SUPRESSED") then 
				{
					_cansee = true;
					if (stance _unit in ["CROUCH","PRONE"]) then {_unit setunitpos "MIDDLE";_cansee = [_unit,getdir _unit,10] call UPSMON_CanSee;}; 
					if (!_cansee) then {_unit setunitpos "UP";};
				};
				if (!IsNull _NearestEnemy && alive _NearestEnemy) then
				{
					_poseni = getposATL _NearestEnemy;
					_distance = [getposATL _unit,_poseni] call UPSMON_distancePosSqr;
					If (_distance <= 300) then
					{
						_haslos = [_unit,_NearestEnemy,300,130] call UPSMON_Haslos;
						If (_haslos) then
						{
							[_unit,_NearestEnemy] call UPSMON_Dowatch;
							sleep 0.5;
							_unit dotarget ObjNull;
							_unit dotarget _NearestEnemy;
						}
						else
						{
							if (_distance < 100 && (_supstatus != "SUPRESSED" || _supstatus != "UNDERFIRE")) then
							{
								_unitdirchk = _unit getvariable ["UPSMON_unitdir",[]];
								If (count _unitdirchk > 0) then
								{
									_watch = [];
									If (_dist <= 150 && random 100 < 60) then {_watch = (_unit getvariable "UPSMON_unitdir") select 1} else {_watch = (_unit getvariable "UPSMON_unitdir") select 0};
									_posATL = getPosATL _unit;
									If (count _watch > 0) then
									{
										_abx = (_watch select 0) - (_posATL select 0);
										_aby = (_watch select 1) - (_posATL select 1);
										_abz = (_watch select 2) - (_posATL select 2);

										_vec = [_abx, _aby, _abz];

										// Main body of the function;
										_unit setdir 0;
										_unit setVectorDir _vec;		
		
										sleep 0.1;
										_unit dowatch ObjNull;
										_unit dowatch _watch;
										sleep 0.5;
									}
									else
									{
										If (!_cansee) then {[_unit,getdir _unit,false] spawn UPSMON_WillSee;};
									};
								};								
							}
							else
							{
								_result = _unit getvariable ["UPSMON_buildingpos",[]];
								If (count _result > 0 && random 100 < 30) then
								{
									_bld = _result select 0;
									_allpos = [_bld,"RANDOMA"] call UPSMON_SortOutBldpos; 
									_allpos = _allpos select 0;
									_bldpos = [];
									{
										_pos = _x;
										If (count (_pos nearEntities ["CAManBase",1]) == 0) then 
										{
											If ([_pos,_poseni] call UPSMON_los) then
											{
												_bldpos pushback _pos;
											};
										};
									} foreach _allpos;
										
									if (count _bldpos > 0) then
									{
										_bldpos = _bldpos select 0;
										dostop _unit;
										_unit domove _bldpos;
										_unit commandMove _bldpos;
										_unit setDestination [_bldpos, "LEADER PLANNED", true];
									};
								};
							};
						};
					};
				};
			};
		};
	};
	sleep 0.01;
}foreach units _grp;
sleep 15;
_grp setvariable ["UPSMON_Checkbuild",false]; 