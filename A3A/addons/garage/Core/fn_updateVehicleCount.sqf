/*
Author: Håkon
Description:
    updates the garage capacity count text

Arguments: nil

Return Value: nil

Scope: Clients
Environment: Any
Public: No
Dependencies:

Example:

License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrl = _disp displayCtrl HR_GRG_IDC_CapacityCount;

private _count = 0;
{
    _count = _count + count _x;
} forEach HR_GRG_Vehicles;

_ctrl ctrlSetText (str _count +" / " + str (call HR_GRG_VehCap));
