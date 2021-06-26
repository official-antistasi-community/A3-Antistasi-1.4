private _posHQ = getMarkerPos respawnTeamPlayer;
private _time = if (isMultiplayer) then {serverTime} else {time};

if ((_time - (boxX getVariable ["lastUsed", -30])) < 30) exitWith {
    if (hasInterface) then {
        ["Heal And Repair", "The repair box has been used in the last 30 seconds! Please wait for a bit."] call A3A_fnc_customHint;
    };
};
boxX setVariable ["lastUsed", _time, true];

//Heal, restore stamina, and clear report for rebel units near HQ
{
    if ((side group _x == teamPlayer) and (_x distance _posHQ < 50)) then {
        if (!isNil "ace_advanced_fatigue_fnc_handlePlayerChanged") then {
            // abuse the init/respawn function to reset ACE stamina
            [_x, objNull] remoteExec ["ace_advanced_fatigue_fnc_handlePlayerChanged", _x];
        } else {
            [_x, 0] remoteExec ["setFatigue", _x];
        };
        if (A3A_hasACEMedical) then {
            [_x, _x] call ace_medical_treatment_fnc_fullHeal;
        };
        _x setDamage 0;
        _x setVariable ["incapacitated",false,true];
        _x setVariable ["compromised", 0, true];
    };
} forEach allUnits;

//clear report from vehicles that are alive, at HQ, and reported
private _reportCleared = false;
{
    if (
        alive _x
        && {_x distance _posHQ < 150}
        && {_x in reportedVehs}
    ) then {
        reportedVehs deleteAt (reportedVehs find _x);
        _reportCleared = true;
    };
} forEach vehicles;
if (_reportCleared) then { publicVariable "reportedVehs" };//spare publicVariable for every vehicle at hq

["Heal", "Nearby units have been healed, refreshed, and can go undercover again.<br/><br/> Nearby vehicles are no longer reported."] call A3A_fnc_customHint;
