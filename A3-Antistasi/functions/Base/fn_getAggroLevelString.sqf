params ["_level"];

if(_level == 1) exitWith {"Low"};
if(_level == 2) exitWith {"Medium"};
if(_level == 3) exitWith {"High"};
if(_level == 4) exitWith {"Very High"};
if(_level == 5) exitWith {"Extreme"};

[1, format ["Bad level recieved, cannot generate string, was %1", _level], "calculateAggression", true] call A3A_fnc_log;
"None"
