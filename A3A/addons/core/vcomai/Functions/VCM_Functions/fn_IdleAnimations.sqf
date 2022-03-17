//Function for handling ambient animations. This makes AI feel more human while not in combat mode.
params ["_Group"];


private _CombatCheck = _Group getVariable "VCOM_FSMH";
//Incase the group is dead
if (isNil "_CombatCheck") exitWith {};

if !(_CombatCheck getFSMVariable ["_CNow",false]) then
{
	
	private _RndAnims= [
	"Acts_Rifle_Operations_Back",
	"Acts_Rifle_Operations_Barrel",
	"Acts_Rifle_Operations_Checking_Chamber",
	"Acts_Rifle_Operations_Front",
	"Acts_Rifle_Operations_Right",
	"Acts_Rifle_Operations_Left",
	"Acts_Rifle_Operations_Zeroing",
	"Acts_Peering_Up",
	"Acts_Peering_Right",
	"Acts_Peering_Left",
	"Acts_Peering_Front",
	"Acts_Peering_Down",
	"Acts_Peering_Back",
	"Acts_Ambient_Cleaning_Nose",
	"Acts_Ambient_Gestures_Sneeze",
	"Acts_Ambient_Gestures_Tired",
	"Acts_Ambient_Gestures_Yawn",
	"Acts_Ambient_Picking_Up",
	"Acts_Ambient_Relax_1",
	"Acts_Ambient_Relax_2",
	"Acts_Ambient_Relax_3",
	"Acts_Ambient_Relax_4",
	"Acts_Ambient_Rifle_Drop",
	"Acts_Ambient_Shoelaces",
	"Acts_Ambient_Stretching"
	];
	
	// && {((GetposATL _x)#2) < 0.1}
	
	{
		if (10 > random 100) then
		{
			if (!(primaryWeapon _x isEqualTo "") && {speed _x < 5 }&& {_x isEqualTo (vehicle _x)} && {UnitPos _x isEqualTo "UP"}) then
			{
				_x playmove (selectRandom _RndAnims);
			};
		};
	} foreach (units _Group);
};




/*
private _RndAnims= [
"Acts_Rifle_Operations_Back",
"Acts_Rifle_Operations_Barrel",
"Acts_Rifle_Operations_Checking_Chamber",
"Acts_Rifle_Operations_Front",
"Acts_Rifle_Operations_Right",
"Acts_Rifle_Operations_Left",
"Acts_Rifle_Operations_Zeroing",
"Acts_Peering_Up",
"Acts_Peering_Right",
"Acts_Peering_Left",
"Acts_Peering_Front",
"Acts_Peering_Down",
"Acts_Peering_Back",
"Acts_Ambient_Cleaning_Nose",
"Acts_Ambient_Gestures_Sneeze",
"Acts_Ambient_Gestures_Tired",
"Acts_Ambient_Gestures_Yawn",
"Acts_Ambient_Picking_Up",
"Acts_Ambient_Relax_1",
"Acts_Ambient_Relax_2",
"Acts_Ambient_Relax_3",
"Acts_Ambient_Relax_4",
"Acts_Ambient_Rifle_Drop",
"Acts_Ambient_Shoelaces",
"Acts_Ambient_Stretching"
];

{
	if (animationState _x in _RndAnims) then
	{
		[_x,""] remoteExec ["switchmove",0];	
	};

} foreach (units _Group);