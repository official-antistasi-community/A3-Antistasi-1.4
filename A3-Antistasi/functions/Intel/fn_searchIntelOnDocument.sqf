params ["_intel"];

/*  Handles the retrieving of medium intel
*   Params:
*       _intel : OBJECT : The object which is holding the intel
*
*   Returns:
*       Nothing
*/

//Take intel from desk
private _side = _intel getVariable "side";
deleteVehicle _intel;
hint "Medium intel taken";
["Medium", _side] spawn A3A_fnc_selectIntel;
