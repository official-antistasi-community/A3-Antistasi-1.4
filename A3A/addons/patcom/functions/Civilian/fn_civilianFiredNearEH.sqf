/*
    Author: [Hazey]
    Description:
		Civilian Event Handler Actions.

    Arguments:
    	<Object> Unit this action is called on.
		<Object> Person who did the firing.
		<Number> Distance from the fired shot.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		_unit addEventHandler["FiredNear", A3A_fnc_civilianFiredNearEH];

    License: MIT License
*/

#include "..\..\script_component.hpp"
params ["_unit", "_firer", "_distance"];

// This only works for civilian units.
if (side group _firer == civilian) exitWith {};

// Get a list of tracks from the Civilian Fear tracks hashmap
private _tracks = keys A3A_Civilian_Amb_Fear_Tracks;

// If we don't have scream effects, why even bother!
if (count _tracks == 0) exitWith {
	Error("No Tracks found to make the unit scream");
};

// Check if shots being fired is from a distance of 50 and closer
if (_distance < 50) then {
	private _isScared = _unit getVariable ["isScared", false];

	if (!_isScared) then {
		private _anim = "ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon";
		[_unit, _anim] remoteExec ["switchMove"];

		// We set this variable to true to avoid running this portion of the event handler again.
		_unit setVariable ["isScared", true];

		// We let the waypoint stuff happen in scheduled space.
		[_unit] spawn {
			params ["_unit"];
			private _positionX = [getPos _unit, 100, 200, 0, 0, -1, 0] call A3A_fnc_getSafePos;
			_unit doMove _positionX;
			_unit forceWalk false;
			_unit setSpeedMode "FULL";

			// moveTo didn't work correctly, so we can't use moveToCompleted and a waitUntil here.
			// We settle for a 60 second sleep timer.
			sleep 60;

			_unit setVariable ["isScared", false];
			[_unit, ""] remoteExec ["switchMove"];
			_unit setSpeedMode "LIMITED";
			_unit forceWalk true;
		};
	};

	// Set random chance to play scream/panic sound.
	if (random 1 > 0.3) then {
		if (count _tracks > 0) then {
			private _panicNoise = selectRandom _tracks;
			[_unit, _panicNoise] remoteExec ["say3D"];
		};
	};
};