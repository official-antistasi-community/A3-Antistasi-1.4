#include "defineGarage.inc"

[vehPlace_callbackTarget, CALLBACK_VEH_PLACEMENT_CANCELLED, []] call A3A_fnc_vehPlacementCallbacks;
["",0,0,5,0,0,4] spawn bis_fnc_dynamicText;
deleteVehicle vehPlace_previewVeh;
vehPlace_previewVeh = objNull;

[] call A3A_fnc_vehPlacementCleanup;