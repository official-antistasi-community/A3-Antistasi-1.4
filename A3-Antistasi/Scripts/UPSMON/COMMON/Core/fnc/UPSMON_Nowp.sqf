/****************************************************************
File: UPSMON_Nowp.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/

private ["_grp","_target","_supstatus","_nowp"];

_grp = _this select 0;
_target = _this select 1;
_supstatus = _this select 2;

_nowp = true;

If (_grp getvariable ["UPSMON_NOWP",0] == 0) then
{
	If (_grp getvariable ["UPSMON_Grpmission",""] != "AMBUSH") then
	{
		If (_grp getvariable ["UPSMON_Grpmission",""] != "FORTIFY") then
		{
			If (_grp getvariable ["UPSMON_Grpmission",""] != "RETREAT") then
			{
				If (_grp getvariable ["UPSMON_Grpmission",""] != "SURRENDER") then
				{
					_nowp = false;
				};
			}
		};
	};
}
else
{
	switch (_grp getvariable ["UPSMON_NOWP",0]) do
	{
		case 1:
		{
			If (!IsNull _target) then
			{
				_nowp = false;
			};
		};
		case 2:
		{
			If (_supstatus == "INCAPACITED") then
			{
				_nowp = false;
			};
		};
		case 3:
		{
			//Always Nowp = true
		};
	};
};

_nowp