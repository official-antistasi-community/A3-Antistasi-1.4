/*
Author: Wurzel0701
    Adds the EH for vehicle weapon spray to the vehicle and the additional logic for locality

Arguments:
    <OBJECT> The vehicle the EH should be added to

Return Value:
    <NIL>

Scope: Local to vehicle
Environment: Any
Public: No
Dependencies:

Example:
    [_myCar] spawn A3A_fnc_addSprayEH;
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params
[
    ["_vehicle", objNull, [objNull]]
];

//No nerf needed, dont add EHs
if (accuracyMult == 0) exitWith {};

private _EHList = _vehicle getVariable ["SprayEHList", []];
private _clientID = clientOwner;

//EH already added for the local machine, dont add again
if (_clientID in _EHList) exitWith {};

Debug_3("Adding accuracy change to vehicle %1 (Factor %2) on client %3", typeOf _veh, accuracyMult, _clientID);

_EHList pushBack _clientID;
_vehicle setVariable ["SprayEHList", _EHList, true];

_vehicle addEventHandler
[
    "Fired",
    {
        //Parameters from the fired EH
        private _weapon = _this#1;
        private _ammo = _this#4;
        private _projectile = _this#6;

        //Getting the original dispersion and the caliber from the configs
        private _dispersion = getNumber(configFile >> "CfgWeapons" >> _weapon >> "dispersion");
        private _caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");

        //Calculating the additional offset, two values to account for y and z axis offset
        private _offset = [(random 2) - 1, (random 2) - 1] vectorMultiply (accuracyMult * _dispersion * 5/_caliber);

        //Calculating the needed y and z axis vectors
        private _forward = vectorDir _projectile;
        private _up = vectorUp _projectile;
        private _side = _forward vectorCrossProduct _up;

        //Getting the current velocity and altering it based on the selected offset
        private _velocity = velocity _projectile;
        _velocity = _velocity vectorAdd (_up vectorMultiply _offset#0) vectorAdd (_side vectorMultiply _offset#1);
        _projectile setVelocity _velocity;
        _projectile setVectorDir _velocity;
    }
];

_vehicle addEventHandler
[
    "Local",
    {
        params ["_vehicle", "_isLocal"];
        if (_isLocal) then
        {
            Debug_2("Vehicle %1 switched locality to local client %2", typeOf _vehicle, clientOwner);
            [_vehicle] call A3A_fnc_addSprayEH;
        }
        else
        {
            //Does it need to JIP? Shouldnt, as a new joined player will get the EH when the car becomes local to him
            Debug_1("Vehicle %1 switched locality to non local client, sending remote exec", typeOf _vehicle);
            [_vehicle] remoteExec ["A3A_fnc_addSprayEH", _vehicle]
        };
    }
];
