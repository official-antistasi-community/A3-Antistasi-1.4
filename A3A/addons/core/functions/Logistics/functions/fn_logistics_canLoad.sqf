/*
    Author: [Håkon]
    [Description]
        Verify that it can load cargo in vehicle

    Arguments:
        0. <Object> Vehicle you want to load cargo inn
        1. <Object> Cargo you want to load

    Return Value:
        <Int>   Error code
        <Array> [Cargo, Vehicle, Nodes, isWeapon] can be passed directly to logistics_load as is

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_vehicle, _cargo] call A3A_fnc_logistics_canLoad;

    Error codes:
        -1: Vehicle not alive or null
        -2: Cargo not alive or null
        -3: Cargo not loadable
        -4: Gunner in static weapon (cargo)
        -5: Weapon not allowed on vehicle
        -6: Unit no longer loadable (conscious)
        -7: Vehicle unable to load any cargo
        -8: Not enough space to load cargo onto vehicle
        -9: Units in cargo seats blocking loading
*/
params [ ["_vehicle", objNull, [objNull] ], ["_object", objNull, [objNull] ] ];
if !(alive _vehicle) exitWith {-1}; //vehicle destroyed
if !(alive _object) exitWith {-2}; //cargo destroyed

//get cargo node size
private _objNodeType = [_object] call A3A_fnc_logistics_getCargoNodeType;
if (_objNodeType isEqualTo -1) exitWith {-3}; //invalid cargo

if !(
    ((gunner _object) isEqualTo _object)
    or ((gunner _object) isEqualTo objNull)
) exitWith {-4}; //gunner in static

//is weapon? and weapon allowed
private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
private _vehModel = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "model");
private _weapon = false;
private _allowed = true;
{
    if ((_x#0) isEqualTo _model) exitWith {
        _weapon = true;
        if (_vehModel in (_x#1)) exitWith {_allowed = false};
        if (typeOf _vehicle in A3A_logistics_coveredVehicles) then {_allowed = false};
    };
} forEach A3A_logistics_weapons;
if !(_allowed) exitWith {-5}; //weapon not allowed on vehicle

if ((_object isKindOf "CAManBase") and (
    ( [_object] call A3A_fnc_canFight )
    or !( isNull (_object getVariable ["helped",objNull]) )
    or !( isNull attachedTo _object )
)) exitWith {-6}; //conscious man

//get vehicle nodes
private _nodes = _vehicle getVariable ["logisticsCargoNodes",nil];

//if nodes not initilized
if (isNil "_nodes") then {
    _nodes = [_vehicle] call A3A_fnc_logistics_getVehicleNodes;
    _vehicle setVariable ["logisticsCargoNodes", _nodes];
};

//Vehicle not able to carry cargo
if (_nodes isEqualTo []) exitWith {-7};

//enough free nodes to load cargo
private "_node";
{
    private _currentNodes = [];
    for "_i" from 0 to _objNodeType - 1 do {
        private _currentNode = _forEachIndex + _i;
        if (isNil {_nodes#_currentNode}) exitWith {};//zero divisor block
        if (((_nodes#_currentNode)#0) isEqualTo 1) then {_currentNodes pushBack _nodes#_currentNode};
    };
    if ((count _currentNodes) isEqualTo _objNodeType) exitWith {_node = _currentNodes};
} forEach _nodes;
if (isNil "_node") exitWith {-8};

//block loading if crew in node seats
private _fullCrew = fullCrew _vehicle;
private _seats = [];
if ((_node#0) isEqualType []) then {
    {_seats append (_x#2)} forEach _node;
} else {
    _seats append (_node#2);
};
if !(_fullCrew findIf {_x#2 in _seats} isEqualTo -1) exitWith {-9};

[_object, _vehicle, _node, _weapon]
