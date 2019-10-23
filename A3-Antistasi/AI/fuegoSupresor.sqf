private ["_unit","_eny"];
_unit = _this select 0;
if ({isPlayer _x} count (units group _unit) > 0) exitWith {};
_eny = _this select 1;
if (time < _unit getVariable ["supressing",time - 1]) exitWith {};
if (([objNull, "VIEW"] checkVisibility [eyePos _eny, eyePos _unit]) == 0) exitWith {};
_unit setVariable ["supressing",time + 60];

_unit commandSuppressiveFire _eny;
_unit suppressFor 10;
