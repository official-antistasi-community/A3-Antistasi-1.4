/****************************************************************
File: UPSMON_GetTransport.sqf
Author: Azroul13

Description:
	Search for a valid patrol position.

Parameter(s):
	<--- group
Returns:
	Transport group
****************************************************************/
private ["_grp","_leader","_side","_supplyneeded","_supplyarray","_supplyselected","_supplygrp","_assignedvehicles","_cargonumber"];
	
_grp = _this select 0;
_supplyneeded = _grp getvariable ["UPSMON_Supplyneeded",[]];
_leader = leader _grp;
_side = side _grp;

_supplyarray = (call (compile format ["UPSMON_SUPPLY_%1_UNITS",side _grp])) - [_grp];
_supplyselected = [];
_supplygrp = ObjNull;


{
	If (!IsNull _x) then
	{
		_group = _x;
		If (({alive _x} count units _group) > 0) then
		{
			If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "WAITING" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "RETURNBASE" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDBASE") then
			{
				_assignedvehicles = [];
				_cargonumber = 0;
				{
					If (alive _x) then
					{
						If (canmove _x) then
						{
							If (vehicle _x != _x) then
							{
								_support =  tolower gettext (configFile >> "CfgVehicles" >> typeof _vehicle >> "vehicleClass");
								If (_support == "Support") then
								{
									If (!((vehicle _x) in _assignedvehicles)) then
									{
										_repair = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "transportRepair");
										_fuel = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "transportFuel");
										_munsupply = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "attendant");
										
										If ("repair" in _supplyneeded) then
										{
											if (_repair > 0) then
											{
												_points = _points + _repair;
											};
										};
										
										If ("fuel" in _supplyneeded) then
										{
											if (_fuel > 0) then
											{
												_points = _points + _fuel;
											};
										};

										If ("munition" in _supplyneeded) then
										{
											if (_munsupply > 0) then
											{
												_points = _points + _munsupply;
											};
										};
										
										_supplyselected pushback [_group,_points];
									};
								};
							};
						};
					};
				} foreach units _group;
			};
		};
	};
} foreach _supplyarray;

If (count _supplyselected > 0) then
{
	_supplyselected = [_supplyselected, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy;
	_supplygrp = (_supplyselected select 0) select 0;
};

_supplygrp