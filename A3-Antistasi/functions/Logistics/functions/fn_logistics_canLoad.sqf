params ["_object"];
if (isNil "_object") exitWith {};

if !(
    ((gunner _object) isEqualTo _object)
    or ((gunner _object) isEqualTo objNull)
) exitWith {["Cargo Load", "Cant load a static thats mounted"] call A3A_fnc_customHint};

private _vehicles = (nearestObjects [_object,["Car","Ship"], 10]) - [_object];
private _vehicle = _vehicles#0;
if (isNil "_vehicle") exitWith {["Cargo Load", "No vehicle close enough"] call A3A_fnc_customHint};

//displayName
private _cargoName = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");
private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
if (_object isKindOf "CAManBase") then {_cargoName = name _object};

if !(alive _vehicle) exitWith {["Cargo Load", "You cant load cargo into destroyed a vehicle"] call A3A_fnc_customHint};

//is weapon? and weapon allowed
private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
private _vehModel = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "model");
private _weapon = _model in logistics_weapons;
private _allowed = true;
{
    _x params ["_wep", "_blacklistVehicles"];
    if (_wep isEqualTo _model) exitWith {
        if (_vehModel in _blacklistVehicles) then {_allowed = false};
    };    
} forEach logistics_weaponVehicleBlackList;
if !(_allowed) exitWith {["Cargo Load", format ["%1 can not be mounted on a %2", _cargoName, _vehicleName]] call A3A_fnc_customHint};

if ((_object isKindOf "CAManBase") and !(([_object] call A3A_fnc_canFight) or !(isNull (_object getVariable ["helped",objNull])) or !(isNull attachedTo _object))) exitWith {["Cargo Load", format ["%1 is being helped or no longer needs your help",_cargoName]] call A3A_fnc_customHint};

//get cargo node size
private _objNodeType = [_object] call A3A_fnc_logistics_getCargoNodeType;
if (_objNodeType isEqualTo -1) exitWith {["Cargo Load", format ["%1 cannot be loaded", _cargoName]] call A3A_fnc_customHint};

//get vehicle nodes
private _nodes = _vehicle getVariable ["logisticsCargoNodes",nil];

//if nodes not initilized
if (isNil "_nodes") then {	
    _nodes = [_vehicle] call A3A_fnc_logistics_getVehicleNodes;
    _vehicle setVariable ["logisticsCargoNodes", _nodes, true];
};

//Vehicle not able to carry cargo
if (_nodes isEqualTo -1) exitWith {["Cargo Load", format ["%1 is unable to load %2", _vehicleName, _cargoName]] call A3A_fnc_customHint};

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
if (isNil "_node") exitWith {["Cargo Load", format ["%1 does not have enough space to load %2", _vehicleName, _cargoName]] call A3A_fnc_customHint};

//block loading if crew in node seats
private _fullCrew = fullCrew _vehicle;
private _seats = [];
if ((_node#0) isEqualType []) then {
    {_seats append (_x#2)} forEach _node;
} else {
    _seats append (_node#2);
};
private _cargoUnits = [];
{
    _x params ["_unit", "_role", "_index", "_turretPath", "_personTurret"];
    private _isBlocking = call {
        if (_index in _seats) exitWith {true};
        false;
    };
    if (_isBlocking) then {_cargoUnits pushBack _x};
}forEach _fullCrew;
if !(_cargoUnits isEqualTo []) exitWith {["Cargo Load", format ["%1 can not load cargo while units blocking the cargo plane", _vehicleName]] call A3A_fnc_customHint};

[_object, _vehicle, _node, _weapon] spawn A3A_fnc_logistics_load;
