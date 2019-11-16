private ["_unit"];
//esto habrá que meterlo en onplayerrespawn también
_unit = _this select 0;
//_unit setVariable ["inconsciente",false,true];

_unit setVariable ["respawning",false];
_unit addEventHandler ["HandleDamage", A3A_fnc_handleDamage];
