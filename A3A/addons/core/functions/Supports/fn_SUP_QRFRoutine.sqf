
/*


*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_sleepTime", "_targPos", "_base", "_isAir", "_vehCount", "_attackCount", "_estResources"];

sleep _sleepTime;

// Now spawn the actual QRF
ServerDebug_3("%1 attempting to create force with %2 transport and %3 attack vehicles", _supportName, _vehCount-_attackCount, _attackCount);
private _data = if (_isAir) then {
    [_side, _base, _targPos, _resPool, _vehCount, _attackCount] call A3A_fnc_createAttackForceAir;
} else {
    [_side, _base, _targPos, _resPool, _vehCount, _attackCount] call A3A_fnc_createAttackForceLand;
};
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];
ServerInfo_1("Spawn performed: Vehicles %1", _vehicles apply { typeOf _x });

// Update the resource usage for the final value
[_estResources - _resources, _side, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];


private _searchTime = time;
private _travelling = true;
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

while {true} do
{
    private _curSoldiers = { _x call A3A_fnc_canFight } count _soldiers;
    if (_curSoldiers < count _soldiers * 0.25) exitWith {
        ServerInfo_1("QRF %1 has been defeated, starting retreat", _supportName);
    };

    if (_travelling and {-1 != _cargoGroups findif { leader _x distance2d _targPos < 300 }}) then {
        _travelling = false;
        _searchTime = time + 600;           // give it 10 minutes to find a target
        ServerDebug_1("%1 is approaching its objective", _supportName);
    };

    if (!_travelling and {time > _searchTime}) then {
        // objNull distance2d [anything] is 1e10
        if (-1 == _cargoGroups findIf { (leader _x findNearestEnemy _targPos) distance2d _targPos < 500 }) then {
            ServerInfo_1("%1 has no nearby targets, returning", _supportName);
            break;
        };
    };

    sleep 30;
};

// Hack. Find nearest friendly garrison marker and use that as attempted garrison target if close
private _potentials = outposts + airportsX + resourcesX + factories + seaports;
_potentials = _potentials select { sidesX getVariable _x == _side };
private _nearestMrk = [_potentials, _targPos] call BIS_fnc_nearestPosition;     // might be nil, which is fine?

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _crewGroups;
{
    if (isNil "_nearestMrk") then { [_x] spawn A3A_fnc_enemyReturnToBase; continue };
    [_x, _nearestMrk] spawn A3A_fnc_enemyReturnToBase;
    sleep 10;
} forEach _cargoGroups;
