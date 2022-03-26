/*
    Adds event handler to trigger enemy responses when rebels fire artillery/mortars

Arguments:
    <OBJECT> The artillery vehicle object

Environment:
    Should be added on server so that it works when vehicle changes locality

Example:
    [_myMortar] remoteExec ["A3A_fnc_artilleryDetectionEH", 2];
*/

params ["_artillery"];

_artillery addEventHandler ["Fired", {
    _mortarX = _this select 0;
    if (side group _mortarX != teamPlayer) exitWith {};
    _dataX = _mortarX getVariable ["detection",[position _mortarX,0]];
    _positionX = position _mortarX;
    _chance = _dataX select 1;
    if ((_positionX distance (_dataX select 0)) < 300) then
    {
        _chance = _chance + 2;
    }
    else
    {
        _chance = 0;
    };
    if (random 100 < _chance) then
    {
        {
            if !(side _x in [Occupants, Invaders]) then { continue };
            [leader _x, [_mortarX, 4]] remoteExec ["reveal", leader _x];
        } forEach allGroups;
        if (_mortarX distance posHQ < 300 and !("DEF_HQ" in A3A_activeTasks)) then
        {
            _LeaderX = leader (gunner _mortarX);
            if (!isPlayer _LeaderX or [_LeaderX] call A3A_fnc_isMember) then
            {
                [[],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler",2];
            };
        };
        _chance = 0;        // reduce spamming
    };
    _mortarX setVariable ["detection",[_positionX,_chance]];
}];
