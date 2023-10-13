/*
    Create plank objects from array in the format, ["_className", "_repairObj", "_position", "_direction", "_holdTime", "_price"]
    Add actions to clients for construct & cancel.

Environment: Server, Unscheduled
Arguments:
    1. <array> Containing arrays:
        1. <string> Classname of object to construct or repair
        2. <object> Object to repair, otherwise objNull
        2. <position> Position to construct object, or nil if repair
        3. <number> Direction to construct object, or nil if repair
        4. <number> Construction time for object
        5. <number> Price of object
*/

params [["_objects",[],[[]]]];


private _constructionObjects = [
    "Land_WoodenPlanks_01_pine_F",
    "Land_WoodenPlanks_01_F",
    "Land_Pallets_F"];


{
    _x params ["_className", "_repairObj", "_position", "_direction", "_holdTime", "_price"];

    private _constructionName = selectRandom _constructionObjects;
    private _planks = createVehicle [_constructionName, [0,0,0], [], 0, "CAN_COLLIDE"];
    _planks setVariable ["A3A_build_timeout", time + 1200];
    _planks setVariable ["A3A_build_price", _price];
 
    // Most stuff only needs to be server visible
    private _buildName = getText (configFile / "CfgVehicles" / _className / "displayName");
    if (isNull _repairObj) then
    {
        // Construction, create planks on spot
        _planks setPosATL _position; // place on the ground
        _planks setDir _direction;

        _planks setVariable ["A3A_build_pos", _position];
        _planks setVariable ["A3A_build_dir", _direction];
        _planks setVariable ["A3A_build_class", _className];
        _buildName = "Build " + _buildName;
    }
    else
    {
        // Repair, create planks nearby
        _position = getPosATL _repairObj findEmptyPosition [0, 50, _constructionName];
        if (_position isEqualTo []) then { _position = _repairObj getPos [10, random 360] };
        _planks setPosATL _position;

        _planks setVariable ["A3A_build_repairObj", _repairObj];
        _buildName = "Repair " + _buildName;
    };

    // Only one needed for client?
    _planks setVariable ["A3A_build_name", _buildName, true];

    A3A_unbuiltObjects pushBack _planks;

    // Should be the only actions on this object, so we can just JIP on the object
    [_planks, _holdTime] remoteExecCall ["A3A_fnc_addBuildingActions", 0, _planks];

    // TODO: could trigger on unbuiltObjects change instead

    // unscheduled at the moment...
    //sleep 0.2; 			// increase network sync performance

} forEach _objects;

publicVariable "A3A_unbuiltObjects";
