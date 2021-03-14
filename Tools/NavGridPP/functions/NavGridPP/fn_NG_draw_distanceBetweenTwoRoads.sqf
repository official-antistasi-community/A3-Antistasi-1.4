/*
Maintainer: Caleb Serafin
    Creates a map marker with the text of the true driving distance between the roads.
    The dot is not visible but the text is.
    The colour depends on the maximum road type given in the road type specification.

Arguments:
    <OBJECT> Road 1
    <OBJECT> Road 2
    <STRING> Marker ID. Note: "NGPP_dist_" is prefixed to the ID.
    <ARRAY<             road colour classification
        <ARRAY<STRING>>     Types of roads (Maximum takes preference)
        <ARRAY<STRING>>     Marker Colours (corresponding to Types of roads)
    >>
    <STRING> Read road driving distance. Please suffix a "m" to inform non-scientific countrymen what units we are working with.

Return Value:
    <STRING> Full marker name (including the prefix).

Scope:Any, Local Arguments, Global Effect
Environment: Scheduled
Public: No

Example:
    _markers pushBack ([_myRoad,_otherRoad,_myName + _otherName,_roadColourClassification,(_realDistance toFixed 0) + "m"] call A3A_fnc_NG_draw_distanceBetweenTwoRoads);
*/
params ["_myRoad","_otherRoad","_markerID","_roadColourClassification","_realDistance"];

private _centre = (getPos _myRoad vectorAdd getPos _otherRoad) vectorMultiply 0.5;

private _name = "NGPP_dist_" + _markerID;
createMarkerLocal [_name,_centre];
_name setMarkerTypeLocal "mil_dot";
_name setMarkerTextLocal _realDistance;
_name setMarkerSizeLocal [0.01, 0.01];  // We do not want the dot to be visible.

private _types = _roadColourClassification#0;
private _colourScore = (_types find (getRoadInfo _myRoad #0)) max (_types find (getRoadInfo _otherRoad #0));
if (_colourScore == -1) then {
    _name setMarkerColor "ColorBlack";
} else {
    _name setMarkerColor (_roadColourClassification #1 #_colourScore);
};

_name;
