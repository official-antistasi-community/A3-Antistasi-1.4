/****************************************************************
File: UPSMON_WillSee.sqf
Author: Zorilaya

Description:
	Make the AI watch openings.

Parameter(s):
	<--- Parameters of the original group
	<--- Minimum number of group to create
	<--- Maximum number of group to create
Returns:
	nothing
****************************************************************/

// garrison func from Zorilaya
private ["_unit","_angle","_window","_essai","_eyes","_hyp","_adj","_opp","_infront","_obstruction","_see","_abx","_aby","_abz","_vec"];

_unit = _this select 0;
_angle = _this select 1;
_window = _this select 2;
_essai = 0;

If (count _this > 3) then {_essai = _this select 3;};

_eyes = eyepos _unit;

_hyp = 10;
_adj = _hyp * (cos _angle);
_opp = sqrt ((_hyp*_hyp) - (_adj * _adj));

	
_infront = if ((_angle) >=  180) then 
{
	[(_eyes select 0) - _opp,(_eyes select 1) + _adj,(_eyes select 2)]
} 
else 
{
	[(_eyes select 0) + _opp,(_eyes select 1) + _adj,(_eyes select 2)]
};

_obstruction = (lineintersectswith [_eyes,_infront,_unit]) select 0;

_see = if (isnil("_obstruction")) then {true} else {false};
if (UPSMON_DEBUG > 0) then {diag_log format ["Unit: %1 See:%2 Essai:%3",_unit,_see,_essai];};
	
If (!_see && _essai < 20) exitwith 
{
	_essai = _essai + 1;
	If (_window) then {_angle = _angle + 2} else {_angle = random 360};
	[_unit,_angle,_window,_essai] call UPSMON_WillSee;
};

If (_see && _essai > 0) then 
{
	_posATL = getPosATL _unit;

	_abx = (_infront select 0) - (_posATL select 0);
	_aby = (_infront select 1) - (_posATL select 1);
	_abz = (_infront select 2) - (_posATL select 2);

	_vec = [_abx, _aby, _abz];

	// Main body of the function;
	_unit setVectorDir _vec;
	sleep 0.02;
	_unit dowatch ObjNull;
	_unit dowatch [_infront select 0,_infront select 1, _posATL select 2];
		
	if (UPSMON_DEBUG > 0) then 
	{
		_ballCover = "Sign_Arrow_Large_BLUE_F" createvehicle [0,0,0];
		_ballCover setposATL [_infront select 0,_infront select 1, _posATL select 2];
	};
};