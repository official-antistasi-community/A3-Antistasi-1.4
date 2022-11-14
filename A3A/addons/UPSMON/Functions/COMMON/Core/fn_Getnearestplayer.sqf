/****************************************************************
File: UPSMON_Getnearestplayer.sqf
Author: Azroul13

Description:
	Get the nearest player near the position.
Parameter(s):
	<--- Position
	<--- Distance
Returns:
	Nearest unit or ObjNull
****************************************************************/
private ["_position","_nearestdist","_height","_nearest","_haslos"];

_position = _this select 0;
_nearestdist = _this select 1;

_nearest = objNull;

{
	if (isPlayer _x) then
	{
		If ((getposATL _x) select 2 <= 100) then
		{
			If ((getposATL _x vectorDistance [_position select 0,_position select 1,0]) <= _nearestdist) exitwith
			{
				_nearest=_x;
			};
		};
	};
} forEach (call A3A_fnc_playableUnits);

//playableUnits;
_nearest
