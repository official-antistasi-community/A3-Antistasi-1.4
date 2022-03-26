/*
Author: Caleb Serafin
    Hosts a variety of coordinate system placement options.
    XY position is enforced with setPosWorld to avoid model drifting.
    NB: If Coordinate system is unspecified, no movement will occur, no errors will be logged.

Arguments:
    <OBJECT> Object to move to new position.
    <POS3D> X,Y,Z Coordinates. [Default=[0,0,0]]
    <STRING> Coordinate system. [Default="AGL"]

Arguments Alternate:
    <OBJECT> Object to move to new position.
    <POS3DTYPE> X,Y,Z Coordinates and Coordinate system.

Return Value:
    <OBJECT> Same object reference.

Scope: Single Execution. Local Arguments. Global Effect.
Environment: Any. | Unscheduled recommended if using AGLS coordinate system.
Public: Yes.

Example:
    private _myPos = getPos player;
    private _vehicle = [getPosAGL player, 0, "B_T_LSV_01_armed_F", resistance, false] call A3A_fnc_spawnVehicle #0;
    [_vehicle,[_myPos#0,_myPos#1,0],"AGLS"] call A3A_fnc_setPos  // Move to 0m above highest roof above the player.
*/
params [
    ["_object",objNull,[objNull]],
    ["_positionIn",[0,0,0],[ [] ], [3,4]],
    ["_coordinateSystem","AGL",[""]]
];
private _position = +_positionIn;
if (count _position isEqualTo 4) then {
    _coordinateSystem = _position deleteAt 3;
};

switch (_coordinateSystem) do {
    case "ASL": { _object setPosASL _this#1 };
    case "ASLW": { _object setPosASLW _this#1 };
    case "ATL": { _object setPosATL _this#1 };
    case "AGL": { _object setPos _this#1 };
    case "AGLS": {
        _object setPosWorld [_position#0,_position#1,10000];
        _position set [2,_position#2 + 10000 - (getPosVisual _object)#2];
        _object setPosWorld _position;
     };
    case "WORLD": { _object setPosWorld _position };
    default {};
};

_position set [2, getPosWorld _object #2];  // Corrects XY drift due to model not being centred with bounding box.
_object setPosWorld _position;
_object
