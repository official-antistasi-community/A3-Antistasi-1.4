/*
    Author: [Hazey] [Genesis]

    Description:
		Do actions when unit is hit.

    Arguments:
		<Object> Unit the eventhandler is assigned to.
		<Object> Source that caused the damage.
		<Number> Level of damage caused by the hit.
		<Object> Person who pulled the trigger.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		_x addEventHandler ["Suppressed", {_this call A3A_fnc_patrolSuppressionEH;}];
    License: MIT License
*/

params ["_unit", "_source", "_damage", "_instigator"];

private _unitStance = Stance _unit;
if !(_unitStance isEqualTo "PRONE") then {	
	[_unit] spawn {
		params ["_unit"];
		sleep 5 + random 5;
		_unit call A3A_fnc_patrolHealSelf;
	}; 

	_unit setUnitPos "DOWN";

	[_unit, _unitStance] spawn  {
		params ["_unit","_Pos"];
		sleep 5;
		if (alive _unit) then {
			_unit setUnitPos "AUTO";
		};
	};
};