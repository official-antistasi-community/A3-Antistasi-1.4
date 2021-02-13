/*
Author: Caleb Serafin (Everything else), ArtemisGodfrey (Particles)
    Creates a napalm particle effect at target location.
    Depending on wind the particle effect size is proximity: 20m towards wind, 50m windward, 30m to side.
    Only renders for players it is called on.
    Safe to eat. Does not cause cancer or other side-effects.

Arguments:
    <POS3|POS2> AGL centre of effect.
    <SCALAR> Start time if called on a client after the effect has began, allows dynamic rendering. (Default = severTime)
    <STRING> CancellationTokenUUID. Provisioning for implementation of cancellationTokens (Default = "");

Return Value:
    <BOOL> true if normal operation. false if something is invalid.

Scope: Client, Global Arguments, Local Effect
Environment: Scheduled
Public: Yes. Can be called on positions independently, will not trigger other effects or functions.

Example:
    [screenToWorld [0.5,0.5], true] call A3A_fnc_napalmParticles;  // Spawn napalm particles at the terrain position you are looking at.
*/
params [
    ["_pos",[],[ [] ], [2,3]],
    ["_startTime",serverTime,[ 0 ]],
    ["_cancellationTokenUUID","",[ "" ]]
];
private _filename = "functions\AI\fn_napalmParticles.sqf";

if (!hasInterface) exitWith {false};  // No eyes, no render, no service
if ((count _pos) isEqualTo 2) then {
    _pos pushBack 0;
};

private _lightPrimary = "#lightpoint" createVehicleLocal [ _pos#0, _pos#1, _pos#2 + 10];
_lightPrimary setLightBrightness 21.4;
_lightPrimary setLightAmbient[0.3, 0.1, 0];
_lightPrimary setLightColor[0.3, 0.1, 0];

private _lightAccent = "#lightpoint" createVehicleLocal [_pos#0, _pos#1, _pos#2 + 10];
_lightAccent setLightBrightness 55;
_lightAccent setLightAmbient[1, 1, 1];
_lightAccent setLightColor[1, 1, 0.9];

private _posAdj = [_pos#0, _pos#1, _pos#2 + 5];
//--- Dust
setWind [0.401112*2,0.204166*2,false];
private _velocity = wind;

private _colour = [1, 1, 1];
private _alpha = 0.31;
private _fireRed = "#particlesource" createVehicleLocal _posAdj;  // this is fire is red
_fireRed setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 1, 12, 0], "", "Billboard", 1, 2 + random 3, [0, 0, 5], _velocity, 1, 1.1, 1, 0, [1 + (random 1.1)], [_colour + [0], _colour + [_alpha], _colour + [0]], [1000], 1, 0, "", "", 1];
_fireRed setParticleRandom [3, [0, 0, 0], [random 4, random 4, 2], 14, 3, [0, 0, 0, 0.1], 1, 0];
_fireRed setParticleCircle [20, [0, 0, 0]];
_fireRed setDropInterval 0.004;

_alpha = 0.35 ;
private _fireYellow = "#particlesource" createVehicleLocal _posAdj;  //this is fire is yellow
_fireYellow setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 1 + random 1, [5, 5, 4], _velocity, 1, 1.1, 1, 0, [1.8 + (random 1)], [_colour + [0], _colour + [_alpha], _colour + [0]], [1000], 1, 0, "", "", 1];
_fireYellow setParticleRandom [3, [0, 0, 0], [random 5, random 2, 1], 14, 3, [0, 0, 0, 0.1], 1, 0];
_fireYellow setParticleCircle [20, [0, 0, 0]];
_fireYellow setDropInterval 0.0012;

_alpha = 0.1 ;
_colour = [1, 1, 0.9];
private _fireWhite = "#particlesource" createVehicleLocal _posAdj;
_fireWhite setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 5, 0], "", "Billboard", 1, 16, [0, 0, 1], _velocity, 1, 1.52,1, 0, [0.007 + (random 0.02)], [_colour + [0], _colour + [_alpha], _colour + [0]], [1000], 1, 0, "", "", 1];
_fireWhite setParticleRandom [0, [0, 0, 0], [0.2, 0.2, 4], 14, 3, [0, 0, 0, 22], 1, 0];
_fireWhite setParticleCircle [20, [0, 0, 0]];
_fireWhite setDropInterval 0.01;


[_lightAccent,_startTime,_cancellationTokenUUID] spawn {
    params ["_lightAccent","_startTime","_canTokUUID"];
    private _dimTime = 75;
    private _dimEnd = _startTime + _dimTime;
    private _fnc_cancelRequested = { false; };// Future provisioning for implementation of cancellationTokens.
    while {serverTime <= _dimEnd && !([_canTokUUID] call _fnc_cancelRequested)} do {
        _lightAccent setLightBrightness ((55 * (1- sqrt( (serverTime-_startTime)/_dimTime ))) max 0.001);
        uiSleep 5;
    };
    _lightAccent setLightBrightness 0.001;
};

private _effectLifetimes = [  // These are independent times from startTime
    [10,_fireWhite],
    [75,_lightAccent],
    [75,_fireYellow],
    [90,_fireRed],
    [90,_lightPrimary]
];
_effectLifetimes sort true;

private _fnc_cancelRequested = { false; };// Future provisioning for implementation of cancellationTokens.
while {count _effectLifetimes > 0 && !([_cancellationTokenUUID] call _fnc_cancelRequested)} do {
    uiSleep ((_startTime + _effectLifetimes#0#0 - serverTime) max 0.01);  // sleep until next one is due.
    deleteVehicle (_effectLifetimes#0#1);
    _effectLifetimes deleteAt 0;
};
if ([_cancellationTokenUUID] call _fnc_cancelRequested) then {
    { deleteVehicle (_effectLifetimes#0#1); } forEach _effectLifetimes;
};

true;
