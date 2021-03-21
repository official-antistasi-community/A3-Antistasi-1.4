/*
Maintainer: Caleb Serafin
    Places a map marker on roads.
    Previous markers make by this function are deleted.
    Colour depends on number of connections:
        0  -> Black
        1  -> Red
        2  -> Orange
        3  -> Yellow
        4  -> Green
        >4 -> Blue

Arguments:
    <ARRAY<             navIslands:
        <ARRAY<             A single road network island:
            <OBJECT>            Road
            <ARRAY<OBJECT>>         Connected roads.
            <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
        >>
    >>
    <SCALAR> Size of road node dots. (Set to 0 to disable) (Default = 0.8)
    <SCALAR> Size of island dots. (Set to 0 to disable) (Default = 1)

Return Value:
    <ANY> undefined.

Scope: Server/Server&HC/Clients/Any, Local Arguments/Global Arguments, Local Effect/Global Effect
Environment: Scheduled (Recommended) | Any (If small navGrid like Stratis, Malden)
Public: Yes

Example:
    [_navIslands] call A3A_fnc_NG_draw_dotOnRoads;
*/
params [
    ["_navIslands",[],[ [] ]], //<ARRAY< island ARRAY<Road,connections ARRAY<Road>>  >>
    ["_dot_size",0.8,[ 0 ]],
    ["_islandDot_size",1,[ 0 ]]
];

private _markers = [localNamespace,"A3A_NGPP","draw","dotOnRoads",[]] call Col_fnc_nestLoc_get;
{
    deleteMarker _x;
} forEach _markers;
_markers resize 0;  // Preserves reference

if (_dot_size > 0) then {
    {
        {
            private _name = "NGPP_dot_" + str (_x#0);
            _markers pushBack createMarkerLocal [_name,getPosWorld (_x#0)];
            _name setMarkerTypeLocal "mil_dot";
            _name setMarkerSizeLocal [_dot_size, _dot_size];
            _name setMarkerColor (switch (count (_x#1)) do { // Broadcasts here
                case 0: { "ColorBlack" };
                case 1: { "ColorRed" };
                case 2: { "ColorOrange" };
                case 3: { "ColorYellow" };
                case 4: { "ColorGreen" };
                default { "ColorBlue" };
            });
        } forEach _x;   // island ARRAY<Road,connections ARRAY<Road>>  // _x is <Road,connections ARRAY<Road>>
    } forEach _navIslands; //<ARRAY< island ARRAY<Road,connections ARRAY<Road>>  >>// _x is <island ARRAY<Road,connections ARRAY<Road>>>
};

if (_islandDot_size > 0) then {
    {
        private _name = "NGPP_dotI_" + str _forEachIndex;
        _markers pushBack createMarkerLocal [_name,getPosWorld (_x#0#0)];
        _name setMarkerTypeLocal "mil_objective";
        _name setMarkerSizeLocal [_islandDot_size, _islandDot_size];
        _name setMarkerTextLocal ("Island <" + str _forEachIndex +">");
        _name setMarkerColor "colorCivilian"; // Broadcasts here

    } forEach _navIslands; //<ARRAY< island ARRAY<Road,connections ARRAY<Road>>  >>// _x is <island ARRAY<Road,connections ARRAY<Road>>>
};

[localNamespace,"A3A_NGPP","draw","dotOnRoads",_markers] call Col_fnc_nestLoc_set;
