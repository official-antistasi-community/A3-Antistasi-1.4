
/*
	Author: Genesis

	Description:
		Check if there are statics nearby

	Parameter(s):
		0: GROUP - Group to search from
		1 (Optional): NUMBER - Search distance

	Returns:
		BOOLEAN
*/

params ["_grp","_searchDist"];
if (isNil "_searchDist") then {_searchDist = 100};
private _returned = false;
{
	private _weap = nearestObject [(getpos _x),"StaticWeapon"];
	if (!(isNull _weap) || {!((_weap distance2D _x) > _searchDist)}) exitWith
	{
		_returned = true;
		_returned
	}	
	
} foreach (units _grp);

_returned