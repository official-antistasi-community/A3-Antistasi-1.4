/*
Author: Wurzel0701
    Draws the entire navGrid

Arguments:
    <NUMBER> The amount of time in seconds the grid should stay visible (-1 means forever) (DEFAULT: 60)

Return Value:
    <NULL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> navGrid

Example:
    [100] call A3A_fnc_drawGrid;
*/

params
[
    ["_time", 60, [0]]
];

{
    private _roadMarker = createMarker [format ["Marker%1", _forEachIndex], (_x select 0)];
    _roadMarker setMarkerShape "ICON";
    _roadMarker setMarkerAlpha 1;
    if(_x select 2) then
    {
        _roadMarker setMarkerColor "ColorGreen";
    }
    else
    {
        _roadMarker setMarkerColor "ColorGrey";
    };
    _roadMarker setMarkerText (str (count (_x select 3)));
    if(count (_x select 3) > 2) then
    {
        _roadMarker setMarkerType "mil_box";
    }
    else
    {
        if(count (_x select 3) == 1) then
        {
            _roadMarker setMarkerType "mil_triangle";
        }
        else
        {
            _roadMarker setMarkerType "mil_dot";
        };
    };

    if(_time >= 0) then
    {
        [_roadMarker, _time] spawn
        {
            sleep (_this select 1);
            deleteMarker (_this select 0);
        };
    };

    private _thisNode = _x;
    private _thisPos = _x select 0;
    private _thisIndex = _forEachIndex;
    {
        private _conIndex = (_x select 0);
        if(_conIndex > _thisIndex) then
        {
            private _conPos = navGrid select _conIndex select 0;
            switch (_x select 1) do
            {
                case (0):
                {
                    //TRAIL
                    [_thisPos, _conPos, "ColorYellow", _time] call A3A_fnc_drawLine;
                };
                case (1):
                {
                    //ROAD
                    [_thisPos, _conPos, "ColorOrange", _time] call A3A_fnc_drawLine;
                };
                case (2):
                {
                    //AUTOBAHN
                    [_thisPos, _conPos, "ColorRed", _time] call A3A_fnc_drawLine;
                };
            };
        };
    } forEach (_x select 3);
} forEach navGrid;
