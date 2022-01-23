/****************************************************************
File: UPSMON_SetTemplate.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- Spawned parameter
	<--- template number
	<--- Side of the group
Returns:

****************************************************************/
private["_spawned","_template","_side","_unitstypes"];	

_spawned= _this select 0;
_template = _this select 1;
_side = _this select 2;
_unitstypes = _this select 3;

//Fills template array for spawn
if (_template > 0 && !_spawned) then 
{
	UPSMON_TEMPLATES = UPSMON_TEMPLATES + ( [[_template]+[_side]+_unitstypes select 0+_unitstypes select 1] );
	if (UPSMON_Debug>0) then 
	{
		diag_log format["Adding TEMPLATE %1 _spawned %2",_template,_spawned];
	};		
};