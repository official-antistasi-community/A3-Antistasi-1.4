/*
Maintainer: John Jordan
    Sends a combined attack force to capture the given marker

Scope: Server
Environment: Scheduled, should be spawned

Arguments:
    <STRING> Destination marker (enemy-owned airport, outpost, seaport, factory or resource)
    <STRING> Origin marker (should be airbase)
    <INTEGER> Maximum number of attack waves to send
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
// server guard?

// TODO: move this to chooseAttack?
bigAttackInProgress = true; publicVariable "bigAttackInProgress";

params ["_mrkDest", "_mrkOrigin", "_maxWaves"];
private _targpos = markerPos _mrkDest;
private _side = sidesX getVariable _mrkOrigin;
private _targside = sidesX getVariable _mrkDest;
private _faction = Faction(_side);
forcedSpawn pushBack _mrkDest; publicVariable "forcedSpawn";

Info_3("Creating waved attack against %1 from %2 with %3 waves", _mrkDest, _mrkOrigin, _maxWaves);

// Create a task for enemy vs rebel, notification only for enemy vs enemy
private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _nameEnemy = _faction get "name";
private _taskId = "wavedAttack" + str A3A_taskCount;
if (_targside == teamPlayer) then {
    private _taskStr = format ["%1 is attacking our garrison at %2. Stop them if you can, or live to fight another day.", _nameEnemy, _nameDest];
    [true,_taskId,[_taskStr,format ["%1 Attack",_nameEnemy],_mrkDest],markerPos _mrkDest,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
    [_taskId, "wavedAttack", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
} else {
    private _text = format ["%1 is attacking the %2 garrison at %3.", _nameEnemy, Faction(_targside) get "name", _nameDest];
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification", 0];
};


// These mostly used for cleanup?
private _allCargoGroups = [];
private _allCrewGroups = [];
private _allVehicles = [];
private _attackHelis = [];

private _wave = 1;
private _victory = false;
while {_wave <= _maxWaves and !_victory} do
{
    // Somewhat flattened because a lot of the work is done by garrisons
    private _vehCount = round (2 + random 1.5 + 3*A3A_balancePlayerScale);
    if (_targside != teamPlayer) then { _vehCount = 4 + round (random 2) };
    if (_wave == 1) then { _vehCount = _vehCount + 2 };

    private _resourcesSpent = 0;
    private _vehicles = [];
    private _crewGroups = [];
    private _cargoGroups = [];

    private _basesAndWeights = [_side, markerPos _mrkDest, true] call A3A_fnc_availableBasesLand;
    private _countLandBases = count (_basesAndWeights#0);
    private _landbase = _basesAndWeights#0 selectRandomWeighted _basesAndWeights#1;

    if (_countLandBases > 0) then { ServerDebug_2("Using land base %1 (%2 available)", _landBase, _countLandBases) };


    // Check what air supports & attack helis we have left from previous waves
    // Check active air supports for UAV/CAS/ASF
    private _countNewSupport = 0;
    private _airSupports = [];      // support type strings
    call {
        {
            _x params ["_supportName", "_suppSide", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];
            if (_suppSide != _side or _suppCenter distance2d _targpos > _suppRadius) then { continue };
            if (_suppType in ["UAV", "CAS", "ASF"]) then { _airSupports pushBack _suppType };
        } forEach A3A_activeSupports;

        // Not ideal because it might have a dead gunner. Might need some proper vehicleCanFight function
        _attackHelis = _attackHelis select { canMove _x and canFire _x };

        private _remSupports = (count _airSupports + count _attackHelis);
        private _reqSupports = round (_vehCount * (0.1 + random 0.1 + (5 + tierWar) * 0.025));
        _countNewSupport = 1 max (_reqSupports - _remSupports);

        ServerDebug_3("Remaining air supports %1, plus %2 attack helis. Adding %3 air supports", _airSupports, count _attackHelis, _countNewSupport);
    };

    // Approx, just to prevent sending QRFs on top
	A3A_supportStrikes pushBack [_side, "TROOPS", _targPos, time + 1800, 1800, (_vehCount-_countNewSupport) * A3A_balanceVehicleCost];


    // Now send the ground part of the wave, if any
    if (_countLandBases != 0) then
    {
        private _groundVehCount = _vehCount - _countNewSupport;
        // If we're sending a lot of stuff or there's only one land base, send some air transports anyway
        if (_groundVehCount >= 4 or _countLandBases == 1) then { _groundVehCount = _groundVehCount * (0.5 + random 0.5) };
        _groundVehCount = ceil _groundVehCount;
        private _attackCount = round (_groundVehCount * (0.25 + random 0.2));

        // ["_side", "_originMrk", "_destMrk", "_resPool", "_vehCount", "_attackVehCount", "_tierMod"]
        private _data = [_side, _landBase, _mrkDest, "attack", _groundVehCount, _attackCount, 2] call A3A_fnc_createAttackForceLand;
        _resourcesSpent = _resourcesSpent + _data#0;
        _vehicles = _vehicles + _data#1;
        _crewGroups = _crewGroups + _data#2;
        _cargoGroups = _cargoGroups + _data#3;

        [-(_data#0), _side, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];

        ServerInfo_1("Spawn performed: Ground vehicles %1", (_data#1) apply {typeof _x});
    };


    // Now we delay until ground vehicles should have got somewhere near...
    private _approxTime = 60 + random 120;
    if (!isNil "_landBase") then { _approxTime = (markerPos _landBase distance _targpos) / 15 };

    private _reveal = [_targPos] call A3A_fnc_calculateSupportCallReveal;
    [_reveal, _side, "MajorAttack", _targPos, _approxTime] remoteExec ["A3A_fnc_showInterceptedSetupCall", 2];

    sleep _approxTime;


    // Now add air supports up to the requirement
    private _newAttackHelis = 0;
    private _airVehicleCount = _vehCount - count _vehicles;
    for "_i" from 1 to _countNewSupport do 
    {
        private _possibles = ["AH", 1];
        if !("UAV" in _airSupports) then { _possibles append ["UAV", 1] };
//        if !("CAS" in _airSupports) then { _possibles append ["CAS", 0.6] };      // CAS now included in air attack vehicles
        if !("ASF" in _airSupports) then { _possibles append ["ASF", 0.3] };

        private _support = selectRandomWeighted _possibles;
        if (_support == "AH") then { _newAttackHelis = _newAttackHelis + 1 }
        else {
            // ["_type", "_side", "_caller", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];
            [_support, _side, "attack", 500, objNull, _targPos, 0, 0] call A3A_fnc_createSupport;
            _airSupports pushBack _support;
            _airVehicleCount = _airVehicleCount - 1;
        };
    };

    // Now spawn the air transports and attack helis
    if (_airVehicleCount > 0) then {
        // ["_side", "_originMrk", "_destMrk", "_resPool", "_vehCount", "_attackVehCount", "_tierMod"]
        private _data = [_side, _mrkOrigin, _mrkDest, "attack", _airVehicleCount, _newAttackHelis, 2] call A3A_fnc_createAttackForceAir;
        _resourcesSpent = _resourcesSpent + _data#0;
        _vehicles = _vehicles + _data#1;
        _crewGroups = _crewGroups + _data#2;
        _cargoGroups = _cargoGroups + _data#3;
        { if (_x in (_faction get "vehiclesHelisAttack") + (_faction get "vehiclesHelisLightAttack")) then { _attackHelis pushBack _x } } forEach (_data#1);

        [-(_data#0), _side, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];

        ServerInfo_1("Spawn performed: Air vehicles %1", (_data#1) apply {typeof _x});
    };

    // Request some artillery
    call {
        // Choose target/pos. Aim for static weapon if known, or just somewhere around flag otherwise
        private _target = markerPos _mrkDest getPos [random 100, random 360];
        private _vehicles = vehicles inAreaArray _mrkDest;
        _vehicles = _vehicles select { canFire _x and _x isKindOf "StaticWeapon" };
        if !(_vehicles isEqualTo []) then { _target = selectRandom _vehicles };

        // ["_side", "_target", "_caller", "_precision", "_reveal", "_delay"];
        [_side, _target, "attack", _wave min 4, 0, 0] call A3A_fnc_requestArtillery;
    };


    private _timeout = time + 900;		// wave timeout, 15 mins after the wave has finished spawning
    private _soldiers = [];
    { _soldiers append units _x } forEach _cargoGroups;     // only new troops count, in case old troops are just stuck somewhere

    _allCargoGroups append _cargoGroups;
    _allCrewGroups append _crewGroups;
    _allVehicles append _vehicles;

    // Wave termination monitor
    while {true} do
    {
//    if (sidesX getVariable [_mrkDestination,sideUnknown] != teamPlayer) then {_soldiers spawn A3A_fnc_remoteBattle};
        private _markerSide = sidesX getVariable _mrkDest;
        if(_markerSide == _side) exitWith {
            ServerInfo_1("Wave %1 has captured %2", _wave, _mrkDest);
            _victory = true;
        };

        private _curSoldiers = { _x call A3A_fnc_canFight } count _soldiers;
        if (_curSoldiers < count _soldiers * 0.25) exitWith {
            ServerInfo_1("Wave %1 against %2 has been defeated", _wave, _mrkDest);
        };
        if(_timeout < time) exitWith {
            ServerInfo_1("Wave %1 against %2 has timed out", _wave, _mrkDest);
        };

        // Attempt to flip marker
        [_mrkDest, _markerSide] remoteExec ["A3A_fnc_zoneCheck", 2];
        sleep 10;
    };
};

// TODO: Check some of this stuff for locality requirements
if (_victory) then {
    if (_targSide != teamPlayer) exitWith {};
    [_taskId, "rebelAttack", "FAILED"] call A3A_fnc_taskSetState;
    [_taskId, "rebelAttack", 30] spawn A3A_fnc_taskDelete;
    if (_targside == teamPlayer) then { [-10,theBoss] call A3A_fnc_playerScoreAdd };
} else {
    [_mrkDest, _mrkOrigin] call A3A_fnc_minefieldAAF;

    if (_targSide != teamPlayer) exitWith {};
    [_taskId, "rebelAttack", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [_taskId, "rebelAttack", 30] spawn A3A_fnc_taskDelete;
    private _nearRebels = [500, 0, markerPos _mrkDest, teamPlayer] call A3A_fnc_distanceUnits;
    { if (isPlayer _x) then { [10, _x] call A3A_fnc_playerScoreAdd } } forEach _nearRebels;
    [10, theBoss] call A3A_fnc_playerScoreAdd;
};

ServerInfo("Reached end of winning conditions. Starting despawn");
sleep 30;

bigAttackInProgress = false; publicVariable "bigAttackInProgress";
forcedSpawn = forcedSpawn - [_mrkDest]; publicVariable "forcedSpawn";


{ [_x] spawn A3A_fnc_VEHDespawner } forEach _allVehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _allCrewGroups;
{
    [_x, [nil, _mrkDest] select _victory] spawn A3A_fnc_enemyReturnToBase;
    sleep 10;
} forEach _allCargoGroups;
