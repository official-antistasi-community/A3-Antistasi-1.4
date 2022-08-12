/*
Author: Spoffy, jaj22, Håkon
Description:
    Heals rebel units near HQ, restores there stamina, and allows units and vehicles to go undercover again.
    Ace compatible.

Arguments: <Nil>

Return Value: <Nil>

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <Object> boxX - Vehicle box at hq init to variable in init field in sqm
    <Marker> respawnTeamPlayer - HQ marker

Example:

License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if ((serverTime - (boxX getVariable ["lastUsed", -30])) < 30) exitWith {
    if (hasInterface) then {
        [localize "STR_antistasi_singleWord_Heal", localize "STR_antistasi_Base_vehicleBoxHeal_UsedRecently"] call A3A_fnc_customHint;
    };
};
boxX setVariable ["lastUsed", serverTime, true];

//Heal, restore stamina, and clear report for rebel units near HQ
private _posHQ = getMarkerPos respawnTeamPlayer;
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

//clear report from vehicles that are at HQ and reported
{
    if (isNil {_x getVariable "A3A_reported"}) then { continue };
    _x setVariable ["A3A_reported", nil, true];
} forEach (vehicles inAreaArray [_posHQ, 150, 150]);

["vehicleBoxHeal", [_posHQ]] call EFUNC(Events,triggerEvent);
[localize "STR_antistasi_singleWord_Heal", localize "STR_antistasi_Base_vehicleBoxHeal_Healed"] call A3A_fnc_customHint;
nil
