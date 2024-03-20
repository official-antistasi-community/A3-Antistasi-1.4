
params ["_medic", "_target", "_dragPos"];

_medic setUnitPos "MIDDLE";
_medic playAction "grabDrag";
_timeOut = time + 5;
waitUntil {sleep 0.3; ((animationState _medic) == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") or ((animationState _medic) == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2") or !([_medic] call A3A_fnc_canFight) or (_timeOut < time)};
if !([_medic] call A3A_fnc_canFight) exitWith {};

[_target,"AinjPpneMrunSnonWnonDb"] remoteExecCall ["switchMove", _target];           // injured dragged pose, no animation
_medic disableAI "ANIM";
//_medic playMoveNow "AcinPknlMstpSrasWrflDnon";
_medic stop false;          // why?

private _dummyGrp = createGroup [civilian, true];
private _dummy = _dummyGrp createUnit ["C_man_polo_1_F", [0,0,20], [], 0, "FORM"];
_dummy setUnitPos "MIDDLE";
_dummy forceWalk true;
_dummy switchMove "AmovPknlMstpSlowWnonDnon";       // Basic no-weapon kneel pose. Otherwise the dummy does a slow weapon-stow animation on spawn which delays the drag.
_dummy setSkill 0;
[_dummy,true] remoteExec ["hideObjectGlobal",2];
_dummy allowdammage false;
_dummy setBehaviour "CARELESS";
_dummy disableAI "FSM";
_dummy disableAI "SUPPRESSION";
//_dummy forceSpeed 0.2;
_dummy setPosATL (getPosATL _medic);

_medic attachTo [_dummy, [0, -0.2, 0]];
_medic setDir 180;
_target attachTo [_dummy, [0,-1.1, 0.092]];
_target setDir 0;

_dummy doMove _dragPos;
[_medic] spawn {sleep 1; (_this select 0) playMove "AcinPknlMwlkSrasWrflDb"};         // Backwards walking animation, delayed because dummy won't move immediately
private _timeOut = time + 30;
private _lastPos = getPosATL _dummy;
sleep 1;
while {true} do
{
    sleep 1;
    if (!([_medic] call A3A_fnc_canFight) or (!alive _target) or (unitReady _dummy) or (_timeOut < time) or (_medic != vehicle _medic) or (_medic getVariable ["cancelRevive",false])) exitWith {};
    if (_lastPos distance _dummy < 0.1) exitWith {};        // stuck?
    _lastPos = getPosATL _dummy;
/*
    // Is any of this necessary? Why would it be?
    if (_target distance _dummy > 3) then
    {
        detach _target;
        _target setPosATL (getPosATL _dummy);
        _target attachTo [_dummy, [0,-1.1, 0.092]];
        _target setDir 0;
    };
    if (_medic distance _dummy > 3) then
    {
        detach _medic;
        _medic setPosATL (getPosATL _dummy);
        _medic attachTo [_dummy, [0, -0.2, 0]];
        _medic setDir 180;
    };
*/
};

detach _target;
detach _medic;
deleteVehicle _dummy;
_medic enableAI "ANIM";
_medic playAction "released";           // Revert to normal pose
// All release animations seem to chain to a face-down unconscious pose, and the paths out of that are all broken, so we hard switch
[_target, "UnconsciousReviveDefault"] remoteExecCall ["switchMove", _target];     // face-up unconscious endpoint
