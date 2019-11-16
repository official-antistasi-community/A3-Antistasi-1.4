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
private ["_grp","_leader","_side","_unitstotransport","_transportarray","_transportsselected","_transportgrp","_assignedvehicles","_cargonumber"];
	
_grp = _this select 0;
_leader = leader _grp;
_side = side _grp;

_unitstotransport = units _grp;

_transportarray = (call (compile format ["UPSMON_TRANSPORT_%1_UNITS",side _grp])) - [_grp];
_transportsselected = [];
_transportgrp = ObjNull;
_assignedvehicles = [];


{
	If (!IsNull _x) then
	{
		_group = _x;
		If (({alive _x} count units _group) > 0) then
		{
			If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "WAITING" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "RETURNBASE" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDBASE") then
			{
				_cargonumber = 0;
				{
					If (alive _x) then
					{
						If (canmove _x) then
						{
							If (vehicle _x != _x) then
							{
								If (!((vehicle _x) in _assignedvehicles)) then
								{
									_assignedvehicles pushback (vehicle _x);
									_Cargocfg  = getNumber  (configFile >> "CfgVehicles" >> typeof (vehicle _x) >> "transportSoldier");
									_unitsincargo = assignedCargo (vehicle _x);
									_cargonumber = _cargonumber + (_Cargocfg - (count _unitsincargo));
								};
							};
						};
					};
				} foreach units _group;
				
				If (_cargonumber >= count _unitstotransport) then
				{
					_transportsselected pushback _group;
				};
			};
		};
	};
} foreach _transportarray;

If (count _transportsselected > 0) then
{
	_transportgrp = _transportsselected select 0;
};

_transportgrp