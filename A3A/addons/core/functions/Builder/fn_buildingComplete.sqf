/*
Description:
    Server-side function to complete or cancel a construction

Environment: Server, unscheduled
Arguments:
    1. <object> Plank object to complete construction for
    2. <bool> True if completed, false if cancelled
*/

params ["_target", ["_finished", true]];

private _className = _target getVariable ["A3A_build_class", ""];
private _position = _target getVariable ["A3A_build_pos", [0,0,0]];
private _direction  = _target getVariable ["A3A_build_dir", [0,0,0]];
private _objectTimeout = _target getVariable ["A3A_build_timeout", 0];
private _price = _target getVariable ["A3A_build_price", 10];

//remove from list
A3A_unbuiltObjects deleteAt (A3A_unbuiltObjects find _target);
publicVariable "A3A_unbuiltObjects";
deleteVehicle _target;

// Cancel case
if (!_finished) exitWith {
    if (_price > 0) then { [0, _price] spawn A3A_fnc_resourcesFIA };
};

// Spawn the building
private _building = createVehicle [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
_building setPosATL _position;
_building setDir _direction;
_building setVariable ["A3A_building", true, true];            // Used to identify removable buildings
A3A_buildingsToSave pushBack _building;

// Allowing flagpole construction is probably not a good idea due to how markerChange handles flags atm
if (_className isEqualTo (A3A_faction_reb get "flag")) then {
    _building setFlagTexture (A3A_faction_reb get "flagTexture");
};
