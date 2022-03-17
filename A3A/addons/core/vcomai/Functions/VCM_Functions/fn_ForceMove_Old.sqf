
/*
	Author: Genesis
	Description:
		Forces AI to move towards enemies, failing that move towards waypoint.

	Parameter(s):
		0: OBJECT - Group leader to get moving
		1 (Optional): NUMBER - Distance to move

	Returns:
		NOTHING
*/

params ["_leader","_moveDist"];
if (isNil "_moveDist") then {private _moveDist = 200};
private _grp = (group _leader);
private _units = (units _grp) select {alive _x};
private _nearestEnemy = _leader findNearestEnemy _leader;
if (isNull _nearestEnemy) then
{
	_nearestEnemy = _leader call VCM_fnc_ClstEmy;	
};


private _curwp = currentWaypoint _grp;
private _wPos = waypointPosition [_grp,_curwp];
private _dir = _wPos;
if (_wPos isEqualTo [0,0,0]) then
{
	_wPos = (getpos _nearestEnemy);
};

private _MovePosition = _wPos;
//private _movePosition = (([_leader,_moveDist,([_leader, _dir] call BIS_fnc_dirTo)]) call BIS_fnc_relPos) getpos [25, (random 360)];

{
	if (isNull objectParent _x && {_nearestEnemy distance2D _x > 20}) then
	{
		[_x,_MovePosition] spawn
		{
			params ["_unit","_movePos"];
			sleep (1 + (random 5));
			_unit disableAI "WEAPONAIM";
			_unit disableAI "COVER";
			_unit disableAI "FSM";
			_unit domove _movePos;
			_unit moveTo _movePos;
			sleep 10;
			_unit enableAI "WEAPONAIM";
			_unit enableAI "COVER";
			_unit enableAI "FSM";
		};		
	};
} foreach _units;
