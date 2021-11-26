/*
    Author: [Håkon]
    [Description]
        Switches current vehicle texture with selected in list

    Arguments:
    0. <Control> ExtrasTexture control

    Return Value:
    <Bool> Succesful texture change

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_switchTexture;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
Trace("Changeing texture");
params ["_ctrl"];
private _index = lbCurSel _ctrl;
_ctrl lbSetCurSel -1;
if (_index isEqualTo -1) exitWith {false};

for "_i" from 0 to (lbSize _ctrl) -1 do { //uncheck all textures
    if ( (checkboxTextures find (_ctrl lbPicture _i)) isEqualTo 1) then { _ctrl lbSetPicture [_i, checkboxTextures#0] };
};
_ctrl lbSetPicture [_index, checkboxTextures#1];
HR_GRG_curTexture = [_ctrl lbData _index, 1];

[HR_GRG_previewVeh, HR_GRG_curTexture, HR_GRG_curAnims] call BIS_fnc_initVehicle;
