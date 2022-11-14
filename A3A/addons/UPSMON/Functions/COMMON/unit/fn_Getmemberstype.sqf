/****************************************************************
File: UPSMON_Getmemberstype.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- members of the group
Returns:
	Array: [[],[]]
****************************************************************/

private ["_members","_vehicles","_equipment","_membertypes","_vehicletypes","_dirveh","_unitstype"];
	
_members = _this select 0;
_vehicles = [];
_membertypes = [];
_vehicletypes = [];

//Fills member soldier types
{	
	if (vehicle _x != _x ) then 
	{
		if (!(vehicle _x in _vehicles)) then
		{
			_vehicles pushback (vehicle _x);
		};
	};
	
	_equipment = _x call UPSMON_getequipment;
	//_membertypes = _membertypes + [[typeof _x,_equipment]];
	_membertypes pushback [typeof _x,_equipment,assignedVehicleRole _x];
} foreach _members;

//Fills member vehicle types
{
	_dirveh = getdir _x;
	_unitsin = [];
	
	//_vehicletypes = _vehicletypes + [typeof _x,_dirveh,_unitsin];
	_vehicletypes pushback [typeof _x,_dirveh];
} foreach _vehicles;

_unitstype = [_membertypes,_vehicletypes];
If (UPSMON_Debug > 0) then {Diag_log format ["Units Array:%1",_unitstype]};
_unitstype