/****************************************************************
File: UPSMON_GothitParam.sqf
Author: Azroul13

Description:
	Is the unit hit ? Or Does it under fire ?
	
Parameter(s):
	<--- unit
Returns:
	Boolean
****************************************************************/

private ["_npc","_gothit"];
	
_npc = _this select 0;
_gothit = false;
	
If (isNil "tpwcas_running") then 
{
	if (group _npc in UPSMON_GOTHIT_ARRAY || group _npc in UPSMON_GOTKILL_ARRAY) then
	{
			_gothit = true;
	};
}
else
{
	_Supstate = [_npc] call UPSMON_supstatestatus;
	if (group _npc in UPSMON_GOTHIT_ARRAY || group _npc in UPSMON_GOTKILL_ARRAY || _Supstate >= 2) then
	{
		_gothit = true;
	};
};
	
_gothit