params ["_side", "_timerIndex", "_supportPos", "_supportName"];

/*  Sets up the data for the airstrike support

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side of which the airstrike should be send
        _timerIndex: NUMBER :  The number of the support timer
        _supportPos: POSITION : The position to which the airstrike should be carried out
        _supportName: STRING : The callsign of the support

    Returns:
        The name of the target marker, empty string if not created
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _airport = [_supportPos, _side] call A3A_fnc_findAirportForAirstrike;

if(_airport == "") exitWith
{
    Info_1("No airport found for %1 support", _supportName);
    ["", 0, 0];
};

private _coverageMarker = createMarkerLocal [format ["%1_coverage", _supportName], _supportPos];
_coverageMarker setMarkerShapeLocal "ELLIPSE";
_coverageMarker setMarkerSizeLocal [200, 200];
_coverageMarker setMarkerAlphaLocal 0;

private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _weightHE = if (_side == Occupants) then {2} else {1};             // occupants less likely to use the wide-area stuff
private _weightCluster = 0 max ((tierWar - 5) / 10 + _aggroValue / 200);           // 1 at max warlevel and aggro
private _weightNapalm = if (napalmEnabled) then {_weightCluster} else {0};

private _bombType = selectRandomWeighted ["HE", _weightHE, "CLUSTER", _weightCluster, "NAPALM", _weightNapalm];

Info_1("Airstrike will be carried out with bombType %1", _bombType);

private _setupTime = 1200 - ((tierWar - 1) * 110);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

[_side, _timerIndex, _sleepTime, _bombType, _airport, _supportPos, _supportName] spawn A3A_fnc_SUP_airstrikeRoutine;

private _result = [_coverageMarker, _minSleepTime, _setupTime];
_result;
