/****************************************************************
File: UPSMON_Splashzone.sqf
Author: Azroul13

Description:
	check if there's allied near the targetpos.

Parameter(s):
	<--- Arti unit
	<--- Mission fire
Returns:
	boolean
****************************************************************/

private ["_grp","_result","_artillerysideFire","_artillerysideunits"];

_grp = _this select 0;
_result = false;

If (!(_grp getvariable ["UPSMON_NOARTILLERY",false])) then
{
	If (_grp getvariable ["UPSMON_RADIORANGE",0] > 0) then
	{
		If (_grp getvariable ["UPSMON_Articalltime",time] <= time) then
		{
			If (_grp getvariable ["UPSMON_Grpmission",""] != "AMBUSH") then
			{
				If (_grp getvariable ["UPSMON_Grpmission",""] != "SURRENDER") then
				{
					_artillerysideFire = call (compile format ["UPSMON_ARTILLERY_%1_FIRE",side _grp]);
					If (_artillerysideFire) then
					{
						_artillerysideunits = call (compile format ["UPSMON_ARTILLERY_%1_UNITS",side _grp]);
						If (count _artillerysideunits > 0) then
						{
							_result = true;
						};
					};
				};
			};
		};
	};
};

_result