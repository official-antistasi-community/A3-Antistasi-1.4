/*
Maintainer: DoomMetal
    Teleports a unit, group or high command group to a selected location.

Arguments:
    <UNIT/GROUP> The unit or group to fast travel
    <STRING> Name of the location marker to travel to

Return Value:
    None

Scope: Clients, Global Effect
Environment: Scheduled
Public: Yes
Dependencies:
    <ARRAY> markersX
    <STRING> respawnTeamPlayer
	<BOOL> limitedFT
	<ARRAY> airportsX
	<SIDE> Occupants
	<SIDE> Invaders
	<ARRAY> forcedSpawn

Example:
    [player, "SYND_HQ"] spawn A3A_fnc_fastTravel;
*/

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_group", grpNull], ["_marker", ""]];

Debug_2("Attempting to fast travel %1 to %2", _group, _marker);

if (_group isEqualTo grpNull) exitWith {
    Error("No group or unit specified");
};

if (_marker isEqualTo "") exitWith {
    Error("No location specified");
};


// Check for unit/group type
private _isHighCommandGroup = false;
if (typeName _group == "OBJECT") then {
    if (isPlayer _group) then {
        _isHighCommandGroup = false;
        Debug("Player detected");
    };
} else {
    if (typeName _group == "GROUP") then {
        if (_group in hcAllGroups player) then {
            _isHighCommandGroup = true;
            Debug("High Command group detected");
        };
    }
};


// Do canFT checks again in case conditions changed in the time this got called
private _canFastTravel = [_group] call A3A_fnc_canFastTravel;
if !(_canFastTravel # 0) exitWith {
    ["Fast Travel", _canFastTravel # 1] call A3A_fnc_customHint;
    Debug_2("%1 - %2", _group, _canFastTravel # 1);
};
Debug_1("%1 can fast travel", _group);
private _canFastTravelToLocation = [_group, _marker] call A3A_fnc_canFastTravelToLocation;
if !(_canFastTravelToLocation # 0) exitWith {
    ["Fast Travel", _canFastTravelToLocation # 1] call A3A_fnc_customHint;
    Debug_2("%1 - %2", _group, _canFastTravelToLocation # 1);
};
Debug_1("%1 is a valid location for fast travel", _marker);


// Get position of location
// private _markerPosition = getMarkerPos _marker;


// Get time to travel to destination
// For some reason it wants to get a random position offset 10m from the selected marker
// I assume this is to minimize the chance of things spawning inside/on top of other things
private _positionX = [getMarkerPos _marker, 10, random 360] call BIS_Fnc_relPos;
// Despite being named "distance" this is apparently the time the traveling takes, aka distance/200 seconds, should be refactored
private _distanceX = round (((position leader _group) distance _positionX)/200);
Debug_1("Calculated time for fast travel: %1", _distanceX);

// Black screen / HC group hints
if (!_isHighCommandGroup) then {
    // If players are involved, show black screen with countdown
    disableUserInput true;
    cutText [format ["Fast traveling, travel time: %1s , please wait", _distanceX],"BLACK",1];
    sleep 1;
} else {
    // If it's a high command group disable the group while it's travelling and show hints

    // hcShowBar false; // Why are these here?
    // hcShowBar true;
    ["Fast Travel", format ["Moving group %1 to destination",groupID _group]] call A3A_fnc_customHint;
    sleep _distanceX;
};

if (!_isHighCommandGroup) then {
    private _timePassed = 0;
    while {_timePassed < _distanceX} do {
        cutText [format ["Fast traveling, travel time: %1s , please wait", (_distanceX - _timePassed)],"BLACK",0.0001];
        sleep 1;
        _timePassed = _timePassed + 1;
    };
};

// Prevent players from getting around the Limited FT check by boarding a HC squad vic, while FT is in progress
private _checkForPlayer = false;
if (limitedFT) then {
    _vehicles = [];
    {
        if (vehicle _x != _x) then {
            _vehicles pushBackUnique (vehicle _x)
        };
    } forEach units _group;

    {
        if ((vehicle _x) in _vehicles) exitWith {
            _checkForPlayer = true;
        };
    } forEach (call A3A_fnc_playableUnits);
};

if (_checkForPlayer and ((_marker != "SYND_HQ") and !(_marker in airportsX))) exitWith {
    // Temporary split until this long-ass string is put in the stringtable, goddang horizontal scrollbars man... :(
    _ftCancelledStr = "%1 Fast Travel has been cancelled because some player has boarded their vehicle and the destination is not HQ or an Airbase";
    ["Fast Travel", format [_ftCancelledStr,groupID _group]] call A3A_fnc_customHint;
};


// Do the actual fast travel
Debug("All checks done, attempting actual fast travel...");
// Loop through all units in the group
{
    _unit = _x; // Give magic _x a more readable name

    // If the unit is not a player OR the unit is THE player...
    if ((!isPlayer _unit) or (_unit == player)) then {

        // This seems like a good idea but needs hideObjectGlobal remoteExec'd on the server to work properly
        //_unit hideObject true;

        _unit allowDamage false;

        // If the unit is in a vehicle
        if (_unit != vehicle _unit) then {

            // If the unit is the driver of the vehicle
            if (driver vehicle _unit == _unit) then {
                sleep 3;

                // Find the closest road to the selected position
                // This should eventually be replaced with BIS_fnc_nearestRoad
                private _roads = [];
                private _radiusX = 10;
                while {true} do {
                    _roads = _positionX nearRoads _radiusX;
                    if (count _roads > 0) exitWith {};
                    _radiusX = _radiusX + 10;
                };
                private _road = _roads select 0;

                // Replacement, needs check for no roads within distance before implementing
                // _road = [_positionX, 500] call BIS_fnc_nearestRoad;

                private _pos = position _road findEmptyPosition [10,100,typeOf (vehicle _unit)];
                vehicle _unit setPos _pos;
            }; // !!! No else block, does this mean non-driver FT just gets ignored?

            // If the unit is in a static weapon AND is the leader of the units group isn't a player...
            if ((vehicle _unit isKindOf "StaticWeapon") and (!isPlayer (leader _unit))) then {
                private _pos = _positionX findEmptyPosition [10,100,typeOf (vehicle _unit)];
                vehicle _unit setPosATL _pos;
            };

        } else {
            // If the unit isn't in a vehicle
            if (!(_unit getVariable ["incapacitated",false])) then {
                _positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
                _unit setPosATL _positionX;
                if (isPlayer leader _unit) then {
                    _unit setVariable ["rearming",false];
                };
                _unit doWatch objNull;
                _unit doFollow leader _unit;
            } else {
                _positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
                _unit setPosATL _positionX;
            };
        };
    };
    //_unit hideObject false;
} forEach units _group;


if (!_isHighCommandGroup) then {
    // If players are involved, remove black screen
    disableUserInput false;
    cutText ["You arrived at your destination","BLACK IN",1];
} else {
    // If it's a high command group show hint that it arrived at the destination
    ["Fast Travel", format ["Group %1 arrived at its destination",groupID _group]] call A3A_fnc_customHint;
};
[] call A3A_fnc_playerLeashRefresh;
sleep 5;
{_x allowDamage true} forEach units _group;
Debug("Fast Travel done");
