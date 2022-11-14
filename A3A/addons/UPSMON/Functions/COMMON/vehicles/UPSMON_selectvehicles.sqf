/****************************************************************
File: UPSMON_selectvehicles.sqf
Author: Azroul13

Description:
	Funci�n que busca vehiclesX closeX y hace entrar a las unitsX del lider
Parameter(s):
	<--- Units
	<--- Array of vehicles
	<--- Do the unit needs to be spawn in the vehicle
Returns:
	Array of units moving to vehicle
****************************************************************/
private["_units","_vehicles","_spawninveh","_grpid","_vehicle","_emptypositions","_i","_vehgrpid","_cargo"];
	
_units = _this select 0;
_vehicles = _this select 1;	
_spawninveh = false;
if ((count _this) > 2) then {_spawninveh = _this select 2;};
	
_grpid = (group (_units select 0)) getvariable ["UPSMON_Grpid",0];
_unitsIn = [];
	
If (count _vehicles > 0) then
{
	{
		if ((count _units) == 0 )  exitwith {_units};
		_vehicle = _x select 0;
		_emptypositions = _x select 1;
		_i = 0;
		_unitsmoveIn = [];
		_cargo = _vehicle getVariable ["UPSMON_cargo",[]];
			
		_vehicle setVariable ["UPSMON_grpid", _grpid, false];
				
		_emptypositions = _emptypositions - (count crew _vehicle);
				
		while {_i < _emptypositions && _i < count _units} do
		{
			_unit = _units select _i;
			_unitsmoveIn pushback _unit;
			_unitsIn pushback _unit;
			_i = _i + 1;
		};
			
		_units = _units - _unitsmoveIn;
		
		If (count _unitsmoveIn > 0) then
		{
			[_grpid,_unitsmoveIn,_vehicle,_spawninveh] spawn UPSMON_UnitsGetIn;	
			if (UPSMON_Debug>0 ) then {player sidechat format["%1: Get in %2 %3 units of %4 available",_grpid,typeof _vehicle,count _unitsmoveIn,_emptypositions]}; 				
			if (UPSMON_Debug>0 ) then {diag_log format["UPSMON %1: Moving %3 units into %2 with %4 positions",_grpid,typeof _vehicle,count _unitsmoveIn,_emptypositions]}; 
		};
	} foreach _vehicles;
};
	
_unitsIn