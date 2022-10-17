private _markerX = _this select 0;
if !(dateToNumber date > server getVariable [_markerX,0]) exitWith {false};
if (_markerX == "CSAT_Carrier" or _markerX == "NATO_Carrier") exitWith {true};

if ((spawner getVariable _markerX) == 0) exitWith {false};
if (!(_markerX in airportsX) and !(_markerX in outposts)) exitWith {false};
if (count (garrison getVariable [_markerX,[]]) < 16) exitWith {false};
if (_markerX in forcedSpawn) exitWith {false};
true
