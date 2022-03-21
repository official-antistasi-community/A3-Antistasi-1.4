
/*
	Author: Genesis
	Description:
		Forces AI to move towards enemies, failing that move towards waypoint.

	Parameter(s):
		0: OBJECT - Group leader to get moving
		1 (Optional): NUMBER - Distance to move

	Returns:
		NOTHING
*/
params ["_SquadLead"];
private _NearbyCover = [_SquadLead] call VCM_fnc_CoverDetect;
private _NEnemyA = [];
private _EnemyList = _SquadLead targets [true,1000];

private _NEnemies = _SquadLead call VCM_fnc_ClstKnwnEnmy;

if (count _NEnemies > 0) then
{

	{
		if (_x#0 < 100) then
		{
			_NEnemyA pushback (_x#1);
		};
	
	} foreach _NEnemies;
};	

private _LGroup = group _SquadLead;
if (_NearbyCover isEqualTo []) exitWith 
{

	{
		doStop _x;_x domove (getposATL _x);
		_x forcespeed -1;
		if (random 100 < 50) then
		{
			private _Unit = _x;
			private _EnemyArray = [];
			{
				private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
				_EnemyArray pushback [_cansee,_x];
			} foreach _EnemyList;
			_EnemyArray sort true;
			if (count _EnemyArray > 0) then
			{
				private _TargetE = ((_EnemyArray#0)#1);
				_unit setCombatBehaviour "COMBAT";
				doStop _unit;_unit domove (getposATL _Unit);
				_Unit doWatch _TargetE;
				_Unit doSuppressiveFire _TargetE;
			};
			if (VCM_DebugOld) then {[_Unit,"LOOKING TO FIRE"] call VCM_fnc_DebugText;};
		};
	} foreach (units _LGroup);
};


private _CoverObjects = _NearbyCover#1;
private _WPos = _NearbyCover#2;

if ((count (waypoints _LGroup)) == 0) exitWith {};

if (count _CoverObjects > 0 && {!(_WPos isEqualTo [0,0,0])}) then
{

	
	private _CoverHardObjects = [];
	{
		if (_x isKindOf "House" || {_x isKindOf "Wall"}) then
		{
			_CoverHardObjects pushback _x;
		};
	} foreach _CoverObjects;	
	
	private _Pos = _WPos;
	private _MoveArray = [];

	

	{
		if (random 100 > 30) then
		{
			if (count _CoverHardObjects > 0) then
			{	_CoverObj = [_CoverHardObjects,_WPos] call BIS_fnc_nearestPosition;
				if (count _CoverHardObjects > 2) then
				{
					_CoverHardObjects deleteAt (_CoverHardObjects findif {_CoverObj isEqualTo _x});
				};
				_Pos =  _CoverObj getPos [2,(_CoverObj getdir _SquadLead)];
				_FinalPos = _Pos findEmptyPosition [0,10,"B_soldier_AT_F"];
				if (_FinalPos isEqualTo []) then {_FinalPos = _Pos;};
				
	
				private _nBuilding = nearestBuilding _FinalPos;
				if ([_nBuilding] call BIS_fnc_isBuildingEnterable && {_nBuilding distance2D _FinalPos < 25}) then
				{
					private _BuildingPos = ([_nBuilding] call BIS_fnc_buildingPositions);
					if (count _BuildingPos > 3) then
					{
						_FinalPos = selectRandom ([_nBuilding] call BIS_fnc_buildingPositions);
					};
				};			
				_MoveArray pushback [_x,_FinalPos];	
				[_x,_FinalPos] spawn
				{
					params ["_Unit","_Pos"];
					sleep (2 + (random 5));
					
					_unit setCombatBehaviour "SAFE";
					doStop _unit;_unit domove (getposATL _Unit);
					_Unit forceSpeed -1;				
					_Unit doMove _Pos;
					If (VCM_DebugOld) then {[_unit,"MOVING TO POSITION - A"] call VCM_fnc_DebugText;};
				};
					if (VCM_DebugOld) then
					{
						private _CustomPos = [(_FinalPos#0),(_FinalPos#1),((_FinalPos#2)+10)];
						private _veh = createVehicle ["Sign_Arrow_Large_Green_F", _CustomPos, [], 0, "CAN_COLLIDE"];
						_veh spawn {sleep 30; deleteVehicle _this;};
		
					};	
	
			}
			else
			{
				_CoverObj = [_CoverObjects,_WPos] call BIS_fnc_nearestPosition;
				if (count _CoverObjects > 0) then
				{
					if (count _CoverObjects > 2) then
					{			
						_CoverObjects deleteAt (_CoverObjects findif {_CoverObj isEqualTo _x});
					};
					_Pos =  _CoverObj getPos [2,(_CoverObj getdir _SquadLead)];				
					_FinalPos = _Pos findEmptyPosition [0,10,"B_soldier_AT_F"];
					if (_FinalPos isEqualTo []) then {_FinalPos = _Pos;};				
					
	
					private _nBuilding = nearestBuilding _FinalPos;
					if ([_nBuilding] call BIS_fnc_isBuildingEnterable && {_nBuilding distance2D _FinalPos < 20}) then
					{
						private _BuildingPos = ([_nBuilding] call BIS_fnc_buildingPositions);
						if (count _BuildingPos > 3) then
						{
							_FinalPos = selectRandom ([_nBuilding] call BIS_fnc_buildingPositions);
						};
					};	
					_MoveArray pushback [_x,_FinalPos];
					[_x,_FinalPos] spawn
					{
						params ["_Unit","_Pos"];
						sleep (2 + (random 5));
						
						_unit setCombatBehaviour "SAFE";
						doStop _unit;_unit domove (getposATL _Unit);
						_unit forceSpeed -1;				
						_Unit doMove _Pos;
						
						If (VCM_DebugOld) then {[_Unit,"MOVING TO POSITION - B"] call VCM_fnc_DebugText;};
					};
		
	
					
					if (VCM_DebugOld) then
					{		
						private _CustomPos = [(_FinalPos#0),(_FinalPos#1),((_FinalPos#2)+10)];
						private _veh = createVehicle ["Sign_Arrow_Large_Green_F", _CustomPos, [], 0, "CAN_COLLIDE"];
						_veh spawn {sleep 30; deleteVehicle _this;};
	
					};
				}
				else
				{
					_MoveArray pushback [_x,_Pos];
					[_x,_Pos] spawn
					{
						params ["_Unit","_Pos"];
						sleep (2 + (random 5));
						
						_unit setCombatBehaviour "SAFE";
						doStop _unit;_unit domove (getposATL _Unit);
						_unit forceSpeed -1;
						_Unit doMove _Pos;
						If (VCM_DebugOld) then {[_unit,"MOVING TO POSITION - C"] call VCM_fnc_DebugText;};
					};			
					
				};
			};
		}
		else
		{
			private _Unit = _x;
			private _EnemyArray = [];
			{
				private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
				_EnemyArray pushback [_cansee,_x];
			} foreach _EnemyList;
			_EnemyArray sort true;
			if (count _EnemyArray > 0) then
			{
				_unit setCombatBehaviour "COMBAT";
				private _TargetE = ((_EnemyArray#0)#1);
				doStop _unit;_unit domove (getposATL _Unit);
				_Unit doWatch _TargetE;
				_Unit doSuppressiveFire _TargetE;
			};
			if (VCM_DebugOld) then {[_Unit,"LOOKING TO FIRE"] call VCM_fnc_DebugText;};
		};
	} foreach (units _LGroup);
	
	private _Cntr = 0;

	_MoveArray spawn
	{
		sleep 5;
		private _Timer = time + 20;

		waituntil
		{
			{
				_x params ["_Unit","_Pos"];
				If (VCM_DebugOld) then {[_Unit,(format ["MOVING: %1 M",(_Unit distance2D _Pos)])] call VCM_fnc_DebugText;};
				//private _EnemyList = ((getPos _Unit) nearEntities ["Man", 100]) select {[(side _x),(side _Unit)] call BIS_fnc_sideIsEnemy};
				private _EnemyList = _Unit targets [true,1000];
				{
					private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
					if (_Cansee > 0) exitWith
					{
						_unit setCombatBehaviour "COMBAT";
						doStop _unit;_unit domove (getposATL _Unit);
						_Unit doWatch _x;
					};
				} foreach _EnemyList;
				
				_unit setCombatBehaviour "SAFE";				
				doStop _unit;_unit domove (getposATL _Unit);
				_Unit forcespeed -1;
				_Unit domove _Pos;
				
			} foreach _this;
			sleep 1;
			time > _Timer
		};
	};

	waituntil
	{
		private _CurrentWaypoint = currentWaypoint _LGroup;
		private _wPos2 = waypointPosition [_LGroup,_CurrentWaypoint];	
		{
				_x params ["_Unit","_Pos"];
				
				if !(alive _Unit) then {_MoveArray deleteAt _foreachIndex;};
				
				if (_Unit distance2D _Pos < 1.5) then
				{
					_unit spawn
					{
						sleep 1;
						_this setCombatBehaviour "COMBAT";
						doStop _this;_this domove (getposATL _this);
						_this forceSpeed 0;
						if (VCM_DebugOld) then {[_this,"SET"] call VCM_fnc_DebugText;};
					};
					_MoveArray deleteAt _foreachIndex;
				};
		} foreach _MoveArray;
		sleep 0.01;
		_Cntr = _Cntr + 0.01;
		(count _MoveArray < 1 || _Cntr > 20 || !(_WPos isEqualTo _wPos2))
	};
	
	
}
else
{
	{
		_x setCombatBehaviour "SAFE";
		_x forceSpeed -1;
		doStop _x;_x domove (getposATL _x);
		_x domove _WPos;
		If (VCM_DebugOld) then {[_x,"MOVING TO POSITION - D"] call VCM_fnc_DebugText;};
		if (random 100 < 50) then
		{
			private _Unit = _x;
			private _EnemyArray = [];
			{
				private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
				_EnemyArray pushback [_cansee,_x];
			} foreach _EnemyList;
			_EnemyArray sort true;
			if (count _EnemyArray > 0) then
			{
				private _TargetE = ((_EnemyArray#0)#1);
				_Unit setCombatBehaviour "COMBAT";
				doStop _unit;_unit domove (getposATL _Unit);
				_Unit doWatch _TargetE;
				_Unit doSuppressiveFire _TargetE;
			};
			if (VCM_DebugOld) then {[_Unit,"LOOKING TO FIRE"] call VCM_fnc_DebugText;};
		};
	} foreach (units _LGroup);
};

if (_WPos distance2D _SquadLead < 75) then
{
	_index = currentWaypoint (group _SquadLead);
	deleteWaypoint [_LGroup,_index];
};