/*  Create the logic for attacking units, how different units should attack and behave

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicle: OBJECT : The vehicle that gets the order
        _crewGroup: GROUP : The group of crew units of _vehicle
        _cargoGroup: GROUP : The group of cargo units of _vehicle, grpNull if none
        _posDestination: POSITION : The position of the target
        _markerOrigin: STRING : The marker from which the units are send
        _landPosBlacklist: ARRAY : A list of already blocked positions

    Returns:
        _landPosBlacklist: ARRAY : The updated list of blocked positions
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle", "_crewGroup", "_cargoGroup", "_posDestination", "_markerOrigin", "_landPosBlacklist"];


private _vehType = typeof _vehicle;
switch (true) do
{
    case (_vehType in FactionGet(all,"vehiclesTrucks") + FactionGet(all,"vehiclesLightUnarmed")):
    {
        //Move cargo group into crew group
        (units _cargoGroup) joinSilent _crewGroup;
        deleteGroup _cargoGroup;

        //Unassign driver from being the group leader. Why?
        if (count units _crewGroup > 1) then {
            _crewGroup selectLeader (units _crewGroup select 1)
        };

        //Create the path waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _dismountWP = [_crewGroup, count waypoints _crewGroup - 1];
        _dismountWP setWaypointType "GETOUT";
        _dismountWP setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];

        private _attackWP = _crewGroup addWaypoint [_posDestination, 0];
        _attackWP setWaypointBehaviour "AWARE";
        //Ever wondered why AI have instant pinpoint accuracy?
        //_vehWP2 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
        //We could add the UPSMON routines here
        [_vehicle, "Inf Truck."] spawn A3A_fnc_inmuneConvoy;
    };
    case (_vehType in FactionGet(all,"vehiclesTanks") + FactionGet(all,"vehiclesAA")):
    {
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        _vehicle allowCrewInImmobile true;

        //Adding the waypoints
        [getPosATL _vehicle, _posDestination, _crewGroup] call A3A_fnc_WPCreate;

        // Turn final waypoint into SAD
        private _attackWP = [_crewGroup, count waypoints _crewGroup - 1];
        _attackWP setWaypointType "SAD";
        _attackWP setWaypointBehaviour "COMBAT";
        //God AI
        //_vehWP1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];

        private _typeName = if (_vehType in FactionGet(all,"vehiclesTanks")) then {"Tank"} else {"AA"};
        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };
    case (_vehType in FactionGet(all,"vehiclesHelisTransport") + FactionGet(all,"vehiclesHelisLight")):
    {
        //Transport helicopter
        _landPos = [_posDestination, 200, 400, 10, 0, 0.12, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
        private _posOrigin = getMarkerPos _markerOrigin;
        _posOrigin set [2, 50];

        {
            if(_x distance2D _landPos < 20) exitWith { _landPos = [0, 0, 0] };
        } forEach _landPosBlacklist;

        if !(_landPos isEqualTo [0,0,0]) then
        {
            _landPos set [2, 0];
            _landPosBlacklist pushBack _landPos;
            [_vehicle, _crewGroup, _cargoGroup, _posDestination, _posOrigin, _landPos] spawn A3A_fnc_combatLanding;
        }
        else
        {
            if ((typeOf _vehicle) in vehFastRope) then {
                [_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastrope;
            } else {
                [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
            };
        };
    };
    case (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")):
    {
        //Attack helicopter
        [_vehicle, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
//        private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
//        _vehWP0 setWaypointBehaviour "AWARE";
//        _vehWP0 setWaypointType "SAD";
    };
    case (_vehType in FactionGet(all,"vehiclesTransportAir")):
    {
        //Dropship with para units
        [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
    };
    case (_vehType in FactionGet(all,"vehiclesFixedWing")):
    {
        //Attack plane or drone - should be unused now?
        private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
        _vehWP0 setWaypointBehaviour "COMBAT";
        _vehWP0 setWaypointType "SAD";
        _crewGroup setCombatMode "RED";
    };
    default
    {
        // APC or armed MRAP, weapons + separate cargo units
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        if (_vehType in FactionGet(all,"vehiclesArmor")) then { _vehicle allowCrewInImmobile true };

        //Set up vehicle waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _vehWP0 = [_crewGroup, count waypoints _crewGroup - 1];
        _vehWP0 setWaypointType "TR UNLOAD";
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; [vehicle this] call A3A_fnc_smokeCoverAuto"];
        private _vehWP1 = _crewGroup addWaypoint [_posDestination, 0];
        _vehWP1 setWaypointType "SAD";
        _vehWP1 setWaypointBehaviour "COMBAT";

        //God AI
        //_vehWP2 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        _cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        private _typeName = if (_vehType in FactionGet(all,"vehiclesArmor")) then {"APC"} else {"MRAP"};
        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };
};

_landPosBlacklist;
