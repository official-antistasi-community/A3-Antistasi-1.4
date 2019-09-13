params["_utility","_parameters"];
/*
["warden",[_detainee,_sentence]] call A3A_fnc_punishment_utils;
["release",[_detainee]] call A3A_fnc_punishment_utils;
["sentence",[_detainee]] call A3A_fnc_punishment_utils;
["forgive_addAction",[_detainee]] call A3A_fnc_punishment_utils;
["notifyAdmin",[_detainee]] call A3A_fnc_punishment_utils;
["notifyAdmin_find",[_detainee]] call A3A_fnc_punishment_utils;
*/

punishment_sentence = {
	params["_detainee"];
	_punishmentPlatform = createVehicle ["Land_Sun_chair_green_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_punishmentPlatform enableSimulation false;
	_detainee setVariable ["punishment_platform",_punishmentPlatform,true];
	
	_pos2D = [random 100,random 100];

	_punishmentPlatform setPos [_pos2D select 0, _pos2D select 1, -0.25];
	_detainee setPos [_pos2D select 0, _pos2D select 1, 0.25];
};
punishment_release = {
	params["_detainee"];

	_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_punishmentPlatform = _detainee getVariable ["punishment_platform",objNull];
	_lastOffenceData = _punishment_vars select 2;
	_punishment_warden = (_punishment_vars select 3) select 0;
	_punishment_sentence = (_punishment_vars select 3) select 1;

	if !(scriptDone _punishment_warden || isNull _punishment_warden) then {terminate _punishment_warden;};
	if !(scriptDone _punishment_sentence || isNull _punishment_sentence) then {terminate _punishment_sentence;};

	_detainee switchMove "";
	_detainee setPos posHQ;
	deleteVehicle _punishmentPlatform;

	_punishment_timeTotal = 0;
	_punishment_offenceTotal = 0.1;
	_lastOffenceData set [1,0];		//[lastTime,overhead]
	_punishment_vars = [_punishment_timeTotal,_punishment_offenceTotal,_lastOffenceData,[scriptNull,scriptNull]];;		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_detainee setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,[wardenHandle,sentenceHandle]]
	_detainee setVariable ["punishment_coolDown",0,true]; 
};
punishment_warden = {
	params["_detainee","_sentence"];
	
	_detainee setVariable ["punishment_coolDown", 2, true]; 
	_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_punishment_warden_handle = _thisScript;
	_punishment_sentence_handle = ["sentence",[_detainee]] call A3A_fnc_punishment_utils;
	["forgive_addAction",[_detainee]] call A3A_fnc_punishment_utils;
	["notifyAdmin_find",[_detainee]] call A3A_fnc_punishment_utils;
	///////////////////////// TODO: PLAYER TEAM FORGIVE SCRIPT
	_punishment_vars set [3,[_punishment_warden_handle,_punishment_sentence_handle]];
	_detainee setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_countX = floor _sentence;
	while {_countX > 0} do
	{
		[ format["Please do not teamkill. Play with the turtles for %1 more seconds.",_countX]] remoteExec ["hintSilent", _detainee, false];
		uiSleep 1;
		_countX = _countX -1;
	};
	["Enough then."] remoteExec ["hint", _detainee, false];
	["release",[_detainee]] call A3A_fnc_punishment_utils;
};
punishment_forgive_addAction = {
	params["_detainee"];

	_addAction_parameters =
	[
		"[ADMIN] Forgive Player", 
		{
			params ["_detainee", "_caller", "_actionId", "_arguments"];
			if ([] call BIS_fnc_admin > 0 || isServer) then 
			{
				[_detainee,_actionId] remoteExec ["removeAction",0,false];
				[_detainee,-99999, -1] call A3A_fnc_punishment;
			};
		}
	];
	[_detainee,_addAction_parameters] remoteExec ["addAction",0,false];
};
punishment_notifyAdmin = {
	params["_detainee"];
	if ([] call BIS_fnc_admin > 0 || isServer) then 
	{ 
		hint format ["%1 has been found guilty of TK.\nIf you believe this is a mistake, you can forgive him with a scroll-menu action on hist body.\nHe is at the bottom left corner of the map.",name _detainee];
	};
};
punishment_notifyAdmin_find = {
	params["_detainee"];
	["notifyAdmin_find",[_detainee]] remoteExec ["A3A_fnc_punishment_utils",0,false];
};

_return = switch (_utility) do {
	case "warden": {_punishment_warden_handle = _parameters spawn punishment_warden; _punishment_warden_handle;};
	case "sentence": {_punishment_sentence_handle = _parameters spawn punishment_sentence; _punishment_sentence_handle;};
	case "release": {_parameters call punishment_release; scriptNull;};
	case "forgive_addAction": {_parameters call punishment_forgive_addAction; scriptNull;};
	case "notifyAdmin": {_parameters call punishment_notifyAdmin; scriptNull;};
	case "notifyAdmin_find": {_parameters call punishment_notifyAdmin_find; scriptNull;};
	///////////////////////// TODO: PLAYER TEAM FORGIVE SCRIPT
	default {scriptNull};
};
_return