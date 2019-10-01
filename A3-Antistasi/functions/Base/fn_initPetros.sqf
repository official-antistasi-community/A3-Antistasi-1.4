diag_log format ["%1: [Antistasi] | INFO | initPetros Started.",servertime];
removeHeadgear petros;
removeGoggles petros;
petros setSkill 1;
petros setVariable ["respawning",false];
petros allowDamage false;
[petros,(selectRandom unlockedRifles), 8, 0] call BIS_fnc_addWeapon;
petros selectWeapon (primaryWeapon petros);
petros addEventHandler
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
    if ((isNull _injurer) or (_injurer == petros)) then {_damage = 0};
        if (_part == "") then
        {
            if (_damage > 1) then
            {
                if (!(petros getVariable ["INCAPACITATED",false])) then
                {
                    petros setVariable ["INCAPACITATED",true,true];
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
            _nul = [] spawn
                {
                garrison setVariable ["Synd_HQ",[],true];
                _hrT = server getVariable "hr";
                _resourcesFIAT = server getVariable "resourcesFIA";
                [-1*(round(_hrT*0.9)),-1*(round(_resourcesFIAT*0.9))] remoteExec ["A3A_fnc_resourcesFIA",2];
                waitUntil {sleep 6; isPlayer theBoss};
                [] remoteExec ["A3A_fnc_placementSelection",theBoss];
               };
            if (!isPlayer theBoss) then
                {
                {["petrosDead",false,1,false,false] remoteExec ["BIS_fnc_endMission",_x]} forEach (playableUnits select {(side _x != teamPlayer) and (side _x != civilian)})
                }
            else
                {
                {
                if (side _x == Occupants) then {_x setPos (getMarkerPos respawnOccupants)};
                } forEach playableUnits;
                };
            }
        else
            {
            [] call A3A_fnc_createPetros;
            };
        };
   }];
[] spawn {sleep 120; petros allowDamage true;};
diag_log format ["%1: [Antistasi] | INFO | initPetros Completed.",servertime];
