/*
    File: fn_spawnVehicle.sqf
    Author: Spoffy, Caleb Serafin

    Description:
        Creates a vehicle with template crew.
        Land vehicles will be in a nearby safe pos.
        Aircraft spawn at 110% of stall speed (Helicopters still spawn at 0 m/s)
        Aircraft will have a minimum height unless precise is set true.

    Parameter(s):
        _pos - Desired position [ARRAY]
        _azi - Desired rotation [NUMBER]
        _type - Type of vehicle [STRING]
        _group - Side or existing group [SIDE or GROUP]
        _precise - (Optional) force precise positioning [BOOL - Default: false]
        _unitType - unit type to use as crew, recommended to leave as default [STRING, Default: nil]

    Returns:
        [new vehicle, all crew, group]

    Example(s):
        // Spawn LSV in nearby "safe" position
        [getPos player, 0, "B_T_LSV_01_armed_F", resistance] call A3A_fnc_spawnVehicle params ["_vehicle", "_crew", "_group"];

        // Spawn Helicopter at default height
        private _vehicle = [getPos player, 69, "B_Heli_Transport_01_F", group player] call A3A_fnc_spawnVehicle select 0;
        _vehicle enableSimulation false; // For inspecting spawn.

        // Spawn Helicopter above default height
        private _vehicle = [getPos player vectorAdd [0,0,420], 69, "B_Heli_Transport_01_F", group player] call A3A_fnc_spawnVehicle select 0;
        _vehicle enableSimulation false; // For inspecting spawn.

        // Spawn Helicopter bellow default height
        private _vehicle = [getPos player vectorAdd [0,0,50], 69, "B_Heli_Transport_01_F", group player, true] call A3A_fnc_spawnVehicle select 0;
        _vehicle enableSimulation false; // For inspecting spawn.

        // Release to check that helicopter RPM is stable.
        cursorObject enableSimulation true;
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params ["_pos", "_azi", "_type", "_group", ["_precise", false], "_unitType"];

if (
    isNil "_pos"
    || {isNil "_azi"}
    || {isNil "_type"}
    || {isNil "_group"}
) exitWith { Error_4("Invalid arguments passed | Pos: %1 | Azimut: %2 | Type: %3 | Group: %4", _pos, _azi, _type, _group) };

private _side = if (_group isEqualType sideUnknown) then { _group } else { side _group };

private _sim = getText(configFile >> "CfgVehicles" >> _type >> "simulation");

private _velocity = 0;
private _veh = objNull;
switch (toLower _sim) do {
    case "airplane";
    case "airplanex";
    case "helicopterrtd";
    case "helicopterx": {
        _velocity = getNumber(configFile >> "CfgVehicles" >> _type >> "stallSpeed") / 3.6 * 1.1;  // kilometres per hour to metres per second * 110% of stall speed.
        _veh = createVehicle [_type, _pos, [], 0, "FLY"];
        //Make sure aircraft will start at higher altitude if provided.
        if (count _pos == 3 && (_pos#2) > 100) then {
            _veh setPos _pos; // It will be set twice if _precise if true, but that will not have any affect on outcome.
        };
    };
    default {
        _veh = createVehicle [_type, _pos, [], 0, "NONE"];
    };
};

//Set the correct direction.
_veh setDir _azi;

//Make sure the vehicle is where it should be.
if (_precise) then {
    _veh setPos _pos;
};

//Set a good velocity in the correct direction.
_veh setVelocityModelSpace [0, _velocity, 0];

if (isNil "_unitType") then {
    _unitType = [_side, _veh] call A3A_fnc_crewTypeForVehicle;
};

//Spawn the crew
_group = [_group, _veh, _unitType] call A3A_fnc_createVehicleCrew;

[_veh, crew _veh, _group];
