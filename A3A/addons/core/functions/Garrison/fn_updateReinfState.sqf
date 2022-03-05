params ["_marker", ["_sides", []]];

/*  Updates the reinf state if the marker, decides whether it can reinforce others and/or needs reinforcement
*   Params:
*       _marker : STRING : The name of the marker
*       _sides : ARRAY of SIDES : If the marker switched sides this will handle the transfer [_loser, _winner]
*
*   Returns:
*     Nothing
*/

private _loser = teamPlayer;
private _owner = sideUnknown;

if(_sides isEqualTo []) then
{
    //Fixed update, get side from the server
    _owner = sidesX getVariable [_marker, teamPlayer];
}
else
{
    //Update as marker changed, sides are given
    _loser = _sides select 0;
    _owner = _sides select 1;
};


private _ratio = [_marker] call A3A_fnc_getGarrisonRatio;

//Remove old entry
if(_loser != teamPlayer) then
{
    private _index = -1;
    if(_loser == Occupants) then
    {
        //Remove marker from occupants
        _index = reinforceMarkerOccupants findIf {(_x select 1) == _marker};
        reinforceMarkerOccupants deleteAt _index;
        canReinforceOccupants = canReinforceOccupants - [_marker];
    }
    else
    {
        //Remove marker form occupants
        _index = reinforceMarkerInvader findIf {(_x select 1) == _marker};
        reinforceMarkerInvader deleteAt _index;
        canReinforceInvader = canReinforceInvader - [_marker];
    };
};

if(_owner != teamPlayer) then
{
    private _reinfMarker = if(_owner == Occupants) then {reinforceMarkerOccupants} else {reinforceMarkerInvader};
    private _canReinf = if(_owner == Occupants) then {canReinforceOccupants} else {canReinforceInvader};

    private _isAirport = _marker in airportsX;
    private _index = _reinfMarker findIf {(_x select 1) == _marker};

    //If in need of reinforcements
    if(_ratio != 1) then
    {
        //Airports don't get send reinforcements
        if(!_isAirport) then
        {
            if(_index == -1) then
            {
                //Add new entry
                _reinfMarker pushBack [_ratio, _marker];
            }
            else
            {
                //Update data
                _reinfMarker set [_index, [_ratio, _marker]];
            };
        };
    }
    else
    {
        //Outpost is full, no more units needed, delete from _reinfMarker
        if(_index != -1) then
        {
            _reinfMarker deleteAt _index;
        };
    };

    private _isOutpost = _marker in outposts;

    //If units are not depleted, let the outpost send units
    if((_isAirport && _ratio > 0.4) || {_isOutpost && _ratio > 0.8}) then
    {
        _canReinf pushBackUnique _marker;
    }
    else
    {
        //Marker depleted, cannot send reinforcements
        _canReinf = _canReinf - [_marker];
    };
};
