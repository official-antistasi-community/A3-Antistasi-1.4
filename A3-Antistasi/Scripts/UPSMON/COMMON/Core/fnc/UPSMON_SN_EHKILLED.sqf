/****************************************************************
File: UPSMON_SN_EHHIT.sqf
Author: Rafalsky

Description:

Parameter(s):

Returns:

****************************************************************/
private ["_unit","_shooter","_grpId"];
_unit = _this select 0;
_shooter = _this select 1;
if (typeName _shooter != typeName objNull) then {_shooter = _unit};//added by Barbolani to avoid .rpt error
_grp = group _unit;


if (!(_unit in UPSMON_GOTKILL_ARRAY)) then
{
	if (side _unit != side _shooter) then
	{
		_alliednear = false;

		{
			if (alive _x) then
			{
				if (getposATL _unit vectordistance getposATL _x <= 30) exitwith
				{
					_alliednear = true;
				};
			};
		} foreach units _grp;

		If (_alliednear) then
		{
			UPSMON_GOTKILL_ARRAY pushback _unit;
			//if (UPSMON_Debug > 0) then {player globalchat format["UNIT: %1, SHOOTER :%2 %3",_unit,_shooter,side _shooter]};
		};
	};
};