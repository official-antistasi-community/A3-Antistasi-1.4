private ["_markerX","_nameDest","_nameENY"];
_markerX = _this select 0;
_nameDest = [_markerX] call A3A_fnc_localizar;
_sideEny = _this select 1;
_nameENY = if (_sideEny == teamPlayer) then
				{
				nameTeamPlayer
				}
			else
				{
				if (_sideEny == Invaders) then {nameInvaders} else {nameOccupants};
				};
_sideX = _this select 2;
if (_sideX == teamPlayer) then {_sideX = [teamPlayer,civilian]};

[_sideX,_markerX,[format ["%2 is attacking us in %1. Help the defense if you can",_nameDest,_nameENY],format ["%1 Contact Rep",_nameENY],_markerX],getMarkerPos _markerX,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

if (_sideX isEqualType []) then {_sideX = teamPlayer};

waitUntil {sleep 10; (sidesX getVariable [_markerX,sideUnknown] != _sideX) or (spawner getVariable _markerX == 2)};

[0,_markerX] spawn A3A_fnc_deleteTask;