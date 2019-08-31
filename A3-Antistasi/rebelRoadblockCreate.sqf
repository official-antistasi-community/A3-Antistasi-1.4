if (!isServer) exitWith {};

private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hr","_unitsX","_formatX"];

_typeX = _this select 0;
_positionTel = _this select 1;

if (_typeX == "delete") exitWith {hint "Deprecated option. Use Remove Garrison from HQ instead"};

_isRoad = isOnRoad _positionTel;

_textX = format ["%1 Observation Post",rebelFactionName];
_typeGroup = rebelGroupSniperTeam;
_typeVehX = rebelVehQuadbike;
private _tsk = "";
if (_isRoad) then
	{
	_textX = format ["%1 Roadblock",rebelFactionName];
	_typeGroup = rebelGroupAT;
	_typeVehX = rebelVehTransport;
	};

_mrk = createMarker [format ["%2 Post%1", random 1000], _positionTel,rebelFactionName];
_mrk setMarkerShape "ICON";

_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + 60];
_dateLimitNum = dateToNumber _dateLimit;
[[rebelSide,civilian],"rebelWatchpostsAndRoadblocks",["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_positionTel,false,0,true,"Move",true] call BIS_fnc_taskCreate;
//_tsk = ["rebelWatchpostsAndRoadblocks",[rebelSide,civilian],["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_positionTel,"CREATED",5,true,true,"Move"] call BIS_fnc_setTask;
//missionsX pushBackUnique _tsk; publicVariable "missionsX";
_formatX = [];
{
if (random 20 <= rebelTrainingLevel) then {_formatX pushBack (_x select 1)} else {_formatX pushBack (_x select 0)};
} forEach _typeGroup;
_groupX = [getMarkerPos rebelRespawn, rebelSide, _formatX] call A3A_fnc_spawnGroup;
_groupX setGroupId ["Post"];
_road = [getMarkerPos rebelRespawn] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
_truckX = _typeVehX createVehicle _pos;
_groupX addVehicle _truckX;
{[_x] call A3A_fnc_rebelCreateUnit} forEach units _groupX;
leader _groupX setBehaviour "SAFE";
(units _groupX) orderGetIn true;
theBoss hcSetGroup [_groupX];

waitUntil {sleep 1; ({alive _x} count units _groupX == 0) or ({(alive _x) and (_x distance _positionTel < 10)} count units _groupX > 0) or (dateToNumber date > _dateLimitNum)};

if ({(alive _x) and (_x distance _positionTel < 10)} count units _groupX > 0) then
	{
	if (isPlayer leader _groupX) then
		{
		_owner = (leader _groupX) getVariable ["owner",leader _groupX];
		(leader _groupX) remoteExec ["removeAllActions",leader _groupX];
		_owner remoteExec ["selectPlayer",leader _groupX];
		(leader _groupX) setVariable ["owner",_owner,true];
		{[_x] joinsilent group _owner} forEach units group _owner;
		[group _owner, _owner] remoteExec ["selectLeader", _owner];
		"" remoteExec ["hint",_owner];
		waitUntil {!(isPlayer leader _groupX)};
		};
	rebelWatchpostsAndRoadblocks = rebelWatchpostsAndRoadblocks + [_mrk]; publicVariable "rebelWatchpostsAndRoadblocks";
	sidesX setVariable [_mrk,rebelSide,true];
	markersX = markersX + [_mrk];
	publicVariable "markersX";
	spawner setVariable [_mrk,2,true];
	["rebelWatchpostsAndRoadblocks",["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_positionTel,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	//["rebelWatchpostsAndRoadblocks", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
	_nul = [-5,5,_positionTel] remoteExec ["A3A_fnc_citySupportChange",2];
	_mrk setMarkerType "loc_bunker";
	_mrk setMarkerColor rebelColor;
	_mrk setMarkerText _textX;
	if (_isRoad) then
		{
		_garrison = [rebelStaticCrew];
		{
		if (random 20 <= rebelTrainingLevel) then {_garrison pushBack (_x select 1)} else {_garrison pushBack (_x select 0)};
		} forEach rebelGroupAT;
		garrison setVariable [_mrk,_garrison,true];
		};
	}
else
	{
	["rebelWatchpostsAndRoadblocks",["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_positionTel,"FAILED"] call A3A_fnc_taskUpdate;
	//["rebelWatchpostsAndRoadblocks", "FAILED",true] spawn BIS_fnc_taskSetState;
	sleep 3;
	deleteMarker _mrk;
	};

theBoss hcRemoveGroup _groupX;
{deleteVehicle _x} forEach units _groupX;
deleteVehicle _truckX;
deleteGroup _groupX;
sleep 15;

_nul = [0,"rebelWatchpostsAndRoadblocks"] spawn A3A_fnc_deleteTask;











