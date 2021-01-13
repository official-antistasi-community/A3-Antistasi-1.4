/*
Author: Antistasi Community

Description:
create task, group with vehicle, wait time limit,
delete group with vehicle, create marker and post

Arguments:
	<STRING> "create" or "delete"
	<POSITION> post position
Return Value: <nil>
Scope: Server
Environment: Scheduled
Public: No
Dependencies:
	groupsSDKAT, vehSDKTruck, groupsSDKSniper, vehSDKBike, theBoss,
	outpostsFIA, sidesX, markersX, spawner, garrison, A3A_fnc_customHint,
	A3A_fnc_spawnGroup, A3A_fnc_findNearestGoodRoad, A3A_fnc_FIAinit,
	A3A_fnc_taskUpdate, A3A_fnc_deleteTask

Example:
	["create", [0, 0, 0]] remoteExec ["A3A_fnc_createOutpostsFIA", 2];
	["delete", [0, 0, 0]] remoteExec ["A3A_fnc_createOutpostsFIA", 2];
*/

/* -------------------------------------------------------------------------- */
/*                                   defines                                  */
/* -------------------------------------------------------------------------- */

// TODO localization
#define HINT_TITLE "Create Outpost"
#define DEPRECATED_TEXT "Deprecated option. Use Remove Garrison from HQ instead"
#define OBSERVATION_MARKER_TEXT format ["%1 Observation Post", nameTeamPlayer]
#define ROADBLOCK_MARKER_TEXT format ["%1 Roadblock", nameTeamPlayer]
#define TASK_TEXT "We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination"
#define TASK_TITLE "Post \ Roadblock Deploy"
#define TASK_TYPE "outpostsFIA"

/* -------------------------------------------------------------------------- */
/*                                    main                                    */
/* -------------------------------------------------------------------------- */

if !(isServer) exitWith {};

params ["_typeX", "_position"];

/* ---------------------------- deprecated option --------------------------- */

if (_typeX == "delete")
exitWith { [HINT_TITLE, DEPRECATED_TEXT] call A3A_fnc_customHint; };

/* ------------------------- create task and marker ------------------------- */

private _markerText = OBSERVATION_MARKER_TEXT;
private _groupType = groupsSDKSniper;
private _vehType = vehSDKBike;

private _isOnRoad = isOnRoad _position;

if (_isOnRoad)
then
{
	_markerText = ROADBLOCK_MARKER_TEXT;
	_groupType = groupsSDKAT;
	_vehType = vehSDKTruck;
};

private _mrk = createMarker [format ["FIAPost%1", random 1000], _position];
_mrk setMarkerShape "ICON";

private _dateLimitNum = dateToNumber [date # 0, date # 1, date # 2, date # 3,
	(date # 4) + 60];

[
	[teamPlayer, civilian],
	TASK_TYPE,
	[TASK_TEXT, TASK_TITLE, _mrk],
	_position,
	false, 0, true, "Move", true
] call BIS_fnc_taskCreate;

/* ------------------------------ create group ------------------------------ */

private _formatX = [];

{
	if (random 20 <= skillFIA)
	then { _formatX pushBack (_x # 1); }
	else { _formatX pushBack (_x # 0); };
} forEach _groupType;

private _group = [getMarkerPos respawnTeamPlayer, teamPlayer, _formatX]
	call A3A_fnc_spawnGroup;

_group setGroupId ["Post"];

private _road = [getMarkerPos respawnTeamPlayer]
	call A3A_fnc_findNearestGoodRoad;

private _vehiclePos = (position _road) findEmptyPosition
	[1, 30, "B_G_Van_01_transport_F"];

private _vehicle = _vehType createVehicle _vehiclePos;

_group addVehicle _vehicle;

{ [_x] call A3A_fnc_FIAinit; } forEach units _group;

(leader _group) setBehaviour "SAFE";
(units _group) orderGetIn true;
theBoss hcSetGroup [_group];

/* ---------------------------------- wait ---------------------------------- */

private _isSuccess = false;

waitUntil
{
	sleep 1;

	if ({alive _x} count units _group == 0) exitWith { true };

	if ((units _group) findIf { alive _x && { _x distance _position < 10 }} != -1)
	exitWith { _isSuccess = true; true };

	if (dateToNumber date > _dateLimitNum) exitWith { true };

	false
};

/* ------------------------- success fail processing ------------------------ */

if (_isSuccess)
then
{
	private _leader = leader _group;

	if (isPlayer _leader)
	then
	{
		private _owner = _leader getVariable ["owner", _leader];

		_leader remoteExec ["removeAllActions", _leader];
		_owner remoteExec ["selectPlayer", _leader];

		_leader setVariable ["owner", _owner, true];

		private _ownerGroup = group _owner;
		{ [_x] joinsilent _ownerGroup; } forEach units _ownerGroup;

		[_ownerGroup, _owner] remoteExec ["selectLeader", _owner];

		// wait for player leave group
		waitUntil { !(isPlayer _leader) };
	};

	outpostsFIA = outpostsFIA + [_mrk];
	publicVariable "outpostsFIA";

	sidesX setVariable [_mrk, teamPlayer, true];

	markersX = markersX + [_mrk];
	publicVariable "markersX";

	spawner setVariable [_mrk, 2, true];

	[TASK_TYPE, [TASK_TEXT, TASK_TITLE, _mrk], _position, "SUCCEEDED"]
		call A3A_fnc_taskUpdate;

	[-5, 5, _position] remoteExec ["A3A_fnc_citySupportChange", 2];

	_mrk setMarkerType "loc_bunker";
	_mrk setMarkerColor colorTeamPlayer;
	_mrk setMarkerText _markerText;

	if (_isOnRoad)
	then
	{
		private _garrison = [staticCrewTeamPlayer];

		{
			if (random 20 <= skillFIA)
			then { _garrison pushBack (_x # 1); }
			else { _garrison pushBack (_x # 0); };
		} forEach groupsSDKAT;

		garrison setVariable [_mrk, _garrison, true];
	};
}
else
{
	[TASK_TYPE, [TASK_TEXT, TASK_TITLE, _mrk], _position, "FAILED"]
		call A3A_fnc_taskUpdate;

	sleep 3;

	deleteMarker _mrk;
};

/* ----------------------- remove units, veh and task ----------------------- */

theBoss hcRemoveGroup _group;

{ deleteVehicle _x; } forEach (units _group);

deleteVehicle _vehicle;
deleteGroup _group;
sleep 15;

[0, "outpostsFIA"] spawn A3A_fnc_deleteTask;
