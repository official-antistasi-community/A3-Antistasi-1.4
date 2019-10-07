diag_log format ["%1: [Antistasi] | INFO | initPetros Started.",servertime];
removeHeadgear (call A3A_fnc_getPetros);
removeGoggles (call A3A_fnc_getPetros);
(call A3A_fnc_getPetros) setSkill 1;
(call A3A_fnc_getPetros) setVariable ["respawning",false];
(call A3A_fnc_getPetros) allowDamage false;
[(call A3A_fnc_getPetros),(selectRandom unlockedRifles), 8, 0] call BIS_fnc_addWeapon;
(call A3A_fnc_getPetros) selectWeapon (primaryWeapon (call A3A_fnc_getPetros));
(call A3A_fnc_getPetros) addEventHandler
[
    "HandleDamage",
    {
    _part = _this select 1;
    _damage = _this select 2;
    _injurer = _this select 3;

    _victim = _this select 0;
    _instigator = _this select 6;
    if(!isNull _instigator && isPlayer _instigator && _victim != _instigator && side _instigator == teamPlayer && _damage > 0.1) then
    {
        [_instigator, 60, 1, _victim] remoteExec ["A3A_fnc_punishment",_instigator];
    };
    if (isPlayer _injurer) then
    {
        _damage = (_this select 0) getHitPointDamage (_this select 7);
    };
    if ((isNull _injurer) or (_injurer == (call A3A_fnc_getPetros))) then {_damage = 0};
        if (_part == "") then
        {
            if (_damage > 1) then
            {
                if (!((call A3A_fnc_getPetros) getVariable ["INCAPACITATED",false])) then
                {
                    (call A3A_fnc_getPetros) setVariable ["INCAPACITATED",true,true];
                    _damage = 0.9;
                    if (!isNull _injurer) then {[(call A3A_fnc_getPetros),side _injurer] spawn A3A_fnc_unconscious} else {[(call A3A_fnc_getPetros),sideUnknown] spawn A3A_fnc_unconscious};
                }
                else
                {
                    _overall = ((call A3A_fnc_getPetros) getVariable ["overallDamage",0]) + (_damage - 1);
                    if (_overall > 1) then
                    {
                        (call A3A_fnc_getPetros) removeAllEventHandlers "HandleDamage";
                    }
                    else
                    {
                        (call A3A_fnc_getPetros) setVariable ["overallDamage",_overall];
                        _damage = 0.9;
                    };
                };
            };
        };
    _damage;
    }
];

(call A3A_fnc_getPetros) addMPEventHandler ["mpkilled",
{
    removeAllActions (call A3A_fnc_getPetros);
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
						playableUnits
						select {(side (group _x) == teamPlayer) && isPlayer _x && _x == _x getVariable ["owner", _x]} 
						apply {[([_x] call A3A_fnc_numericRank) select 0, _x]};
					_playersWithRank sort false;
					
					 [] remoteExec ["A3A_fnc_placementSelection", _playersWithRank select 0 select 1];
				};
			};
			{
				if (side _x == Occupants) then {_x setPos (getMarkerPos respawnOccupants)};
			} forEach playableUnits;
		}
        else
		{
            [] call A3A_fnc_createPetros;
		};
	};
}];
[] spawn {sleep 120; (call A3A_fnc_getPetros) allowDamage true;};
diag_log format ["%1: [Antistasi] | INFO | initPetros Completed.",servertime];
