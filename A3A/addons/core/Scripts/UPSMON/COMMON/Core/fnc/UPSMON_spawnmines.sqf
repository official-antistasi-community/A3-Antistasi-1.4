/****************************************************************
File: UPSMON_spawnmines.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/

private ["_minesnbr","_minetype1","_minetype2","_positiontoambush","_minetype","_mineposition","_max","_min","_ang","_dir","_orgX","_orgY","_posX","_posY","_mineposition","_Mine"];

_minesnbr = _this select 0;
_minetype1 = _this select 1;
_minetype2 = _this select 2;
_positiontoambush = _this select 3;
_diramb = _this select 4;
_side = _this select 5;

for [{_i=0}, {_i < _minesnbr}, {_i=_i+1}] do
{
	_minetype= _minetype1;
	_mineposition = _positiontoambush;
	
	If (_i > 0) then
	{
		_minetype = _minetype2;
		// Many thanks Shuko ...
		_max = 0; _min = 0;
		if (floor (random 4) < 2) then 
		{
			_min = _diramb + 270;
			_max = _diramb + 335;			
		}
		else
		{
			_min = _diramb + 25;
			_max = _diramb + 90;
		};
			
		_ang = _max - _min;
		// Min bigger than max, can happen with directions around north
		if (_ang < 0) then { _ang = _ang + 360 };
		if (_ang > 360) then { _ang = _ang - 360 };
		_dir = (_min + random _ang);
				
		_orgX = _positiontoambush select 0;
		_orgY = _positiontoambush select 1;
		_posX = _orgX + (((random 10) + (random 30 +5)) * sin _dir);
		_posY = _orgY + (((random 10) + (random 30 +5)) * cos _dir);
		_mineposition = [_posX,_posY,0];
	};
			
			
	_Mine=createMine [_minetype,_mineposition, [], 0]; 
	_side revealMine _Mine;	
	if (UPSMON_Debug>0) then 
	{
		[_mineposition,"Sign_Arrow_Large_GREEN_F"] spawn UPSMON_createsign;
		[_mineposition,"Icon","Minefield","Colorred"] spawn UPSMON_createmarker
	};
	sleep 0.01;
};