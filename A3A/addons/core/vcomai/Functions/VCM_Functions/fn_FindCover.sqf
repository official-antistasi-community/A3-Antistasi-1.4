
/*
	Author: Genesis

	Description:
		Makes group find cover

	Parameter(s):
		0: OBJECT - Group leader
		1: NUMBER - Move distance

	Returns:
		NOTHING
		
	Note:
		It has been decided to use Vanilla cover system rather than a custom implementation.
*/

params ["_leader"];

private _grp = (group _leader);
private _moveDist = 50;
private _nearestEnemy = _leader findNearestEnemy _leader;
if (isNull _nearestEnemy) then
{
	_nearestEnemy = _leader call VCM_fnc_ClstEmy;	
};
private _typeListFinal = [];

private _weakListFinal = [];
private _closestCover = [];
private _typeListFinal = [];
private _units = (units _grp) select {alive _x};

private _curwp = currentWaypoint _grp;
private _wPos = waypointPosition [_grp,_curwp];
private _dir = _wPos;
if (_wPos isEqualTo [0,0,0]) then
{
	_wPos = (getpos _leader);
	_dir = _nearestEnemy;
	_moveDist = 15;
};

//private _movePosition = [_leader,_moveDist,([_leader, _dir] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
private _movePosition = _leader getpos [_moveDist,(_leader getDir _dir)];
if (VCM_DebugOld) then
{
	private _arrow = "Sign_Arrow_Green_F" createVehicle [0,0,0];
	_arrow setposATL _movePosition;
	_arrow spawn 
	{
		_counter = 0;
		_position = getpos _this;
		_newPos2 = _position select 2;						
		while {_counter < 60} do
		{
			_newPos2 = _newPos2 + 0.1;
			_this setpos [_position select 0,_position select 1,_newPos2];
			_counter = _counter + 1;
			sleep 0.5;
		};
		deletevehicle _this;
	};					
};	
private _typeList = nearestObjects [_movePosition, [], (_moveDist/2)];
private _roads = _movePosition nearRoads _moveDist;
{
	private _Type = typeOf _x;
	if !(_type in ["#crater","#crateronvehicle","#soundonvehicle","#particlesource","#lightpoint","#slop","#mark","HoneyBee","Mosquito","HouseFly","FxWindPollen1","ButterFly_random","Snake_random_F","Rabbit_F","FxWindGrass2","FxWindLeaf1","FxWindGrass1","FxWindLeaf3","FxWindLeaf2"]) then
	{
		if (!(_x isKindOf "Man") && {!(_x isKindOf "Bird")} && {!(_x isKindOf "BulletCore")} && {!(_x isKindOf "Grenade")} && {!(_x isKindOf "WeaponHolder")}) then
		{
			private _boundingArray = boundingBoxReal _x;
			private _p1 = _boundingArray select 0;
			private _p2 = _boundingArray select 1;
			private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
			private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
			private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));
			if (_maxWidth > 1.5 && {_maxLength > 1.5} && {_maxHeight > 1.5}) then
			{
				if (_type isEqualTo "") then 
				{
					_weakListFinal pushback _x
				} 
				else
				{
					_typeListFinal pushback _x;
				};
			};
		};
	};
	true;
} count ((_typeList) - (_roads));

if (_typeListFinal isEqualTo [] && _weakListFinal isEqualTo []) exitWith 
{
	//NO COVER
	{
		private _P = [[[_movePosition, 50]],["water"]] call BIS_fnc_randomPos;
		_x forcespeed -1;
		_x doMove _P;		
	} foreach _units;
};

//Now tell the AI to seek cover.
{
	private _Foot = isNull objectParent _x;
	if (_Foot) then
	{
		[_x,_typeListFinal,_weakListFinal,_nearestEnemy,_moveDist,_movePosition] spawn
		{
			params ["_unit","_coverL","_concealL","_nearestEnemy","_moveDist","_movePosition"];	
			private _posCON = (getPosWorld _unit);
			if (count _concealL > 0) then {_posCON = selectRandom _concealL;}; //[_concealL,_unit,true,"NrstPos"] call VCM_fnc_ClstObj;
			if (count _coverL > 0) then {_posCON = selectRandom _coverL }; //_posCON = [_coverL,_unit,true,"NrstPos"] call VCM_fnc_ClstObj;
				
				//Return fire for a few seconds, then move
				private _fNearestEnemy = _unit findNearestEnemy _unit;
				if (isNull _fNearestEnemy) then
				{
					_fNearestEnemy = _unit call VCM_fnc_ClstEmy;	
				};
				_unit doSuppressiveFire _fNearestEnemy;
				sleep (5 + (random 10));
				
				private _FPos = [_nearestEnemy, (_posCON distance _nearestEnemy) + 2, ([_nearestEnemy, _posCON] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
				private _DistW = 2;
				if (_posCON iskindof "AllVehicles") then {_DistW = 5;};
				if (VCM_DebugOld) then
				{
					private _arrow = "VR_3DSelector_01_exit_F" createVehicle [0,0,0];
					_arrow setposATL _FPos;
					_arrow spawn 
					{
						_counter = 0;
						_position = getpos _this;
						_newPos2 = _position select 2;						
						while {_counter < 60} do
						{
							_newPos2 = _newPos2 + 0.1;
							_this setpos [_position select 0,_position select 1,_newPos2];
							_counter = _counter + 1;
							sleep 0.5;
						};
						deletevehicle _this;
					};					
				};
				_unit setUnitPos "MIDDLE";
				_unit doWatch ObjNull;
				_unit disableAI "AUTOTARGET";
				_unit disableAI "TARGET";
				_unit disableAI "SUPPRESSION";
				_unit disableAI "WEAPONAIM";
				_unit forcespeed -1;
				sleep 0.2;
				_unit doMove _FPos;
				sleep 1;
				//_unit setDestination [_FPos,"LEADER PLANNED", true];								
				//We need the AI to STAY in the ordered position until ordered to move again.
				private _Cont = true;
				private _Fail = false;
				private _Cnt = 0;
				while {_Cont} do
				{
					if (_unit distance2D _FPos < _DistW) then {_Cont = false;};
					if (!(alive _unit) || _Cnt > 80) then {_Cont = false;_Fail = true;};
					_Cnt = _Cnt + 0.1;	
					sleep 0.1;
				};
				if !(_Fail) then {_unit forcespeed 0;};
				_unit enableAI "AUTOTARGET";
				_unit enableAI "TARGET";
				_unit enableAI "SUPPRESSION";
				_unit enableAI "WEAPONAIM";
				_unit setUnitPos "AUTO";

		};
	};
} foreach _units;





