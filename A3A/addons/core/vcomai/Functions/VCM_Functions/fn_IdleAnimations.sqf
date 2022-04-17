//Function for handling ambient animations. This makes AI feel more human while not in combat mode.
params ["_Group"];

private _animations = [
	"acts_rifle_operations_back",
	"acts_rifle_operations_barrel",
	"acts_rifle_operations_checking_chamber",
	"acts_rifle_operations_front",
	"acts_rifle_operations_right",
	"acts_rifle_operations_left",
	"acts_rifle_operations_zeroing",
	"acts_ambient_cleaning_nose",
	"acts_ambient_gestures_sneeze",
	"acts_ambient_gestures_tired",
	"acts_ambient_gestures_yawn",
	"acts_ambient_picking_up",
	"acts_ambient_relax_1",
	"acts_ambient_relax_2",
	"acts_ambient_relax_3",
	"acts_ambient_relax_4",
	"acts_ambient_rifle_drop",
	"acts_ambient_shoelaces",
	"acts_ambient_stretching",
	"acts_shieldfromsun_in"
];

private _CombatCheck = _Group getVariable "VCOM_FSMH";
//Incase the group is dead
if (isNil "_CombatCheck") exitWith {};

if !(_CombatCheck getFSMVariable ["_CNOW",false]) then {
	{
		if (Vcm_IdleAnimationChnc > random 100) then {
			private _unit = _x;
			if (!(primaryWeapon _x isEqualTo "") && {speed _x < 5 }&& {_x isEqualTo (vehicle _x)} && {stance _x isEqualTo "STAND"} && {_animations findIf {_x isEqualTo (animationstate _unit)} isEqualTo -1}) then {
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
		};
	} foreach (units _Group);
};