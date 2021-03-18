params ["_vehicleType", "_typeOfAttack", "_landPosBlacklist", "_side", "_markerOrigin"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
/*  Creates a vehicle for a QRF or small attack, including crew and cargo

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicleType: STRING : The name of the vehicle to spawn
        _typeOfAttack: STRING : The type of the attack
        _landPosBlacklist: ARRAY : List of blacklisted position
        _side: SIDE : The side of the attacker
        _markerOrigin: STRING : The name of the marker marking the origin

    Returns:
        ARRAY : [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist]
        or
        OBJECT : objNull if the spawning did not worked
*/

private _vehicle = [_markerOrigin, _vehicleType] call A3A_fnc_spawnVehicleAtMarker;

if(isNull _vehicle) exitWith {objNull};

private _crewGroup = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
{
    [_x] call A3A_fnc_NATOinit
} forEach (units _crewGroup);
[_vehicle, _side] call A3A_fnc_AIVEHinit;

private _cargoGroup = grpNull;
private _spawnPerformed = false;
private _expectedCargo = ([_vehicleType, true] call BIS_fnc_crewCount) - ([_vehicleType, false] call BIS_fnc_crewCount);
if (_expectedCargo > 0) then
{
    //Vehicle is able to transport units
    private _groupType = if (_typeOfAttack == "Normal") then
    {
        [_vehicleType, _side] call A3A_fnc_cargoSeats;
    }
    else
    {
        if (_typeOfAttack == "Air") then
        {
            if (_side == Occupants) then {groupsNATOAA} else {groupsCSATAA}
        }
        else
        {
            if (_side == Occupants) then {groupsNATOAT} else {groupsCSATAT}
        };
    };

    private _allUnits = {(local _x) and (alive _x)} count allUnits;

    private _allUnitsSide = 0;
    private _maxUnitsSide = maxUnits;
    if (gameMode < 3) then
    {
        _allUnitsSide = {(local _x) and (alive _x) and (side group _x == _side)} count allUnits;
        _maxUnitsSide = round (maxUnits * 0.7);
    };

    if ((_allUnits + _expectedCargo) <= maxUnits  && (_allUnitsSide + _expectedCargo) <= _maxUnitsSide) then
    {
        _spawnPerformed = true;
        _cargoGroup = [_posOrigin, _side, _groupType] call A3A_fnc_spawnGroup;
        {
            _x assignAsCargo _vehicle;
            _x moveInCargo _vehicle;
            if !(isNull objectParent _x) then
            {
                [_x] call A3A_fnc_NATOinit;
                _x setVariable ["originX", _markerOrigin];
            }
            else
            {
                deleteVehicle _x;
            };
        } forEach units _cargoGroup;
    };
};

if(!_spawnPerformed) exitWith
{
    Debug("Unit limit reached, deleting vehicle and crew");
    {
        deleteVehicle _x;
    } forEach (units _crewGroup);
    deleteVehicle _vehicle;
    deleteGroup _crewGroup;
    objNull;
};

_landPosBlacklist = [_vehicle, _crewGroup, _cargoGroup, _posDestination, _markerOrigin, _landPosBlacklist] call A3A_fnc_createVehicleQRFBehaviour;
Debug_2("Spawn Preformed: Created vehicle %1 with %2 soldiers", typeof _vehicle, count crew _vehicle);

private _vehicleData = [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist];
_vehicleData;
