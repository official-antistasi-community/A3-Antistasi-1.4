/*
Author: Wurzel0701
    Marks the node given via index on the map

Arguments:
    <NUMBER> The index of the node which should be marked

Return Value:
    <NONE>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> navGrid

Example:
    [0] call A3A_fnc_markNode;
*/


params
[
    ["_index", -1, [0]],
    ["_type", "", [""]],
    ["_color", "", [""]],
    ["_text", "", [""]]
];

if(_index == -1) exitWith {};

private _pos = navGrid select _index select 0;

//deleteMarker (format ["Node%1", _index]);
if(getMarkerColor (format ["Node%1", _index]) != "") then
{
    _color = "ColorRed";
    _text = "ERROR";
};

private _nodeMarker = createMarker [format ["Node%1", _index], _pos];
_nodeMarker setMarkerShape "ICON";
_nodeMarker setMarkerType _type;
_nodeMarker setMarkerColor _color;
_nodeMarker setMarkerText _text;
