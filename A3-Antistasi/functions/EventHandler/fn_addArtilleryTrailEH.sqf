/*
Author: Wurzel0701
    Adds the needed code to give artillery a smoke trail, so you can see where it is coming from

Arguments:
    <OBJECT> The artillery vehicle that the smoke should be added to

Return Value:
    <NIL>

Scope: Where _artillery is local
Environment: Any
Public: No
Dependencies:
    <NIL>

Example:
    [_myMortar] call A3A_fnc_addArtilleryTrailEH;
*/


params [["_artillery", objNull, [objNull]]];

_artillery addEventHandler
[
    "Fired",
    {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
        _projectile spawn
        {
            sleep 0.05;

            private _smoke = "SmokeShell_Infinite" createVehicle (getPos _this);
            _smoke attachTo [_this, [0, -1, 0]];

            waitUntil {sleep 0.1; !(alive _this)};
            deleteVehicle _smoke;
        };
    }
];
