params ["_marker"];

/*  Returns the units of a garrison that needs to be reinforced on the given marker
*   Params:
*     _marker: STRING : The name of the marker to get the needed reinforcements from
*
*   Returns:
*     _result: ARRAY : The needed reinforcements in the correct format
*/

private ["_result"];

if(isNil "_marker") exitWith {diag_log "GetRequested: No marker given!";};

_result = garrison getVariable [format ["%1_requested", _marker], [["", [], []]]];

_result;
