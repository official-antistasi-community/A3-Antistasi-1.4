if (bombRuns < 1) exitWith {[localize "STR_antistasi_dialogs_commander_comm_air_support", localize "STR_antistasi_customHint_air_support_noSupport"] call A3A_fnc_customHint;};
//if (!allowPlayerRecruit) exitWith {hint "Server is very loaded. <br/>Wait one minute or change FPS settings in order to fulfill this request"};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[localize "STR_antistasi_dialogs_commander_comm_air_support", localize "STR_antistasi_customHint_minefields_noradio"] call A3A_fnc_customHint;} else {["Air Support", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};
if ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX == 0) exitWith {[localize "STR_antistasi_dialogs_commander_comm_air_support", localize "STR_antistasi_customHint_air_support_noAirport"] call A3A_fnc_customHint;};
_typeX = _this select 0;

positionTel = [];

[localize "STR_antistasi_dialogs_commander_comm_air_support", localize "STR_antistasi_customHint_air_support_select"] call A3A_fnc_customHint;

if (!visibleMap) then {openMap true};
onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_pos1 = positionTel;
positionTel = [];

_mrkorig = createMarkerLocal [format ["BRStart%1",random 1000], _pos1];
_mrkorig setMarkerShapeLocal "ICON";
_mrkorig setMarkerTypeLocal "hd_destroy";
_mrkorig setMarkerColorLocal "ColorRed";
_mrkOrig setMarkerTextLocal localize "STR_antistasi_markers_bomb_init";

[localize "STR_antistasi_dialogs_commander_comm_air_support", localize "STR_antistasi_customHint_air_support_selectVector"] call A3A_fnc_customHint;

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {deleteMarker _mrkOrig};

_pos2 = positionTel;
positionTel = [];

_ang = [_pos1,_pos2] call BIS_fnc_dirTo;


bombRuns = bombRuns - 1;
publicVariable "bombRuns";
[] spawn A3A_fnc_statistics;

_mrkDest = createMarkerLocal [format ["BRFin%1",random 1000], _pos2];
_mrkDest setMarkerShapeLocal "ICON";
_mrkDest setMarkerTypeLocal "hd_destroy";
_mrkDest setMarkerColorLocal "ColorRed";
_mrkDest setMarkerTextLocal localize "STR_antistasi_markers_bomb_exit";

//openMap false;

_angorig = _ang - 180;

_origpos = [_pos1, 2500, _angorig] call BIS_fnc_relPos;
_finpos = [_pos2, 2500, _ang] call BIS_fnc_relPos;

_planefn = [_origpos, _ang, vehSDKPlane, teamPlayer] call A3A_fnc_spawnVehicle;
_plane = _planefn select 0;
_planeCrew = _planefn select 1;
_groupPlane = _planefn select 2;

_plane setPosATL [getPosATL _plane select 0, getPosATL _plane select 1, 1000];
_plane disableAI "TARGET";
_plane disableAI "AUTOTARGET";
_plane flyInHeight 100;
private _minAltASL = ATLToASL [_positionX select 0, _positionX select 1, 0];
_plane flyInHeightASL [(_minAltASL select 2) +100, (_minAltASL select 2) +100, (_minAltASL select 2) +100];

driver _plane sideChat format [localize "STR_antistasi_chat_startBomb",30];
_wp1 = group _plane addWaypoint [_pos1, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";

if(_typeX == "NAPALM" && !napalmEnabled) then {_typeX == "HE"};
private _bombParams = [_plane, _typeX, 4, (_pos1 distance2D _pos2)];
(driver _plane) setVariable ["bombParams", _bombParams, true];

[_pos1, driver _plane] spawn
{
    params ["_pos", "_pilot"];
    waitUntil {sleep 0.1; ((_pos distance2D _pilot) < 250) || {isNull (objectParent _pilot)}};
    if(isNull (objectParent _pilot)) exitWith {};
    (_pilot getVariable 'bombParams') spawn A3A_fnc_airbomb;
};

_wp2 = group _plane addWaypoint [_pos2, 1];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointType "MOVE";

_wp3 = group _plane addWaypoint [_finpos, 2];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

private _timeOut = time + 600;
waitUntil { sleep 2; (currentWaypoint group _plane == 4) or (time > _timeOut) or !(canMove _plane) };

deleteMarkerLocal _mrkOrig;
deleteMarkerLocal _mrkDest;

if !(canMove _plane) then { sleep cleantime };		// let wreckage hang around for a bit
deleteVehicle _plane;
{deleteVehicle _x} forEach _planeCrew;
deleteGroup _groupPlane;
