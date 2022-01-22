/****************************************************************
File: UPSMON_UnitWatchDir.sqf
Author: Azroul13

Description:
	make unit watch doors or windows.

Parameter(s):
	<--- Unit
	<--- Direction of the unit
	<--- Building where is the unit
Returns:
	nothing
****************************************************************/
private ["_see","_infront","_uposASL","_opp","_adj","_hyp","_eyes","_obstruction","_angle","_isroof"];
	
_unit = _this select 0;
_angle = _this select 1;
_bld = _this select 2;
_essai = 0;
_see = false;
_ouverture = false;
_findoor = false;
_wpos = [];
_dpos = [];
_watch = [];
dostop _unit;
_windowpositions = [];
_doorpositions = [];
	
_watchdir = [getposATL _unit,_bld modeltoworld [0,0,0]] call BIS_fnc_DirTo;
_watchdir = _watchdir + 180;
_unit setdir 0;
_unit setdir _watchdir;
sleep 0.7;
	
_sight = [_unit,getdir _unit, 20] call UPSMON_CanSee; 
	
_isroof = [_unit] call UPSMON_Isroof;
	
If (_isroof) then 
{
	if (!_sight) then 
	{
		// check window
		_windowpositions = [_bld] call UPSMON_checkwindowposition;
		If (count _windowpositions > 0) then 
		{
			{
				If (UPSMON_Debug > 0) then {diag_log format ["%1 %2 window %3 result %4",_unit,(ASLtoATL(eyePos _unit)),_x select 0,(ASLtoATL(eyePos _unit)) distance _x]};
				If (((ASLtoATL(eyePos _unit)) vectorDistance _x) <= 2.5) exitwith {_watch = _x;};
			} forEach _windowpositions;
	
			if (count _watch > 0) then 
			{
					_wpos = _watch;	
			};
		};
 
		// check for door
		_doorpositions = [_bld] call UPSMON_checkdoorposition;
		
		if (count _doorpositions == 0) then 
		{
			_exitpos = _bld buildingExit 0;
			If (count _exitpos > 0) then {_doorpositions pushback (_bld modelToWorld _exitpos)};
		};
			
		If (count _doorpositions > 0) then 
		{
			{
				//diag_log format ["%1 %2 door %3 result %4",_unit,(ASLtoATL(eyePos _unit)),_x,(ASLtoATL(eyePos _unit)) distance _x];
				If (((ASLtoATL(eyePos _unit)) vectorDistance _x) <= 3) exitwith {_watch = _x;};
			} forEach _doorpositions;
	
			if (count _watch > 0) then 
			{
				_dpos = _watch;	
	
			};
		};
	};
};
	
_unit setvariable ["UPSMON_unitdir",[_wpos,_dpos]];
If (count _dpos > 0) then {_watch = _dpos;_ouverture = true; _findoor = true;};
If (count _wpos > 0) then {_watch = _wpos;_ouverture = true;_findoor = false;};
sleep 0.1;
If (count _watch > 0) then 
{
	_posATL = getPosATL _unit;

	_abx = (_watch select 0) - (_posATL select 0);
	_aby = (_watch select 1) - (_posATL select 1);
	_abz = (_watch select 2) - (_posATL select 2);

	_vec = [_abx, _aby, _abz];

	// Main body of the function;
	_unit setdir 0;
	_unit setVectorDir _vec;		
		
	_unit dowatch ObjNull;
	_unit dowatch _watch;
		
	If(UPSMON_DEBUG > 0) then 
	{
		_ballCover2 = "Sign_Sphere25cm_F" createvehicle [0,0,0];
		_ballCover2 setposATL _watch;
	};
};
	
Sleep 0.5;
// Check if window blocking view or search direction for AI if he doesn't watch window or door.
If (!(_findoor) && !_sight) then 
{
	[_unit,getdir _unit,_ouverture] spawn UPSMON_WillSee;
};	