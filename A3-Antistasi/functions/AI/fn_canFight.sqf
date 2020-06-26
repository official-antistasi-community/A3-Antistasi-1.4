private _unit = _this select 0;

if (isNull _unit) exitWith {false};
if (!alive _unit) exitWith {false};
if (captive _unit) exitWith {false};
if (_unit getVariable ["incapacitated",false]) exitWith {false};
if (_unit getVariable ["surrendered",false]) exitWith {false};
if (getSuppression _unit == 1) exitWith {false};
true