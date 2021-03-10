/*
Author: Caleb Serafin
    Creates ID counter for locations.
    Create location pool array in missionNamespace.

Return Value:
    <nil>

Scope: Local to this machine.
Environment: Unscheduled, Pre-Init.
Public: NO (Only called in pre-init)

Example:
    class Collections_Location
    {
        file="Collections\Location";
        class location_init { preInit = 1 };
    };
*/
#include "..\ID\ID_defines.hpp"
Col_mac_ID_G1e7_new(Col_location_ID)
Col_location_pool = [];
