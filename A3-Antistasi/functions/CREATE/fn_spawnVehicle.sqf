/*
    File: fn_spawnVehicle.sqf
    Author: Spoffy
    
    Description:
		Creates a vehicle with a crew. Compatible with A3A_fnc_spawnVehicle parameters.
    
    Parameter(s):
		_pos - Desired position [ARRAY]
		_azi - Desired rotation [NUMBER]
		_type - Type of vehicle [STRING]
		_group - Side or existing group [SIDE or GROUP]
		_precise - (Optional) force precise positioning [BOOL - Default: true]
		_unitType - unit type to use as crew [STRING, default "loadouts_side_other_crew"]
    
    Returns:
		[new vehicle, all crew, group]
    
    Example(s):
*/

params ["_pos", "_azi", "_type", "_group", ["_precise", true], "_unitType"];

private _side = if (_group isEqualType sideUnknown) then { _group } else { side _group };

private _sim = getText(configFile >> "CfgVehicles" >> _type >> "simulation");

private _veh = switch (tolower _sim) do {
	case "airplanex";
	case "helicopterrtd";
	case "helicopterx": {
		//Make sure aircraft start at a reasonable height.
		if (count _pos == 2) then {_pos set [2,0];};
		_pos set [2,(_pos select 2) max 50];
		createVehicle [_type, _pos, [], 0, "FLY"]
	};
	default {
		createvehicle [_type, _pos, [], 0, "NONE"]
	};
};

//Set the correct direction.
_veh setDir _azi;

//Make sure the vehicle is where it should be.
if (_precise) then
{
	_veh setPos _pos;
};

//Set a good velocity in the correct direction.
if (_sim == "airplanex") then {
	_veh setVelocityModelSpace [0, 100, 0];
};

if (isNil "_unitType") then {
	_unitType = [_side, _veh] call A3A_fnc_crewTypeForVehicle;
};

//Spawn the crew
_group = [_group, _veh, _unitType] call A3A_fnc_createVehicleCrew;

[_veh, crew _veh, _group]