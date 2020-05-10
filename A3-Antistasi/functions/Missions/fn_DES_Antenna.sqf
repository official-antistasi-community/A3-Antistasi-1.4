//Mission: Destroy the antenna
if (!isServer and hasInterface) exitWith{};

private ["_antenna","_positionX","_timeLimit","_markerX","_nameDest","_mrkFinal","_tsk"];

_antenna = _this select 0;
_markerX = [markersX,_antenna] call BIS_fnc_nearestPosition;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_nameDest = [_markerX] call A3A_fnc_localizar;
_positionX = getPos _antenna;

private _side = sidesX getVariable [_markerX, sideUnknown];

_timeLimit = if (_difficultX) then {30} else {120};
if (hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_mrkFinal = createMarker [format ["DES%1", random 100], _positionX];
_mrkFinal setMarkerShape "ICON";

[[teamPlayer,civilian],"DES",[format ["We need to destroy or take a Radio Tower in %1. This will interrupt %3 Propaganda Nework. Do it before %2.",_nameDest,_displayTime,nameOccupants],"Destroy Radio Tower",_mrkFinal],_positionX,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
missionsX pushBack ["DES","CREATED"]; publicVariable "missionsX";
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (not alive _antenna) or (not(sidesX getVariable [_markerX,sideUnknown] == Occupants))};

_bonus = if (_difficultX) then {2} else {1};

if (dateToNumber date > _dateLimitNum) then
	{
	["DES",[format ["We need to destroy or take a Radio Tower in %1. This will interrupt %3 Propaganda Nework. Do it before %2.",_nameDest,_displayTime,nameOccupants],"Destroy Radio Tower",_mrkFinal],_positionX,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
	//[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
    if(_side == Occupants) then
    {
        [[-5, 60], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
    };
    if(_side == Invaders) then
    {
        [[0, 0], [-5, 60]] remoteExec ["A3A_fnc_prestige",2]
    };

	}
else
	{
	sleep 15;
	["DES",[format ["We need to destroy or take a Radio Tower in %1. This will interrupt %3 Propaganda Nework. Do it before %2.",_nameDest,_displayTime,nameOccupants],"Destroy Radio Tower",_mrkFinal],_positionX,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
	//[-5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
    if(_side == Occupants) then
    {
        [[15, 90], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
    };
    if(_side == Invaders) then
    {
        [[0, 0], [15, 90]] remoteExec ["A3A_fnc_prestige",2];
    };
	[600*_bonus, _side] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _positionX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

deleteMarker _mrkFinal;

_nul = [1200,"DES"] spawn A3A_fnc_deleteTask;
