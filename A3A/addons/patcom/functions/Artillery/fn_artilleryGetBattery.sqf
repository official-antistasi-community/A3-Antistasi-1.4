// Returns array of available battery groups

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _batteryArray = [];

{
	if !(_x getVariable ["PATCOM_ArtilleryBusy", false]) then {
		{
			private _veh = vehicle _x;
			private _class = typeOf _veh;
			if !(isNil ("_class")) then {
				private _artyChk = getNumber(configfile/"CfgVehicles"/_class/"artilleryScanner");
				if (_artyChk isEqualTo 1) then {
					if !(_veh in _batteryArray) then {
						_batteryArray pushBack _veh;
					};
				};
			};
		} forEach (units _x);
	};
} forEach (allGroups select {_x getVariable ["PATCOM_ArtilleryBattery", false]});

_batteryArray