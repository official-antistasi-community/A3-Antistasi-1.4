/*  
Maintainer: John Jordan
    Create mixed air/land/sea attack force

Scope: Server or HC
Environment: Scheduled (potential long sleeps, returns after last vehicle spawned)

Arguments:
    <SIDE> Side to create force for
    <STRING> Marker name of source airbase
    <POS2D or STRING> Position or marker of target location for attack force
    <STRING> Resource pool to use
    <INTEGER> Total number of vehicles to create
    <SCALAR> Minimum arrival delay in seconds. -1 will force immediate spawn, otherwise will attempt to sync air/ground arrival  
    <ARRAY> Array of modifier strings: ["tierboost", "specops", "airboost", "noairsupport"]
    <STRING> Optional: Attack type for showInterceptedSetupCall. Won't show anything if missing
    <SCALAR> Optional: Reveal value for showInterceptedSetupCall

Return array:
    <SCALAR> Resources spent
    <ARRAY> Array of vehicle objects created
    <ARRAY> Array of crew groups created
    <ARRAY> Array of cargo groups created
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_delay", "_modifiers", "_attackType", "_reveal"];
private _targPos = if (_target isEqualType []) then { _target } else { markerPos _target };
// _modifiers ["tierboost", "specops", "airboost", "noairsupport"]

private _lowAir = Faction(_side) getOrDefault ["attributeLowAir", false];
private _tier = [tierWar, tierWar+2] select ("tierboost" in _modifiers);

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

// Decision to try to send a naval counterpart
private _checkRadius = 100;
private _nearWaterPos = 0;
diag_log "set up  vars";
while {_checkRadius < 500} do {
    private _checkFrequency = linearConversion [10, 500, _checkRadius, 6, 100];
    private _checkAngleIncrement = 360 / _checkFrequency;
    private _contCheckAngle = 0;
    private _finalPos = 0;
    diag_log format ["_checkFrequency: %1 _checkAngleIncrement: %2",_checkFrequency, _checkAngleIncrement];
    for "_i" from 1 to (round _checkAngleIncrement) do {
        private _checkPos = _targPos getPos [_checkRadius, _contCheckAngle];
        diag_log _checkPos;
        if (surfaceIsWater _checkPos) exitWith {diag_log "found water"; _finalPos = _checkPos};
        _contCheckAngle = _contCheckAngle + _checkAngleIncrement;
        diag_log format ["_checkPos: %1, is water: %2, _newCheckAngle: %3",_checkPos, surfaceIsWater _checkPos, _contCheckAngle];
    };
    if (_finalPos isEqualType []) exitWith {diag_log "found water"; _nearWaterPos = _finalPos};
    _checkRadius = _checkRadius + 10;
    diag_log format ["new check radius: %1",_checkRadius];
};
if (debug) then {_nearWaterPos = _targPos;};
private _waterDistance = 0;
private _naval = false;
diag_log _nearWaterPos;
diag_log typeName _nearWaterPos;
diag_log typeName [];
diag_log _nearWaterPos isEqualType [];
if (_nearWaterPos isEqualType []) then {
    diag_log "is near water";
    _waterDistance = _targPos distance2D _nearWaterPos;
    diag_log _waterDistance;
    _naval = if (_waterDistance > 400) then {false} else {
        diag_log "is naval";
        private _navalProb = 1100 + _waterDistance;
        if (random _navalProb < 1100) then {true}; // at max usable distance (400) 73% chance of sending naval counterpart
    };
} else {
    diag_log "is not near water";
};
//TINYTODO Remove this
Debug_2("Water distance %1 Naval %2",_waterDistance,_naval)

private _landRatio = if ("airboost" in _modifiers) then {     // punishment, HQ attack
    if (_lowAir) exitWith { 0.5 + random 0.5 };
    random 0.4;
} else {            // non-airboost cases
    if ("noairsupport" in _modifiers) then {          // waved attack case, handles air supports itself
        if (_lowAir) exitWith { 0.8 + random 0.2 };
        0.5 + random 0.4;
    } else {                            // counterAttack
        if (_lowAir) exitWith { 0.7 + random 0.3 };
        0.4 + random 0.4;
    };
};
ServerDebug_4("Land ratio %1 out of vehicle count %2 due to lowAir %3 and modifiers %4", _landRatio, _vehCount, _lowAir, _modifiers);
private _landCount = round (_landRatio * _vehCount);

if (_landCount > 0) then
{
    private _landBase = [_side, _targPos] call A3A_fnc_availableBasesLand;
    if (_delay >= 0 and !isNil "_landBase") then {
        private _navIndex = _landBase call A3A_fnc_getMarkerNavPoint;
        private _landTime = ([_targPos, _navIndex] call A3A_fnc_findNavDistance) / 15;
        ServerDebug_2("Minimum delay %1 and land travel time %2", _delay, _landTime);
        if (_landTime < _delay) then { sleep (_delay - _landTime) };
        _delay = _landTime;
    };

    while { !isNil "_landBase" } do
    {
        [_landBase, 1] call A3A_fnc_addTimeForIdle;
        private _attackCount = round (_landCount * (0.25 + random 0.2));
        private _troops = ["Normal", "SpecOps"] select ("specops" in _modifiers and random 1 > 0.5);
        ServerDebug_3("Attempting to spawn %1 land vehicles including %2 attack from %3", _landCount, _attackCount, _landBase);

        private _data = [_side, _landBase, _targPos, _resPool, _landCount, _attackCount, _tier, _troops] call A3A_fnc_createAttackForceLand;
        if (_data#1 isEqualTo []) exitWith { Error_1("Land base %1 passed checks but failed vehicle spawning", _landBase) };
        _resourcesSpent = _resourcesSpent + _data#0;
        _vehicles append _data#1;
        _crewGroups append _data#2;
        _cargoGroups append _data#3;

        [-(_data#0), _side, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];

        ServerInfo_2("Spawn performed: Ground vehicles %1 from %2", _data#1 apply {typeOf _x}, _landBase);

        // If we didn't manage to spawn enough land vehicles, try another base
        _landCount = _landCount - count (_data#1);
        if (_landCount <= 0) exitWith {};    
        _landBase = [_side, _targPos] call A3A_fnc_availableBasesLand;
    };
};

// Show setup call now that we know the delay time
if (!isNil "_attackType") then {
    [_reveal, _side, _attackType, _targPos, _delay] remoteExec ["A3A_fnc_showInterceptedSetupCall", 2];
};

// Now we delay to synchronize with ground vehicle arrival
if (_delay > 0) then {
    private _airTime = (markerPos _airbase distance2d _targPos) / 70;
    ServerDebug_2("Remaining delay %1 and air travel time %2", _delay, _airTime);
    sleep (0 max (_delay - _airTime));
};

if (_airBase != "") then            // uh, is that a thing
{
    private _airCount = _vehCount - count (_vehicles);
    if (_airCount <= 0) exitWith {};

    private _attackCount = if ("noairsupport" in _modifiers) then { 0 } else {
        private _AHratio = 0.02 * (6 + tierWar) + random 0.1;
        _AHratio = _AHratio + 0.2 * count (_vehicles) / _vehCount;
        round (random 0.3 + _airCount * _AHratio);
    };
    private _troops = ["Normal", "SpecOps"] select ("specops" in _modifiers);
    ServerDebug_3("Attempting to spawn %1 air vehicles including %2 attack from %3", _airCount, _attackCount, _airbase);

    private _data = [_side, _airBase, _targPos, _resPool, _airCount, _attackCount, _tier, _troops] call A3A_fnc_createAttackForceAir;
    _resourcesSpent = _resourcesSpent + _data#0;
    _vehicles append _data#1;
    _crewGroups append _data#2;
    _cargoGroups append _data#3;

    [-(_data#0), _side, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];

    ServerInfo_1("Spawn performed: Air vehicles %1", _data#1 apply {typeOf _x});
};

if (_naval) then
{ // For now, boats dont play into any strength calculation and just take resources
    private _navalSpawn = [seaAttackSpawn,_nearWaterPos] call BIS_fnc_nearestPosition;
    Info_3("Attempted to perform naval spawn for drop point %1 at spawn point %2 distance %3 ",_nearWaterPos,_navalSpawn,_nearWaterPos distance2D getMarkerPos _navalSpawn)
    if (_nearWaterPos distance2D getMarkerPos _navalSpawn > 4000) exitWith {Info("Naval attack aborted")};
    private _boatCount = round (_vehCount / 5);
    private _attackRatio = 0.3 + tierWar/30;
    private _attackCount = round (_boatCount * _attackRatio);
    private _troops = ["Normal", "SpecOps"] select ("specops" in _modifiers);
    ServerDebug_3("Attempting to spawn %1 sea vehicles including %2 attack from %3", _boatCount, _attackCount, _navalSpawn);

    private _data = [_side, _navalSpawn, _nearWaterPos, _resPool, _boatCount, _attackCount, _tier, _troops,_nearWaterPos] call A3A_fnc_createAttackForceSea;
    _resourcesSpent = _resourcesSpent + _data#0;
    _vehicles append _data#1;
    _crewGroups append _data#2;
    _cargoGroups append _data#3;

    [-(_data#0), _side, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];

    ServerInfo_1("Spawn performed: Sea vehicles %1", _data#1 apply {typeOf _x});
};

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];
