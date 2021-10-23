// TODO UI-update: add proper header
// This is mostly copypasted from fn_garrisonDialog

params [["_marker", ""]];

private _positionX = getMarkerPos _marker;

if (not(sidesX getVariable [_marker,sideUnknown] == teamPlayer)) exitWith
{
    ["Garrison", format ["That zone does not belong to %1.",nameTeamPlayer]] call A3A_fnc_customHint;
};

if ([_positionX,500] call A3A_fnc_enemyNearCheck) exitWith
{
    ["Garrison", "You cannot manage this garrison while there are enemies nearby."] call A3A_fnc_customHint;
};

private _outpostFIA = if (_marker in outpostsFIA) then {true} else {false};
_wPost = if (_outpostFIA and !(isOnRoad getMarkerPos _marker)) then {true} else {false};
_garrison = if (! _wpost) then {garrison getVariable [_marker,[]]} else {SDKSniper};

if ((count _garrison == 0) and !(_marker in outpostsFIA)) exitWith
{
    ["Garrison", "The place has no garrisoned troops to remove."] call A3A_fnc_customHint;
};

private _costs = 0;
private _hr = 0;
{
    if (_x == staticCrewTeamPlayer) then {
        if (_outpostFIA) then {
            _costs = _costs + ([vehSDKLightArmed] call A3A_fnc_vehiclePrice)
        } else {
            _costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice)
        };
    };
    _hr = _hr + 1;
    _costs = _costs + (server getVariable [_x,0]);
} forEach _garrison;

[_hr,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_outpostFIA) then
{
    garrison setVariable [_marker,nil,true];
    outpostsFIA = outpostsFIA - [_marker]; publicVariable "outpostsFIA";
    markersX = markersX - [_marker]; publicVariable "markersX";
    deleteMarker _marker;
    sidesX setVariable [_marker,nil,true];
} else {
    garrison setVariable [_marker,[],true];
    //[_marker] call A3A_fnc_mrkUpdate;
    //[_marker] remoteExec ["tempMoveMrk",2];
    {
        if (_x getVariable ["markerX",""] == _marker) then {deleteVehicle _x};
    } forEach allUnits;
};

[_marker] call A3A_fnc_mrkUpdate;
["Garrison", format ["Garrison removed<br/><br/>Recovered Money: %1 €<br/>Recovered HR: %2",_costs,_hr]] call A3A_fnc_customHint;
