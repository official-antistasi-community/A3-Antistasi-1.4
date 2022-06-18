
/*  
Maintainer: John Jordan
    Add or remove resources from enemy faction

Scope: Server only
Environment: Scheduled or unscheduled

Arguments:
    <SCALAR> Positive or negative count of resources to add
    <SIDE> Side of enemy faction to adjust
    <STRING> Resource pool type, currently "attack", "defence" or "legacy"
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_count", "_side", "_type"];

if (_side != Occupants && _side != Invaders) exitWith { Error_1("Called with invalid side: %1", _side) };
if (isNil "_count" or {!finite _count}) exitWith { Error("Called with invalid count") };

Debug_3("Adding %1 resources of type %2 to side %3", _count, _type, _side);

if (_type isEqualTo "defence") exitWith {
    if (_side == Invaders) then {
        A3A_resourcesDefenceInv = A3A_resourcesDefenceInv + _count;
    } else {
        A3A_resourcesDefenceOcc = A3A_resourcesDefenceOcc + _count;
    };
};
if (_type isEqualTo "attack") exitWith {
    if (_side == Invaders) then {
        A3A_resourcesAttackInv = A3A_resourcesAttackInv + _count;
    } else {
        A3A_resourcesAttackOcc = A3A_resourcesAttackOcc + _count;
    };
};
if (_type isEqualTo "legacy") exitWith {
    [_count/2, _side, "defence"] call A3A_fnc_addEnemyResources;
    [_count/2, _side, "attack"] call A3A_fnc_addEnemyResources;
};

Error_1("Called with unknown type: %1", _type);

// TODO: do we need to publish these?
// Probably not for decision code (always runs on server), but might be needed for intel?

/*
private _varName = call {
    if (_type == "defence") exitWith { ["A3A_resourcesDefenceOcc", "A3A_resourcesDefenceInv"] select (_side == Invaders) };
    if (_type == "attack") exitWith { ["A3A_resourcesAttackOcc", "A3A_resourcesAttackInv"] select (_side == Invaders) };
};

if (isNil "_varName") exitWith {};

isNil { missionNamespace setVariable [_varName, (missionNamespace getVariable _varName) + _count, true] };
*/