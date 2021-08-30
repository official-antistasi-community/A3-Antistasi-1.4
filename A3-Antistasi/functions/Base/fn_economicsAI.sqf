//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

// Increase one type by _increase*_typeCoeff, if total of types is lower than _baseCap*_typeCoeff
_fnc_economics = {
    params ["_types", "_typeCoeff", "_baseCap", "_increase"];

    if (_types isEqualTo []) exitWith {};

    private _totalItems = 0;
    {
        // fractions don't count towards cap
        _totalItems = _totalItems + floor (timer getVariable [_x, 0]);
    } forEach _types;

    if (_totalItems < ceil (_typeCoeff * _baseCap)) then {
        private _type = selectRandom _types;
        private _currentItems = timer getVariable [_type, 0];
        timer setVariable [_type, _currentItems + _typeCoeff * _increase, true];
    };
};

// Community with ~30 players killed roughly 2 APCs per hour, probably similar for attack helis
// Air vehicles set fairly high because we're using a lot of them since 2.4
// Coeff 1.0 means one vehicle per hour with 9 players @ tierWar 7, or two vehicles per hour for 26 players.

// 9 players @ tierWar 7 => balanceScale 1
private _playerScale = exp((sqrt(count allPlayers)/3) - 1);
private _balanceScale = _playerScale * (3 + tierWar) / 10;

//--------------------------------------Occupants--------------------------------------------------
private _airbases = { sidesX getVariable [_x, sideUnknown] == Occupants } count airportsX;
private _outposts = { sidesX getVariable [_x, sideUnknown] == Occupants } count outposts;
private _seaports = { sidesX getVariable [_x, sideUnknown] == Occupants } count seaports;

private _airCap = _balanceScale * (4 + _airbases*2);
private _groundCap = _balanceScale * (4 + _airbases + _outposts*0.5);
private _increase = _balanceScale / 6;      // Because it's called six times per hour. Could pass in a time instead...

[[staticATOccupants], 1.0, _groundCap, _increase] call _fnc_economics;
[[staticAAOccupants], 1.0, _groundCap, _increase] call _fnc_economics;
[vehNATOAPC, 1.2, _groundCap, _increase] call _fnc_economics;
[[vehNATOTank], 0.4, _groundCap, _increase] call _fnc_economics;
[[vehNATOAA], 0.4, _groundCap, _increase] call _fnc_economics;
[[vehNATOMRLS], 0.2, _groundCap, _increase] call _fnc_economics;           // not used atm?
[[vehNATOBoat], 1.0, _balanceScale * (1 + _seaports), _increase] call _fnc_economics;
[[vehNATOPlane], 0.25, _airCap, _increase] call _fnc_economics;             // only used for major attacks
[[vehNATOPlaneAA], 0.25, _airCap, _increase] call _fnc_economics;           // only used for major attacks
[vehNATOTransportPlanes, 1.0, _airCap, _increase] call _fnc_economics;
[vehNATOTransportHelis - [vehNATOPatrolHeli], 1.5, _airCap, _increase] call _fnc_economics;
[vehNATOAttackHelis, 0.8, _airCap, _increase] call _fnc_economics;

private _natoArray = flatten [staticATOccupants, staticAAOccupants, vehNATOAPC, vehNATOTank, vehNATOAA, vehNATOBoat, vehNATOPlane, vehNATOPlaneAA, vehNATOTransportPlanes, (vehNATOTransportHelis - [vehNATOPatrolHeli]), vehNATOAttackHelis, vehNATOMRLS];
_natoArray = _natoArray apply { [_x, timer getVariable [_x, 0]] };
DebugArray("Occupants arsenal", _natoArray);

//--------------------------------------Invaders---------------------------------------------------
_airbases = { sidesX getVariable [_x, sideUnknown] == Invaders } count airportsX;
_outposts = { sidesX getVariable [_x, sideUnknown] == Invaders } count outposts;
_seaports = { sidesX getVariable [_x, sideUnknown] == Invaders } count seaports;

_airCap = 1.2 * _balanceScale * (4 + _airbases*2);
_groundCap = 1.2 * _balanceScale * (4 + _airbases + _outposts*0.5);
_increase = 1.2 * _balanceScale / 6;            // Invaders get a bit more of everything

[[staticATInvaders], 1.0, _groundCap, _increase] call _fnc_economics;
[[staticAAInvaders], 1.0, _groundCap, _increase] call _fnc_economics;
[vehCSATAPC, 1.2, _groundCap, _increase] call _fnc_economics;
[[vehCSATTank], 0.4, _groundCap, _increase] call _fnc_economics;
[[vehCSATAA], 0.4, _groundCap, _increase] call _fnc_economics;
[[vehCSATMRLS], 0.2, _groundCap, _increase] call _fnc_economics;           // not used atm?
[[vehCSATBoat], 1.0, _balanceScale * (1 + _seaports), _increase] call _fnc_economics;
[[vehCSATPlane], 0.25, _airCap, _increase] call _fnc_economics;             // only used for major attacks
[[vehCSATPlaneAA], 0.25, _airCap, _increase] call _fnc_economics;           // only used for major attacks
[vehCSATTransportPlanes, 1.0, _airCap, _increase] call _fnc_economics;
[vehCSATTransportHelis - [vehCSATPatrolHeli], 1.5, _airCap, _increase] call _fnc_economics;
[vehCSATAttackHelis, 0.8, _airCap, _increase] call _fnc_economics;

private _csatArray = flatten [staticATInvaders, staticAAInvaders, vehCSATAPC, vehCSATTank, vehCSATAA, vehCSATBoat, vehCSATPlane, vehCSATPlaneAA, vehCSATTransportPlanes, (vehCSATTransportHelis - [vehCSATPatrolHeli]), vehCSATAttackHelis, vehCSATMRLS];
_csatArray = _csatArray apply { [_x, timer getVariable [_x, 0]] };
DebugArray("Invaders arsenal", _csatArray);
