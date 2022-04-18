params ["_AIArray"];

{
	if (animationState _x in PATCOM_Patrol_Animations) then
	{
		_x switchmove "";
	};
} foreach _AIArray;
