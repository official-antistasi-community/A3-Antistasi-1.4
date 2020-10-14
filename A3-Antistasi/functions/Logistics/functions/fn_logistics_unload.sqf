params ["_vehicle"];

private _loaded = _vehicle getVariable ["Cargo", []];
private _lastLoaded = false;
if ((count _loaded) isEqualTo 1) then {_lastLoaded = true};
(_loaded#0) params ["_cargo", "_node"];

if !(
    ((gunner _cargo) isEqualTo _cargo)
    or ((gunner _cargo) isEqualTo objNull)
) exitWith {["Cargo Load", "Cant unload a static thats mounted"] call A3A_fnc_customHint};

if (_vehicle getVariable ["LoadingCargo", false]) exitWith {["Cargo Load", "Cargo is already being unloaded from vehicle"] call A3A_fnc_customHint};
_vehicle setVariable ["LoadingCargo",true,true];

//update list function
_updateList = {
    params ["_vehicle", "_node"];
    _list = _vehicle getVariable ["logisticsCargoNodes",[]];
    _index = _list find _node;
    _node set [0,1];
    _list set [_index, _node];
    _vehicle setVariable ["logisticsCargoNodes", _list, true];
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

//detach cargo
private _keepUnloading = false;
if !(_cargo isEqualTo objNull) then {//cargo not deleted
    //check if its a weapon
    private _model = getText (configFile >> "CfgVehicles" >> typeOf _cargo >> "model");
    _weapon = false;
    {
        if ((_x#0) isEqualTo _model) exitWith {_weapon = true};
    } forEach logistics_weapons;

    if (_weapon) then {
        [_vehicle, _cargo] remoteExecCall ["A3A_fnc_logistics_removeWeaponAction",0];
        player setCaptive false; //break undercover for unloading weapon
    };
    _cargo setVariable ["AttachmentOffset", nil, true];

    private _location = ([_cargo] call A3A_fnc_logistics_getCargoOffsetAndDir)#0;
    private _location = _location vectorAdd _nodeOffset;

    private _bbv = (boundingBoxReal _vehicle select 0 select 1) + ((boundingCenter _vehicle) select 1);
    private _bbc = (boundingBoxReal _cargo select 0 select 1) + ((boundingCenter _cargo) select 1);
    private _yEnd = _bbv + _bbc - 0.1;

    while {(_location#1) > _yEnd} do {
        sleep 0.1;
        _location = _location vectorAdd [0,-0.1,0];
        _cargo attachto [_vehicle,_location];
    };
    detach _cargo;

    [_cargo] call A3A_fnc_logistics_toggleAceActions;
    [_vehicle, _cargo, true] call A3A_fnc_logistics_addOrRemoveObjectMass;
    _cargo lockDriver false;
} else {_keepUnloading = true};

//unlock seats
[_cargo, false] remoteExec ["A3A_fnc_logistics_toggleLock", 0, _cargo];
_cargo setVariable ["Logistics_occupiedSeats", nil, true];
[_vehicle, false, _seats] remoteExec ["A3A_fnc_logistics_toggleLock", 0, _vehicle];

//update list
_loaded deleteAt 0;
_vehicle setVariable ["Cargo", _loaded, true];
[_vehicle] call A3A_fnc_logistics_refreshVehicleLoad; //refresh list in case theres more on the list but no actuall cargo loaded

_vehicle setVariable ["LoadingCargo",nil,true];
if (_keepUnloading and !_lastLoaded) then {[_vehicle] spawn A3A_fnc_logistics_unload};//if you tried to unload a null obj unload next on list
