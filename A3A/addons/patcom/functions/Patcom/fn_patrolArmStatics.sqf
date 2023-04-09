/*
    Author: [Hazey]
    Description:
		Checks for open static weapons near the AI group.

    Arguments:
    	<Object> Group of units you want to search for StaticWeapon.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group] call A3A_fnc_patrolArmStatics;

    License: MIT License

	Notes:
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

private _leader = leader _group;
private _staticsNear = nearestObjects [_leader, ["StaticWeapon"], 150];
private _unitArray = units _group;
_unitArray deleteAt (_unitArray find _leader);
private _assignedPairs = [];

if (count _staticsNear < 0) exitWith {};

{
	private _unit = [_unitArray, _x, true, "W1"] call A3A_fnc_patrolClosestObject;
	if (_unit isEqualTo [0,0,0]) exitWith {};

	private _foot = isNull objectParent _unit;
	if (_foot) then {
		if (_unit distance2D _x < 100) then {
			_assignedPairs pushback [_unit, _x, _group];
			_unitArray deleteAt (_unitArray findIf {_x isEqualTo _unit});	
		};
	};
} foreach _staticsNear;

if (count _assignedPairs isEqualTo 0) exitWith {};

{
	_x spawn {
		params ["_unit", "_static", "_group"];
		private _assignedGunner = assignedGunner _static;
		if ((isNull _assignedGunner) && ((_static getVariable ["PATCOM_STATIC_ASSIGNED", false]) == false)) then {
			[_unit] join grpnull;
			_static setVariable ["PATCOM_STATIC_ASSIGNED", true];
			_unit setCombatBehaviour "SAFE"; 
			_unit setUnitCombatMode "BLUE";

			if (PATCOM_DEBUG) then {
				[_unit, "STATIC FOUND", 5, "Green"] call A3A_fnc_debugText3D;
			};

			_unit doMove (getPosATL _static);
			_unit assignAsGunner _static;
			[_unit] orderGetIn true;

			while {(alive _unit) && {_unit distance _static > 4}} do {
				sleep 3;
			};
			_unit moveInGunner _static;
			_unit setCombatBehaviour "AWARE"; 
			_unit setUnitCombatMode "YELLOW";

			if (typeOf _static in FactionGet(all, "vehiclesArtillery")) then {
				[_group] call A3A_fnc_artilleryAdd;
			};

			[_unit, _static, _group] spawn {
				params ["_unit", "_static", "_group"];
				private _staticGreen = true;
				private _statictime = PATCOM_AI_STATIC_ARM;
				
				while {_staticGreen && {alive _unit} && {alive _static} && {!(isNull (gunner _static))} && {_unit distance2D (leader (group _unit)) < 500}} do {
					sleep 5;
					private _enemy = _unit findNearestEnemy _unit;
					if (!(isNull _enemy)) then {
							private _cansee = [_unit, "VIEW"] checkVisibility [eyePos _unit, eyePos _enemy];
							if (_cansee > 0) then {
								_statictime = _statictime + 3;
							} else {
								_statictime = _statictime - 5;
							};
					} else {
						_statictime = _statictime - 5;
					};

					if (_statictime < 1) then {
						_staticGreen = false;
					};
				};				
				
				unassignVehicle _unit;
				_unit leaveVehicle _static;
				_static setVariable ["PATCOM_STATIC_ASSIGNED", false];
				doGetOut _unit;
				[_unit] join _group;
			
			};
		};		
	};	
} foreach _assignedPairs;