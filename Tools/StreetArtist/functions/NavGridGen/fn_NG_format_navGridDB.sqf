/*
Maintainer: Caleb Serafin
    Formats the navGrid array into a string so that each line only has a maximum of 5 road structs.
    The array is then assigned to navGrid.

Arguments:
    <ARRAY<             navGridDB:
        <POS2D|POSAGL>      Road pos.
        <SCALAR>            Island ID.
        <BOOLEAN>           isJunction.
        <ARRAY<             Connections:
            <SCALAR>            Index in navGridDB of connected road.
            <SCALAR>            Road type Enumeration. {TRACK = 0; ROAD = 1; MAIN ROAD = 2} at time of writing.
            <SCALAR>            True driving distance to connection, includes distance of roads swallowed in simplification.
        >>
        <STRING|SCALAR>     Road name or 0 if name not needed for finding road (Ie. name is need if roadAt cannot find road).
    >> _navGridDB format

Return Value:
    <STRING> 5 per line version of navGridDB that assigns an array to navGrid

Scope: Any, Global Arguments
Environment: Any
Public: Yes
Dependants:
    <ARRAY> navGrid

Example:
    copyToClipboard ([_navGridDB] call A3A_fnc_NG_format_navGridDB);
*/
params ["_navGridDB"];

private _chunks = [_navGridDB,5] call Col_fnc_array_toChunks;
private _trimOuterBrackets = {
    _this#0 select [1,count (_this#0)-2]
};
private _const_lineBrake = "
";
private _const_comma_lineBrake = ","+_const_lineBrake;
"navGrid = [" + _const_lineBrake + ((_chunks apply {[str _x] call _trimOuterBrackets}) joinString _const_comma_lineBrake) + _const_lineBrake + "];";
