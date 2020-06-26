//example: _result = [distanceSPWN,0,posHQ,Invaders] call A3A_fnc_distanceUnits: devuelve un array con todas las que estén a menos de distanceSPWN
//example: _result = [distanceSPWN,1,posHQ,teamPlayer] call A3A_fnc_distanceUnits: devuelve un boolean si hay una que esté a menos de distanceSPWN
/**
	Finds units capable of spawning in a given range belonging to a target side.

	Params:
		_distanceX: number - The distance to search in.
		_modeX: 0 or 1 - Whether an array of units should be returned, or a boolean if a unit belonging to that side is in range.
		_center: Position or Object - The center to search around.
		_targetSide: Side - Search for units belonging to this side

	Returns:
		Array of units found in range, or a boolean if a unit was found (depending on mode)
**/

params ["_distanceX","_modeX","_center","_targetSide"];

private _result = false;

//All units capable of triggering a marker to spawn.
private _allUnits = allUnits select {_x getVariable ["spawner",false]};
if (_modeX == 0) then
	{
	_result = [];
	{
	if (side group _x == _targetSide) then
		{
		if (_x distance2D _center < _distanceX) then
			{
			_result pushBack _x;
			};
		};
	} forEach _allUnits;
	}
else
	{
	{if ((side group _x == _targetSide) and (_x distance2D _center < _distanceX)) exitWith {_result = true}} count _allUnits;
	};

_result
