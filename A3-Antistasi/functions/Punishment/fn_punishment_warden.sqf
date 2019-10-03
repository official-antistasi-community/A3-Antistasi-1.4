params["_detainee","_sentence"];

_detainee setVariable ["punishment_coolDown", 2, true]; 
_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
_punishment_warden_handle = _thisScript;
_punishment_sentence_handle = [_detainee] call A3A_fnc_punishment_sentence;
[_detainee] call A3A_fnc_punishment_addActionForgive;
[_detainee] call A3A_fnc_punishment_notifyAllAdmins;
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
[_detainee] call A3A_fnc_punishment_release;