/*  
Maintainer: John Jordan
    Create mixed air/land attack force

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
        [_landBase, 5] call A3A_fnc_addTimeForIdle;
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

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];
