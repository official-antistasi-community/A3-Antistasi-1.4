params ["_cargo", "_vehicle", "_node", "_weapon"];

if (_vehicle getVariable ["LoadingCargo", false]) exitWith {["Cargo Load", "Cargo is already being loaded into vehicle"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]};
_vehicle setVariable ["LoadingCargo",true,true];

//update list function
_updateList = {
    params ["_vehicle", "_node"];
    _list = _vehicle getVariable ["logisticsCargoNodes",[]];
    _index = _list find _node;
    _node set [0,0];
    _list set [_index, _node];
    _vehicle setVariable ["logisticsCargoNodes", _list];
};

//find node point and seats
private _nodeOffset = [0,0,0];
private _seats = [];

if ((_node#0) isEqualType []) then {
    //type 2 cargo
    //offset
    private _lastNode = (count _node) -1;
    private _offsetOne = (_node#0#1);
    private _offsetTwo = (_node#_lastNode#1);
    private _diff = _offsetOne vectorDiff _offsetTwo;
    _nodeOffset = _offsetTwo vectorAdd [0,(_diff#1)/2,0];

    //seats
    {
        _seats append (_x#2);
    } forEach _node;

    //update cargo list
    for "_i" from 0 to _lastNode do {
        [_vehicle, _node#_i] call _updateList;
    };
} else {
    //type 1 cargo
    //offset
    _nodeOffset = (_node#1);
    //seats
    _seats append (_node#2);
    //update list
    [_vehicle , _node] call _updateList;
};

//attach data
private _offsetAndDir = [_cargo] call A3A_fnc_logistics_getCargoOffsetAndDir;
private _location = _offsetAndDir#0;
private _location = _location vectorAdd _nodeOffset;

private _bbv = (boundingBoxReal _vehicle select 0 select 1) + ((boundingCenter _vehicle) select 1);
private _bbc = (boundingBoxReal _cargo select 0 select 1) + ((boundingCenter _cargo) select 1);
private _yStart = _bbv + _bbc - 0.1;
private _yEnd = _location#1;
_cargo setVariable ["AttachmentOffset", _location];

//block seats
[_cargo, true] remoteExec ["A3A_fnc_logistics_toggleLock", 0, _cargo];
[_vehicle, true, _seats] remoteExecCall ["A3A_fnc_logistics_toggleLock", 0, _vehicle];

//break undercover
if (_weapon) then {
    {_x setCaptive false;}forEach crew _vehicle;
    player setCaptive false;
};

//initial attachement, hide uglyness
_vectorUp = if (_cargo isKindOf "CAManBase") then {[0,0,0]} else {[0,0,1]};
_location set [1, _yStart];
_cargo hideObjectGlobal true;
_cargo attachto [_vehicle,_location];
_cargo setVectorDirAndUp [(_offsetAndDir#1),[0,0,1]];
_cargo hideObjectGlobal false;

//slideing attachment
while {(_location#1) < _yEnd} do {
    sleep 0.1;
    _location = _location vectorAdd [0,0.1,0];
    _cargo attachto [_vehicle,_location];
};

//update loaded list (for unload ease)
private _previousLoaded = _vehicle getVariable ["Cargo", []];
private _loadedCargo = [[_cargo,_node]] + _previousLoaded;
_vehicle setVariable ["Cargo", _loadedCargo, true];

//misc
[_cargo] call A3A_fnc_logistics_toggleAceActions;
[_vehicle, _cargo] call A3A_fnc_logistics_addOrRemoveObjectMass;
if (_weapon) then {
    [_cargo, _vehicle] remoteExec ["A3A_fnc_logistics_addWeaponAction", 0, _cargo];
};

_vehicle setVariable ["LoadingCargo",nil,true];
[_vehicle, "unload"] remoteExec ["A3A_fnc_logistics_addAction", 0 ,_vehicle];
