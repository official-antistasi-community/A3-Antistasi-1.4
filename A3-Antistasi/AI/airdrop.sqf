private ["_veh","_grupo","_marcador","_posicion","_heli","_engagepos","_landpos","_exitpos","_wp","_wp1","_wp2","_wp3","_wp4"];

_veh = _this select 0;
_grupo = _this select 1;
_marcador = _this select 2;
_origen = _this select 3;
_reinf = if (count _this > 4) then {_this select 4} else {false};

_posicion = _marcador;
if (typeName _marcador == typeName "") then {_posicion = getMarkerPos _marcador};
_heli = group driver _veh;
{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _heli;
_dist = 500;
_distEng = if (_veh isKindOf "Helicopter") then {1000} else {5000};
_distExit = if (_veh isKindOf "Helicopter") then {400} else {1000};
_orig = getMarkerPos _origen;


_engagepos = [];
_landpos = [];
_exitpos = [];

_randAng = random 360;

while {true} do
	{
 	_landpos = _posicion getPos [_dist, _randang];
 	if (!surfaceIsWater _landpos) exitWith {};
   _randAng = _randAng + 1;
	};

_randang = _randang + 90;

while {true} do
	{
 	_exitpos = _posicion getPos [_distExit, _randang];
 	_randang = _randang + 1;
 	if ((!surfaceIsWater _exitpos) and (_exitpos distance _posicion > 300)) exitWith {};
	};

_randang = [_landpos,_exitpos] call BIS_fnc_dirTo;
_randang = _randang - 180;

_engagepos = _landpos getPos [_distEng, _randang];
{_x set [2,300]} forEach [_landPos,_exitPos,_engagePos];
{_x setBehaviour "CARELESS"} forEach units _heli;
_veh flyInHeight 300;
_veh setCollisionLight false;

_wp = _heli addWaypoint [_engagepos, 0];
_wp setWaypointType "MOVE";
//_wp setWaypointSpeed "LIMITED";

_wp1 = _heli addWaypoint [_landpos, 1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";

_wp2 = _heli addWaypoint [_exitpos, 2];
_wp2 setWaypointType "MOVE";

_wp3 = _heli addWaypoint [_orig, 3];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";
_wp3 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

{removebackpack _x; _x addBackpack "B_Parachute"} forEach units _grupo;
waitUntil {sleep 1; (currentWaypoint _heli == 3) or (not alive _veh) or (!canMove _veh)};

//[_veh] call A3A_fnc_puertasLand;

if (alive _veh) then
	{
	_veh setCollisionLight true;
	{
   waitUntil {sleep 0.5; !surfaceIsWater (position _x)};
      _x allowDamage false;
   	unAssignVehicle _x;
   	moveOut _x;
   	sleep 1;
   	_x spawn {sleep 5; _this allowDamage true};
  	} forEach units _grupo;
	};


if !(_reinf) then
   {
   _posLeader = position (leader _grupo);
   _posLeader set [2,0];
   _wp5 = _grupo addWaypoint [_posLeader,0];
   _wp5 setWaypointType "MOVE";
   _wp5 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
   _wp4 = _grupo addWaypoint [_posicion, 1];
   _wp4 setWaypointType "MOVE";
   _wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
   _wp4 = _grupo addWaypoint [_posicion, 2];
   _wp4 setWaypointType "SAD";
   }
else
   {
   _wp4 = _grupo addWaypoint [_posicion, 0];
   _wp4 setWaypointType "MOVE";
   _wp4 setWaypointStatements ["true","nul = [(thisList select {alive _x}),side this,(group this) getVariable [""reinfMarker"",""""],0] remoteExec [""A3A_fnc_garrisonUpdate"",2];[group this] spawn A3A_fnc_groupDespawner; reinfPatrols = reinfPatrols - 1; publicVariable ""reinfPatrols"";"];
   };
//[_veh] call A3A_fnc_puertasLand;
