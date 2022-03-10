private _unit = _this select 0;

if (_unit getHit "head" >= 0.9) exitWith {true};
if (_unit getHit "body" >= 0.9) exitWith {true};
false
