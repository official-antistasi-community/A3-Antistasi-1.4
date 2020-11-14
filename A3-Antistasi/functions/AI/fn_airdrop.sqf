private ["_veh","_groupX","_markerX","_positionX","_groupPilot","_engagepos","_landpos","_exitpos","_wp","_wp1","_wp2","_wp3","_wp4"];

_veh = _this select 0;
_groupX = _this select 1;
_markerX = _this select 2;
_originX = _this select 3;
_reinf = if (count _this > 4) then {_this select 4} else {false};

_positionX = _markerX;
if (_markerX isEqualType "") then {_positionX = getMarkerPos _markerX};
_groupPilot = group driver _veh;
{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _groupPilot;
_dist = 500;
_distEng = if (_veh isKindOf "Helicopter") then {1000} else {2000};
_distExit = if (_veh isKindOf "Helicopter") then {400} else {1000};
_orig = getMarkerPos _originX;


_engagepos = [];
_landpos = [];
_exitpos = [];

_randAng = random 360;

while {true} do
	{
 	_landpos = _positionX getPos [_dist, _randang];
 	if (!surfaceIsWater _landpos) exitWith {};
   _randAng = _randAng + 1;
	};

_randang = _randang + 90;

while {true} do
	{
 	_exitpos = _positionX getPos [_distExit, _randang];
 	_randang = _randang + 1;
 	if ((!surfaceIsWater _exitpos) and (_exitpos distance _positionX > 300)) exitWith {};
	};

_randang = [_landpos,_exitpos] call BIS_fnc_dirTo;
_randang = _randang - 180;

_engagepos = _landpos getPos [_distEng, _randang];
{_x set [2,300]} forEach [_landPos,_exitPos,_engagePos];
{_x setBehaviour "CARELESS"} forEach units _groupPilot;
_veh flyInHeight 300;
_veh setCollisionLight false;

_wp = _groupPilot addWaypoint [_engagepos, 0];
_wp setWaypointType "MOVE";
//_wp setWaypointSpeed "LIMITED";

_wp1 = _groupPilot addWaypoint [_landpos, 1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";

_wp2 = _groupPilot addWaypoint [_exitpos, 2];
_wp2 setWaypointType "MOVE";

_wp3 = _groupPilot addWaypoint [_orig, 3];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";
_wp3 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

{removebackpack _x; _x addBackpack "B_Parachute"} forEach units _groupX;
waitUntil {sleep 1; (currentWaypoint _groupPilot == 3) or (not alive _veh) or (!canMove _veh)};

//[_veh] call A3A_fnc_entriesLand;

if (alive _veh) then
	{
	_veh setCollisionLight true;
	{
	_x addEventHandler ["Killed", {diag_log format ["Paratrooper killed by %1, %2, %3", _this, typeOf (_this select 1), isDamageAllowed (_this select 0)]}];
    waitUntil {sleep 0.5; !surfaceIsWater (position _x)};
    _x allowDamage false;
   	unAssignVehicle _x;
	//Move them into alternating left/right positions, so their parachutes are less likely to kill each other
	private _pos = if (_forEachIndex % 2 == 0) then {_veh modeltoWorld [7, -20, -5]} else {_veh modeltoWorld [-7, -20, -5]};
	_x setPos _pos;
   	_x spawn {sleep 5;_this allowDamage true};
  	} forEach units _groupX;
	};


if !(_reinf) then
   {
   _posLeader = position (leader _groupX);
   _posLeader set [2,0];
   _wp5 = _groupX addWaypoint [_posLeader,0];
   _wp5 setWaypointType "MOVE";
   _wp5 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
   _wp4 = _groupX addWaypoint [_positionX, 1];
   _wp4 setWaypointType "MOVE";
   _wp4 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
   _wp4 = _groupX addWaypoint [_positionX, 2];
   _wp4 setWaypointType "SAD";
   }
else
   {
   _wp4 = _groupX addWaypoint [_positionX, 0];
   _wp4 setWaypointType "MOVE";
   };
//[_veh] call A3A_fnc_entriesLand;
