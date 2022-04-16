
/*
	Author: Genesis

	Description:
		Ensures AI reaches their rearm objective.

	Parameter(s):
		0: OBJECT - the unit to rearm
		1: ARRAY - location to rearm at.

	Returns:
		NOTHING
		
	Example:
		[unit1, getPos deadUnit] call VCM_fnc_ActRearm;
*/

params ["_unitToRearm","_rearmLocation"];

while {(_unitToRearm distance _rearmLocation) > 5 && {(_unitToRearm distance _rearmLocation) < 200}} do
{
	_unitToRearm domove (getpos _rearmLocation);
	sleep 4;
};

	_unitToRearm action ["rearm", _rearmLocation];