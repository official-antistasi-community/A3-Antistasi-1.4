private ["_markerX","_nameDest","_nameENY"];

params ["_markerX", "_sideEny", "_sideX", ["_roadblockTemp", true]];
_nameDest = [_markerX] call A3A_fnc_localizar;
_nameENY = if (_sideEny == teamPlayer) then
{
	nameTeamPlayer
}
else
{
	if (_sideEny == Invaders) then {nameInvaders} else {nameOccupants};
};
if (_sideX == teamPlayer) then {_sideX = [teamPlayer,civilian]};

[_sideX,_markerX,[format ["%2 is attacking us in %1. Help the defense if you can",_nameDest,_nameENY],format ["%1 Contact Rep",_nameENY],_markerX],getMarkerPos _markerX,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

if (_sideX isEqualType []) then {_sideX = teamPlayer};

waitUntil {sleep 10; (sidesX getVariable [_markerX,sideUnknown] != _sideX) or (_roadblockTemp && {spawner getVariable _markerX == 2})};

[0,_markerX] spawn A3A_fnc_deleteTask;
