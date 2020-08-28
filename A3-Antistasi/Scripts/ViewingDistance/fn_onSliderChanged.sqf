#include "defines.h"
/*
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Called when the slider is changed for any field and 
    updates the view distance for it.
*/
private "_varData";
params [["_mode",-1,[0]],["_value",-1,[0]]];

if(EQUAL(_mode,-1) OR EQUAL(_value,-1)) exitWith {};

disableSerialization;

_varData = switch(_mode) do {
    case 0: {["tawvd_foot",INFANTRY_EDIT]};
    case 1: {["tawvd_car",GROUND_EDIT]};
    case 2: {["tawvd_air",AIR_EDIT]};
    case 3: {["tawvd_object",OBJECT_EDIT]};
    case 4: {["tawvd_drone",DRONE_EDIT]};
};

SVAR_MNS [SEL(_varData,0),round(_value)];
ctrlSetText[SEL(_varData,1),str(GVAR_MNS SEL(_varData,0))];
[] call TAWVD_fnc_updateViewDistance;

if(EQUAL(_mode,3)) then {
    setObjectViewDistance [tawvd_object,100];
};

if(tawvd_syncObject) then {
    sliderSetPosition[OBJECT_SLIDER, tawvd_object];
    ctrlSetText[OBJECT_EDIT,str(tawvd_object)];
};