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
private _animations = ["acts_ambient_cleaning_nose","acts_ambient_gestures_sneeze","acts_ambient_gestures_tired","acts_ambient_gestures_yawn","acts_ambient_picking_up","acts_ambient_relax_1","acts_ambient_relax_2","acts_ambient_relax_3","acts_ambient_relax_4","acts_ambient_rifle_drop","acts_ambient_shoelaces","acts_ambient_stretching","acts_shieldfromsun_in"];

if !(_groupState == "CALM") exitWith {};

if (_animations findIf {_x == (animationstate _Unit)} == -1) then {
	private _animation = selectRandom _animations;
	[_unit, _animation] remoteExec ["playMove"];

	if (_animation == "acts_shieldfromsun_in") then {
		_unit spawn {
			params ["_unit"];
			sleep (random 10);
			[_unit, "Acts_ShieldFromSun_out"] remoteExec ["playMove"];
		}
	};
};
