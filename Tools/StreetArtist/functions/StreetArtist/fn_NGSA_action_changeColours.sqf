/*
Maintainer: Caleb Serafin
    Cycles the marker colour mode and updates the map legend.

Arguments:
    <NIL> cycle colour mode. | <STRING|INTEGER> switch to specific colour mode. [Default = nil]
    <BOOLEAN> Perform automatic refresh. [Default = true]

Return Value:
    <ANY> undefined.

Scope: Client, Local Arguments, Local Effect
Environment: Any
Public: No

Dependencies:
    <SCALAR> A3A_NGSA_autoMarkerRefreshNodeMax

Example:
    [] call A3A_fnc_NGSA_action_changeColours;
    [0,true] call A3A_fnc_NGSA_action_changeColours;
*/
params [
    ["_specificColourMode",nil,["",0]],
    ["_refresh",true,[false]]
];

private _colourModes = ["normal","normalOffroad","islandID","islandIDDeadEnd"];
private _newColourMode = [localNamespace,"A3A_NGPP","draw","specialColouring", "none"] call Col_fnc_nestLoc_get;

private _colourModeIndex = switch (true) do {
    case (isNil{_specificColourMode}): { ((_colourModes find _newColourMode) + 1) mod count _colourModes };
    case (_specificColourMode isEqualType 0): { _specificColourMode mod count _colourModes };
    case (_specificColourMode isEqualType ""): { _colourModes find _specificColourMode mod count _colourModes };
};
_newColourMode = _colourModes #_colourModeIndex;
[localNamespace,"A3A_NGPP","draw","specialColouring", _newColourMode] call Col_fnc_nestLoc_set;

private _proceduralTextureLine = "<t size='"+str(0.3*A3A_NGSA_baseTextSize)+"'><img image='#(argb,4,4,1)color(1,1,1,1)'/><img image='#(argb,4,4,1)color(1,1,1,1)'/></t>";
// The titles use a non-breaking space for the underlining to work. Find in CharMap or google key combination for your local system.
private _legends = [
    // normal
    "<t align='right' underline='1'>Connection Types</t><br/>"+
    "<t color='#f57a21'>"+_proceduralTextureLine+"</t> OrangeTrack- dirt/narrow/bumpy<br/>"+
    "<t color='#cfc01c'>"+_proceduralTextureLine+"</t> Yellow Road- asphalt/cement/smooth<br/>"+
    "<t color='#26c91e'>"+_proceduralTextureLine+"</t> Green Main Road- smooth/wide/large turns<br/>"+
    "<t align='right' underline='1'>Connections per Node</t><br/>"+
    "<img color='#cccccc' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Black:0   <img color='#c12726' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Red:1   <img color='#f57a21' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Orange:2<br/>"+
    "<img color='#cfc01c' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Yellow:3   <img color='#26c91e' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Green:4   <img color='#1fbbfc' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Blue:5+<br/>"+
    "<t align='right' underline='1'>Node Types</t><br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Dot- Road within "+(100 * A3A_NG_const_positionInaccuracy toFixed 0)+" cm.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\triangle_CA'/>Triangle- Off road.<br/>"+
    "<img color='#7e44c1' image='a3\ui_f\data\Map\Markers\Military\flag_CA'/>Purple Flag- Island Label.",
    // normalOffroad
    "<t align='right' underline='1'>Connection Types</t><br/>"+
    "<t color='#f57a21'>"+_proceduralTextureLine+"</t> OrangeTrack- dirt/narrow/bumpy<br/>"+
    "<t color='#cfc01c'>"+_proceduralTextureLine+"</t> Yellow Road- asphalt/cement/smooth<br/>"+
    "<t color='#26c91e'>"+_proceduralTextureLine+"</t> Green Main Road- smooth/wide/large turns<br/>"+
    "<t align='right' underline='1'>Connections per Node</t><br/>"+
    "<img color='#8c9b5b' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Khaki Dot- Connected road within "+(100 * A3A_NG_const_positionInaccuracy toFixed 0)+" cm.<br/>"+
    "<img color='#c12726' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Red Dot- Dead end.<br/>"+
    "<img color='#e65a5a' image='a3\ui_f\data\Map\Markers\Military\triangle_CA'/>Pink Triangle- Off road.<br/>"+
    "<img color='#790e0d' image='a3\ui_f\data\Map\Markers\Military\triangle_CA'/>Dark Red Triangle- Off road &amp; Dead end.<br/>"+
    "<img color='#7e44c1' image='a3\ui_f\data\Map\Markers\Military\flag_CA'/>Purple Flag- Island Label.",
    // islandID
    "<t align='right' underline='1'>Node Types</t><br/>"+
    "Islands are separated by "+ str A3A_NGSA_const_allMarkerColoursCount +" colours.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Dot- Road within "+(100 * A3A_NG_const_positionInaccuracy toFixed 0)+" cm.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\triangle_CA'/>Triangle- Off road.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\flag_CA'/>Flag- Island Label.",
    // islandIDDeadEnd
    "<t align='right' underline='1'>Node Types</t><br/>"+
    "Islands are separated by "+ str A3A_NGSA_const_allMarkerColoursCount +" colours.<br/>"+
    "<img color='#c12726' image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Red Dot- Dead end.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\dot_CA'/>Dot- Road within "+(100 * A3A_NG_const_positionInaccuracy toFixed 0)+" cm.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\triangle_CA'/>Triangle- Off road.<br/>"+
    "<img image='a3\ui_f\data\Map\Markers\Military\flag_CA'/>Flag- Island Label."
];
// The text uses a non-breaking space for the underlining to work. Find in CharMap or google key combination for your local system.
private _selectorText = ["Normal","Normal &amp; Offroad","Island","Island &amp; Dead-ends"];
_selectorText set [_colourModeIndex, "<t color='#f0d498' size='"+str(A3A_NGSA_baseTextSize)+"'>" + (_selectorText #_colourModeIndex) + "</t>"];
[
    "Marker Legend",
    "<t align='center' color='#888888' size='"+str(0.8*A3A_NGSA_baseTextSize)+"' underline='1' valign='middle'>"+(_selectorText joinString " ")+"</t><br/>"+
    (_legends #_colourModeIndex),
    true,
    400
] call A3A_fnc_customHint;

if (_refresh) then {
    private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;
    if (count _navGridHM <= A3A_NGSA_autoMarkerRefreshNodeMax) then {
        [true] spawn A3A_fnc_NGSA_action_refresh;
    } else {
        ["Colour Mode Changed","Refresh To apply colour changes! (<t color='#f0d498'>'ctrl'+'R'</t>)",true,200] call A3A_fnc_customHint;
    };
};
