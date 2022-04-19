
[] spawn {
	sleep 5;
	
	[] call VCM_fnc_WeaponDefine;
	//[] spawn VCM_fnc_AIDRIVEBEHAVIOR;
	[] spawn VCM_fnc_Scheduler;
	
	if (hasInterface) then {
		//Event handlers for players	
		player addEventHandler ["Fired",{_this call VCM_fnc_HearingAids;}];
		player spawn VCM_fnc_IRCHECK;
		player addEventHandler ["Respawn",{
			_this spawn VCM_fnc_IRCHECK;
		}];
		//if (Vcm_PlayerAISkills) then {[] spawn VCM_fnc_PLAYERSQUAD;};
	};
};