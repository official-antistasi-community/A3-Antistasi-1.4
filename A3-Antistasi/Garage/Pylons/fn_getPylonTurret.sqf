/*
 * Author: PabstMirror (striped of any ace dependancy by Håkon)
 * Finds turret owner of a pylon.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Pylon Index (starting at 0) <NUMBER>
 *
 * Return Value:
 * * Turret index (either [-1] or [0]) <ARRAY>
 *
 * Scope: Any
 * Environment: Any
 * Example:
 * [cursorObject, 0] call HR_GRG_fnc_getPylonTurret;
 *
 * Public: No
 */

params ["_vehicle", "_pylonIndex"];

// See if index is in ace_pylonTurrets setVar on vehicle
private _pylonTurrets = _vehicle getVariable ["ace_pylonTurrets", []];
private _returnValue = _pylonTurrets param [_pylonIndex, []];

if (_returnValue isEqualTo []) then {
    // Attempt to determine turret owner based on magazines in the vehicle
    private _pyMags = getPylonMagazines _vehicle;
    private _pylonConfigs = configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
    if (_pylonIndex >= (count _pyMags)) exitWith {};
    if (_pylonIndex >= (count _pylonConfigs)) exitWith {};

    private _targetMag = _pyMags select _pylonIndex;
    private _inPilot = _targetMag in (_vehicle magazinesTurret [-1]);
    private _inGunner = _targetMag in (_vehicle magazinesTurret [0]);

    if (_inPilot) then {
        if !(_inGunner) then {
            _returnValue = [];
        };
    } else {
        if (_inGunner) then {
            _returnValue = [0];
        };
    };

    if (_returnValue isEqualTo []) then { // If not sure, just use config value
        _returnValue = getArray ((_pylonConfigs select _pylonIndex) >> "turret");
    };
} else {
    if (_returnValue isEqualTo [-1]) then { _returnValue = [] };
};

_returnValue
