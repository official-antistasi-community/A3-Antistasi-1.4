/*
    Author: [Hazey]

    Description:
		Checks to see if unit can see enemy

    Arguments:
    	0: <Object> Unit you want to check if they can see.
		1: <Number> Angle you want to check.
		2: <Number> Height of the object you're checking.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[leader _group, getDir (leader _group), (_enemyGroup getPosATL) # 2] call A3A_fnc_patrolCanSee;

    License: MIT License
*/

params ["_unit", "_angle", "_height"];

private _eyePosition = eyePos _unit;
private _adj = _height * (cos _angle);
private _opp = sqrt ((_height * _height) - (_adj * _adj));

private _infront = if ((_angle) >=  180) then {
	[(_eyePosition # 0) - _opp, (_eyePosition # 1) + _adj, (_eyePosition # 2)]
} else {
	[(_eyePosition # 0) + _opp, (_eyePosition # 1) + _adj, (_eyePosition # 2)]
};

_obstruction = (lineintersectswith [_eyePosition, _infront, _unit]) # 0;

private _canSee = if (isnil("_obstruction")) then {true} else {false};

_canSee