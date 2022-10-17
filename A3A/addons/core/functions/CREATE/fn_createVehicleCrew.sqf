/*
    File: fn_createVehicleCrew.sqf
    Author: Spoffy
    Date: 2021-02-13
    Last Update: 2021-02-13
    Public: No

    Description:
		Creates a crew for the given vehicle.

    Parameter(s):
		_group - Existing group to add units to, or side to create group on [GROUP/SIDE]
		_vehicle - Vehicle to create crew for [OBJECT]
		_unitType - Type of unit to create [STRING]

    Returns:
		_group - Group with crew members [GROUP]

    Example(s):
		[west, _myVehicle, FactionGet(occ,"crew")] call A3A_fnc_createVehicleCrew;
*/

params ["_group", "_vehicle", "_unitType"];

private _newGroup = false;
if (_group isEqualType sideUnknown) then {
	_group = createGroup _group;
	_newGroup = true;
};

// Hack. Moving UAV AIs into gunner/turret manually does not work for some reason
if (unitIsUAV _vehicle) then {
	createVehicleCrew _vehicle;
	crew _vehicle joinSilent _group;
};

if (isNil "_unitType") then {
	_unitType = [side _group, _vehicle] call A3A_fnc_crewTypeForVehicle;
};

private _type = typeOf _vehicle;
private _config = configFile >> "CfgVehicles" >> _type;
if (getNumber (_config >> "hasDriver") > 0 && isNull driver _vehicle) then {
	private _driver = [_group, _unitType, getPos _vehicle, [], 10] call A3A_fnc_createUnit;
	_driver assignAsDriver _vehicle;
	_driver moveInDriver _vehicle;
};

private _fnc_addCrewToTurrets = {
	params ["_config", ["_path", []]];
	private _turrets = "true" configClasses (_config >> "Turrets");
	{
		private _turretConfig = _x;
		private _turretPath = _path + [_forEachIndex];
		//Handle nested turrets
		[_turretConfig, _turretPath] call _fnc_addCrewToTurrets;

		if (getNumber (_turretConfig >> "hasGunner") == 0 || getNumber (_turretConfig >> "dontCreateAI") != 0) then { continue };
		if (getNumber (_turretConfig >> "showAsCargo") > 0) then { continue };
		if (isNull (_vehicle turretUnit _turretPath)) then {
			private _gunner = [_group, _unitType, getPos _vehicle, [], 10] call A3A_fnc_createUnit;
			_gunner assignAsTurret [_vehicle, _turretPath];
			_gunner moveInTurret [_vehicle, _turretPath];
		};
	} forEach _turrets;
};

[_config] call _fnc_addCrewToTurrets;

if (_newGroup) then {
	_group selectLeader (effectiveCommander _vehicle);
};

_group addVehicle _vehicle;

_group
