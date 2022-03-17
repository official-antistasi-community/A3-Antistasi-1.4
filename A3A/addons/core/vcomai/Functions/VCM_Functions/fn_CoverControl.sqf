//Function for controlling the queue of groups moving to cover. It's job is to at least space out all groups looking for cover by 2 seconds each. Reducing the FPS impact.

if (count VCM_CoverQueue > 0) then
{
	{
		[_x] call VCM_fnc_ForceMove;
	} foreach VCM_CoverQueue;
	VCM_CoverQueue = [];
	//VCM_CoverQueue deleteAt 0;
};
