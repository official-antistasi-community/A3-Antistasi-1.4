//Function for handling ambient animations. This makes AI feel more human while not in combat mode.
params ["_Group"];


private _CombatCheck = _Group getVariable "VCOM_FSMH";
//Incase the group is dead
if (isNil "_CombatCheck") exitWith {};

if !(_CombatCheck getFSMVariable ["_CNOW",false]) then {
	{
		if (Vcm_IdleAnimationChnc > random 100) then {
			private _unit = _x;
			if (!(primaryWeapon _x isEqualTo "") && {speed _x < 5 }&& {_x isEqualTo (vehicle _x)} && {stance _x isEqualTo "STAND"} && {PATCOM_Patrol_Animations findIf {_x isEqualTo (animationstate _unit)} isEqualTo -1}) then {
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
	} foreach (units _Group);
};