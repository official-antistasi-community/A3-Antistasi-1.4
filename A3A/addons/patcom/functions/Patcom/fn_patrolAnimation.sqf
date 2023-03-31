/*
    Author: [Hazey] [Genesis]

    Description:
		Make unit do idle animation when called

    Arguments:
    	<Object> Unit you want to do the animation.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_unit] call A3A_fnc_patrolAnimation;

    License: MIT License
*/

params ["_unit"];

private _group = group _unit;
private _groupState = _group getVariable "PATCOM_Group_State";

if !(_groupState == "CALM") exitWith {};

if (PATCOM_Patrol_Animations findIf {_x == (animationstate _Unit)} == -1) then {
	private _animation = selectRandom PATCOM_Patrol_Animations;
	[_unit, _animation] remoteExec ["playMove"];

	if (_animation == "acts_shieldfromsun_in") then {
		_unit spawn {
			params ["_unit"];
			sleep (random 10);
			[_unit, "Acts_ShieldFromSun_out"] remoteExec ["playMove"];
		}
	};
};
