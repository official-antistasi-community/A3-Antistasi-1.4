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



params [["_veh", objNull], ["_markerKey", ""]];

if(isNull _veh) exitWith {};

if(_markerKey isEqualTo "") then {
	_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
	_markerKey = [_sites, getPosATL player] call BIS_fnc_nearestPosition;

	//TODO check distance encase this was wrongly called
};

private _type = "";

switch (true) do {
	case (_veh isKindOf "StaticWeapon"): { _type = "StaticWeapon";};
	case (_veh isKindOf "Building"): { _type = "Building";};
	default { };
};

systemChat str [_veh, _type];

private _objMap = sidesX getVariable ["OBJ_DATA", nil];
if (isNil "_objMap") exitWith {};
private _hashmap = _objMap getOrDefault [_markerKey, nil];
if (isNil "_hashmap") then {_hashmap = createHashMap};

private _objectsToSave = _hashmap getOrDefault [_type, []];
_objectsToSave pushBackUnique _veh;
private _objectsData = _hashmap getOrDefault [(_type + "Data"), []];

_objectsData pushBackUnique [typeOf _veh, getPosWorld _veh, vectorUp _veh, vectorDir _veh];


_hashmap set [_type, _objectsToSave];
_hashmap set [(_type + "Data"), _objectsData];

_objMap set [_markerKey, _hashmap];

sidesX setVariable ["OBJ_DATA", _objMap, true];