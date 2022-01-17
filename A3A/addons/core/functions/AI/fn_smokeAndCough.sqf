/*
Maintainer: Caleb Serafin
    Creates an Immersive Audio and Visual Aid for finding a nearby humanoid. (Last time I checked, robots don't cough)
    Coughing occurs in three burst. Total duration is about 20 seconds. Smoke is vanilla smoke grenade.

Arguments:
    <POSASL> Source of smoke and coughing.
    <SCALAR> Minimum Audible range for coughing. (Default = 100)

Scope: Any, Global Effect
Environment: Any
Public: Yes

Example:
    [getPosASL player, 50] call A3A_fnc_smokeAndCough;

    // Here's one to prank your friends in multiplayer.
    [screenToWorld [0.5, 0.5]] call A3A_fnc_smokeAndCough;
*/

params [
    ["_posASL", [0,0,0], [ [] ], [3]],
    ["_audibleRange", 100, [0]]
];
// Audio and Visual aid.

[_posASL,_audibleRange] spawn {
    params ["_posASL", "_audibleRange"];

    private _posAGL = ASLToAGL _posASL;
    // Base distance plus 10 ensures that the flag capturer can hear the sound faintly.
    // Total distance multiply by 10 extends the range enough so that it can be herd. Arma's calculation is the range at which the sound cannot be herd.
    // The volume serves more as loudness, since it does not affect range much.
    "SmokeShell" createVehicle _posAGL;
    uiSleep 2;
    private _soundSettings = [objNull, false, _posASL, 1.5, 1, 10*_audibleRange, 0, false];
    playSound3D (["A3\Sounds_F\characters\human-sfx\Person0\P0_choke_02.wss"] + _soundSettings);
    uiSleep 8;
    playSound3D (["A3\Sounds_F\characters\human-sfx\Person0\P0_choke_03.wss"] + _soundSettings);
    uiSleep 8;
    playSound3D(["A3\Sounds_F\characters\human-sfx\Person0\P0_choke_04.wss"] + _soundSettings);
};
