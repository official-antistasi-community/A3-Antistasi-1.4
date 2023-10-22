params ["_unit"];

if (!(isNil {_unit getVariable "ace_isEngineer"}) && _unit getVariable "ace_isEngineer" > 0) exitWith { true };

_unit getUnitTrait "engineer";
