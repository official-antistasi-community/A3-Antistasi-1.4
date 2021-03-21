/*
Author: Caleb Serafin
    Allows spawning a vehicle in locations and orientations precisely
    Supports multiple coordinate systems through the use of A3A_fnc_setPos.

Arguments:
    <STRING> Desired classname of new vehicle. [Default=""]
    <POS3D> Leaves placement up to createUnit. | <POS3DTYPE> Places according to the specified coordinate system. | <<POS3D><TYPE>> Places according to the specified coordinate system. [Default=[0,0,0]]
    <SCALAR> Angles towards heading. | <VECTORDIR> Angles according to VectorDir. | <<VECTORDIR>,<VECTORUP>> Angles according to VectorDir And VectorUp. [Default=0]
    <SCALAR> If above zero, will look for an empty position nearby. [Default=0]
    <ANY> nil for no aircraft physics | <<SCALAR>height,<SCALAR>Velocity> Overrides minimum height and velocity, if no value is provided: aircraft spawn at minimum 100m and fly at 110% stall speed. (leave value nil for each default [nil,nil]). [Default=nil]
    <BOOLEAN> True to enable vehicle BIS randomisation. [Default=true]

Return Value:
    <OBJECT> Spawned Vehicle; objNull if error.

Scope: Single Execution. Local Arguments. Global Effect.
Environment: Any. Automatically creates Unscheduled scope when needed.
Public: Yes.

Example:
    // Spawn rebel LSV nearby
private _vehicle = ["B_T_LSV_01_armed_F",getPos player, 0, 20] call A3A_fnc_spawnVehiclePrecise;
_unitType = [_side, _vehicle] call A3A_fnc_crewTypeForVehicle;
[resistance, _vehicle, _unitType] call A3A_fnc_createVehicleCrew;

    // Spawn empty LSV on roof above you
private _myPos = getPosWorld player;
_myPos = [_myPos#0,_myPos#1,0,"AGLS"];  // Spawn 0m above highest roof above the player.
["B_T_LSV_01_armed_F",_myPos] call A3A_fnc_spawnVehiclePrecise;


    // Spawn rebel ghost-hawk roof above you motionless, until being released.
private _myPosW = getPosWorld player;
private _vectorDirAndUp = [[0.676148,-0.736273,-0.0269321],[-0.571476,-0.547179,0.611565]];
private _vehicle = ["B_Heli_Transport_01_F",[_myPosW,"WORLD"], _vectorDirAndUp, nil, [10,40]] call A3A_fnc_spawnVehiclePrecise;
_unitType = [_side, _vehicle] call A3A_fnc_crewTypeForVehicle;
[resistance, _vehicle, _unitType] call A3A_fnc_createVehicleCrew;
_vehicle enableSimulation false; // For admiring the artwork
// Release.
cursorObject enableSimulation true;
*/
params [
    ["_className","",[ "" ]],
    ["_position",[0,0,0],[ [] ], [2,3,4]],
    ["_direction",0,[ 0,[] ], [ 3,2 ]],
    ["_emptyPositionRadius",0, [ 0 ]],
    ["_aircraftPhysics",nil, [ nil,[] ]],
    ["_enableRandomization",true, [ true ]]
];
private _filename = "fn_spawnVehiclePrecise";

private _position = flatten _position;
private _addAircraftPhysics = false;
private _aircraftMinHeight = 0;
private _velocity = 0;
private _createVehicleSpecial = "CAN_COLLIDE";

if !(isNil {_aircraftPhysics}) then {
    if !((toLower getText(configFile >> "CfgVehicles" >> _className >> "simulation")) in ["airplanex","helicopterrtd","helicopterx"]) exitWith {};
    _addAircraftPhysics = true;
    _createVehicleSpecial = "FLY";

    _aircraftPhysics params [
        ["_aircraftMinHeightIN",100,[0]],
        ["_velocityIN",getNumber(configFile >> "CfgVehicles" >> _className >> "stallSpeed") / 3.6 * 1.1,[0]]  // default speed is kilometres per hour to metres per second; 110% of stall speed should provide enough speed and lift.
    ];
    _aircraftMinHeight = _aircraftMinHeightIN;
    _velocity = _velocityIN;
};

private _vehicle = objNull;
if (isNil { // Make sure vehicle is spawned and placed within the same physics step.
    _vehicle = createVehicle [_className, _position select [0,2], [], 0, _createVehicleSpecial];
    if (isNull _vehicle) then {
        [1, "InvalidObjectClassName | """+_className+""" does not exist or failed creation.", _filename] remoteExecCall ["A3A_fnc_log",2,false];
        _vehicle = createVehicle ["C_Offroad_01_F", _position select [0,2], [], 0, _createVehicleSpecial];     // Retry with a known vehicle so that a convoy/mission which doesn't check won't error out.
        _vehicle setVariable ["InvalidObjectClassName",true,true];                  // Allow external code to check for incorrect vehicle.
    };
    if (isNull _vehicle) exitWith {
        [1, "CreateVehicleFailure | Could not create vehicle at "+str _position, _filename] remoteExecCall ["A3A_fnc_log",2,false];
        nil;    // Will cause outer scope to exit as well.
    };
    _vehicle setVariable ["BIS_enableRandomization", _enableRandomization];

    switch (true) do {
        case (!(_direction isEqualType [])): {_vehicle setDir _direction};
        case (count _direction isEqualTo 3): {_vehicle setVectorDir _direction};
        default {_vehicle setVectorDirAndUp _direction};
    };
    _vehicle setVelocityModelSpace [0, _velocity, 0];

    if (_emptyPositionRadius > 0) then {
        [_vehicle,_position] call A3A_fnc_setPos;
        _safePosition = getPos _vehicle findEmptyPosition [0, _emptyPositionRadius, _className];
        if (_safePosition isEqualTo []) then {
            [2, "EmptyPositionNotFound | Unable to find suitable empty position """+str _emptyPositionRadius+"""m within """+str getPosASL _vehicle+"""(ASL) for """+_className+""" on """+worldName+""".", _filename] remoteExecCall ["A3A_fnc_log",2,false];
        } else {
            _position = _safePosition + ["AGLS"];   // Is set in following setPos call.
        };
    };
    [_vehicle,_position] call A3A_fnc_setPos;
    if (_addAircraftPhysics && getPosVisual _vehicle #2 < _aircraftMinHeight) then {    // Enforces minimum height above surface.
        [_vehicle,[_position#0,_position#1,_aircraftMinHeight],"AGLS"] call A3A_fnc_setPos;
    };

    true;
}) exitWith {_vehicle};

if (false) then {   // New template system detection goes here.
    _vehicle forceFlagTexture "\A3\Data_F\Flags\Flag_red_CO.paa"; // New template system dress-up goes here.
};

_vehicle;
