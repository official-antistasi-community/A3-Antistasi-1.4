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
        _dismountPos: POSITION : Optional, needed for boats. The chosen dismount hardpoint

    Returns:
        _landPosBlacklist: ARRAY : The updated list of blocked positions
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle", "_crewGroup", "_cargoGroup", "_posDestination", "_markerOrigin", "_landPosBlacklist",["_dismountPos",[0,0,0]]];


private _vehType = typeof _vehicle;
if (_vehicle isKindOf "Air") exitWith
{
    if (_vehType in FactionGet(all,"vehiclesHelisTransport") + FactionGet(all,"vehiclesHelisLight")) exitWith
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
    if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith 
    {
        //Attack helicopter
        [_vehicle, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
    };
    if (_vehType in FactionGet(all,"vehiclesTransportAir")) exitWith
    {
        //Dropship with para units
        [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
    };

    Error_1("Obsolete/unidentified vehicle type %1", _vehType);
    //Attack plane or drone - should be unused now?
    private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
    _vehWP0 setWaypointBehaviour "COMBAT";
    _vehWP0 setWaypointType "SAD";
    _crewGroup setCombatMode "RED";
    _landPosBlacklist;

};
if (_vehicle isKindOf "Ship") then {
    // Boats are straight forward, right?
    // _landPosBlacklist is an array of positions. We can use that to (roughly) get an empty dismount without looping it
    private _landBase = _dismountPos;
    private _attack = (_vehType in FactionGet(all,"vehiclesGunBoats"));
    private _blacklistedCoordArray = []; // This is to compensate for findSafePos needing a unique pos blacklist
    {
        private _pos = _x;
        private _topLeftXCoord = _pos#0 - 15;
        private _topLeftYCoord = _pos#1 + 15;
        private _bottomRightXCoord = _pos#0 + 15;
        private _bottomRightYCoord = _pos#1 - 15;
        _blacklistedCoordArray pushBack [[_topLeftXCoord,_topLeftYCoord,0],[_bottomRightXCoord,_bottomRightYCoord,0]];
    } forEach _landPosBlacklist;
    private _landPos = [_landBase, 20, 150, 0, 2, 0, 1, _blacklistedCoordArray, [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
    if (_landPos isEqualTo [0,0,0]) then {
        Info_3("Could not find landing pos for %1 (%2) within 150m of hardpoint %3",_crewGroup,_vehType,_landBase)
        {[_x] spawn A3A_fnc_groupDespawner} forEach [_crewGroup,_cargoGroup];
        [vehicle leader _crewGroup] spawn A3A_fnc_vehDespawner; 
    };

    private _vehWP0 = _crewGroup addWaypoint [_landPos, 0];
    _vehWP0 setWaypointType "TR UNLOAD";
    //_vehWP0 setWaypointCompletionRadius 200;
    _vehWP0 setWaypointBehaviour "AWARE";
    /*
    [_vehWP0, _vehicle, _vehType] spawn {
        params ["_vehWP0","_vehicle","_vehType"];
        diag_log format ["Debug WP running for WP %1 Veh %2 Type %3", _vehWP0, _vehicle, _vehType];
        private _emptyCargo = [_vehType, false] call BIS_fnc_crewCount;
        diag_log [_vehType, _emptyCargo];
        waitUntil {sleep 5; count crew _vehicle > _emptyCargo};
        diag_log format ["WP finished for WP %1 Veh %2 Type %3", _vehWP0, _vehicle, _vehType];
        private _hasSAD = count waypoints group driver _vehicle > 1;
        diag_log _hasSAD;
        deleteWaypoint _vehWP0;
    };
    */
    _vehWP0 setWaypointStatements ["true","if !(local this) exitWith {}; [vehicle leader group this] spawn A3A_fnc_VEHDespawner; [group this] spawn A3A_fnc_enemyReturnToBase"];
    if (_attack) then {
        diag_log "ATTACK CRAFT CREATED";
        _vehWP0 setWaypointStatements ["true","if !(local this) exitWith {}; if ((combatBehaviour group this) != 'COMBAT') then {deleteWaypoint [group this, 1]};"];
        private _vehWPSAD = _crewGroup addWaypoint [_landPos, 0];
        _vehWPSAD setWaypointType "SAD";
        _vehWPSAD setWaypointStatements ["true","if !(local this) exitWith {}; [vehicle leader group this] spawn A3A_fnc_VEHDespawner; [group this] spawn A3A_fnc_enemyReturnToBase"];
    };
    /*
    //Set the waypoints for cargoGroup
    private _cargoWP0 = _cargoGroup addWaypoint [_landPos, 0];
    _cargoWP0 setWaypointType "GETOUT";
    _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
    */
    private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
    _cargoWP1 setWaypointBehaviour "AWARE";
    //Link the dismount waypoints
    //_vehWP0 synchronizeWaypoint [_cargoWP0];
    

}
else            // ground vehicle
{
    private _typeName = call {
        if (_vehType in FactionGet(all,"vehiclesTanks")) exitWith {"Tank"};
        if (_vehType in FactionGet(all,"vehiclesLightTanks")) exitWith {"Tank"};
        if (_vehType in FactionGet(all,"vehiclesHeavyTanks")) exitWith {"Tank"};
        if (_vehType in FactionGet(all,"vehiclesAA")) exitWith {"AA"};
        if (_vehType in FactionGet(all,"vehiclesArmor"))  exitWith {"APC"};
        if (_vehType in FactionGet(all,"vehiclesTrucks")) exitWith {"Truck"};
        "MRAP";
    };

    if (isNull _cargoGroup) exitWith
    {
        // Vehicle has no passengers, just kill stuff
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        _vehicle allowCrewInImmobile true;

        //Adding the waypoints
        [getPosATL _vehicle, _posDestination, _crewGroup] call A3A_fnc_WPCreate;

        // Turn final waypoint into SAD
        private _attackWP = [_crewGroup, count waypoints _crewGroup - 1];
        _attackWP setWaypointType "SAD";
        _attackWP setWaypointBehaviour "COMBAT";

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (isNull gunner _vehicle and count units _cargoGroup < 4) exitWith
    {
        // Vehicle has no weapons(?) and small cargo, merge crew group into cargo group
        (units _crewGroup) joinSilent _cargoGroup;
        deleteGroup _crewGroup;
        _cargoGroup selectLeader driver _vehicle;

        //Create the path waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _cargoGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _dismountWP = [_cargoGroup, count waypoints _cargoGroup - 1];
        //_dismountWP setWaypointType "GETOUT";         // better to leave it as move? GETOUT is pretty busted
        _dismountWP setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];

        private _attackWP = _cargoGroup addWaypoint [_posDestination, 0];
        _attackWP setWaypointBehaviour "AWARE";

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (count units _crewGroup == 1) exitWith
    {
        // driver + large cargo. Unload and RTB

        //Set up vehicle waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _vehWP0 = [_crewGroup, count waypoints _crewGroup - 1];
        _vehWP0 setWaypointType "TR UNLOAD";
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; [group this] spawn A3A_fnc_enemyReturnToBase"];

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        //_cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (true) exitWith
    {
        // weapons + separate cargo units
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

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        //_cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };
};

_landPosBlacklist;
