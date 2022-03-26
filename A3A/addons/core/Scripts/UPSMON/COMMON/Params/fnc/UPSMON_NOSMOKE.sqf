/****************************************************************
File: UPSMON_BackToNormal.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- group
Returns:
	Nothing
****************************************************************/
private["_grp","_nosmoke"];	

_grp = _this select 0;
_nosmoke = true;

If (random 100 > UPSMON_USE_SMOKE) then
{	
	If (_grp getvariable ["UPSMON_SmokeTime",0] < time) then
	{
		If (!(_grp getvariable ["UPSMON_NOSMOKE",false])) then
		{
			_nosmoke = false;
		};
	};
};

_nosmoke
