#include "..\..\script_component.hpp"
params ["_unit", "_firer", "_distance"];

if (side group _firer == civilian) exitWith {};

private _tracks = keys A3A_Civilian_Amb_Fear_Tracks;

if (count _tracks == 0) exitWith {
	Error("No Tracks found to make the unit scream");
};

if (_distance < 50) then {

	private _anim = "ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon";

	if (random 1 > 0.4) then {
		if (isMultiplayer) then {
			[_unit, _anim] remoteExec ["switchMove"];
		} else {
			_unit switchMove _anim;
		};
	};

	if (random 1 > 0.3) then {

		if (count _tracks > 0) then {
			private _panicNoise = selectRandom _tracks;
			if (isMultiplayer) then {
				[_unit, _panicNoise] remoteExec ["say3D"];
			} else {
				_unit say3D _panicNoise;
			};
		};
	};

	_unit setSpeedMode "FULL";
	_unit forceWalk false;

};