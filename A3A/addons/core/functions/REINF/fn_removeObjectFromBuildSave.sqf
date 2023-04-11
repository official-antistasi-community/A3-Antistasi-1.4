/*
Author: [Killerswin2]
    removes objects from the save/build system
Arguments:
0.  <object>    object to remove
1.  <string>    key name for hashmap

Return Value:
    <nil>

Scope: Clients
Environment: scheduled
Public: yes
Dependencies:

Example:
    [_veh, _marker] call A3A_fnc_removeObjectFromBuildSave;
*/



params [["_veh", objNull], ["_markerKey", ""]];

if(isNull _veh) then {};

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

private _objMap = sidesX getVariable ["OBJ_DATA", nil];
if (isNil "_objMap") exitWith {};
private _hashmap = _objMap getOrDefault [_markerKey, nil];
if (isNil "_hashmap") exitWith {};

private _objectsToSave = _hashmap getOrDefault [_type, []];
_objectsToSave deleteAt (_objectsToSave find _veh);
private _objectsData = _hashmap getOrDefault [(_type + "Data"), []];

_objectsData deleteAt (_objectsData find [typeOf _veh, getPosWorld _veh, vectorUp _veh, vectorDir _veh]);


_hashmap set [_type, _objectsToSave];
_hashmap set [(_type + "Data"), _objectsData];

_objMap set [_markerKey, _hashmap];

sidesX setVariable ["OBJ_DATA", _objMap, true];