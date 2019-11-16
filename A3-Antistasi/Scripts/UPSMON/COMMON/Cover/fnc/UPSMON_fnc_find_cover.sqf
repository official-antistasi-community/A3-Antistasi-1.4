/****************************************************************
File: UPSMON_fnc_find_cover.sqf
Author: OLLEM

Description:
	Make a group move to cover
Parameter(s):
	<--- Leader position
	<--- Position to watch
	<--- Radius searching
	<--- Do the unit move or spawn to the cover position ?
	<--- Array of group units
Returns:
	Nothing
****************************************************************/

private ["_unitpos","_lookpos","_dist","_spawn","_units","_i","_objects","_vdir","_cpos","_object","_coverPosition"];

_unitpos 	= 		_this select 0;
_lookpos 	= 		_this select 1;
_dist 		= 		_this select 2;
_spawn 		= 		_this select 3;
_units 		= 		_this select 4;

_i = 0;
If (count _this > 5) then {_i = _this select 5;};
	
If (_i > 3) exitwith {_units};

if (_spawn) then 
{
	{
		_pos2 = _unitpos findEmptyPosition [1,25];
		_x setposATL _pos2;
	}foreach _units;
};
	
_movetocover = [];
	
(group (_units select 0)) setvariable ["UPSMON_Cover",true];
if (UPSMON_Debug>0) then {player sidechat "Cover"};
//potential cover objects list	
_objects = [(nearestObjects [_unitpos, [], _dist]), { _x call UPSMON_fnc_filter } ] call BIS_fnc_conditionalSelect;

_vdir = [_unitpos, _lookpos] call BIS_fnc_DirTo;

{
	If (alive _x) then
	{
		If (count _objects > 0) then
		{
			_object = _objects select 0;
			_objects = _objects - [_object];
			If (!IsNull _object) then
			{
				//_x is potential cover object
				_cPos = (getPosATL _object);
					
				//set coverposition to 1.3 m behind the found cover
				_coverPosition = [(_cPos select 0) - (sin(_vdir)*1.5), (_cPos select 1) - (cos(_vdir)*1.5), 0];
				
				//Any object which is high and wide enough is potential cover position, excluding water
				if (!(surfaceIsWater _coverPosition)) exitwith
				{
					
					if (UPSMON_Debug>0) then 
					{
						_ballCover = "sign_sphere100cm_F" createvehicle _coverPosition;
						_ballCover setpos _coverPosition;	
						diag_log format ["object: %1",_object];
					};	
					
					_movetocover pushback _x;
					[_x,[_object, _coverPosition],_lookpos,_spawn] spawn UPSMON_fnc_move_to_cover;
				};				
			};
		};
	};
} foreach _units;

_units = _units - _movetocover;

If (count _units > 0) then
{
	_i = _i + 1;
	_units = [_unitpos,_lookpos,_dist,_spawn,_units] call UPSMON_fnc_find_cover;
};

_units;