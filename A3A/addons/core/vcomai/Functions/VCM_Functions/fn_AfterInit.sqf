
[] spawn
{
	private _id = clientOwner;
	["Vcm_Settings",_id] remoteExec ["VCM_ServerAsk",2,false];
	waitUntil {!(isNil "Vcm_Settings")};
	[] call Vcm_Settings;	
	sleep 2;
	

	
	[] call VCM_fnc_WeaponDefine;
	[] spawn VCM_fnc_AIDRIVEBEHAVIOR;
	[] spawn VCM_fnc_Scheduler;
	
	if (hasInterface) then
	{
		//Event handlers for players	
		player addEventHandler ["Fired",{_this call VCM_fnc_HearingAids;}];
		player spawn VCM_fnc_IRCHECK;
		player addEventHandler ["Respawn",{_this spawn VCM_fnc_IRCHECK;}];
		//if (Vcm_PlayerAISkills) then {[] spawn VCM_fnc_PLAYERSQUAD;};
	};
	
	
	
	//OnEachFrame monitor for mines. Should make them more responsive, without a significant impact on FPS.
	["VCMMINEMONITOR", "onEachFrame", {[] call VCM_fnc_MineMonitor}] call BIS_fnc_addStackedEventHandler;
	
};