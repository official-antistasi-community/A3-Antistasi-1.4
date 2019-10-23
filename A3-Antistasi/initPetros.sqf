removeHeadgear petros;
removeGoggles petros;
petros setSkill 1;
petros setVariable ["respawning",false];
petros allowDamage false;
[petros, sniperRifle, 8, 0] call BIS_fnc_addWeapon;
petros selectWeapon (primaryWeapon petros);
petros addEventHandler ["HandleDamage",
        {
        private ["_unit","_part","_dam","_injurer"];
        _part = _this select 1;
        _dam = _this select 2;
        _injurer = _this select 3;

        if (isPlayer _injurer) then
            {
            _dam = 0;
            };
        if ((isNull _injurer) or (_injurer == petros)) then {_dam = 0};
        if (_part == "") then
            {
            if (_dam > 1) then
                {
                if (!(petros getVariable ["INCAPACITATED",false])) then
                    {
                    petros setVariable ["INCAPACITATED",true,true];
                    _dam = 0.9;
                    if (!isNull _injurer) then {[petros,side _injurer] spawn A3A_fnc_inconsciente} else {[petros,sideUnknown] spawn A3A_fnc_inconsciente};
                    }
                else
                    {
                    _overall = (petros getVariable ["overallDamage",0]) + (_dam - 1);
                    if (_overall > 1) then
                        {
                        petros removeAllEventHandlers "HandleDamage";
                        }
                    else
                        {
                        petros setVariable ["overallDamage",_overall];
                        _dam = 0.9;
                        };
                    };
                };
            };
        _dam
        }];

petros addMPEventHandler ["mpkilled",
    {
    removeAllActions petros;
    _killer = _this select 1;
    if (isServer) then
        {
        if ((side _killer == muyMalos) or (side _killer == malos) and !(isPlayer _killer) and !(isNull _killer)) then
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
                {["petrosDead",false,1,false,false] remoteExec ["BIS_fnc_endMission",_x]} forEach (playableUnits select {(side _x != buenos) and (side _x != civilian)})
                }
            else
                {
                {
                if (side _x == malos) then {_x setPos (getMarkerPos respawnMalos)};
                } forEach playableUnits;
                };
            }
        else
            {
            _viejo = petros;
            grupoPetros = createGroup buenos;
            publicVariable "grupoPetros";
            petros = grupoPetros createUnit [tipoPetros, position _viejo, [], 0, "NONE"];
            publicVariable "petros";
            grupoPetros setGroupIdGlobal ["Petros","GroupColor4"];
            petros setIdentity "amiguete";
            if (worldName == "Tanoa") then {petros setName "Maru"} else {petros setName "Petros"};
            petros disableAI "MOVE";
            petros disableAI "AUTOTARGET";
            if (group _viejo == grupoPetros) then {[Petros,"mission"]remoteExec ["A3A_fnc_flagaction",[buenos,civilian],petros]} else {[Petros,"buildHQ"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],petros]};
            [] execVM "initPetros.sqf";
            deleteVehicle _viejo;
            };
        };
   }];
sleep 120;
petros allowDamage true;
