
/*  Sends a combined attack force to capture the given marker

    Environment: Server or HC, scheduled

    Params:
        _mrkDest: MARKER : The target position where the attack will be send to
        _side: SIDE : The side to send the attack
        _vehCount: NUMBER : Number of vehicles to use in the attack
        _reveal: NUMBER : Amount of info to reveal to rebels, 0 low, 1 high

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mrkDest", "_side", "_vehCount", "_reveal"];
private _targPos = markerPos _mrkDest;

ServerInfo_1("Starting attack with parameters %1", _this);

private _airbase = [_side, markerPos _mrkDest] call A3A_fnc_availableBasesAir;
private _basesAndWeights = [_side, markerPos _mrkDest, true] call A3A_fnc_availableBasesLand;
private _countLandBases = count (_basesAndWeights#0);
private _landBase = if (_countLandBases > 0) then { _basesAndWeights#0 selectRandomWeighted _basesAndWeights#1 } else { "" };

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

// Set the attack heli count now
private _AHratio = (5 + tierWar) * ([0.1, 0.2] select (_landBase == ""));
private _AHcount = random 0.3 + _vehCount * (0.5 * random 1) * _AHratio;

ServerDebug_4("Land base %1 (%2 possible), air base %3, aiming for %4 air supports", _landBase, _countLandBases, _airBase, _AHcount);

if (_landBase != "") then
{
    private _groundVehCount = _vehCount - _AHcount;
    // If we're sending a lot of stuff or there's only one land base, send some air transports anyway
    if (_groundVehCount >= 4 or _countLandBases == 1) then { _groundVehCount = _groundVehCount * (0.5 + random 0.5) };
    _groundVehCount = round _groundVehCount;
    private _attackCount = round (_groundVehCount * (0.25 + random 0.2));

    private _data = [_side, _landBase, _mrkDest, "defence", _groundVehCount, _attackCount] call A3A_fnc_createAttackForceLand;
    _resourcesSpent = _resourcesSpent + _data#0;
    _vehicles = _vehicles + _data#1;
    _crewGroups = _crewGroups + _data#2;
    _cargoGroups = _cargoGroups + _data#3;

    [-(_data#0), _side, "defence"] remoteExec ["A3A_fnc_addEnemyResources", 2];

    ServerInfo_1("Spawn performed: Ground vehicles %1", _data#1 apply {typeOf _x}); 
};

// Now we delay until ground vehicles should have got somewhere near...
private _approxTime = 60 + random 120;
if (_landBase != "") then { _approxTime = (markerPos _landBase distance _targpos) / 15 };

[_reveal, _side, "Counterattack", _targPos, _approxTime] remoteExec ["A3A_fnc_showInterceptedSetupCall", 2];

sleep _approxTime;

if (_airBase != "") then
{
    private _airVehCount = _vehCount - count (_vehicles);
    if (_airVehCount <= 0) exitWith {};

    private _data = [_side, _airBase, _mrkDest, "defence", _airVehCount, round _AHcount] call A3A_fnc_createAttackForceAir;
    _resourcesSpent = _resourcesSpent + _data#0;
    _vehicles = _vehicles + _data#1;
    _crewGroups = _crewGroups + _data#2;
    _cargoGroups = _cargoGroups + _data#3;

    [-(_data#0), _side, "defence"] remoteExec ["A3A_fnc_addEnemyResources", 2];

    ServerInfo_1("Spawn performed: Air vehicles %1", _data#1 apply {typeOf _x}); 
};


// Prepare despawn conditions
private _endTime = time + 2700;
private _victory = false;
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

while {true} do
{
    private _markerSide = sidesX getVariable _mrkDest;
    if(_markerSide == _side) exitWith {
        ServerInfo_1("Small attack to %1 captured the marker, starting despawn routines", _mrkDest);
        _victory = true;
    };

    private _curSoldiers = { _x call A3A_fnc_canFight } count _soldiers;
    if (_curSoldiers < count _soldiers * 0.25) exitWith {
        ServerInfo_1("Small attack to %1 has been defeated, starting despawn routines", _mrkDest);
    };
    if(_endTime < time) exitWith {
        ServerInfo_1("Small attack to %1 timed out, starting despawn routines", _mrkDest);
    };

    // Attempt to flip marker
    [_mrkDest, _markerSide] remoteExec ["A3A_fnc_zoneCheck", 2];
    sleep 30;
};

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _crewGroups;
{
    [_x, [nil, _mrkDest] select _victory] spawn A3A_fnc_enemyReturnToBase;
    sleep 10;
} forEach _cargoGroups;
