/*
Maintainer: John Jordan
    Send a special forces air attack to kill Petros

Scope: Server
Environment: Scheduled, should be spawned

Arguments:
    <SIDE> Side from which to send the attack (Occupants or Invaders)
    <STRING> Marker name of airport to send the attack from
    <SCALAR> Optional: Delay in minutes after creating the task (Default: Auto-calculated from balancePlayerScale)
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//Mission: HQ is under attack
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_side", "_airbase", ["_delay", -1]];			// Side is now specified
private _targPos = markerPos "Synd_HQ";
private _faction = Faction(_side);

bigAttackInProgress = true;
publicVariable "bigAttackInProgress";


private _taskId = "DEF_HQ" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format ["The enemy has sent SpecOps to find %1. Stop them, or move the HQ before they get here.",name petros],format ["Defend %1",name petros],respawnTeamPlayer],_targPos,true,10,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "DEF_HQ", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

// Give smaller player groups a bit more time to respond
if (_delay < 0) then { _delay = 5 / A3A_balancePlayerScale };
[_airbase, _delay + 10] call A3A_fnc_addTimeForIdle;        // Reserve airbase for this attack
sleep (60 * _delay);


// Create the attacking force
private _vehCount = round (1 + random 1 + 2 * A3A_balancePlayerScale);
private _attackRatio = (0.5 + random 1) * (tierWar * 0.03);
private _attackCount = round (random 0.3 + _vehCount * _attackRatio);

private _data = [_side, _airbase, _targPos, "attack", _vehCount, _attackCount, nil, "SpecOps"] call A3A_fnc_createAttackForceAir;
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];
[-_resources, _side, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];

// May as well do it properly here
A3A_supportStrikes pushBack [_side, "TROOPS", _targPos, time + 1800, 1800, _resources];

ServerInfo_1("Spawn performed: Air vehicles %1", _data#1 apply {typeOf _x});


// Send in a UAV
// ["_type", "_side", "_caller", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];
["UAV", _side, "attack", 500, objNull, _targPos, 0, 0] call A3A_fnc_createSupport;

// Call up some artillery
call {
    // Choose target/pos. Aim for static weapon if known, or just somewhere around flag otherwise
    private _target = _targPos getPos [random 100, random 360];
    private _vehicles = vehicles inAreaArray [_targPos, 100, 100];
    _vehicles = _vehicles select { canFire _x and _x isKindOf "StaticWeapon" };
    if !(_vehicles isEqualTo []) then { _target = selectRandom _vehicles };

    // ["_side", "_target", "_pool", "_precision", "_reveal", "_delay"];
    [_side, _target, "attack", 2, 0, 0] call A3A_fnc_requestArtillery;
};

// TODO: Could add an extra timed "petros surrender" condition if there are too many enemies near him

private _timeout = time + 900;			// It's a lightning raid, don't string it out
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;
private _origPetros = petros;

while {true} do
{
    private _curSoldiers = { _x call A3A_fnc_canFight } count _soldiers;
    if (_curSoldiers < count _soldiers * 0.33) exitWith {
        ServerInfo("HQ attack has been defeated, starting retreat");
    };
    if (time > _timeOut) exitWith {
        ServerInfo("HQ attack timed out, starting retreat");
    };
    if (!alive _origPetros) exitWith {
        ServerInfo("HQ attack succeeded in killing petros, starting retreat");
    };
    sleep 30;
};

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach (_crewGroups + _cargoGroups);

sleep 60;

if (!alive _origPetros) then {
    [_taskId, "DEF_HQ", "FAILED"] call A3A_fnc_taskSetState;
    // Other results handled by petros death code
} else {
    [_taskId, "DEF_HQ", "SUCCEEDED"] call A3A_fnc_taskSetState;
    if (_targPos distance markerPos respawnTeamPlayer < 500) then {			// assume we fought it out?
        [_side, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
        // This is bullshit really
        {if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_targPos,teamPlayer] call A3A_fnc_distanceUnits);
    };
};

bigAttackInProgress = false;
publicVariable "bigAttackInProgress";

[_taskId, "DEF_HQ", 1200] spawn A3A_fnc_taskDelete;
