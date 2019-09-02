params["_utllity","_parameters"];
/*
["warden",[_detainee,_sentence]] call A3A_fnc_punishment_utills;
["release",[_detainee]] call A3A_fnc_punishment_utills;
["sentance",[_detainee]] call A3A_fnc_punishment_utills;
["forgive_addAction",[_detainee]] call A3A_fnc_punishment_utills;
*/

punishment_sentance = {
	params["_detainee"];
	//_detainee switchMove "HubSpectator_standu"; //They should move on their little surf board.
	_punishmentPlatform = createVehicle ["Land_Sun_chair_green_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_punishmentPlatform enableSimulation false;
	_detainee setVariable ["punishment_platform",_punishmentPlatform,true];
	
	_pos2D = [random 100,random 100];

	_punishmentPlatform setPos [_pos2D select 0, _pos2D select 1, -0.25];
	_detainee setPos [_pos2D select 0, _pos2D select 1, 0.25];

	/*
	_detainee removeMagazines (primaryWeapon _detainee);
	removeAllItemsWithMagazines _detainee;
	_detainee removeMagazines (secondaryWeapon _detainee);
	_detainee removeWeaponGlobal (primaryWeapon _detainee);
	_detainee removeWeaponGlobal (secondaryWeapon _detainee);
	*/

	//uiSleep 0.2;
	//["Being an asshole is not a desired skill of the general Antistasi player."] remoteExec ["hint", _detainee, false];
	//uiSleep 5.2;
	//["This is a COOP game and you are welcome to do so."] remoteExec ["hint", _detainee, false];
	//uiSleep 5.2;
	//["If you are bored, I think there is a new episode on SpongeBob Square Pants today."] remoteExec ["hint", _detainee, false];
};
punishment_release = {
	params["_detainee"];

	_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,[wardenHandle,sentanceHandle]]
	_punishmentPlatform = _detainee getVariable ["punishment_platform",objNull];
	_punishment_warden = (_punishment_vars select 2) select 0;
	_punishment_sentance = (_punishment_vars select 2) select 1;

	if !(scriptDone _punishment_warden || isNull _punishment_warden) then {terminate _punishment_warden;};
	if !(scriptDone _punishment_sentance || isNull _punishment_sentance) then {terminate _punishment_sentance;};

	_detainee switchMove "";
	_detainee setPos posHQ;
	deleteVehicle _punishmentPlatform;

	_punishment_timeTotal = 0;
	_punishment_offenceTotal = 0.1;
	_punishment_vars = [_punishment_timeTotal,_punishment_offenceTotal,[scriptNull,scriptNull]];;		//[timeTotal,offenceTotal,[wardenHandle,sentanceHandle]]
	_detainee setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,[wardenHandle,sentanceHandle]]
	_detainee setVariable ["punishment_coolDown",0,true]; 
};
punishment_warden = {
	params["_detainee","_sentence"];
	_detainee setVariable ["punishment_coolDown", 2, true]; 
	_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,[wardenHandle,sentanceHandle]]
	_punishment_warden_handle = _thisScript;
	_punishment_sentance_handle = [_detainee] spawn punishment_sentance;
	///////////////////////// TODO: PLAYER TEAM FORGIVE SCRIPT
	// ADD ME
	//////////////////////////
	_punishment_vars set [2,[_punishment_warden_handle,_punishment_sentance_handle]];
	_detainee setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,[wardenHandle,sentanceHandle]]
	_countX = _sentence;
	while {_countX > 0} do
	{
		[ format["Please do not teamkill. Play with the turtles for %1 more seconds.",_countX]] remoteExec ["hint", _detainee, false];
		uiSleep 1;
		_countX = _countX -1;
	};
	["Enough then."] remoteExec ["hint", _detainee, false];
	["release",[_detainee]] call A3A_fnc_punishment_utills;
};
punishment_forgive_addAction = {
	params["_detainee"];

	_addAction_paramerters =
	[
		"[ADMIN] Forgive Player", 
		{
			params ["_detainee", "_caller", "_actionId", "_arguments"];
			if ([] call BIS_fnc_admin == 0 && !isServer) exitWith {}; 
			[_detainee,_actionId] remoteExec ["removeAction",0,false];
			[_detainee,-99999, -1] call A3A_fnc_punishment;
		}
	];
	[_detainee,_addAction_paramerters] remoteExec ["addAction",0,false];
};

_return = switch (_utllity) do {
	case "warden": {_punishment_warden_handle = _parameters spawn punishment_warden; _punishment_warden_handle;};
	case "sentance": {_punishment_sentance_handle = _parameters spawn punishment_sentance; _punishment_sentance_handle;};
	case "release": {_parameters call punishment_release; scriptNull;};
	case "forgive_addAction": {_parameters call punishment_forgive_addAction; scriptNull;};
	///////////////////////// TODO: PLAYER TEAM FORGIVE SCRIPT
	default {scriptNull};
};
_return