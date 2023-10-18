params ["_unit"];

if !(isNil {_unit getVariable "ace_isEngineer"}) exitWith { true };

_unit getUnitTrait "engineer";
