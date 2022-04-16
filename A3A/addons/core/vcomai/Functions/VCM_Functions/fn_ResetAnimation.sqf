params ["_AIArray"];

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
		_x switchmove "";
	};
} foreach _AIArray;
