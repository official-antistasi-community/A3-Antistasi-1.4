params ["_AIArray"];

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
	
{
	if (animationState _x in _animations) then
	{
		_x switchmove "";
	};
} foreach _AIArray;
