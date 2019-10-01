params ["_base", "_target"];

private ["_isAirport", "_side", "_targetIsBase", "_reinfMarker", "_targetReinforcements", "_reinfCount", "_maxSend"];

_isAirport = _base in airportsX;
_side = sidesX getVariable [_base, sideUnknown];

//To far away for land convoy or not the same island
if(!_isAirport && {(getMarkerPos _base) distance2D (getMarkerPos _target) > distanceForLandAttack || {!([_base, _target] call A3A_fnc_isTheSameIsland)}}) exitWith {false};

//To far away for air convoy
if(_isAirport && {(getMarkerPos _base) distance2D (getMarkerPos _target) > distanceForAirAttack}) exitWith {false};

_targetIsBase = (_target in outposts);
_reinfMarker = if(_side == Occupants) then {reinforceMarkerOccupants} else {reinforceMarkerInvader};

_targetReinforcements = [_target] call A3A_fnc_getRequested;
_reinfCount = [_targetReinforcements, true] call A3A_fnc_countGarrison;

_maxSend = garrison getVariable [format ["%1_recruit", _base], 0];

//Can't send enough troups
if(_maxSend < (_reinfCount * 2/3)) exitWith {false};

//Bases should not send more than 8 troops at a time
if((_reinfCount > 8) && {!_isAirport}) exitWith {false};

//Airports only support bases with less than 4 troups
if((_reinfCount < 4) && {_isAirport && {!_targetIsBase}}) exitWith {false};

true;
