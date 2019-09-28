//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

_fnc_economics = {
    params ["_coefficient", "_random", "_typeX", "_maxItems", "_accelerator"];
    private ["_currentItems"];

    if (_typeX isEqualType "") then {
        _typeX  = [_typeX];
    };
	
	if (_typeX isEqualTo []) exitWith {};

    if (_random == "random") then {
        private _selectedType = selectRandom _typeX;
        _currentItems = timer getVariable [_selectedType, 0];
        if (_currentItems < _maxItems) then {
            timer setVariable [_selectedType, _currentItems + _coefficient * _accelerator, true];
        };
    } else {
        _currentItems = 0;
        {
            _currentItems = _currentItems + (timer getVariable [_x, 0]);
        } forEach _typeX;
        if (_currentItems < _maxItems) then {
            timer setVariable [selectRandom _typeX, _currentItems + _coefficient * _accelerator, true];
        };
    };
};

//--------------------------------------Occupants--------------------------------------------------
private _airbases = { sidesX getVariable [_x, sideUnknown] == Occupants } count airportsX;
private _outposts = { sidesX getVariable [_x, sideUnknown] == Occupants } count outposts;
private _seaports = { sidesX getVariable [_x, sideUnknown] == Occupants } count seaports;
private _accelerator = [1 + (tierWar + difficultyCoef) / 20, 0] select (tierWar == 1);

[0.2, "", staticATOccupants, _outposts * 0.2 + _airbases * 0.5, _accelerator] spawn _fnc_economics;
[0.1, "", staticAAOccupants, _airbases * 2, _accelerator] spawn _fnc_economics;
[0.2, "random", vehNATOAPC, _outposts * 0.3 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", vehNATOTank, _outposts * 0.5 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", vehNATOAA, _airbases, _accelerator] spawn _fnc_economics;
[0.3, "", vehNATOBoat, _seaports, _accelerator] spawn _fnc_economics;
[0.2, "", vehNATOPlane, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", vehNATOPlaneAA, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", vehNATOTransportPlanes, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", vehNATOTransportHelis - [vehNATOPatrolHeli], _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", vehNATOAttackHelis, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", vehNATOMRLS, _airbases + _outposts * 0.2, _accelerator] spawn _fnc_economics;

//--------------------------------------Invaders---------------------------------------------------
_airbases = { sidesX getVariable [_x, sideUnknown] == Invaders } count airportsX;
_outposts = { sidesX getVariable [_x, sideUnknown] == Invaders } count outposts;
_seaports = { sidesX getVariable [_x, sideUnknown] == Invaders } count seaports;
_accelerator = 1.2 + (tierWar + difficultyCoef) / 20;

[0.2, "", staticATInvaders, _outposts * 0.2 + _airbases * 0.5, _accelerator] spawn _fnc_economics;
[0.1, "", staticAAInvaders, _airbases * 2, _accelerator] spawn _fnc_economics;
[0.2, "random", vehCSATAPC, _outposts * 0.3 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", vehCSATTank, _outposts * 0.5 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", vehCSATAA, _airbases, _accelerator] spawn _fnc_economics;
[0.3, "", vehCSATBoat, _seaports, _accelerator] spawn _fnc_economics;
[0.2, "", vehCSATPlane, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", vehCSATPlaneAA, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", vehCSATTransportPlanes, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", vehCSATTransportHelis - [vehCSATPatrolHeli], _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", vehCSATAttackHelis, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", vehCSATMRLS, _airbases + _outposts * 0.2, _accelerator] spawn _fnc_economics;
