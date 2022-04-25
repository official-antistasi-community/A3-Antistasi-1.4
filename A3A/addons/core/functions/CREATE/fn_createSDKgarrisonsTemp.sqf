#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX", "_typeX"];

// Create a new rebel unit in a garrison that's already spawned
private _positionX = getMarkerPos _markerX;
private _groups = [];

if (_typeX isEqualType "") then {
	// Select a suitable group from the current garrison for this unit
    _groups = if !(_typeX == FactionGet(reb,"unitCrew")) then {
        // can happen with surrendered enemy garrison
        allGroups select {
            (leader _x getVariable ["markerX",""] == _markerX)
            and (count units _x < 8) and (vehicle (leader _x) == leader _x)
            and (side _x == teamPlayer)
        };
    };

    private _groupX = if (_groups isEqualTo []) then {
        createGroup teamPlayer;
    } else {
        _groups select 0;
    };

    private _unit = [_groupX, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_unit,_markerX] call A3A_fnc_FIAinitBases;
    if (_typeX isEqualTo FactionGet(reb,"unitRifle")) then { [_markerX] remoteExec ["A3A_fnc_updateRebelStatics", 2] };

    if (_typeX == FactionGet(reb,"unitCrew")) then {
        private _veh = FactionGet(reb,"staticMortar") createVehicle _positionX;

        [_groupX] call A3A_fnc_artilleryAdd;

        _unit assignAsGunner _veh;
        _unit moveInGunner _veh;
        [_veh, teamPlayer] call A3A_fnc_AIVEHinit;
    };

    if (_groups isEqualTo []) then {

        // GIVE UNIT PATCOM CONTROL
        [_groupX, "Patrol_Defend", 0, 150, -1, true, _positionX, false] call A3A_fnc_patrolLoop;

        diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createSDKgarrisonsTemp#1"];

    };

    [_unit,_markerX] spawn {
        params ["_unit", "_markerX"];
        waitUntil {sleep 1; (spawner getVariable _markerX == 2)};
        if (alive _unit) then {
            private _groupX = group _unit;
            if ((_unit getVariable "unitType") isEqualTo FactionGet(reb,"unitCrew")) then {deleteVehicle (vehicle _unit)};
            deleteVehicle _unit;
            if (count units _groupX == 0) then {deleteGroup _groupX};
        };
    };
};
