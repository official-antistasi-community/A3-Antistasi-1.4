if !(membershipEnabled) exitWith {true};
_obj = (_this select 0) getVariable ["owner",_this select 0];
if (isNil "miembros") then {waitUntil {sleep 0.5; !(isNil "miembros")}};
if !((getPlayerUID _obj) in miembros) exitWith {false};
true
