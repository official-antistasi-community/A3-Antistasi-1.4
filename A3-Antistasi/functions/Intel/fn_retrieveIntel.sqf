/*  Handles the retrieving of any kind of intel
*   Params:

*       if _intelType == "Small"
*           _squadLeader : OBJECT : The unit (or body) which holds the intel
*           _caller : OBJECT : The unit which is searching
*           _searchAction : NUMBER : The ID of the action which started this script
*       if _intelType == "Medium"
*           _intel : OBJECT : The object which is holding the intel
*       if _intelType == "Large"
*           _intel : OBJECT : The object which is holding the intel
*           _unused
*           _searchAction : NUMBER : The ID of the action which started this script
*       _intelType/_preCheck : STRING : The type of the intel, one of "Small", "Medium" and "Large"
*
*   Returns:
*       Nothing
*/

private _preCheck = _this select 3;
switch (_preCheck) do
{
    case ("Small"):
    {
        _this params ["_squadLeader", "_caller", "_searchAction"];
        [_caller, _squadLeader, _searchAction] spawn A3A_fnc_retrieveSmallIntel;
    };
    case ("Medium"):
    {
        private _intel = _this select 0;
        //Take intel from desk
        private _side = _intel getVariable "side";
        deleteVehicle _intel;
        hint "Medium intel taken";
        ["Medium", _side] spawn A3A_fnc_selectIntel;
    };
    case ("Large"):
    {
        private _intel = _this select 0;
        private _searchAction = _this select 2;
        [_intel, _searchAction] spawn A3A_fnc_retrieveLargeIntel;
    };
};
