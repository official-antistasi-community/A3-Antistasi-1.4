// Removes a single unit from a garrison
// TODO UI-update: add header
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_unitType", ""], ["_marker", ""]];

// Temporary old templates fix
if (_unitType isEqualType []) then {
    _unitType = _unitType # 0;
};

Debug_2("Attempting to remove %1 from %2 garrison", _unitType, _marker);

private _position = getMarkerPos _marker;
private _garrison = garrison getVariable [_marker, []];

if (not(sidesX getVariable [_marker,sideUnknown] == teamPlayer)) exitWith
{
    ["Garrison", format ["That zone does not belong to %1.",nameTeamPlayer]] call A3A_fnc_customHint;
};

if ([_position,500] call A3A_fnc_enemyNearCheck) exitWith
{
    ["Garrison", "You cannot manage this garrison while there are enemies nearby."] call A3A_fnc_customHint;
};

if !(_unitType in _garrison) exitWith
{
    ["Garrison", "The unit type does not exist in this garrison."] call A3A_fnc_customHint;
};

// TODO: watchposts and roadblocks stuff

_index = _garrison find _unitType;
_garrison deleteAt _index;
garrison setVariable [_marker, _garrison, true];

{
    if ((_x getVariable ["markerX", ""] == _marker) and (_x getVariable "unittype" == _unitType)) exitWith
    {
        // possible QOL thing to consider adding later here: try to prioritize units that aren't manning statics first
        Debug_2("Removing %1 from %2 garrison", _unitType, _marker);
        deleteVehicle _x;
    };
} forEach allUnits;

Debug_1("Refunding %1", _unitType);
// Get loadout type type from unit
// _unit getVariable "unittype"

Debug("Succesfully removed unit from garrison");
[_marker] call A3A_fnc_mrkUpdate;
