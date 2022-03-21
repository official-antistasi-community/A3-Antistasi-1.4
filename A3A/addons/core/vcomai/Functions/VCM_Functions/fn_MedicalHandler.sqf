/*
	Author: Genesis

	Description:
		Makes group check medical status, and order medics about

	Parameter(s):
		0: GROUP

	Returns:
		NOTHING
*/

if !(VCM_MEDICALACTIVE) exitWith {};

params ["_group","_MedList"];
private _units = units _group;
private _Medics = _MedList;

{
	if (damage _x > 0) then
	{
		private _CanHealSelf = _x call VCM_fnc_HealSelf; 
		if !(_CanHealSelf) then
		{
			if (count _Medics > 0) then
			{
			
				private _FinalMedics = [];
				{
					if !(_x getVariable ["VCM_MBUSY", false]) then
					{
						_FinalMedics pushback _x;
					};
				} foreach _Medics;
				
				private _Medic = [_FinalMedics,_x,true,"MedicalHandler"] call VCM_fnc_ClstObj;
				[_Medic,_x] spawn VCM_fnc_MedicHeal;	
			
			};
		};
	};
} foreach _units;









