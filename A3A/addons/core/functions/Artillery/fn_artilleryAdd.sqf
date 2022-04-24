/*
    Author: [Hazey]
    Description:
		Add available artillery to active battery

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_artilleryAdd;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group", ["_variance", 10 + (random 50)], ["_maxFR", 6], ["_minFR", 3]];

waitUntil {((!isNil "PATCOM_INIT_COMPLETE") && (PATCOM_INIT_COMPLETE))};

_group setVariable ["PATCOM_ArtilleryBattery", true, true];
_group setVariable ["PATCOM_ArtilleryBusy", false, true];
_group setVariable ["PATCOM_ArtilleryError", _variance, true];
_group setVariable ["PATCOM_ArtilleryMaxFR", _maxFR, true];
_group setVariable ["PATCOM_ArtilleryMinFR", _minFR, true];