private ["_unit"];
//esto habrá que meterlo en onplayerrespawn también // ENGLISH: this will have to be put in onplayerrespawn too
_unit = _this select 0;
//_unit setVariable ["inconsciente",false,true];

_unit setVariable ["respawning",false];
[_unit] remoteExecCall ["A3A_fnc_punishment_FF_addEH",_unit,false];
_unit addEventHandler ["HandleDamage", A3A_fnc_handleDamage];
