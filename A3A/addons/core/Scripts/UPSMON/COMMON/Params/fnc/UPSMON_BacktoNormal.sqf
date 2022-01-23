/****************************************************************
File: UPSMON_BackToNormal.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- group
Returns:
	Nothing
****************************************************************/
private["_npc","_Ucthis","_behaviour"];

_grp = _this select 0;

_grp setvariable ["UPSMON_Grpstatus","GREEN"];

If (_grp getvariable ["UPSMON_NOWP",0] > 0) then
{
//	[_grp,((_grp getvariable "UPSMON_Origin") select 0),"MOVE",((_grp getvariable "UPSMON_Origin") select 1),((_grp getvariable "UPSMON_Origin") select 2),((_grp getvariable "UPSMON_Origin") select 3),"YELLOW",1] spawn UPSMON_DocreateWP;
	[_grp,((_grp getvariable "UPSMON_Origin") select 0),"MOVE",((_grp getvariable "UPSMON_Origin") select 3),((_grp getvariable "UPSMON_Origin") select 2),((_grp getvariable "UPSMON_Origin") select 1),"YELLOW",1] spawn UPSMON_DocreateWP;//corrected by barbolani
}
else
{
	_grp setbehaviour ((_grp getvariable "UPSMON_Origin") select 1);
	_grp setspeedmode ((_grp getvariable "UPSMON_Origin") select 2);
	_grp setformation ((_grp getvariable "UPSMON_Origin") select 3);
};

_grp setvariable ["UPSMON_Grpmission",_grp getvariable "UPSMON_OrgGrpmission"];
