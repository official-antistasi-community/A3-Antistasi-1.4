/****************************************************************
File: UPSMON_DeleteWP.sqf
Author: Azroul13

Description:
	delete waypoint for group
Parameter(s):
	<--- group
Returns:
	Nothing
****************************************************************/
private [];
	
while {(count (waypoints _this)) > 0} do
{
	deleteWaypoint ((waypoints _this) select 0);
	sleep 0.25;
};
		