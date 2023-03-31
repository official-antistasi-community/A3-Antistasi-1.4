/*
    Author: [Hazey] [Genesis]

    Description:
		Give AI a chance to heal themselves in the field.

    Arguments:
    	<Object> Unit you want to do the check themselves for healing.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_unit] call A3A_fnc_patrolHealSelf;

    License: MIT License

	TODO:
		Add ace compatability.
*/

params ["_unit"];
private _CanHeal = false;

if (alive _unit && {"FirstAidKit" in (items _unit)}) then {
	if (damage _unit > 0.1) then {
		if (PATCOM_DEBUG) then {
			[_Unit, "HEALING SELF", 5, "Yellow"] call A3A_fnc_debugText3D;
		};
		_unit setdamage 0;
		_unit action ["HealSoldierSelf", _unit];	
	};
	_CanHeal = true;
};

_CanHeal