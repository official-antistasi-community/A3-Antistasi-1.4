/*
Maintainer: DoomMetal
    Gets the location type of a marker.

Arguments:
    <GROUP> A high command group

Return Value:
    None

Scope: Any, Global Arguments
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> citiesX
    <ARRAY> outposts
    <ARRAY> airportsX
    <ARRAY> factories
    <ARRAY> resourcesX
    <ARRAY> seaports

Example:
    ["factory_1"] call A3A_fnc_getLocationMarkerType; // "factory"
    ["Synd_HQ"] call A3A_fnc_getLocationMarkerType; // "hq"
*/

params ["_marker"];

private _markerType = "";
switch (true) do
{
    case (_marker isEqualTo "Synd_HQ"): {_markerType = "hq"};
    case (_marker in citiesX): {_markerType = "city"};
    case (_marker in outposts): {_markerType = "outpost"};
    case (_marker in airportsX): {_markerType = "airport"};
    case (_marker in factories): {_markerType = "factory"};
    case (_marker in resourcesX): {_markerType = "resource"};
    case (_marker in seaports): {_markerType = "seaport"};
    case (_marker in outpostsFIA):
    {
        if (isOnRoad getMarkerPos _marker) then
        {
            _markerType = "roadblock";
        } else {
            _markerType = "watchpost";
        };
    };
};
_markerType;
