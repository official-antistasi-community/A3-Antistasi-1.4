
/*
	Author: Genesis

	Description:
		Generates flanking waypoints.

	Parameter(s):
		0: OBJECT - Group leader who will generate waypoints

	Returns:
		NOTHING
*/

params ["_leader"];

private _grp = group _leader;
if (_grp getVariable ["VCM_NOFLANK",false]) exitWith {};




private _nearestEnemy = _leader findNearestEnemy _leader;
if (isNull _nearestEnemy) then
{
	_nearestEnemy = _leader call VCM_fnc_ClstEmy;	
};

if (isNil "_nearestEnemy" || _nearestEnemy isEqualTo [0,0,0]) exitWith {};
if ((vehicle _nearestEnemy) isKindOf "Air") exitWith {};

//If they don't know about the enemy position, then just exit the function
private _knows = _grp knowsAbout _nearestEnemy;
if (_knows < 2) exitwith 
{
	sleep 5;
	[_leader] spawn VCM_fnc_FlankMove;
};


if !((waypointPosition [_grp,(currentWaypoint _grp)]) isEqualTo [0,0,0]) exitWith {};
//If first waypoint is DESTROY, DO NOT change waypoints.
private _index = currentWaypoint _grp;
private _wType = waypointType [_grp,_index];
if (_wType isEqualTo "DESTROY" || _wType isEqualTo "SAD" || _wType isEqualTo "SCRIPTED") exitWith {};

while {(count (waypoints _grp)) > 1} do
{
 deleteWaypoint ((waypoints _grp) select 0);
 sleep 0.25;
};


//Let's check what waypoints the enemy group has already had assigned to them
private _EnemyGroup = group _nearestEnemy;
private _AssignedWaypoints = _EnemyGroup getvariable ["VCM_WAYPOINTS",[]];

//Lets define types of attack we can do.
private _wayPointTypes = ["Assault","High","Low","Flank","FlankL"];

if (count _AssignedWaypoints > 0) then
{
	//If the waypoint is 2 minutes old, remove it from the group.
	{
		if ((_x#1) > (time - 120)) then
		{
			_wayPointTypes = _wayPointTypes - [_x#0];
		}
		else
		{
			_AssignedWaypoints = _AssignedWaypoints - [_x];
		};
	} foreach _AssignedWaypoints;
};

if (count _wayPointTypes isEqualTo 0) then
{
	_wayPointTypes = ["Assault","High","Low","Flank","FlankL"];
};

private _WayPointType = selectRandom _waypointTypes;
_AssignedWaypoints pushback [_waypointtype,time];
_EnemyGroup setVariable ["VCM_WAYPOINTS",_AssignedWaypoints,true];

switch (_wayPointType) do {
    case "Assault": 
		{
			private _waypoint0 = _grp addwaypoint [(getpos _nearestEnemy),0];
			_waypoint0 setwaypointtype "MOVE";
			//_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];		
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
			private _waypoint0 = _grp addwaypoint [(getpos _nearestEnemy),0];
			_waypoint0 setwaypointtype "MOVE";			
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
		};
    case "High": 
		{
			private _highP = ([_leader,500,50,false] call VCM_fnc_Heights) select 0 select 1;
			//private _finalP = [[[_highP, 50]],["water"]] call BIS_fnc_randomPos;
			private _finalP = _highp getpos [(random 50),(random 360)];
			_finalP set [2,0];
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";
			//_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];		
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;		
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";	
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
		}; 
    case "Low": 
		{
			private _highP = ([_leader,500,50,true] call VCM_fnc_Heights) select 0 select 1;
			private _finalP = _highp getpos [(random 50),(random 360)];
			_finalP set [2,0];
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];			
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";	
			//_waypoint0 setWaypointSpeed "FULL";	
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;			
		}; 
    case "Retreat": 
		{
			private _MovePosition = [_nearestEnemy,(_nearestEnemy distance2D _leader),([_nearestEnemy, _leader] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
			private _finalP = _MovePosition getpos [(random 50),(random 360)];
			_finalP set [2,0];
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];			
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";	
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
		}; 
    case "Flank": 
		{
			private _myEnemyPos = getpos _nearestEnemy;
			private _rnd = random 100;
			private _dist = (_rnd + 100);
			private _dir = random 360;
			private _positions = [(_myEnemyPos select 0) + (sin _dir) * _dist, (_myEnemyPos select 1) + (cos _dir) * _dist, 0];
			private _myPlaces = selectBestPlaces [_myEnemyPos, 250,"((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", 100, 5];
			if (_myPlaces isEqualTo []) then {_myPlaces = [_positions];};
			private _RandomArray = _myPlaces call BIS_fnc_selectrandom;
			private _RandomLocation = _RandomArray select 0;
			_RandomLocation set [2,0];
			private _finalP = _RandomLocation getpos [(random 50),(random 360)];
			_finalP set [2,0];
			if (_finalP isEqualTo [0,0]) then {_finalP = _RandomLocation;};
			_waypoint0 = _grp addwaypoint [_finalP,0];	
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];
			_waypoint0 = _grp addwaypoint [_myEnemyPos,0];	
			//_waypoint0 setWaypointSpeed "FULL";	
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;			
		}; 
    case "FlankL": 
		{
			private _myEnemyPos = getpos _nearestEnemy;
			private _rnd = random 100;
			private _dist = (_rnd + 100);
			private _dir = random 360;
			private _leaderPos = getpos _leader;
			private _positions = [(_myEnemyPos select 0) + (sin _dir) * _dist, (_myEnemyPos select 1) + (cos _dir) * _dist, 0];
			private _positionsL = [(_leaderPos select 0) + (sin _dir) * _dist, (_leaderPos select 1) + (cos _dir) * _dist, 0];
			private _myPlaces = selectBestPlaces [_myEnemyPos, 250,"((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", 100, 5];
			private _myPlacesL = selectBestPlaces [_leaderPos, 250,"((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", 100, 5];
			if (_myPlaces isEqualTo []) then {_myPlaces = [_positions];};
			if (_myPlacesL isEqualTo []) then {_myPlaces = [_positionsL];};
			private _RandomArray = _myPlaces call BIS_fnc_selectrandom;
			private _RandomArray2 = _myPlacesL call BIS_fnc_selectrandom;
			private _RandomLocation = _RandomArray select 0;
			private _RandomLocationL = _RandomArray2 select 0;
			_RandomLocation set [2,0];
			_RandomLocationL set [2,0];
			private _finalP = _RandomLocationL getpos [(random 50),(random 360)];
			private _finalP2 = _RandomLocation getpos [(random 50),(random 360)];
			_finalP set [2,0];
			_finalP2 set [2,0];
			_waypoint0 = _grp addwaypoint [_finalP,0];	
			//_waypoint0 setWaypointSpeed "FULL";		
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;		
			_waypoint0 = _grp addwaypoint [_finalP2,0];	
			//_waypoint0 setWaypointSpeed "FULL";
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;	
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];
			_waypoint0 = _grp addwaypoint [_myEnemyPos,0];	
			//_waypoint0 setWaypointSpeed "FULL";		
			[_grp, (_waypoint0 select 1)] setWaypointCompletionRadius 50;		
		}; 
};