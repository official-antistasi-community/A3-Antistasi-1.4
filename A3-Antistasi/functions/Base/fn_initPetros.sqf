private _fileName = "fn_initPetros";
[2,"initPetros started",_fileName] call A3A_fnc_log;
scriptName "fn_initPetros";
removeHeadgear petros;
removeGoggles petros;
petros setSkill 1;
petros setVariable ["respawning",false];
petros allowDamage false;

[petros,unlockedRifles] call A3A_fnc_randomRifle;
petros selectWeapon (primaryWeapon petros);
[petros,true] call A3A_fnc_punishment_FF_addEH;
petros addEventHandler
[
    "HandleDamage",
    {
    _part = _this select 1;
    _damage = _this select 2;
    _injurer = _this select 3;

    _victim = _this select 0;
    _instigator = _this select 6;
    if (isPlayer _injurer) then
    {
        _damage = (_this select 0) getHitPointDamage (_this select 7);
    };
    if ((isNull _injurer) or (_injurer == petros)) then {_damage = 0};
        if (_part == "") then
        {
            if (_damage > 1) then
            {
                if (!(petros getVariable ["incapacitated",false])) then
                {
                    petros setVariable ["incapacitated",true,true];
                    _damage = 0.9;
                    if (!isNull _injurer) then {[petros,side _injurer] spawn A3A_fnc_unconscious} else {[petros,sideUnknown] spawn A3A_fnc_unconscious};
                }
                else
                {
                    _overall = (petros getVariable ["overallDamage",0]) + (_damage - 1);
                    if (_overall > 1) then
                    {
                        petros removeAllEventHandlers "HandleDamage";
                    }
                    else
                    {
                        petros setVariable ["overallDamage",_overall];
                        _damage = 0.9;
                    };
                };
            };
        };
    _damage;
    }
];

petros addMPEventHandler ["mpkilled",
{
    removeAllActions petros;
    _killer = _this select 1;
    if (isServer) then
	{
        if ((side _killer == Invaders) or (side _killer == Occupants) and !(isPlayer _killer) and !(isNull _killer)) then
		{
			_nul = [] spawn {
				garrison setVariable ["Synd_HQ",[],true];
				_hrT = server getVariable "hr";
				_resourcesFIAT = server getVariable "resourcesFIA";
				[-1*(round(_hrT*0.9)),-1*(round(_resourcesFIAT*0.9))] remoteExec ["A3A_fnc_resourcesFIA",2];
				waitUntil {count allPlayers > 0};
				if (!isNull theBoss) then {
					[] remoteExec ["A3A_fnc_placementSelection",theBoss];
				} else {
					private _playersWithRank =
						(call A3A_fnc_playableUnits)
						select {(side (group _x) == teamPlayer) && isPlayer _x && _x == _x getVariable ["owner", _x]}
						apply {[([_x] call A3A_fnc_numericRank) select 0, _x]};
					_playersWithRank sort false;

					 [] remoteExec ["A3A_fnc_placementSelection", _playersWithRank select 0 select 1];
				};
			};
			{
				if (side _x == Occupants) then {_x setPos (getMarkerPos respawnOccupants)};
			} forEach (call A3A_fnc_playableUnits);
		}
        else
		{
            [] call A3A_fnc_createPetros;
		};
	};
}];
[] spawn {sleep 120; petros allowDamage true;};

private _removeProblematicAceInteractions = {
    _this spawn {
        //Wait until we've got hasACE initialised fully
        waitUntil {!isNil "initVar"};
        //Disable ACE Interactions
        if (hasInterface && hasACE) then {
            [typeOf _this, 0,["ACE_ApplyHandcuffs"]] call ace_interact_menu_fnc_removeActionFromClass;
            [typeOf _this, 0,["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
        };
    };
};

//We're doing it per-init of petros, because the type of petros on respawn might be different to initial type.
//This'll prevent it breaking in the future.
[petros, _removeProblematicAceInteractions] remoteExec ["call", 0, petros];

[2,"initPetros completed",_fileName] call A3A_fnc_log;
