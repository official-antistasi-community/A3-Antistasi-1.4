#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith {false};
private ["_markerX","_base","_posbase","_posMarker","_angOrig","_ang","_attempts","_distanceX","_pos","_failure","_mineX"];

_markerX = _this select 0;

_base = _this select 1;

_sideX = sidesX getVariable [_base,sideUnknown];
private _faction = Faction(_sideX);

if (spawner getVariable _base != 2) exitWith {false};
_posbase = getMarkerPos _base;
_posMarker = getMarkerPos _markerX;
_angOrig = [_posbase,_posMarker] call BIS_fnc_dirTo;
_angOrig = _angOrig - 45;
_ang = _angOrig + random 90;
_attempts = 1;
//_distanceX = (distanceSPWN/2) + 101;
_distanceX = 500;

_pos = [];
_failure = true;
while {_attempts < 37} do
    {
    _pos = [_posbase, _distanceX, _ang] call BIS_Fnc_relPos;
    if (!surfaceIsWater _pos) then
        {
        _nearX = [markersX,_pos] call BIS_fnc_nearestPosition;
        if (spawner getVariable _nearX == 2) then
            {
            _size = [_nearX] call A3A_fnc_sizeMarker;
            if ((_pos distance (getMarkerPos _nearX)) > (_size + 100)) then
                {
                _road = [_pos,101] call BIS_fnc_nearestRoad;
                if (isNull _road) then
                    {
                    if ({_x distance _pos < 200} count allMines == 0) then
                        {
                        _failure = false;
                        };
                    };
                };
            };
        };
    if (!_failure) exitWith {};
    _attempts = _attempts + 1;
    _ang = _ang - 10;
    };

if (_failure) exitWith {
    Info_1("could not create a Minefield at %1", _base);
    false;
};

Debug_1("Creating a Minefield at %1", _base);

private _mines = (_faction get "minefieldAT") + (_faction get "minefieldAPERS");

for "_i" from 1 to 30 do {
	_mineX = createMine [ selectRandom _mines ,_pos,[],50];
	_sideX revealMine _mineX;
};

//[-4000] remoteExec ["resourcesAAF",2];
true
