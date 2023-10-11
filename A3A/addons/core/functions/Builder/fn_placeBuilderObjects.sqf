/*
    Create plank objects from array in the format, ["_className", "_position", "_direction", "_holdTime", "_price"]
    Add actions to clients for construct & cancel.

Environment: Server, Unscheduled
Arguments:
    1. <array> array of [classname, position, direction, holdTime, price] for placement

*/

params [["_objects",[],[[]]]];


private _constructionObjects = [
    "Land_WoodenPlanks_01_pine_F",
    "Land_WoodenPlanks_01_F",
    "Land_Pallets_F"];


{
    _x params ["_className", "_position", "_direction", "_holdTime", "_price"];

    private _constructionName = selectRandom _constructionObjects;
    private _planks = createVehicle [_constructionName, [0,0,0], [], 0, "CAN_COLLIDE"];
    _planks setPosATL _position; // place on the ground
    _planks setDir _direction;

    // Only set these server-local
    _planks setVariable ["A3A_build_pos", _position];
    _planks setVariable ["A3A_build_dir", _direction];
    _planks setVariable ["A3A_build_class", _className];
    _planks setVariable ["A3A_build_timeout", time + 1200];
    _planks setVariable ["A3A_build_price", _price];

    // Only one needed for client?
    _planks setVariable ["A3A_build_name", getText (configFile / "CfgVehicles" / _className / "displayName"), true];

    A3A_unbuiltObjects pushBack _planks;

    // Should be the only actions on this object, so we can just JIP on the object
    [_planks, _holdTime] remoteExecCall ["A3A_fnc_addBuildingActions", 0, _planks];

    // TODO: could trigger on unbuiltObjects change instead

    // unscheduled at the moment...
    //sleep 0.2; 			// increase network sync performance

} forEach _objects;

publicVariable "A3A_unbuiltObjects";
