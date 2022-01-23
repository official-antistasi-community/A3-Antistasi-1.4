/****************************************************************
File: UPSMON_fnc_setVehicleVarName.sqf
Author: Ollem

Description:
	Replacement of "setvehicleinit" command. 
Parameter(s):
	<--- netid object
	<--- unit name
Returns:
	Nothing
****************************************************************/

private ["_netID","_unit","_unitname"];
	
_netID = _this select 0;
_unit = objectFromNetID _netID;
_unitname = _this select 1;
	
_unit setVehicleVarName _unitname;
_unit call compile format ["%1=_This; PublicVariable ""%1""",_unitname];
	
if (UPSMON_Debug>0) then { diag_log format ["UPSMON 'UPSMON_fnc_setVehicleVarName': %1=_This; PublicVariable ""%1""",_unitname]; };