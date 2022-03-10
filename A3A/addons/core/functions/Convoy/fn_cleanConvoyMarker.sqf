/*  Checks the convoy markers and cleans out deleted convoys
*
*   Scope: Internal
*
*   Params:
*       Nothing
*
*   Returns:
*       Nothing
*/

private _convoysOccupants = server getVariable ["convoyMarker_Occupants", [""]];
_convoysOccupants = _convoysOccupants select {(getMarkerColor _x) != ""};
server setVariable ["convoyMarker_Occupants", _convoysOccupants, true];

private _convoysInvaders = server getVariable ["convoyMarker_Invaders", [""]];
_convoysInvaders = _convoysInvaders select {(getMarkerColor _x) != ""};
server setVariable ["convoyMarker_Invaders", _convoysInvaders, true];
