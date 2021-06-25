/*
Author: Caleb Serafin
    WORK IN PROGRESS
    Attempts to grab location from location pool. Otherwise it creates one on demand.
    Optionally specify it's given path. (Will become mandatory soon.)
    Optionally specify it's 1e14 ID. (Not recommended for normal use. Designed for loading of saved mission ect. Will need to update the global counter as well to avoid a collision)

Arguments:
    <ARRAY>|<STRING> path to location (Include own name).
    <SCALAR> 1e7 ID. If nil will auto gen. Only fill in locations are being loaded from a serialisation and the global location counter has been advanced! (default=nil).

Return Value:
    <LOCATION> *new* location; locationNull if issue.

Scope: Local return. Local arguments.
Environment: Any.
Public: Not recommended. Use Col_nestLoc_set as it will ensure that path is set correctly.

Example:
    [[localNamespace,"Collections","TestBucket","NewLocation"],] call Col_fnc_location_new;

    // Rather use Col_fnc_nestLoc_set. Eg to create namespace called members to store members.
    _loc = [localNamespace,"MyContainer","Squad1", "Members", nil, nil] call Col_fnc_nestLoc_set;
*/
#include "..\ID\ID_defines.hpp"
params [
    ["_path",[],[ [] ]],
    ["_id",-1,[ 0 ]]
];
if (_id isEqualTo -1) then {isNil {
    Col_mac_ID_G1e7_inc(Col_location_ID,_id);
}};
private _location = createLocation ["Invisible", ASLtoAGL [-_id / 1e6, -(0) / 1e6, -(0) / 1e6], 0, 0];
_location setText (_path call Col_fnc_location_serialiseAddress);
_location;
