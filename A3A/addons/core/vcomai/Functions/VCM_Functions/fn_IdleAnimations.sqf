//Function for handling ambient animations. This makes AI feel more human while not in combat mode.
params ["_Group"];


private _CombatCheck = _Group getVariable "VCOM_FSMH";
//Incase the group is dead
if (isNil "_CombatCheck") exitWith {};

if !(_CombatCheck getFSMVariable ["_CNow",false]) then
{
	
	private _rndanims= [
	"acts_rifle_operations_back",
	"acts_rifle_operations_barrel",
	"acts_rifle_operations_checking_chamber",
	"acts_rifle_operations_front",
	"acts_rifle_operations_right",
	"acts_rifle_operations_left",
	"acts_rifle_operations_zeroing",
	"acts_peering_up",
	"acts_peering_right",
	"acts_peering_left",
	"acts_peering_front",
	"acts_peering_down",
	"acts_peering_back",
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
		if (Vcm_IdleAnimationChnc > random 100) then
		{
			private _Unit = _x;
			if (!(primaryWeapon _x isEqualTo "") && {speed _x < 5 }&& {_x isEqualTo (vehicle _x)} && {stance _x isEqualTo "STAND"} && {_rndanims findIf {_x isEqualTo (animationstate _Unit)} isEqualTo -1}) then
			{
				private _Anim = (selectRandom _RndAnims);
				_x playmove _Anim;
				
				switch (_Anim) do 
				{
					case "acts_shieldfromsun_in": {_x spawn {sleep (random 5);_this playmove "Acts_ShieldFromSun_out";};};
					case "acts_ambient_picking_up": {_x spawn {sleep 3;private _SmallObj = createVehicle [(selectrandom ["Land_Compass_F","Land_Battery_F","Land_PortableLongRangeRadio_F","Land_ShotTimer_01_F","Land_Can_Dented_F","Land_TacticalBacon_F"]),(getpos _this), [], 2, "CAN_COLLIDE"];_SmallObj attachto [_this,[0,0,0.04],"lefthand"];sleep 3;deleteVehicle _SmallObj;};};
					default {};
				};					
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