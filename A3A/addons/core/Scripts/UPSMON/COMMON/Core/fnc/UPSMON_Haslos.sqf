/****************************************************************
File: UPSMON_Haslos.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- unit
	<--- Target
	<--- Max distance the unit can see the target
	<--- Field of view of the unit
Returns:
	Boolean
****************************************************************/

private ["_unit", "_target", "_range", "_fov","_eyeVector","_eyeDirection","_eyePosition","_targetPosition", "_inRange", "_result"];

_unit = [_this,0] call BIS_fnc_param; 
_target = [_this,1] call BIS_fnc_param; 
_range = [_this,2,100,[0]] call BIS_fnc_param; 
_fov = [_this,3,130,[0]] call BIS_fnc_param; 

_result = false;
_inRange = ((getposATL _unit) vectordistance (getposATL _target)) < _range;
_eyeVector = eyeDirection _unit;
_eyeDirection = ((_eyeVector select 0) atan2 (_eyeVector select 1));
_eyePosition = eyePos _unit;
_targetPosition = eyePos _target;

If (!(_target iskindof "CAManBase")) then
{
	_targetPosition = aimpos _target;
};
	
if (_inRange) then 
{
	if ([_eyePosition, _eyeDirection, _fov, _targetPosition] call BIS_fnc_inAngleSector) then
	{
		if (!lineIntersects[_eyePosition, _targetPosition, vehicle _unit, vehicle _target]) then
		{
			if (!terrainIntersectASL[_eyePosition, _targetPosition]) then
			{
				_result = true;
			};
		};
	};
};
	
_result;