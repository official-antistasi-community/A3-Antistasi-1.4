#include "defines.h"
/*
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Updates the view distance dependant on whether the player
    is on foot, a car or an aircraft.
*/
private "_saveData";
params [["_control",controlNull,[controlNull]],["_index",-1,[0]]];

/* Error checks */
if(EQUAL(_index,-1) OR isNull _control) exitWith {};
_saveData = GVAR_PNS format["tawvd_slot_%1",_index];
if(isNil "_saveData") exitWith {};

/* Set variables to chosen slot data */
CONTROL(MENU_IDD,SLOT_NAME) ctrlSetText (SEL(_saveData,0));
SVAR_MNS ["tawvd_foot",SEL(_saveData,1)];
SVAR_MNS ["tawvd_car",SEL(_saveData,2)];
SVAR_MNS ["tawvd_air",SEL(_saveData,3)];
SVAR_MNS ["tawvd_drone",SEL(_saveData,4)];
SVAR_MNS ["tawvd_object",SEL(_saveData,5)];
SVAR_MNS ["tawvd_syncObject",SEL(_saveData,6)];

/* Update Menu & View Distance */
[] call TAWVD_fnc_updateViewDistance;
[] call TAWVD_fnc_openMenu;