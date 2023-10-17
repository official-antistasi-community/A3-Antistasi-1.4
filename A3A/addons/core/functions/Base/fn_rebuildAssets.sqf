#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_fn_base_rebasset_title";

_resourcesFIA = server getVariable "resourcesFIA";

if (_resourcesFIA < 5000) exitWith {[_titleStr, localize "STR_A3A_fn_base_rebasset_no_money"] call A3A_fnc_customHint;};

_destroyedSites = destroyedSites - citiesX;

if (!visibleMap) then {openMap true};
positionTel = [];
[_titleStr, localize "STR_A3A_fn_base_rebasset_click_zone"] call A3A_fnc_customHint;

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;

_siteX = [markersX,_positionTel] call BIS_fnc_nearestPosition;

if (getMarkerPos _siteX distance _positionTel > 50) exitWith {[_titleStr, localize "STR_A3A_fn_base_rebasset_click_marker"] call A3A_fnc_customHint;};

if ((not(_siteX in _destroyedSites)) and (!(_siteX in outposts))) exitWith {[_titleStr, localize "STR_A3A_fn_base_rebasset_no"] call A3A_fnc_customHint;};

_leave = false;
_antennaDead = objNull;
_textX = localize "STR_A3A_fn_base_rebasset_no_notower";
if (_siteX in outposts) then
	{
	_antennasDead = antennasDead select {_x inArea _siteX};
	if (count _antennasDead > 0) then
		{
		if (sidesX getVariable [_siteX, sideUnknown] != teamPlayer) then
			{
			_leave = true;
			_textX = format [localize "STR_A3A_fn_base_rebasset_no_owner",FactionGet(reb,"name")];
			}
		else
			{
			_antennaDead = _antennasDead select 0;
			};
		}
	else
		{
		_leave = true
		};
	};

if (_leave) exitWith {[_titleStr, format ["%1",_textX]] call A3A_fnc_customHint;};

if (isNull _antennaDead) then
	{
	_nameX = [_siteX] call A3A_fnc_localizar;

	[_titleStr, format [localize "STR_A3A_fn_base_rebasset_done_1", _nameX]] call A3A_fnc_customHint;

	[0,10,_positionTel] remoteExec ["A3A_fnc_citySupportChange",2];
    [Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    [Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
	destroyedSites = destroyedSites - [_siteX];
	publicVariable "destroyedSites";
	}
else
	{
	[_titleStr, localize "STR_A3A_fn_base_rebasset_done_2"] call A3A_fnc_customHint;
	[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];
	};
[0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
