private ["_unit"];
//esto habrá que meterlo en onplayerrespawn también // ENGLISH: this will have to be put in onplayerrespawn too
_unit = _this select 0;
//_unit setVariable ["inconsciente",false,true];

_unit setVariable ["respawning",false];
[_unit] remoteExecCall ["A3A_fnc_punishment_FF_addEH",_unit,false];
_unit addEventHandler ["HandleDamage", A3A_fnc_handleDamage];
waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyUp", { // If I used KeyDown, I would need a extra variable for tracking press state.
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"]; // https://community.bistudio.com/wiki/User_Interface_Event_Handlers#onKeyDown
	if (inputAction "User12" > 0) then { // Will be selectable when client-side preferences, Soon™.
		[] call A3A_fnc_dismissHint;
	};
	false;
}];
