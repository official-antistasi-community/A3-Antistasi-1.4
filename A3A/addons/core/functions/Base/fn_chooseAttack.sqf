/*
Maintainer: John Jordan
    Choose and launch an appropriate attack

Arguments:
    <SIDE> Source side for attack

Return value:
    <BOOL> false if no valid attack was found
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side"];

Info_1("Starting attack choice script for side %1", _side);


// Make a weighted list of rebel attack targets
private _targetsAndWeights = [teamPlayer, _side] call A3A_fnc_findAttackTargets;
_targetsAndWeights params ["_targets", "_weights"];

// Give targets within mission distance higher weight
// Returns total multiplier due to this adjustment
private _rebWeightMul = call {
    if (_targets isEqualTo []) exitWith {1};
    private _totalW = 0; private _distW = 0;
    private _hqPos = markerPos "Synd_HQ";
    {
        _totalW = _totalW + _x; 
        if !(markerPos (_targets#_forEachIndex#0) distance2d _hqPos < distanceMission) then { continue };
        _distW = _distW + _x;
        _weights set [_forEachIndex, _x * A3A_attackMissionDistMul];
    } forEach _weights;
    1 + _distW * (A3A_attackMissionDistMul - 1) / _totalW;
};

// Add in the targets for the other enemy side
if (gameMode == 1) then 
{
    private _enemySide = [Occupants, Invaders] select (_side == Occupants); 
    private _targetsAndWeightsEnemy = [_enemySide, _side] call A3A_fnc_findAttackTargets;
    if (_targetsAndWeightsEnemy#0 isEqualTo []) exitWith {};

    // at war tier 1, want about 10% of attacks to be against rebels
    private _aggro = [aggressionOccupants, aggressionInvaders] select (_side == Invaders);
    private _weightFactor = 0.05 * (tierWar + _aggro/20) * _rebWeightMul;
    _weights apply { _x * _weightFactor };

    _targets append (_targetsAndWeightsEnemy#0);
    _weights append (_targetsAndWeightsEnemy#1);
};

if (_targets isEqualTo []) exitWith {
    Info_1("Aborting attack by %1 because no targets available", _side);
    false;
};

{
    Debug_2("Target: weight %1, %2", _weights#_forEachIndex, _x);
} forEach _targets;

// Cull anything worse than 10:1 value ratio, otherwise we'll launch some really stupid attacks occasionally
private _minWeight = selectMax _weights / 10;
private _culledTargets = [];
{
    private _weight = _weights select _forEachIndex;
    if (_weight > _minWeight) then { _culledTargets append [_x, _weight] };
} forEach _targets;


// Now we just pick a target
private _target = selectRandomWeighted _culledTargets;
_target params ["_targetMrk", "_originMrk", "_targetValue", "_localThreat", "_flyoverThreat", "_countLandAttackBases"];
Debug_1("Selected attack is %1", _target);

// Only need to check stuff that would actually break
if (sidesX getVariable _targetMrk == _side) exitWith {
    Info_1("Aborting attack because target (%1) already captured", _targetMrk);
    false;
};
if (sidesX getVariable _originMrk != _side) exitWith {
    // do we check spawner status too?
    Info_1("Aborting attack because origin (%1) changed sides", _originMrk);
    false;
};


if (_targetMrk in citiesX) exitWith {
    if (_side == Invaders) then {
        // Punishment, unsimulated
        Info_2("Starting punishment mission from %1 to %2", _originMrk, _targetMrk);
        [_originMrk, _targetMrk] spawn A3A_fnc_invaderPunish;
    } else {
        // Supply convoy, unsimulated
        // Do we allow these even if there's already a convoy? Probably not harmful.
        Info_2("Sending supply convoy from %1 to %2", _originMrk, _targetMrk);
        [[_targetMrk, _originMrk, "supplies", "attack"],"A3A_fnc_convoy"] call A3A_fnc_scheduler;
    };
    true;
};

if (_targetMrk == "Synd_HQ") exitWith {
    Info_2("Starting HQ attack from %1", _originMrk);
    [_side, _originMrk] spawn A3A_fnc_attackHQ;
    true;
};

// Otherwise it's a major attack. Then we need to decide whether to simulate:
if((spawner getVariable _targetMrk) != 2 || (sidesX getVariable _targetMrk) == teamPlayer) then
{
    // Sending real attack, execute the fight
    private _waves = round (1 + random 1 + _localThreat / 1000);         // TODO: magic number
    // do we want any other factors?

    // Pay basic travel + first wave cost immediately?
    // Just travel, I guess. Well, wavedCA could also do that...
    private _atkDist = markerPos _originMrk distance2d markerPos _targetMrk;
    // no reason to charge travel because that's already charged for air units being more expensive?
    // could just charge balanceResourceRate? * (A + B * waves)
    // as a kind of preparation cost?
    // Purpose here is to increase the flat (as against result-dependent) part of the attack cost?

    Info_3("Starting waved attack with %1 waves from %2 to %3", _waves, _originMrk, _targetMrk);
    [_targetMrk, _originMrk, _waves] spawn A3A_fnc_wavedAttack;
    true;
}
else
{
    // Get the available defence resources
    private _defSide = [Occupants, Invaders] select (_side == Occupants);
    private _defResources = [_defSide, _side, _targetMrk, 1] call A3A_fnc_maxDefenceSpend;      // might need multiplier?

    // subtract that from defender and equal quantity for attacker
    [-_defResources, _defSide, "defence"] call A3A_fnc_addEnemyResources;

    // land units are a bit cheaper, attack is generally more expensive than defence
    private _atkResources = _defResources + _localThreat + _flyoverThreat;
    _atkResources = _atkResources * (1 + 2^(-_countLandAttackBases));
    [-_atkResources, _side, "attack"] call A3A_fnc_addEnemyResources;

    // Flip marker and add garrison once flipped
    [_side, _targetMrk] spawn A3A_fnc_markerChange;        // add simulation param here? or just rely on spawn status?
    Info_4("Simulated capture of %1 by %2, atk resources %3, def resources %4", _targetMrk, _side, _atkResources, _defResources);

    sleep 10;
    if (sidesX getVariable _targetMrk != _side) exitWith {
        Error_2("%1 still not switched to side %2 after 10 seconds", _targetMrk, _side);
        false;
    };

    // Get the garrison for free because we already paid for them in the simulated attack
    private _maxTroops = 12 max round ((0.5 + random 0.5) * ([_targetMrk] call A3A_fnc_garrisonSize));
    private _soldiers = [];
    private _faction = Faction(_side);
    while {count _soldiers < _maxTroops} do {
        _soldiers append selectRandom ((_faction get "groupsSquads") + (_faction get "groupsMedium"));
    };
    _soldiers resize _maxTroops;
    [_soldiers, _side, _targetMrk, 0] spawn A3A_fnc_garrisonUpdate;
    true;
};

