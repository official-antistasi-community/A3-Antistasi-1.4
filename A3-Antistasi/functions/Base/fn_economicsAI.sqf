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
private _capBalance = tierWar + 5;
private _playerScale = exp((sqrt(count allPlayers)/3) - 1);

[0.2 * _playerScale, "", staticATOccupants, _capBalance + _outposts * 0.2 + _airbases * 0.5, _accelerator] spawn _fnc_economics;
[0.1 * _playerScale, "", staticAAOccupants, _capBalance + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehNATOAPC, _capBalance + _outposts * 0.3 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1 * _playerScale, "", vehNATOTank, _capBalance + _outposts * 0.5 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1 * _playerScale, "", vehNATOAA, _capBalance + _airbases, _accelerator] spawn _fnc_economics;
[0.3 * _playerScale, "", vehNATOBoat, _capBalance + _seaports, _accelerator] spawn _fnc_economics; //Why on earth do they get as many boats but we cheat AA tanks????
[0.2 * _playerScale, "", vehNATOPlane, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "", vehNATOPlaneAA, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehNATOTransportPlanes, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehNATOTransportHelis - [vehNATOPatrolHeli], _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehNATOAttackHelis, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "", vehNATOMRLS, _capBalance + _airbases + _outposts * 0.2, _accelerator] spawn _fnc_economics;

//--------------------------------------Invaders---------------------------------------------------
_airbases = { sidesX getVariable [_x, sideUnknown] == Invaders } count airportsX;
_outposts = { sidesX getVariable [_x, sideUnknown] == Invaders } count outposts;
_seaports = { sidesX getVariable [_x, sideUnknown] == Invaders } count seaports;
_accelerator = 1.2 + (tierWar + difficultyCoef) / 20;
_capBalance = tierWar * 2 + 10;

[0.2 * _playerScale, "", staticATInvaders, _capBalance + _outposts * 0.2 + _airbases * 0.5, _accelerator] spawn _fnc_economics;
[0.1 * _playerScale, "", staticAAInvaders, _capBalance + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehCSATAPC, _capBalance + _outposts * 0.3 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1 * _playerScale, "", vehCSATTank, _capBalance + _outposts * 0.5 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1 * _playerScale, "", vehCSATAA, _capBalance + _airbases, _accelerator] spawn _fnc_economics;
[0.3 * _playerScale, "", vehCSATBoat, _capBalance + _seaports, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "", vehCSATPlane, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "", vehCSATPlaneAA, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehCSATTransportPlanes, _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehCSATTransportHelis - [vehCSATPatrolHeli], _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "random", vehCSATAttackHelis, _capBalance + _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2 * _playerScale, "", vehCSATMRLS, _capBalance + _airbases + _outposts * 0.2, _accelerator] spawn _fnc_economics;
