/****************************************************************
File: UPSMON_Returnbase.sqf
Author: Azroul13

Description:
	Make the transport return to the base

Parameter(s):
	<--- Vehicle
Returns:
	nothing
****************************************************************/

private["_transport","_grp","_basepos"];				

_transport = _this select 0;
_grp = group _transport;

_basepos = (_grp getvariable "UPSMON_Origin") select 0;

if (!alive _transport) exitwith{};

If (_transport iskindof "Air") then
{
	_grp setvariable ["UPSMON_Transportmission",["LANDBASE",_basepos,ObjNull]];
	_grp setvariable ["UPSMON_ChangingLZ",false];
	[_grp,_basepos,"MOVE","COLUMN","FULL","CARELESS","YELLOW",1,UPSMON_flyInHeight] call UPSMON_DocreateWP;
}
else
{
	_grp setvariable ["UPSMON_Transportmission",["RETURNBASE",_basepos,ObjNull]];
	[_grp,_basepos,"MOVE","COLUMN","NORMAL","SAFE","YELLOW",1] call UPSMON_DocreateWP;
};