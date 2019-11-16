/****************************************************************
File: UPSMON_CheckTransport.sqf
Author: Azroul13

Description:
	Return if the group keep doing transport

Parameter(s):
	<--- Group
Returns:
	Group transported
****************************************************************/

private["_grp","_grouptransported"];				

_grp = _this select 0;
_grouptransported = ObjNull;

If (!IsNull ((_grp getvariable ["UPSMON_Transportmission",[]]) select 2)) then 
{
	If ({alive _x && !(captive _x)} count units ((_grp getvariable ["UPSMON_Transportmission",[]])select 2) > 0) then
	{
		If (_grp getvariable ["UPSMON_Grpmission",""] == "WAITTRANSPORT") then
		{
			_grouptransported = (_grp getvariable ["UPSMON_Transportmission",[]])select 2;
		};
	};
};

_grouptransported