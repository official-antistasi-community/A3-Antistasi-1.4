/*
Maintainer: DoomMetal
    Checks if the player or a high command group is able to fast travel to
    a specific location and gives a reason if not.

Arguments:
    <UNIT/GROUP> The unit group to check fast travel for, player is default
    <STRING> Name of the location marker

Return Value:
    ARRAY<BOOL, STRING> Returns true and "" if able to FT, false and reason if not

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <BOOL> limitedFT

Example:
    [] call A3A_fnc_canFastTravelToLocation; // [true, ""] or [false,"Reasons"]
*/

params [["_group", player],["_location", ""]];

// Check what type of unit/group we're dealing with
private _invalidUnitOrGroup = false;
private _isHighCommandGroup = false;
if (typeName _group == "OBJECT") then {
    if (isPlayer _group) then {
        _isHighCommandGroup = false;
    };
} else {
    if (typeName _group == "GROUP") then {
        if (_group in hcAllGroups player) then {
            _isHighCommandGroup = true;
        };
    } else {
        _invalidUnitOrGroup = true;
    };
};
if (_invalidUnitOrGroup) exitWith {
    [false, "Invalid unit or group for fast travel"];
};

// Check if location is valid
// TODO: add checks for more than just blank strings
if (_location == "") exitWith {
    [false, "No location specified"];
};

// If limited FT is on, player groups can only FT to HQ or Airbases
if ((!_isHighCommandGroup and limitedFT) and ((_location != "SYND_HQ") and !(_location in airportsX))) exitWith {
    [false, "Player groups are only allowed to Fast Travel to HQ or Airbases"];
};

// Can't FT to enemy controlled locations
if ((sidesX getVariable [_location,sideUnknown] == Occupants) or (sidesX getVariable [_location,sideUnknown] == Invaders)) exitWith {
    [false, "You cannot Fast Travel to a location under enemy control"];
};

/* if (_location in outpostsFIA) exitWith {
    hint "You cannot Fast Travel to roadblocks and watchposts";
}; */

// Can't FT to locations under attack or with enemies near
if ([getMarkerPos _location,500] call A3A_fnc_enemyNearCheck) exitWith {
    [false, "You cannot Fast Travel to a location under attack or with enemies in the surrounding area"];
};

if (!([player] call A3A_fnc_isMember) && {!([getMarkerPos _location] call A3A_fnc_playerLeashCheckPosition)}) exitWith {
    [false, format ["There are no members nearby the target location. You need to be within %1 km of HQ or a member.", ceil (memberDistance/1e3)]];
};

[true, ""];
