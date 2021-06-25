/*
Maintainer: Caleb Serafin
    Deletes and recreates hover markers to make sure that they are on top.

Scope: Any, Global Effect
Environment: Unscheduled
Public: No
Dependencies:

Example:
    call A3A_fnc_NGSA_refreshMarkerOrder;
*/

deleteMarker A3A_NGSA_modeConnect_lineName;
createMarkerLocal [A3A_NGSA_modeConnect_lineName,[0,0]];


deleteMarker A3A_NGSA_UI_marker0_name;
createMarker [A3A_NGSA_UI_marker0_name,A3A_NGSA_UI_marker0_pos];
deleteMarker A3A_NGSA_UI_marker1_name;
createMarker [A3A_NGSA_UI_marker1_name,A3A_NGSA_UI_marker1_pos];
