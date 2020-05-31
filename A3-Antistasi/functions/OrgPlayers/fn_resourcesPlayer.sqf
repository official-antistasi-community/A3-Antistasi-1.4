_moneyX = _this select 0;

_moneyX = _moneyX + (player getVariable "moneyX");
if (_moneyX < 0) then {_moneyX = 0};
player setVariable ["moneyX",_moneyX,true];
[] spawn A3A_fnc_statistics;
true
