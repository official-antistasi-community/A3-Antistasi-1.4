//TODO: add header

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_thingX","_playerX","_id","_isStatic","_sites","_markerX","_size","_positionX"];
private _titleStr = localize "STR_A3A_fn_dialogs_movehqobj_title";

_thingX = _this select 0;
_playerX = _this select 1;
_id = _this select 2;
_isStatic = (_thingX isKindOf "StaticWeapon");

if (!_isStatic && player != theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_commander"] call A3A_fnc_customHint;};
if (!(isNull attachedTo _thingX)) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_already"] call A3A_fnc_customHint;};
if (vehicle _playerX != _playerX) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_vehicle"] call A3A_fnc_customHint;};

if (([_playerX] call A3A_fnc_countAttachedObjects) > 0) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_attached"] call A3A_fnc_customHint;};

_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_markerX = [_sites,_playerX] call BIS_fnc_nearestPosition;
_size = [_markerX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _markerX;
if (_playerX distance2D _positionX > _size) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_closer"] call A3A_fnc_customHint;};

if (captive _playerX) then { _playerX setCaptive false };

_thingX setVariable ["objectBeingMoved", true];
if !(_isStatic) then { _thingX removeAction _id };
if (_isStatic) then { _thingX lock true };

if (isNil {_thingX getVariable "A3A_originalMass"}) then { _thingX setVariable ["A3A_originalMass", getMass _thingX] };
[_thingX, 1e-12] remoteExecCall ["setMass", 0]; 

private _spacing = 2 max (1 - (boundingBoxReal _thingX select 0 select 1));
private _height = 0.1 - (boundingBoxReal _thingX select 0 select 2);
_thingX attachTo [_playerX, [0, _spacing, _height]];

private _fnc_placeObject = {
	params [["_thingX", objNull], ["_playerX", objNull], ["_dropObjectActionIndex", -1]];

	if (isNull _thingX) exitWith {Error("trying to place invalid HQ object")};
	if (isNull _playerX) exitWith {Error("trying to place HQ object with invalid player")};

	if (!(_thingX getVariable ["objectBeingMoved", false])) exitWith {};

	if (_playerX == attachedTo _thingX) then {
		_playerX setVelocity [0,0,0];
		_thingX setVelocity [0,0,0];
		detach _thingX;
	};

	if (_dropObjectActionIndex != -1) then {
		_playerX removeAction _dropObjectActionIndex;
	};

	// Can't find a case where this is ever true, but we'll make sure
	if (local _thingX) then {
		if (isNull group _thingX) then { [_thingX, 2] remoteExec ["setOwner", 2] }
		else { [group _thingX, 2] remoteExec ["setGroupOwner", 2] };
	};

	// Some objects never lose (and even regain) their velocity when detached, becoming lethal
	// On a DS, object locality changes when detached, so we have to remoteexec
	[_thingX, [0,0,0]] remoteExec ["setVelocity", _thingX];

	// Without this, non-unit objects often hang in mid-air
	[_thingX, surfaceNormal position _thingX] remoteExec ["setVectorUp", _thingX];

	// Place on closest surface
	private _pos = getPosASL _thingX;
	private _intersects = lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-100], _thingX];
	if (count _intersects > 0) then {
		_thingX setPosASL (_intersects select 0 select 0);
	};

	// _thingX setPosATL [getPosATL _thingX select 0,getPosATL _thingX select 1,0.1];

	if (_thingX isKindOf "StaticWeapon") then { _thingX lock false };

	_thingX setVariable ["objectBeingMoved", false];

	[_thingX, _thingX getVariable "A3A_originalMass"] remoteExecCall ["setMass", _thingX];
};

private _actionX = _playerX addAction [localize "STR_A3A_fn_dialogs_movehqobj_addact_drop", {
	(_this select 3) params ["_thingX", "_fnc_placeObject"];

	[_thingX, player, (_this select 2)] call _fnc_placeObject;
}, [_thingX, _fnc_placeObject],6,true,true,"",""];

waitUntil {sleep 1;
	(_playerX != attachedTo _thingX)
	or (vehicle _playerX != _playerX)
	or (_playerX distance2D _positionX > (_size-3))
	or !([_playerX] call A3A_fnc_canFight)
	or (!isPlayer _playerX)
	or (_isStatic and {count crew _thingX > 0})
};

[_thingX, _playerX, _actionX] call _fnc_placeObject;
if !(_isStatic) then { _thingX addAction [localize "STR_A3A_fn_dialogs_movehqobj_addact_move", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)"] };

if (vehicle _playerX != _playerX) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_vehicle"] call A3A_fnc_customHint;};

if  (_playerX distance2D _positionX > _size) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_movehqobj_no_far"] call A3A_fnc_customHint;};
