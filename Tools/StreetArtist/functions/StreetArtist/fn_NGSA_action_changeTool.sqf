/*
Maintainer: Caleb Serafin
    Cycles the tool and updates the help hint.

Arguments:
    <NIL> cycle colour mode. | <INTEGER> switch to specific tool. [Default = nil]

Return Value:
    <ANY> undefined.

Scope: Client, Local Arguments, Local Effect
Environment: Any
Public: No

Example:
    [] call A3A_fnc_NGSA_action_changeTool;
    [0] call A3A_fnc_NGSA_action_changeTool;
*/
params [
    ["_specificTool",nil,[0]]
];

A3A_NGSA_toolModeChanged = true;    // Used by UI functions for resetting cursor marker states.
if (isNil{_specificTool}) then {
    A3A_NGSA_clickModeEnum = (A3A_NGSA_clickModeEnum + 1) mod 2;
} else {
    A3A_NGSA_clickModeEnum = _specificTool mod 2;
};

private _legends = [
    // Connection Tool
    "<t color='#f0d498'>'click'</t>-Select &amp; connect roads<br/>"+
    "<t color='#f0d498'>'shift'+'click'</t>-Create new node<br/>"+
    "<t color='#f0d498'>'alt'</t>-Deselect node<br/>"+
    "<t color='#f0d498'>'alt'+'click'</t>-Delete node<br/>"+
    "<t color='#f0d498'>'C'</t>-Cycle connection type.",
    // Brush Tool
    "<t color='#f0d498'>'click'</t>-Set connections to selected type<br/>"+
    "<t color='#f0d498'>'alt'+'click'</t>-Delete nodes under brush.<br/>"+
    "<t color='#f0d498'>'shift'</t>-Double the brush size<br/>"+
    "<t color='#f0d498'>'C'</t>-Cycle connection type.<br/>"+
    " "      // Extra line so make it same length as connection tool. This avoids common visual jumping when switching tools.
];
// The text uses a non-breaking space for the underlining to work. Find in CharMap or google key combination for your local system.
private _selectorText = ["Connection","Brush"];
private _selectorTextPlain = _selectorText #A3A_NGSA_clickModeEnum;
_selectorText set [A3A_NGSA_clickModeEnum, "<t color='#f0d498' size='"+str(A3A_NGSA_baseTextSize)+"'>"+_selectorTextPlain+"</t>"];
[
    "Toolbox",
    "<t align='center' color='#888888' size='"+str(0.8*A3A_NGSA_baseTextSize)+"' underline='1' valign='middle'>"+(_selectorText joinString " ")+"</t><br/>"+
    (_legends #A3A_NGSA_clickModeEnum),
    true,
    500
] call A3A_fnc_customHint;
