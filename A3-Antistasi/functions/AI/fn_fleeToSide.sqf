params ["_unit", "_side"];

private _marker = respawnTeamPlayer;
if (_side != teamPlayer) then {
	_marker = respawnOccupants;
	private _potentials = (outposts + airportsX + resourcesX + factories);
	_potentials = _potentials select { sidesX getVariable [_x, sideUnknown] == _side };
	_potentials = _potentials select { spawner getVariable _x != 0 };		// only flee to unspawned locations
	if (count _potentials == 0) exitWith {};
	_marker = [_potentials, _unit] call BIS_fnc_nearestPosition;
};

// In case unit was surrendered
_unit enableAI "ANIM";
_unit enableAI "MOVE";
_unit stop false;
_unit switchMove "";

_unit doMove (getMarkerPos _marker);
