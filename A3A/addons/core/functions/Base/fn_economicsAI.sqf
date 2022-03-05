#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

params [["_timeInHours", 1/6], ["_occScale", 1], ["_invScale", 1.2]];

// Increase one type by _increase*_typeCoeff, if total of types is lower than _baseCap*_typeCoeff
_fnc_economics = {
    params ["_types", "_typeCoeff", "_baseCap", "_increase"];

    if (_types isEqualTo []) exitWith {};

    isNil {
        private _totalItems = 0;
        {
            // fractions don't count towards cap
            _totalItems = _totalItems + floor (timer getVariable [_x, 0]);
        } forEach _types;

        if (_totalItems < _typeCoeff * _baseCap) then {
            private _type = selectRandom _types;
            private _currentItems = timer getVariable [_type, 0];
            timer setVariable [_type, _currentItems + _typeCoeff * _increase, true];
        };
    };
};

// Community with ~30 players killed roughly 2 APCs per hour, probably similar for attack helis
// However they weren't spawning QRFs or singleAttacks due to maxUnits bugs, so this is probably low
// Air vehicles set fairly high because we're using a lot of them since 2.4
// Coeff 1.0 means one vehicle per hour with 9 players @ tierWar 7, or two vehicles per hour for 26 players.

// 9 players @ tierWar 7 => balanceScale 1
private _playerScale = call A3A_fnc_getPlayerScale;
private _balanceScale = _playerScale * (3 + tierWar) / 10;

//--------------------------------------Occupants--------------------------------------------------
private _airbases = { sidesX getVariable [_x, sideUnknown] == Occupants } count airportsX;
private _outposts = { sidesX getVariable [_x, sideUnknown] == Occupants } count outposts;
private _seaports = { sidesX getVariable [_x, sideUnknown] == Occupants } count seaports;

private _airCap = _occScale * _balanceScale * (4 + _airbases*2);
private _groundCap = _occScale * _balanceScale * (4 + _airbases + _outposts*0.5);
private _increase = _occScale * _balanceScale * _timeInHours;

[FactionGet(occ,"staticAT"), 1.0, _groundCap, _increase] call _fnc_economics;
[FactionGet(occ,"staticAA"), 1.0, _groundCap, _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesAPCs"), 1.8, _groundCap, _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesTanks"), 0.6, _groundCap, _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesAA"), 0.6, _groundCap, _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesArtillery"), 0.3, _groundCap, _increase] call _fnc_economics;           // not used atm?
[FactionGet(occ,"vehiclesGunBoats"), 1.0, _balanceScale * (2 + _seaports*2), _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesPlanesCAS"), 0.25, _airCap, _increase] call _fnc_economics;             // only used for major attacks
[FactionGet(occ,"vehiclesPlanesAA"), 0.25, _airCap, _increase] call _fnc_economics;           // only used for major attacks
[FactionGet(occ,"vehiclesPlanesTransport"), 1.5, _airCap, _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesHelisTransport"), 2.5, _airCap, _increase] call _fnc_economics;
[FactionGet(occ,"vehiclesHelisAttack"), 1.2, _airCap, _increase] call _fnc_economics;

private _natoArray = flatten [FactionGet(occ,"staticAT"), FactionGet(occ,"staticAA"), FactionGet(occ,"vehiclesAPCs"), FactionGet(occ,"vehiclesTanks"), FactionGet(occ,"vehiclesAA"), FactionGet(occ,"vehiclesGunBoats"), FactionGet(occ,"vehiclesPlanesCAS"), FactionGet(occ,"vehiclesPlanesAA"), FactionGet(occ,"vehiclesPlanesTransport"), FactionGet(occ,"vehiclesHelisTransport"), FactionGet(occ,"vehiclesHelisAttack"), FactionGet(occ,"vehiclesArtillery")];
_natoArray = _natoArray apply { [_x, timer getVariable [_x, 0]] };
DebugArray("Occupants arsenal", _natoArray);

//--------------------------------------Invaders---------------------------------------------------
_airbases = { sidesX getVariable [_x, sideUnknown] == Invaders } count airportsX;
_outposts = { sidesX getVariable [_x, sideUnknown] == Invaders } count outposts;
_seaports = { sidesX getVariable [_x, sideUnknown] == Invaders } count seaports;

_airCap = _invScale * _balanceScale * (4 + _airbases*2);
_groundCap = _invScale * _balanceScale * (4 + _airbases + _outposts*0.5);
_increase = _invScale * _balanceScale * _timeInHours;

[FactionGet(inv,"staticAT"), 1.0, _groundCap, _increase] call _fnc_economics;
[FactionGet(inv,"staticAA"), 1.0, _groundCap, _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesAPCs"), 1.8, _groundCap, _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesTanks"), 0.6, _groundCap, _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesAA"), 0.6, _groundCap, _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesArtillery"), 0.3, _groundCap, _increase] call _fnc_economics;           // not used atm?
[FactionGet(inv,"vehiclesGunBoats"), 1.0, _balanceScale * (2 + _seaports*2), _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesPlanesCAS"), 0.25, _airCap, _increase] call _fnc_economics;             // only used for major attacks
[FactionGet(inv,"vehiclesPlanesAA"), 0.25, _airCap, _increase] call _fnc_economics;           // only used for major attacks
[FactionGet(inv,"vehiclesPlanesTransport"), 1.5, _airCap, _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesHelisTransport"), 2.5, _airCap, _increase] call _fnc_economics;
[FactionGet(inv,"vehiclesHelisAttack"), 1.2, _airCap, _increase] call _fnc_economics;

private _csatArray = flatten [FactionGet(inv,"staticAT"), FactionGet(inv,"staticAA"), FactionGet(inv,"vehiclesAPCs"), FactionGet(inv,"vehiclesTanks"), FactionGet(inv,"vehiclesAA"), FactionGet(inv,"vehiclesGunBoats"), FactionGet(inv,"vehiclesPlanesCAS"), FactionGet(inv,"vehiclesPlanesAA"), FactionGet(inv,"vehiclesPlanesTransport"), FactionGet(inv,"vehiclesHelisTransport"), FactionGet(inv,"vehiclesHelisAttack"), FactionGet(inv,"vehiclesArtillery")];
_csatArray = _csatArray apply { [_x, timer getVariable [_x, 0]] };
DebugArray("Invaders arsenal", _csatArray);
