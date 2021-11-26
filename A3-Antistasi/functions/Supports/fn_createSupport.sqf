params ["_side", "_timerIndex", "_supportType", "_supportTarget", "_precision", "_revealCall"];

/*  Creates an support type that attacks areas

    Execution on: Server

    Scope: Internal

    Parameters:
        _side: SIDE: The side of the support unit
        _timerIndex: NUMBER: The number of the timer for the support
        _supportType: STRING: The type of support to send
        _supportTarget: POSITION or OBJECT: The position or object which will be attacked
        _precision: NUMBER: How precise the target info is

    Returns:
        Nothing
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//Selecting the first available name of support type
private _supportIndex = 0;
private _supportName = format ["%1%2", _supportType, _supportIndex];
while {(server getVariable [format ["%1_targets", _supportName], -1]) isEqualType []} do
{
    _supportIndex = _supportIndex + 1;
    _supportName = format ["%1%2", _supportType, _supportIndex];
};

Debug_1("New support name will be %1", _supportName);

private _supportMarker = "";
switch (_supportType) do
{
    case ("QRF"):
    {
        _supportMarker = [_side, _supportTarget, _supportName] call A3A_fnc_SUP_QRF;
    };
    case ("AIRSTRIKE"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_airstrike;
    };
    case ("MORTAR"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_mortar;
    };
    case ("ORBSTRIKE"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_orbitalStrike;
    };
    case ("MISSILE"):
    {
        _supportMarker = [_side, _timerIndex, _supportName] call A3A_fnc_SUP_cruiseMissile;
    };
    case ("SAM"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_SAM;
    };
    case ("CARPETBOMB"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_carpetBombs;
    };
    case ("CAS"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_CAS;
    };
    case ("ASF"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_ASF;
    };
    case ("GUNSHIP"):
    {
        _supportMarker = [_side, _timerIndex, _supportTarget, _supportName] call A3A_fnc_SUP_gunship;
    };
};

if(_supportMarker isEqualType [] && {(_supportMarker select 0) != ""}) then
{
    server setVariable [format ["%1_targets", _supportName], [[[_supportTarget, _precision], _revealCall]], true];
    if (_side == Occupants) then
    {
        occupantsSupports pushBack [_supportType, _supportMarker select 0, _supportName];
    };
    if(_side == Invaders) then
    {
        invadersSupports pushBack [_supportType, _supportMarker select 0, _supportName];
    };
    private _supportPos = if (_supportTarget isEqualType objNull) then {getPos _supportTarget} else {_supportTarget};
    [_revealCall + (random 0.4) - 0.2, _side, _supportType, _supportPos, _supportMarker select 1, _supportMarker select 2] spawn A3A_fnc_showInterceptedSetupCall;
}
else
{
    Info_2("Maybe no spawn, maybe bad value, input %1, return %2", _supportType, _supportMarker);
};

supportCallInProgress = false;
