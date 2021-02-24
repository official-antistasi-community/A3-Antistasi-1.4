#include "defineGarage.inc"
//Always called after a placement, successful or not.

[vehPlace_callbackTarget, CALLBACK_VEH_PLACEMENT_CLEANUP, []] call A3A_fnc_vehPlacementCallbacks;
placingVehicle = false;