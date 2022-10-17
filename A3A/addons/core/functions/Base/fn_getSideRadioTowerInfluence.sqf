private ["_markerX","_result","_positionX", "_aliveRadioTower", "_destroyedRadioTower", "_sideX"];

/**
	Finds under which side radio tower influence is current marker/
	
	Params:
		_markerX - Marker position.
		
	Returns:
		Side under which influence is given marker. 'SideUnknown' if given marker is closer to destroyed radio tower than working radio tower.
**/

_markerX = _this select 0;
if (count antennas == 0) exitWith {sideUnknown};
_positionX = getMarkerPos _markerX;

_aliveRadioTower = [antennas,_positionX] call BIS_fnc_nearestPosition;
_destroyedRadioTower = [antennasDead, _positionX] call BIS_fnc_nearestPosition;

// If destroyed radio tower is closer to alive radio tower then this position is under influence of no1.
if (_aliveRadioTower distance _positionX > _destroyedRadioTower distance _positionX) exitWith {sideUnknown};

_outpost = [markersX,_aliveRadioTower] call BIS_fnc_NearestPosition;
private _sideX = sidesX getVariable [_outpost,sideUnknown];

_sideX