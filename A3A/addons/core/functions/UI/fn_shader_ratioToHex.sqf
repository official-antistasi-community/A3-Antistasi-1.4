/*
Function:
    A3A_fnc_shader_ratioToHex

Description:
    Converts a base-10 ratio to a two digit hex intensity.
    REQUIRES A3A_fnc_customHintInit to have completed!

Parameters:
    <SCALER> Base-10 intensity ratio.

Returns:
    <STRING> Two digit Hex intensity.

Examples:
    [0.64] call A3A_fnc_shader_ratioToHex; // returns "A3"

Authors: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
private _intColour = 255 * (0 max (_this#0 min 1));
[A3A_customHint_hexChars#(floor (_intColour/16)), A3A_customHint_hexChars#(floor (_intColour%16))] joinString "";
