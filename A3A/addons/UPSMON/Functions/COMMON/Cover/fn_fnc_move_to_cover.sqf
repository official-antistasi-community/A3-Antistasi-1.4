/****************************************************************
File: UPSMON_fnc_move_to_cover.sqf
Author: OLLEM

Description:
	Make a group move to cover
Parameter(s):
	<--- unit
	<--- Cover Array
		<--- Cover object
		<--- Cover position
	<--- Position to watch
	<--- Do the unit move or spawn to the cover position ?
Returns:
	Nothing
****************************************************************/

private ["_unit","_coverArray","_lookpos","_spawn","_cover","_coverPosition","_coverDist","_stopped","_continue","_checkTime","_dist","_sight"];
	
_unit 			=	_this select 0;
_coverArray 	=	_this select 1;
_lookpos  		=	_this select 2;
_spawn 			= 	_this select 3;
	
_cover 			=	_coverArray select 0;
_coverPosition 	= 	_coverArray select 1;

if (_spawn) then
{
	_unit setposATL _coverPosition;
	doStop _unit;
			
	if (_unit == leader (group _unit) || random 100 < 50) then 
	{
		[_unit,_lookpos] call UPSMON_dowatch;
	};	
}
else
{
	Dostop _unit;
	_unit domove _coverPosition;
	_unit forceSpeed 100;
	_unit setDestination [_coverPosition, "LEADER PLANNED", true];

	_coverDist = round ([getposATL _unit,_coverPosition] call UPSMON_distancePosSqr);

	_stopped = true;
	_continue = true;
	
	_checkTime =  (time + (1.7 * _coverDist) + 20);

	while { _continue } do 
	{
			
		_dist = ([getposATL _unit,_coverPosition] call UPSMON_distancePosSqr);
		
		if (!(unitReady _unit) && (alive _unit) && (_dist > 1.25) && (_unit getvariable ["UPSMON_SUPSTATUS",""] == "")) then
		{
			//if unit takes too long to reach cover or moves too far out stop at current location
			if (time <= _checkTime) then
			{
				_continue = false;
			}
			else
			{
				//_coverPosition = getPosATL _unit;
				//_unit doMove _coverPosition;

				//_continue = true;
			};
		}
		else
		{	
			_continue = false;
			_stopped = false;
		};
	}; 
	
	_unit forcespeed -1;
	if (!( _stopped)) then 
	{			
		doStop _unit;
		_unit setBehaviour "STEALTH";
		_sight = [_unit,getdir _unit, 50] call UPSMON_CanSee; 
		If (!_sight) then {_unit setUnitPos "MIDDLE";};
	};	
};
	