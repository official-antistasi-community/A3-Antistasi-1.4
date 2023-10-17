/*  Count empty spawn positions on marker of a specific type

Environment: Any. Has network timing risks which should be mitigated using addTimeForIdle

Arguments:
    <STRING> Marker name to search
    <STRING> Type of spawn place to search, "vehicle", "mortar", "heli" or "plane"

Return Value:
    <NUMBER> Number of spawn positions of that type available to use
*/

params ["_marker", "_type"];
private _varName = format ["%1_%2_used", _marker, tolower _type];
private _used = spawner getVariable [_varName, []];
{ !_x } count _used;
