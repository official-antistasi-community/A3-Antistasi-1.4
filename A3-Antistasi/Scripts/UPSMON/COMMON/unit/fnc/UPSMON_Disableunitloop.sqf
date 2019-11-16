/****************************************************************

****************************************************************/
private["_unit"];

_unit = _this select 0;

waituntil {IsNull _unit || !alive _unit || !IsNull ((group _unit) getvariable ["UPSMON_target",Objnull]) || _unit getvariable ["UPSMON_SUPSTATUS",""] != "" || _unit getvariable ["UPSMON_Wait",time] <= time};

if (!IsNull _unit) then
{
	If (alive _unit) then
	{
		[_unit,""] remoteExec ["switchMove"];
		_unit enableAI "MOVE";
		_unit setvariable ["UPSMON_Civdisable",false];
	};
};