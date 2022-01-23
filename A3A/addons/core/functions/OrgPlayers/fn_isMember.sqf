if !(membershipEnabled) exitWith {true};
_obj = (_this select 0) getVariable ["owner",_this select 0];
if (isNil "membersX") then {waitUntil {sleep 0.5; !(isNil "membersX")}};
if !((getPlayerUID _obj) in membersX) exitWith {false};
true
