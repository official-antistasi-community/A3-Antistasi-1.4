if (bombRuns < 1) exitWith {hint "You lack of enough Air Support to make this request"};
//if (!allowPlayerRecruit) exitWith {hint "Server is very loaded. \nWait one minute or change FPS settings in order to fulfill this request"};
	if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hayIFA) then {hint "You need a radio in your inventory to be able to give orders to other squads"} else {hint "You need a Radio Man in your group to be able to give orders to other squads"}};
if ({lados getVariable [_x,sideUnknown] == buenos} count aeropuertos == 0) exitWith {hint "You need to control an airport in order to fulfill this request"};
_tipo = _this select 0;

posicionTel = [];

hint "Select the spot from which the plane will start to drop the bombs";

if (!visibleMap) then {openMap true};
onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_pos1 = posicionTel;
posicionTel = [];

_mrkorig = createMarkerLocal [format ["BRStart%1",random 1000], _pos1];
_mrkorig setMarkerShapeLocal "ICON";
_mrkorig setMarkerTypeLocal "hd_destroy";
_mrkorig setMarkerColorLocal "ColorRed";
_mrkOrig setMarkerTextLocal "Bomb Run Init";

hint "Select the map position to which the plane will exit to calculate plane's route vector";

onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {deleteMarker _mrkOrig};

_pos2 = posicionTel;
posicionTel = [];

_ang = [_pos1,_pos2] call BIS_fnc_dirTo;

bombRuns = bombRuns - 1;
publicVariable "bombRuns";
[] spawn A3A_fnc_statistics;

_mrkDest = createMarkerLocal [format ["BRFin%1",random 1000], _pos2];
_mrkDest setMarkerShapeLocal "ICON";
_mrkDest setMarkerTypeLocal "hd_destroy";
_mrkDest setMarkerColorLocal "ColorRed";
_mrkDest setMarkerTextLocal "Bomb Run Exit";

//openMap false;

_angorig = _ang - 180;

_origpos = [_pos1, 2500, _angorig] call BIS_fnc_relPos;
_finpos = [_pos2, 2500, _ang] call BIS_fnc_relPos;

_planefn = [_origpos, _ang, vehSDKPlane, buenos] call bis_fnc_spawnvehicle;
_plane = _planefn select 0;
_plane setPosATL [getPosATL _plane select 0, getPosATL _plane select 1, 1000];
_plane disableAI "TARGET";
_plane disableAI "AUTOTARGET";
_plane flyInHeight 100;

driver _plane sideChat "Starting Bomb Run. ETA 30 seconds.";
_wp1 = group _plane addWaypoint [_pos1, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";
if (_tipo == "CARPET") then {_wp1 setWaypointStatements ["true", "[this,""CARPET""] execVM 'AI\airbomb.sqf'"]};
if (_tipo == "NAPALM") then {_wp1 setWaypointStatements ["true", "[this,""NAPALM""] execVM 'AI\airbomb.sqf'"]};
if (_tipo == "HE") then {_wp1 setWaypointStatements ["true", "[this] execVM 'AI\airbomb.sqf'"]};


_wp2 = group _plane addWaypoint [_pos2, 1];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointType "MOVE";

_wp3 = group _plane addWaypoint [_finpos, 2];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";
_wp3 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew this; deleteVehicle this; deleteGroup (group this)"];

waitUntil {sleep 1; (currentWaypoint group _plane == 4) or (!canMove _plane)};

deleteMarkerLocal _mrkOrig;
deleteMarkerLocal _mrkDest;
if ((!canMove _plane) and (!isNull _plane)) then
	{
	sleep cleantime;
	{deleteVehicle _x} forEach crew _plane; deleteVehicle _plane;
	deleteGroup group _plane;
	};