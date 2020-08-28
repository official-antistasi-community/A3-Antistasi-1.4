#include "defines.h"
/*
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Updates the view distance dependant on whether the player
    is on foot, a car or an aircraft.
*/
private ["_controlGrp","_saveList"];
disableSerialization;

/* Store displays */
_controlGrp = CONTROL(MENU_IDD,MANAGER_GROUP);
_saveList = CONTROL(MENU_IDD,SAVES_LIST);
lbClear _saveList; //Purge the list

/* Make the Saves manager group visible */
_controlGrp ctrlSetfade 0;
_controlGrp ctrlCommit .3;

/* Fill the listbox */
for "_i" from 0 to 9 do {
    _varData = GVAR_PNS format["tawvd_slot_%1",_i];
    if(!isNil "_varData") then {
        _saveList lbAdd SEL(_varData,0);
        _saveList lbSetData [(lbSize _saveList)-1,"true"];
    } else {
        _saveList lbAdd format["Save Slot %1",_i];
        _saveList lbSetData [(lbSize _saveList)-1,"false"];
    };
};