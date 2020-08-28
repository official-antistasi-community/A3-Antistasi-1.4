#include "defines.h"
/*
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Updates the view distance dependant on whether the player
    is on foot, a car or an aircraft.
*/
private ["_saveIndex","_saveName"];
_saveIndex = lbCurSel SAVES_LIST;
_saveName = ctrlText SLOT_NAME;

hint format["saveIndex: %1", _saveIndex];
SVAR_PNS [format["tawvd_slot_%1",_saveIndex], 
    [
        _saveName,
        tawvd_foot,
        tawvd_car,
        tawvd_air,
        tawvd_drone,
        tawvd_object,
        tawvd_syncObject
    ]
];

saveProfileNamespace;
[] call TAWVD_fnc_openSaveManager;
