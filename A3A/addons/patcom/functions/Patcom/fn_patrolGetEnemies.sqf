#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

private _side = side _group;
private _enemySides = [];
private _knownEnemies = [];

if (_side isEqualTo Occupants) then {
	if (gameMode != 1) then {
		_enemySides = [teamPlayer, sideEnemy];
	} else {
		_enemySides = [Invaders, teamPlayer, sideEnemy];
	};
};

if (_side isEqualTo Invaders) then {
	if (gameMode != 1) then {
		_enemySides = [teamPlayer, sideEnemy];
	} else {
		_enemySides = [Occupants, teamPlayer, sideEnemy];
	};
};

if (_side isEqualTo teamPlayer) then {
	if (gameMode != 1) then {
		_enemySides = [Occupants, sideEnemy];
	} else {
		_enemySides = [Occupants, Invaders, sideEnemy];
	};
};

_knownEnemies append (_group targets [true, PATCOM_VISUAL_RANGE, _enemySides, PATCOM_TARGET_TIME]);

{
	if ((side _x) in _enemySides) then {
		if ((_group knowsAbout _x) > 2) then {
			_knownEnemies pushBackUnique (group _x);
		};
	};
} forEach (allUnits inAreaArray [getPosATL (leader _group), PATCOM_VISUAL_RANGE, PATCOM_VISUAL_RANGE]);

_knownEnemies