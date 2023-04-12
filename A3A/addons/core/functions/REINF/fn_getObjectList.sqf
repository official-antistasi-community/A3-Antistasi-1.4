/*
Author: [Killerswin2]
    adds objects to the save/build system for tracking
Arguments:
0.  <object>    object to add
1.  <string>    key name for hashmap

Return Value:
    <nil>

Scope: Clients
Environment: scheduled
Public: yes
Dependencies:

Example:
    [_veh, _markerKey] call A3A_fnc_addObjectToBuildSave;
*/


params [["_markerKey", ""], ["_type", 1]];

private _key = "";
if(_type == 1) then {_key = "StaticWeapon";} else {_key = "Building";};


private _objMap = sidesX getVariable ["OBJ_DATA", nil];
if (isNil "_objMap") exitWith {[]};
private _hashmap = _objMap getOrDefault [_markerKey, nil];
if (isNil "_hashmap") exitWith {[]};

private _objectsToSave = _hashmap getOrDefault [_key, []];
private _return = +_objectsToSave;
// if we need both do this
if (_type > 2) then {
	_return append (_hashmap getOrDefault ["StaticWeapon", []]);
};

_return