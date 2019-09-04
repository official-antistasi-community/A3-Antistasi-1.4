//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

#define OCCS [\
	[0.2, 0, staticATOccupants, "_outposts * 0.2 + _airbases * 0.5"],\
	[0.1, 0, staticAAOccupants, "_airbases * 2"],\
	[0.2, 1, vehNATOAPC, "_outposts * 0.3 + _airbases * 2"],\
	[0.1, 0, vehNATOTank, "_outposts * 0.5 + _airbases * 2"],\
	[0.1, 0, vehNATOAA, "_airbases"],\
	[0.3, 0, vehNATOBoat, "_seaports"],\
	[0.2, 0, vehNATOPlane, "_airbases * 4"],\
	[0.2, 0, vehNATOPlaneAA, "_airbases * 4"],\
	[0.2, 1, vehNATOTransportPlanes, "_airbases * 4"],\
	[0.2, 1, vehNATOTransportHelis - [vehNATOPatrolHeli], "_airbases * 4"],\
	[0.2, 1, vehNATOAttackHelis, "_airbases * 4"],\
	[0.2, 0, vehNATOMRLS, "_airbases + _outposts * 0.2"]\
]
#define INVS [\
	[0.2, 0, staticATInvaders, "_outposts * 0.2 + _airbases * 0.5"],\
	[0.1, 0, staticAAInvaders, "_airbases * 2"],\
	[0.2, 1, vehCSATAPC, "_outposts * 0.3 + _airbases * 2"],\
	[0.1, 0, vehCSATTank, "_outposts * 0.5 + _airbases * 2"],\
	[0.1, 0, vehCSATAA, "_airbases"],\
	[0.3, 0, vehCSATBoat, "_seaports"],\
	[0.2, 0, vehCSATPlane, "_airbases * 4"],\
	[0.2, 0, vehCSATPlaneAA, "_airbases * 4"],\
	[0.2, 1, vehCSATTransportPlanes, "_airbases * 4"],\
	[0.2, 1, vehCSATTransportHelis - [vehCSATPatrolHeli], "_airbases * 4"],\
	[0.2, 1, vehCSATAttackHelis, "_airbases * 4"],\
	[0.2, 0, vehCSATMRLS, "_airbases + _outposts * 0.2"]\
]

private ["_sideX", "_airbases", "_outposts", "_seaports", "_accelerator", "_sideArray"];

{
	_sideX = _x;
	_airbases = { sidesX getVariable [_x, sideUnknown] == _sideX } count airportsX;
	_outposts = { sidesX getVariable [_x, sideUnknown] == _sideX } count outposts;
	_seaports = { sidesX getVariable [_x, sideUnknown] == _sideX } count seaports;

	if (_sideX == Occupants) then {
		_accelerator = [1 + (tierWar + difficultyCoef) / 20, 0] select (tierWar == 1);
		_sideArray = OCCS;
	} else {
		_accelerator = 1.2 + (tierWar + difficultyCoef) / 20;
		_sideArray = INVS;
	};
	{
		_x params ["_coefficient", "_random", "_typeX", "_maxItems"];

		if (_random == 0) then {
			_currentItems = timer getVariable [_typeX, 0];
			if (_currentItems < call compile _maxItems) then {
				timer setVariable [_typeX, _currentItems + (_coefficient * _accelerator), true];
			};
		} else {
			if (_typeX isEqualTo []) exitWith {};
			_currentItems = 0;
			{
				_currentItems = _currentItems + (timer getVariable [_x, 0]);
			} forEach _typeX;
			if (_currentItems < call compile _maxItems) then {
				timer setVariable [selectRandom _typeX, _currentItems + (_coefficient * _accelerator), true];
			};
		};
	} forEach _sideArray;
} forEach [Occupants, Invaders];
