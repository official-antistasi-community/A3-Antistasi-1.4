#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

_fnc_economics =
{
    params
    [
        ["_coefficient", 0, [0]],
        ["_isRandom", false, [false]],
        ["_types", [], ["", []]],
        ["_itemCap", 0, [0]],
        ["_accelerator", 0, [0]]
    ];

    if (_types isEqualType "") then
    {
        _types  = [_types];
    };

	if (_types isEqualTo []) exitWith {};

    private _currentItems = 0;
    private _selectedType = "";
    if (_isRandom) then
    {
        _selectedType = selectRandom _types;
        _currentItems = timer getVariable [_selectedType, 0];
        if (_currentItems < _itemCap) then
        {
            timer setVariable [_selectedType, _currentItems + _coefficient * _accelerator, true];
            Debug_3("Out of the array %1, increased %2 by %3", str _types, _selectedType, _coefficient * _accelerator);
        };
    }
    else
    {
        {
            _selectedType = _x;
            _currentItems = _currentItems + (timer getVariable [_selectedType, 0]);
            if (_currentItems < _itemCap) then
            {
                timer setVariable [_selectedType, _currentItems + _coefficient * _accelerator, true];
                Debug_2("Increasing single entry %1 by %2", _selectedType, _coefficient * _accelerator);
            };
        } forEach _types;
    };
};

//--------------------------------------Occupants--------------------------------------------------
private _airbases = { sidesX getVariable [_x, sideUnknown] == Occupants } count airportsX;
private _outposts = { sidesX getVariable [_x, sideUnknown] == Occupants } count outposts;
private _seaports = { sidesX getVariable [_x, sideUnknown] == Occupants } count seaports;
private _accelerator = [1 + (tierWar + difficultyCoef) / 20, 0] select (tierWar == 1);
private _capBalance = tierWar + 5;
private _playerScale = exp((sqrt(count allPlayers)/3) - 1);

[0.2 * _playerScale, false, staticATOccupants, _capBalance + _outposts * 0.2 + _airbases * 0.5, _accelerator] call _fnc_economics;
[0.1 * _playerScale, false, staticAAOccupants, _capBalance + _airbases * 2, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehNATOAPC, _capBalance + _outposts * 0.3 + _airbases * 2, _accelerator] call _fnc_economics;
[0.1 * _playerScale, false, vehNATOTank, _capBalance + _outposts * 0.5 + _airbases * 2, _accelerator] call _fnc_economics;
[0.1 * _playerScale, false, vehNATOAA, _capBalance + _airbases, _accelerator] call _fnc_economics;
[0.3 * _playerScale, false, vehNATOBoat, _capBalance + _seaports, _accelerator] call _fnc_economics; //Why on earth do they get as many boats but we cheat AA tanks????
[0.2 * _playerScale, false, vehNATOPlane, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, false, vehNATOPlaneAA, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehNATOTransportPlanes, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehNATOTransportHelis - [vehNATOPatrolHeli], _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehNATOAttackHelis, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, false, vehNATOMRLS, _capBalance + _airbases + _outposts * 0.2, _accelerator] call _fnc_economics;

private _natoArray = [];
{
    if(_x isEqualType "") then
    {
        _natoArray pushBack [_x, timer getVariable [_x, 0]];
    }
    else
    {
        private _array = _x;
        _natoArray append (_array apply {[_x, timer getVariable [_x, 0]]});
    };
} forEach [staticATOccupants, staticAAOccupants, vehNATOAPC, vehNATOTank, vehNATOAA, vehNATOBoat, vehNATOPlane, vehNATOPlaneAA, vehNATOTransportPlanes, (vehNATOTransportHelis - [vehNATOPatrolHeli]), vehNATOAttackHelis, vehNATOMRLS];
DebugArray("Occupants arsenal", _natoArray);
//--------------------------------------Invaders---------------------------------------------------
_airbases = { sidesX getVariable [_x, sideUnknown] == Invaders } count airportsX;
_outposts = { sidesX getVariable [_x, sideUnknown] == Invaders } count outposts;
_seaports = { sidesX getVariable [_x, sideUnknown] == Invaders } count seaports;
_accelerator = 1.2 + (tierWar + difficultyCoef) / 20;
_capBalance = tierWar * 2 + 10;

[0.2 * _playerScale, false, staticATInvaders, _capBalance + _outposts * 0.2 + _airbases * 0.5, _accelerator] call _fnc_economics;
[0.1 * _playerScale, false, staticAAInvaders, _capBalance + _airbases * 2, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehCSATAPC, _capBalance + _outposts * 0.3 + _airbases * 2, _accelerator] call _fnc_economics;
[0.1 * _playerScale, false, vehCSATTank, _capBalance + _outposts * 0.5 + _airbases * 2, _accelerator] call _fnc_economics;
[0.1 * _playerScale, false, vehCSATAA, _capBalance + _airbases, _accelerator] call _fnc_economics;
[0.3 * _playerScale, false, vehCSATBoat, _capBalance + _seaports, _accelerator] call _fnc_economics;
[0.2 * _playerScale, false, vehCSATPlane, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, false, vehCSATPlaneAA, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehCSATTransportPlanes, _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehCSATTransportHelis - [vehCSATPatrolHeli], _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, true, vehCSATAttackHelis, _capBalance + _airbases * 4, _accelerator] call _fnc_economics;
[0.2 * _playerScale, false, vehCSATMRLS, _capBalance + _airbases + _outposts * 0.2, _accelerator] call _fnc_economics;

_natoArray = [];
{
    if(_x isEqualType "") then
    {
        _natoArray pushBack [_x, timer getVariable [_x, 0]];
    }
    else
    {
        private _array = _x;
        _natoArray append (_array apply {[_x, timer getVariable [_x, 0]]});
    };
} forEach [staticATInvaders, staticAAInvaders, vehCSATAPC, vehCSATTank, vehCSATAA, vehCSATBoat, vehCSATPlane, vehCSATPlaneAA, vehCSATTransportPlanes, (vehCSATTransportHelis - [vehCSATPatrolHeli]), vehCSATAttackHelis, vehCSATMRLS];
DebugArray("Invaders arsenal", _natoArray);
