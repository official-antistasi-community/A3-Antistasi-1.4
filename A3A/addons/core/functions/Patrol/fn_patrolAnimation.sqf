params ["_unit", ["_chance", 25]];

private _group = group _unit;
private _groupState = _group getVariable "PATCOM_Group_State";

if !(_groupState == "CALM") exitWith {};

if (_chance > random 100) then {
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
};
