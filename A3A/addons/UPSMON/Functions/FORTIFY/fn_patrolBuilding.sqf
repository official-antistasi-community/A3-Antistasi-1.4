/****************************************************************
File: UPSMON_patrolBuilding.sqf
Author: Monsada

Description:
	unit will patrol in building

Parameter(s):
	<--- soldier to move
	<--- building to patrol
	<--- positions of building (optional)
Returns:
	nothing
****************************************************************/

private ["_units","_bldpos","_grp","_movein","_currpos","_attackpos","_unit","_patrolto","_time"];

_units = _this select 0;
_bldpos = _this select 1;
_grp = _this select 2;
_time = _this select 3;

_grp setVariable ["UPSMON_inbuilding",true];

_units = [_units] call UPSMON_Getunits;
_movein = [];
if (count _units > 0) then
	{
	_currpos = getposATL (_units select 0);
	_attackpos = _currpos;

	If ("deletethis" in _bldpos) then {_bldpos = _bldpos - ["deletethis"]};
	If (count _bldpos > 0) then
	{
		_attackpos = _bldpos select 0;
	};

	{
		_unit = _x;
		If (alive _unit) then
		{
			If (vehicle _unit == _unit) then
			{
				If (Unitready _unit) then
				{
					If ("deletethis" in _bldpos) then {_bldpos = _bldpos - ["deletethis"]};
					If (count _bldpos > 0) then
					{
						_patrolto = _bldpos select 0;
						_bldpos set [0,"deletethis"];
						_bldpos = _bldpos - ["deletethis"];
						Dostop _unit;
						_unit domove _patrolto;
						_unit setdestination [_patrolto,"LEADER PLANNED",true];
						_movein pushback _unit;
					};
				};
			};
		};
	} foreach _units;

	sleep _time;

	_time = (((_attackpos vectordistance _currpos)*1.2) + 5);

	If (_grp getvariable ["UPSMON_Grpmission",""] != "PATROLINBLD" || _grp getvariable ["UPSMON_Grpmission",""] != "ASSAULT") exitwith {_grp setVariable ["UPSMON_inbuilding",false];};

	If (count _bldpos > 0 && count _units > 0) then
	{
		[_units,_bldpos,_grp,_time] call UPSMON_patrolBuilding;
	};

	_grp setVariable ["UPSMON_inbuilding",false];
	};